// Copyright 2017 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ios/chrome/browser/ui/ntp/metrics/metrics.h"

#import "base/mac/foundation_util.h"
#import "components/favicon_base/favicon_types.h"
#import "components/ntp_tiles/metrics.h"
#import "components/ntp_tiles/ntp_tile_impression.h"
#import "components/ntp_tiles/tile_visual_type.h"
#import "ios/chrome/browser/application_context/application_context.h"
#import "ios/chrome/browser/ui/favicon/favicon_attributes_with_payload.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

namespace {

ntp_tiles::TileVisualType VisualTypeFromAttributes(
    const FaviconAttributes* attributes) {
  if (!attributes) {
    return ntp_tiles::TileVisualType::NONE;
  } else if (attributes.faviconImage) {
    return ntp_tiles::TileVisualType::ICON_REAL;
  }
  return attributes.defaultBackgroundColor
             ? ntp_tiles::TileVisualType::ICON_DEFAULT
             : ntp_tiles::TileVisualType::ICON_COLOR;
}

favicon_base::IconType IconTypeFromAttributes(
    const FaviconAttributes* attributes) {
  favicon_base::IconType icon_type = favicon_base::IconType::kInvalid;
  if (attributes.faviconImage) {
    FaviconAttributesWithPayload* favicon_attributes =
        base::mac::ObjCCastStrict<FaviconAttributesWithPayload>(attributes);
    icon_type = favicon_attributes.iconType;
  }
  return icon_type;
}

}  // namespace

void RecordNTPTileImpression(int index,
                             ntp_tiles::TileSource source,
                             ntp_tiles::TileTitleSource title_source,
                             const FaviconAttributes* attributes,
                             const GURL& url) {
  ntp_tiles::metrics::RecordTileImpression(ntp_tiles::NTPTileImpression(
      index, source, title_source, VisualTypeFromAttributes(attributes),
      IconTypeFromAttributes(attributes), url));
}

void RecordNTPTileClick(int index,
                        ntp_tiles::TileSource source,
                        ntp_tiles::TileTitleSource title_source,
                        const FaviconAttributes* attributes,
                        const GURL& url) {
  ntp_tiles::metrics::RecordTileClick(ntp_tiles::NTPTileImpression(
      index, source, title_source, VisualTypeFromAttributes(attributes),
      IconTypeFromAttributes(attributes), url));
}
