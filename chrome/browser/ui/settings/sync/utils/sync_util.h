// Copyright 2012 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef IOS_CHROME_BROWSER_UI_SETTINGS_SYNC_UTILS_SYNC_UTIL_H_
#define IOS_CHROME_BROWSER_UI_SETTINGS_SYNC_UTILS_SYNC_UTIL_H_

#import <Foundation/Foundation.h>

#include "google_apis/gaia/google_service_auth_error.h"
#include "ios/chrome/browser/sync/sync_setup_service.h"

class ChromeBrowserState;
@protocol SyncPresenter;

namespace web {
class WebState;
}

// Gets the top-level description message associated with the sync error state
// of `syncSetupService`. Returns nil if there is no sync error.
NSString* GetSyncErrorDescriptionForSyncSetupService(
    SyncSetupService* syncSetupService);

// Gets the string message associated with the sync error state of
// `browserState`. The returned error message does not contain any links.
// Returns nil if there is no sync error.
NSString* GetSyncErrorMessageForBrowserState(ChromeBrowserState* browserState);

// Gets the title of the button to fix the sync error of `browserState`.
// Returns nil if there is no sync error or it can't be fixed by a user action.
NSString* GetSyncErrorButtonTitleForBrowserState(
    ChromeBrowserState* browserState);

// Gets the sync state of `browserState`.
SyncSetupService::SyncServiceState GetSyncStateForBrowserState(
    ChromeBrowserState* browserState);

// Returns true if sync settings (or the google services settings when unified
// consent is enabled) should be displayed based on `syncState`.
bool ShouldShowSyncSettings(SyncSetupService::SyncServiceState syncState);

// Check for sync errors, and display any that ought to be shown to the user.
// Returns true if an infobar was brought up.
bool DisplaySyncErrors(ChromeBrowserState* browser_state,
                       web::WebState* web_state,
                       id<SyncPresenter> presenter);

// Returns true if `errorState` corresponds to a transient sync error.
bool IsTransientSyncError(SyncSetupService::SyncServiceState errorState);

#endif  // IOS_CHROME_BROWSER_UI_SETTINGS_SYNC_UTILS_SYNC_UTIL_H_
