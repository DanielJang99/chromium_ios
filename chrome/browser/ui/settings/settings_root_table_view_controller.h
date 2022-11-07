// Copyright 2018 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef IOS_CHROME_BROWSER_UI_SETTINGS_SETTINGS_ROOT_TABLE_VIEW_CONTROLLER_H_
#define IOS_CHROME_BROWSER_UI_SETTINGS_SETTINGS_ROOT_TABLE_VIEW_CONTROLLER_H_

#import <UIKit/UIKit.h>

#import "ios/chrome/browser/ui/settings/settings_root_view_controlling.h"
#import "ios/chrome/browser/ui/table_view/cells/table_view_link_header_footer_item.h"
#import "ios/chrome/browser/ui/table_view/chrome_table_view_controller.h"

// SettingsRootTableViewController is a base class for integrating UITableViews
// into the Settings UI. This class is made to be subclassed and contains the
// logic to handle the most common user interactions (edit, delete...).
@interface SettingsRootTableViewController
    : ChromeTableViewController <SettingsRootViewControlling,
                                 TableViewLinkHeaderFooterItemDelegate,
                                 UIAdaptivePresentationControllerDelegate>

// Delete button for the toolbar.
@property(nonatomic, strong, readonly) UIBarButtonItem* deleteButton;

// Add button for the toolbar.
@property(nonatomic, strong, readonly) UIBarButtonItem* addButtonInToolbar;

// Settings button for the toolbar.
@property(nonatomic, strong, readonly) UIBarButtonItem* settingsButtonInToolbar;

// Whether this table view controller should hide the "Done" button (the right
// navigation bar button). Default is NO.
@property(nonatomic, assign) BOOL shouldHideDoneButton;

// Whether this table view controller should hide the "Done" button (the right
// navigation bar button) on edit. Default is NO.
@property(nonatomic, assign) BOOL shouldDisableDoneButtonOnEdit;

// Whether this table view controller should show the "Add" button in the
// toolbar(bottom left). Cannot be set to YES if
// `shouldShowSettingsButtonInToolbar` is already enabled. Default is NO.
@property(nonatomic, assign) BOOL shouldShowAddButtonInToolbar;

// Whether this table view controller should show the "Settings" button in the
// toolbar(bottom left). Cannot be set to YES if `shouldShowAddButtonInToolbar`
// is already enabled. Default is NO.
@property(nonatomic, assign) BOOL shouldShowSettingsButtonInToolbar;

// Whether this table view controller should show the "Delete" button in the
// toolbar(bottom left) in edit mode. Default is YES. Set in `viewDidLoad`.
@property(nonatomic, assign) BOOL shouldShowDeleteButtonInToolbar;

// Updates the edit or done button to reflect editing state.  If the
// tableView is not in edit mode (and thus showing the 'Done' button) it is
// using shouldHideDoneButton to know if it should display the edit button.
// TODO(crbug.com/952227): This method should probably be called from the
// setEditing:animated: method instead of being manually triggered.
- (void)updateUIForEditState;

// Updates the edit or done button to reflect editing state in the toolbar.
// Shows Add button in the left end if `shouldShowAddButtonInToolbar` is YES. In
// edit state, the left end shows the Delete button and the right end shows
// Done.
- (void)updatedToolbarForEditState;

// Reloads the table view model with `loadModel` and then reloads the
// table view data.
- (void)reloadData;

@end

// Subclasses of SettingsRootTableViewController should implement the
// following methods to customize the behavior.
@interface SettingsRootTableViewController (Subclassing)

// Returns YES. Subclasses should overload this if a toolbar is required.
- (BOOL)shouldHideToolbar;

// Returns NO.  Subclasses should overload this if an edit button is required.
- (BOOL)shouldShowEditButton;

// Returns NO.  Subclasses should overload this if the edit button should be
// enabled.
- (BOOL)editButtonEnabled;

// Returns YES by default. Subclasses should overload this if the edit done
// button should be shown.
- (BOOL)shouldShowEditDoneButton;

// Notifies the view controller that the edit button has been tapped. If you
// override this method, you must call -[super editButtonPressed] at some point
// in your implementation.
//
// Note that this method calls -[self setEditing:] in order to change the
// editing mode of this controller.
- (void)editButtonPressed;

// Returns NO. Subclasses should overload this if the cancel button should be
// shown during editing.
- (BOOL)showCancelDuringEditing;

// Called when this ViewController toolbar's delete item has been tapped.
// `indexPaths` is the index paths of the currently selected item to be deleted.
// Default implementation removes the items.
- (void)deleteItems:(NSArray<NSIndexPath*>*)indexPaths;

// Prevents user interaction until `-allowUserInteraction` is called by doing
// the following:
// * Disables user interaction with the navigation bar.
// * Replaces the done button with an activity indicator.
// * Covers the TableView with a transparent veil.
- (void)preventUserInteraction;

// Allows user interaction:
// * Enables user interaction with the navigation bar.
// * Restores the done button.
// * Removes the transparent veil.
- (void)allowUserInteraction;

// Called when the add button in the toolbar is pressed. Subclasses must
// override this method if `shouldShowAddButtonInToolbar` is set to YES.
- (void)addButtonCallback;

// Called when the add button in the toolbar is pressed. Subclasses must
// override this method if `shouldShowSettingsButtonInToolbar` is set to YES.
- (void)settingsButtonCallback;

@end

#endif  // IOS_CHROME_BROWSER_UI_SETTINGS_SETTINGS_ROOT_TABLE_VIEW_CONTROLLER_H_
