// Copyright 2017 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ios/web_view/internal/web_view_web_state_policy_decider.h"

#import "ios/web_view/internal/cwv_navigation_type_internal.h"
#import "ios/web_view/public/cwv_navigation_delegate.h"
#import "ios/web_view/public/cwv_web_view.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

namespace ios_web_view {

WebViewWebStatePolicyDecider::WebViewWebStatePolicyDecider(
    web::WebState* web_state,
    CWVWebView* web_view)
    : web::WebStatePolicyDecider(web_state), web_view_(web_view) {}

void WebViewWebStatePolicyDecider::ShouldAllowRequest(
    NSURLRequest* request,
    web::WebStatePolicyDecider::RequestInfo request_info,
    web::WebStatePolicyDecider::PolicyDecisionCallback callback) {
  id<CWVNavigationDelegate> delegate = web_view_.navigationDelegate;
  if ([delegate respondsToSelector:@selector
                (webView:shouldStartLoadWithRequest:navigationType:)]) {
    // CWVNavigationType is virtually the same as ui::PageTransition. But
    // ui::PageTransition must not be used in the public API of //ios/web_view
    // because its API must be in pure Objective-C. It cannot use a type defined
    // in a C++ header //ui/base/page_transition_types.h.
    CWVNavigationType navigation_type =
        CWVNavigationTypeFromPageTransition(request_info.transition_type);
    BOOL allow = [delegate webView:web_view_
        shouldStartLoadWithRequest:request
                    navigationType:navigation_type];
    if (!allow) {
      return std::move(callback).Run(
          web::WebStatePolicyDecider::PolicyDecision::Cancel());
    }
  }
  std::move(callback).Run(web::WebStatePolicyDecider::PolicyDecision::Allow());
}

void WebViewWebStatePolicyDecider::ShouldAllowResponse(
    NSURLResponse* response,
    web::WebStatePolicyDecider::ResponseInfo response_info,
    web::WebStatePolicyDecider::PolicyDecisionCallback callback) {
  id<CWVNavigationDelegate> delegate = web_view_.navigationDelegate;
  if ([delegate respondsToSelector:@selector
                (webView:shouldContinueLoadWithResponse:forMainFrame:)]) {
    BOOL allow = [delegate webView:web_view_
        shouldContinueLoadWithResponse:response
                          forMainFrame:response_info.for_main_frame];
    if (!allow) {
      return std::move(callback).Run(
          web::WebStatePolicyDecider::PolicyDecision::Cancel());
    };
  }
  std::move(callback).Run(web::WebStatePolicyDecider::PolicyDecision::Allow());
}

}  // namespace ios_web_view
