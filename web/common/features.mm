// Copyright 2017 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ios/web/common/features.h"

#import "base/metrics/field_trial_params.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

namespace web {
namespace features {

BASE_FEATURE(kCrashOnUnexpectedURLChange,
             "CrashOnUnexpectedURLChange",
             base::FEATURE_ENABLED_BY_DEFAULT);

BASE_FEATURE(kBlockUniversalLinksInOffTheRecordMode,
             "BlockUniversalLinksInOffTheRecord",
             base::FEATURE_ENABLED_BY_DEFAULT);

BASE_FEATURE(kKeepsRenderProcessAlive,
             "KeepsRenderProcessAlive",
             base::FEATURE_ENABLED_BY_DEFAULT);

BASE_FEATURE(kClearOldNavigationRecordsWorkaround,
             "ClearOldNavigationRecordsWorkaround",
             base::FEATURE_ENABLED_BY_DEFAULT);

BASE_FEATURE(kEnablePersistentDownloads,
             "EnablePersistentDownloads",
             base::FEATURE_DISABLED_BY_DEFAULT);

BASE_FEATURE(kPreserveScrollViewProperties,
             "PreserveScrollViewProperties",
             base::FEATURE_ENABLED_BY_DEFAULT);

BASE_FEATURE(kRecordSnapshotSize,
             "RecordSnapshotSize",
             base::FEATURE_DISABLED_BY_DEFAULT);

BASE_FEATURE(kSetRequestAttribution,
             "SetRequestAttribution",
             base::FEATURE_ENABLED_BY_DEFAULT);

BASE_FEATURE(kIOSSharedHighlightingColorChange,
             "IOSSharedHighlightingColorChange",
             base::FEATURE_ENABLED_BY_DEFAULT);

BASE_FEATURE(kSynthesizedRestoreSession,
             "SynthesizedRestoreSession",
             base::FEATURE_ENABLED_BY_DEFAULT);

BASE_FEATURE(kEnableFullscreenAPI,
             "EnableFullscreenAPI",
             base::FEATURE_DISABLED_BY_DEFAULT);

BASE_FEATURE(kMediaPermissionsControl,
             "MediaPermissionsControl",
             base::FEATURE_DISABLED_BY_DEFAULT);

BASE_FEATURE(kUseLoadSimulatedRequestForOfflinePage,
             "UseLoadSimulatedRequestForErrorPageNavigation",
             base::FEATURE_DISABLED_BY_DEFAULT);

BASE_FEATURE(kEnableWebPageAnnotations,
             "EnableWebPageAnnotations",
             base::FEATURE_DISABLED_BY_DEFAULT);

BASE_FEATURE(kLongPressSurroundingText,
             "LongPressSurroundingText",
             base::FEATURE_DISABLED_BY_DEFAULT);

bool IsMediaPermissionsControlEnabled() {
  if (@available(iOS 15, *)) {
    return base::FeatureList::IsEnabled(kMediaPermissionsControl);
  }
  return false;
}

bool IsLoadSimulatedRequestAPIEnabled() {
  if (@available(iOS 15, *)) {
    return base::FeatureList::IsEnabled(kUseLoadSimulatedRequestForOfflinePage);
  }
  return false;
}

}  // namespace features
}  // namespace web
