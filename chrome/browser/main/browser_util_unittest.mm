// Copyright 2020 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ios/chrome/browser/main/browser_util.h"

#import <memory>

#import "ios/chrome/browser/browser_state/test_chrome_browser_state.h"
#import "ios/chrome/browser/main/browser_list.h"
#import "ios/chrome/browser/main/browser_list_factory.h"
#import "ios/chrome/browser/main/test_browser.h"
#import "ios/chrome/browser/snapshots/snapshot_browser_agent.h"
#import "ios/chrome/browser/snapshots/snapshot_tab_helper.h"
#import "ios/chrome/browser/web_state_list/web_state_list.h"
#import "ios/chrome/browser/web_state_list/web_state_opener.h"
#import "ios/web/public/test/fakes/fake_web_state.h"
#import "ios/web/public/test/web_task_environment.h"
#import "testing/gtest_mac.h"
#import "testing/platform_test.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

// Test fixture for testing functions in browser_util.h/mm.
class BrowserUtilTest : public PlatformTest {
 protected:
  BrowserUtilTest() {
    TestChromeBrowserState::Builder test_browser_state_builder;
    chrome_browser_state_ = test_browser_state_builder.Build();

    browser_ = std::make_unique<TestBrowser>(chrome_browser_state_.get());
    other_browser_ = std::make_unique<TestBrowser>(chrome_browser_state_.get());
    incognito_browser_ = std::make_unique<TestBrowser>(
        chrome_browser_state_->GetOffTheRecordChromeBrowserState());
    other_incognito_browser_ = std::make_unique<TestBrowser>(
        chrome_browser_state_->GetOffTheRecordChromeBrowserState());

    browser_list_ =
        BrowserListFactory::GetForBrowserState(chrome_browser_state_.get());
    browser_list_->AddBrowser(browser_.get());
    browser_list_->AddBrowser(other_browser_.get());
    browser_list_->AddIncognitoBrowser(incognito_browser_.get());
    browser_list_->AddIncognitoBrowser(other_incognito_browser_.get());

    SnapshotBrowserAgent::CreateForBrowser(browser_.get());
    SnapshotBrowserAgent::CreateForBrowser(other_browser_.get());
    SnapshotBrowserAgent::CreateForBrowser(incognito_browser_.get());
    SnapshotBrowserAgent::CreateForBrowser(other_incognito_browser_.get());

    AppendNewWebState(browser_.get());
    AppendNewWebState(browser_.get());
    AppendNewWebState(browser_.get());
    AppendNewWebState(incognito_browser_.get());
  }

  // Appends a new web state in the web state list of `browser`.
  web::FakeWebState* AppendNewWebState(Browser* browser) {
    auto fake_web_state = std::make_unique<web::FakeWebState>();
    web::FakeWebState* inserted_web_state = fake_web_state.get();
    SnapshotTabHelper::CreateForWebState(inserted_web_state);
    browser->GetWebStateList()->InsertWebState(
        WebStateList::kInvalidIndex, std::move(fake_web_state),
        WebStateList::INSERT_ACTIVATE, WebStateOpener());
    return inserted_web_state;
  }

  // Returns the tab ID for the web state at `index` in `browser`.
  NSString* GetTabIDForWebStateAt(int index, Browser* browser) {
    web::WebState* web_state = browser->GetWebStateList()->GetWebStateAt(index);
    return web_state->GetStableIdentifier();
  }

  web::WebTaskEnvironment task_environment_;
  std::unique_ptr<TestChromeBrowserState> chrome_browser_state_;
  std::unique_ptr<Browser> browser_;
  std::unique_ptr<Browser> other_browser_;
  std::unique_ptr<Browser> incognito_browser_;
  std::unique_ptr<Browser> other_incognito_browser_;
  BrowserList* browser_list_;
};

// Tests that an incognito tab is moved from one incognito browser to another.
TEST_F(BrowserUtilTest, TestMoveTabAcrossIncognitoBrowsers) {
  ASSERT_EQ(1, incognito_browser_->GetWebStateList()->count());
  ASSERT_TRUE(other_incognito_browser_->GetWebStateList()->empty());
  NSString* tab_id = GetTabIDForWebStateAt(0, incognito_browser_.get());
  MoveTabToBrowser(tab_id, other_incognito_browser_.get(),
                   /*destination_index=*/0);
  EXPECT_TRUE(incognito_browser_->GetWebStateList()->empty());
  EXPECT_EQ(1, other_incognito_browser_->GetWebStateList()->count());
}

// Tests that a tab is moved from one regular browser (with several tabs) to
// another browser.
TEST_F(BrowserUtilTest, TestMoveTabAcrossRegularBrowsers) {
  ASSERT_EQ(3, browser_->GetWebStateList()->count());
  ASSERT_TRUE(other_browser_->GetWebStateList()->empty());
  NSString* tab_id = GetTabIDForWebStateAt(1, browser_.get());
  MoveTabToBrowser(tab_id, other_browser_.get(), /*destination_index=*/0);
  EXPECT_EQ(2, browser_->GetWebStateList()->count());
  EXPECT_EQ(1, other_browser_->GetWebStateList()->count());
  EXPECT_NE(tab_id, GetTabIDForWebStateAt(1, browser_.get()));
  EXPECT_EQ(tab_id, GetTabIDForWebStateAt(0, other_browser_.get()));
}

// Tests that a tab is reordered within the same browser.
TEST_F(BrowserUtilTest, TestReorderTabWithinSameBrowser) {
  ASSERT_EQ(3, browser_->GetWebStateList()->count());
  NSString* tab_id = GetTabIDForWebStateAt(0, browser_.get());
  MoveTabToBrowser(tab_id, browser_.get(), /*destination_index=*/2);
  EXPECT_EQ(3, browser_->GetWebStateList()->count());
  EXPECT_NE(tab_id, GetTabIDForWebStateAt(0, browser_.get()));
  EXPECT_EQ(tab_id, GetTabIDForWebStateAt(2, browser_.get()));
}
