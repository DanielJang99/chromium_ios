// Copyright 2018 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef IOS_CHROME_BROWSER_UI_FULLSCREEN_FULLSCREEN_FEATURES_H_
#define IOS_CHROME_BROWSER_UI_FULLSCREEN_FULLSCREEN_FEATURES_H_

#include "base/feature_list.h"
#include "components/flags_ui/feature_entry.h"

namespace fullscreen {
namespace features {

// Feature used by finch config to enable smooth scrolling when the default
// viewport adjustment experiment is selected via command line switches.
BASE_DECLARE_FEATURE(kSmoothScrollingDefault);

}  // namespace features
}  // namespace fullscreen

#endif  // IOS_CHROME_BROWSER_UI_FULLSCREEN_FULLSCREEN_FEATURES_H_
