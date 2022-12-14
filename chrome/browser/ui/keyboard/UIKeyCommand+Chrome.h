// Copyright 2015 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef IOS_CHROME_BROWSER_UI_KEYBOARD_UIKEYCOMMAND_CHROME_H_
#define IOS_CHROME_BROWSER_UI_KEYBOARD_UIKEYCOMMAND_CHROME_H_

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Note: this is implemented as a category on UIKeyCommand because UIKeyCommand
// can't be subclassed as of iOS 9 beta 4. http://crbug.com/510970
@interface UIKeyCommand (Chrome)

// These commands come pre-configured with localized titles (for those that
// appear in the HUD or menu), inputs, and modifier flags. Their action is
// matching their name, where the UIKeyCommand cr_xxx triggers the action method
// keyCommand_xxx.
// Variants are provided if necessary. Variants are named cr_xxx_2, cr_xxx_3,
// etc. They don't have a title and don't appear in the HUD or menu, but trigger
// the same action method keyCommand_xxx.
@property(class, nonatomic, readonly) UIKeyCommand* cr_openNewTab;
@property(class, nonatomic, readonly) UIKeyCommand* cr_openNewRegularTab;
@property(class, nonatomic, readonly) UIKeyCommand* cr_openNewIncognitoTab;
@property(class, nonatomic, readonly) UIKeyCommand* cr_openNewWindow;
@property(class, nonatomic, readonly) UIKeyCommand* cr_reopenLastClosedTab;
@property(class, nonatomic, readonly) UIKeyCommand* cr_openFindInPage;
@property(class, nonatomic, readonly) UIKeyCommand* cr_findNextStringInPage;
@property(class, nonatomic, readonly) UIKeyCommand* cr_findPreviousStringInPage;
@property(class, nonatomic, readonly) UIKeyCommand* cr_focusOmnibox;
@property(class, nonatomic, readonly) UIKeyCommand* cr_closeTab;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showNextTab;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showPreviousTab;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showNextTab_2;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showPreviousTab_2;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showNextTab_3;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showPreviousTab_3;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showBookmarks;
@property(class, nonatomic, readonly) UIKeyCommand* cr_addToBookmarks;
@property(class, nonatomic, readonly) UIKeyCommand* cr_reload;
@property(class, nonatomic, readonly) UIKeyCommand* cr_goBack;
@property(class, nonatomic, readonly) UIKeyCommand* cr_goForward;
@property(class, nonatomic, readonly) UIKeyCommand* cr_goBack_2;
@property(class, nonatomic, readonly) UIKeyCommand* cr_goForward_2;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showHistory;
@property(class, nonatomic, readonly) UIKeyCommand* cr_startVoiceSearch;
@property(class, nonatomic, readonly) UIKeyCommand* cr_close;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showSettings;
@property(class, nonatomic, readonly) UIKeyCommand* cr_stop;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showHelp;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showDownloadsFolder;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showDownloadsFolder_2;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showTab0;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showTab1;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showTab2;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showTab3;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showTab4;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showTab5;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showTab6;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showTab7;
@property(class, nonatomic, readonly) UIKeyCommand* cr_showLastTab;
@property(class, nonatomic, readonly) UIKeyCommand* cr_reportAnIssue;
@property(class, nonatomic, readonly) UIKeyCommand* cr_reportAnIssue_2;
@property(class, nonatomic, readonly) UIKeyCommand* cr_addToReadingList;
@property(class, nonatomic, readonly) UIKeyCommand* cr_goToTabGrid;
@property(class, nonatomic, readonly) UIKeyCommand* cr_clearBrowsingData;

// Returns a symbolic description of the key command. For example: ??????T.
@property(nonatomic, readonly) NSString* cr_symbolicDescription;

@end

NS_ASSUME_NONNULL_END

#endif  // IOS_CHROME_BROWSER_UI_KEYBOARD_UIKEYCOMMAND_CHROME_H_
