// Copyright 2019 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ios/chrome/browser/ui/find_bar/find_in_page_controller_app_interface.h"

#import "ios/chrome/browser/find_in_page/find_in_page_controller.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

@implementation FindInPageControllerAppInterface

+ (void)clearSearchTerm {
  [FindInPageController setSearchTerm:nil];
}

@end
