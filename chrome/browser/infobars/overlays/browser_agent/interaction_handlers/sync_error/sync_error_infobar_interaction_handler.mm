// Copyright 2022 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ios/chrome/browser/infobars/overlays/browser_agent/interaction_handlers/sync_error/sync_error_infobar_interaction_handler.h"

#import "ios/chrome/browser/infobars/infobar_type.h"
#import "ios/chrome/browser/infobars/overlays/browser_agent/interaction_handlers/sync_error/sync_error_infobar_banner_interaction_handler.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

SyncErrorInfobarInteractionHandler::SyncErrorInfobarInteractionHandler()
    : InfobarInteractionHandler(
          InfobarType::kInfobarTypeSyncError,
          std::make_unique<SyncErrorInfobarBannerInteractionHandler>(),
          /*modal_handler=*/nullptr) {}

SyncErrorInfobarInteractionHandler::~SyncErrorInfobarInteractionHandler() =
    default;
