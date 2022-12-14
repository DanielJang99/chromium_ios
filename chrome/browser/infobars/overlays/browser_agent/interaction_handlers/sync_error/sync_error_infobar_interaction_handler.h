// Copyright 2022 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef IOS_CHROME_BROWSER_INFOBARS_OVERLAYS_BROWSER_AGENT_INTERACTION_HANDLERS_SYNC_ERROR_SYNC_ERROR_INFOBAR_INTERACTION_HANDLER_H_
#define IOS_CHROME_BROWSER_INFOBARS_OVERLAYS_BROWSER_AGENT_INTERACTION_HANDLERS_SYNC_ERROR_SYNC_ERROR_INFOBAR_INTERACTION_HANDLER_H_

#import "ios/chrome/browser/infobars/overlays/browser_agent/interaction_handlers/common/infobar_banner_interaction_handler.h"

// Helper object that updates the model layer for interaction events with the
// sync error infobar banner UI.
class SyncErrorInfobarInteractionHandler : public InfobarInteractionHandler {
 public:
  SyncErrorInfobarInteractionHandler();
  ~SyncErrorInfobarInteractionHandler() override;
};

#endif  // IOS_CHROME_BROWSER_INFOBARS_OVERLAYS_BROWSER_AGENT_INTERACTION_HANDLERS_SYNC_ERROR_SYNC_ERROR_INFOBAR_INTERACTION_HANDLER_H_
