// Copyright 2018 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ios/chrome/browser/ui/ntp/new_tab_page_coordinator.h"

#import "base/test/task_environment.h"
#import "ios/chrome/browser/browser_state/test_chrome_browser_state.h"
#import "ios/chrome/browser/browser_state/test_chrome_browser_state_manager.h"
#import "ios/chrome/browser/favicon/ios_chrome_large_icon_service_factory.h"
#import "ios/chrome/browser/main/test_browser.h"
#import "ios/chrome/browser/ntp/new_tab_page_tab_helper.h"
#import "ios/chrome/browser/ntp_snippets/ios_chrome_content_suggestions_service_factory.h"
#import "ios/chrome/browser/search_engines/template_url_service_factory.h"
#import "ios/chrome/browser/signin/authentication_service_factory.h"
#import "ios/chrome/browser/signin/authentication_service_fake.h"
#import "ios/chrome/browser/ui/commands/command_dispatcher.h"
#import "ios/chrome/browser/ui/commands/omnibox_commands.h"
#import "ios/chrome/browser/ui/commands/snackbar_commands.h"
#import "ios/chrome/browser/ui/main/scene_state.h"
#import "ios/chrome/browser/ui/main/scene_state_browser_agent.h"
#import "ios/chrome/browser/ui/ntp/incognito_view_controller.h"
#import "ios/chrome/browser/ui/ntp/new_tab_page_controller_delegate.h"
#import "ios/chrome/browser/ui/ntp/new_tab_page_feature.h"
#import "ios/chrome/browser/ui/ntp/new_tab_page_view_controller.h"
#import "ios/chrome/test/ios_chrome_scoped_testing_chrome_browser_state_manager.h"
#import "ios/web/public/test/fakes/fake_web_state.h"
#import "ios/web/public/test/web_task_environment.h"
#import "testing/gtest/include/gtest/gtest.h"
#import "testing/gtest_mac.h"
#import "testing/platform_test.h"
#import "third_party/ocmock/OCMock/OCMock.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

// Test fixture for testing NewTabPageCoordinator class.
class NewTabPageCoordinatorTest : public PlatformTest {
 protected:
  NewTabPageCoordinatorTest()
      : scoped_browser_state_manager_(
            std::make_unique<TestChromeBrowserStateManager>(base::FilePath())),
        base_view_controller_([[UIViewController alloc] init]) {
    TestChromeBrowserState::Builder test_cbs_builder;
    test_cbs_builder.AddTestingFactory(
        ios::TemplateURLServiceFactory::GetInstance(),
        ios::TemplateURLServiceFactory::GetDefaultFactory());
    test_cbs_builder.AddTestingFactory(
        IOSChromeContentSuggestionsServiceFactory::GetInstance(),
        IOSChromeContentSuggestionsServiceFactory::GetDefaultFactory());
    test_cbs_builder.AddTestingFactory(
        IOSChromeLargeIconServiceFactory::GetInstance(),
        IOSChromeLargeIconServiceFactory::GetDefaultFactory());
    test_cbs_builder.AddTestingFactory(
        AuthenticationServiceFactory::GetInstance(),
        base::BindRepeating(
            &AuthenticationServiceFake::CreateAuthenticationService));
    browser_state_ = test_cbs_builder.Build();

    toolbar_delegate_ =
        OCMProtocolMock(@protocol(NewTabPageControllerDelegate));
  }

  void CreateCoordinator(bool off_the_record) {
    if (off_the_record) {
      ChromeBrowserState* otr_state =
          browser_state_->GetOffTheRecordChromeBrowserState();
      browser_ = std::make_unique<TestBrowser>(otr_state);
    } else {
      browser_ = std::make_unique<TestBrowser>(browser_state_.get());
      scene_state_ = OCMClassMock([SceneState class]);
      SceneStateBrowserAgent::CreateForBrowser(browser_.get(), scene_state_);
    }
    NewTabPageTabHelper::CreateForWebState(&web_state_);
    coordinator_ =
        [[NewTabPageCoordinator alloc] initWithBrowser:browser_.get()];
    coordinator_.baseViewController = base_view_controller_;
    coordinator_.toolbarDelegate = toolbar_delegate_;
    coordinator_.webState = &web_state_;
  }

  web::FakeWebState web_state_;
  id toolbar_delegate_;
  id delegate_;
  web::WebTaskEnvironment task_environment_;
  IOSChromeScopedTestingChromeBrowserStateManager scoped_browser_state_manager_;
  std::unique_ptr<TestChromeBrowserState> browser_state_;
  std::unique_ptr<Browser> browser_;
  id scene_state_;
  NewTabPageCoordinator* coordinator_;
  UIViewController* base_view_controller_;
};

// Tests that the coordinator doesn't vend an IncognitoViewController VC on the
// record.
TEST_F(NewTabPageCoordinatorTest, StartOnTheRecord) {
  CreateCoordinator(/*off_the_record=*/false);
  id omniboxCommandsHandlerMock = OCMProtocolMock(@protocol(OmniboxCommands));
  id snackbarCommandsHandlerMock = OCMProtocolMock(@protocol(SnackbarCommands));
  [browser_.get()->GetCommandDispatcher()
      startDispatchingToTarget:omniboxCommandsHandlerMock
                   forProtocol:@protocol(OmniboxCommands)];
  [browser_.get()->GetCommandDispatcher()
      startDispatchingToTarget:snackbarCommandsHandlerMock
                   forProtocol:@protocol(SnackbarCommands)];
  [coordinator_ start];
  UIViewController* viewController = [coordinator_ viewController];
  EXPECT_FALSE([viewController isKindOfClass:[IncognitoViewController class]]);
  [coordinator_ stop];
}

// Tests that the coordinator vends an incognito VC off the record.
TEST_F(NewTabPageCoordinatorTest, StartOffTheRecord) {
  CreateCoordinator(/*off_the_record=*/true);
  [coordinator_ start];
  UIViewController* viewController = [coordinator_ viewController];
  EXPECT_TRUE([viewController isKindOfClass:[IncognitoViewController class]]);
}
