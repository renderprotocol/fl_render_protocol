// Layout
import 'package:fl_render_protocol/src/views/layout/rp_column_view.dart';
import 'package:fl_render_protocol/src/views/layout/rp_row_view.dart';
import 'package:fl_render_protocol/src/views/layout/rp_stack_view.dart';
import 'package:fl_render_protocol/src/views/layout/rp_scroll_view_view.dart';
import 'package:fl_render_protocol/src/views/layout/rp_lazy_list_view.dart';
import 'package:fl_render_protocol/src/views/layout/rp_lazy_grid_view.dart';
import 'package:fl_render_protocol/src/views/layout/rp_wrap_view.dart';
import 'package:fl_render_protocol/src/views/layout/rp_center_view.dart';
import 'package:fl_render_protocol/src/views/layout/rp_expanded_view.dart';

// Modifiers
import 'package:fl_render_protocol/src/views/modifiers/rp_padding_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_background_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_border_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_clip_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_opacity_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_visibility_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_shadow_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_size_box_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_safe_area_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_aspect_ratio_view.dart';
import 'package:fl_render_protocol/src/views/modifiers/rp_positioned_view.dart';

// Display
import 'package:fl_render_protocol/src/views/display/rp_image_view.dart';
import 'package:fl_render_protocol/src/views/display/rp_text_view.dart';
import 'package:fl_render_protocol/src/views/display/rp_icon_view.dart';
import 'package:fl_render_protocol/src/views/display/rp_spacer_view.dart';
import 'package:fl_render_protocol/src/views/display/rp_divider_view.dart';
import 'package:fl_render_protocol/src/views/display/rp_progress_indicator_view.dart';
import 'package:fl_render_protocol/src/views/display/rp_button_view.dart';

// Input
import 'package:fl_render_protocol/src/views/input/rp_text_field_view.dart';
import 'package:fl_render_protocol/src/views/input/rp_toggle_view.dart';
import 'package:fl_render_protocol/src/views/input/rp_slider_view.dart';

// Composite
import 'package:fl_render_protocol/src/views/composite/rp_card_view.dart';
import 'package:fl_render_protocol/src/views/composite/rp_list_tile_view.dart';
import 'package:fl_render_protocol/src/views/composite/rp_app_bar_view.dart';
import 'package:fl_render_protocol/src/views/composite/rp_bottom_nav_bar_view.dart';
import 'package:fl_render_protocol/src/views/composite/rp_badge_view.dart';
import 'package:fl_render_protocol/src/views/composite/rp_scaffold_view.dart';

// Interactive
import 'package:fl_render_protocol/src/views/interactive/rp_gesture_detector_view.dart';

import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPWidgetView extends StatelessWidget {
  const RPWidgetView({super.key, required this.widget});

  final RPWidget widget;

  @override
  Widget build(BuildContext context) {
    switch (widget.whichContent()) {
      // ── Layout (51–69) ──────────────────────────────────
      case .row:
        return RPRowView(row: widget.row);
      case .column:
        return RPColumnView(column: widget.column);
      case .stack:
        return RPStackView(stack: widget.stack);
      case .scrollView:
        return RPScrollViewView(scrollView: widget.scrollView);
      case .lazyList:
        return RPLazyListView(lazyList: widget.lazyList);
      case .lazyGrid:
        return RPLazyGridView(lazyGrid: widget.lazyGrid);
      case .wrap:
        return RPWrapView(wrap: widget.wrap);
      case .center:
        return RPCenterView(center: widget.center);
      case .expanded:
        return RPExpandedView(expanded: widget.expanded);

      // ── Modifiers (70–89) ───────────────────────────────
      case .padding:
        return RPPaddingView(padding: widget.padding);
      case .background:
        return RPBackgroundView(background: widget.background);
      case .border:
        return RPBorderView(border: widget.border);
      case .clip:
        return RPClipView(clip: widget.clip);
      case .opacity:
        return RPOpacityView(opacity: widget.opacity);
      case .visibility:
        return RPVisibilityView(visibility: widget.visibility);
      case .shadow:
        return RPShadowView(shadow: widget.shadow);
      case .sizeBox:
        return RPSizeBoxView(sizeBox: widget.sizeBox);
      case .safeArea:
        return RPSafeAreaView(safeArea: widget.safeArea);
      case .aspectRatio:
        return RPAspectRatioView(aspectRatio: widget.aspectRatio);
      case .positioned:
        return RPPositionedView(positioned: widget.positioned);

      // ── Display (101–149) ───────────────────────────────
      case .text:
        return RPTextView(text: widget.text);
      case .image:
        return RPImageView(image: widget.image);
      case .icon:
        return RPIconView(icon: widget.icon);
      case .spacer:
        return RPSpacerView(spacer: widget.spacer);
      case .divider:
        return RPDividerView(divider: widget.divider);
      case .progressIndicator:
        return RPProgressIndicatorView(
          progressIndicator: widget.progressIndicator,
        );
      case .button:
        return RPButtonView(button: widget.button);

      // ── Input (150–179) ─────────────────────────────────
      case .textField:
        return RPTextFieldView(textField: widget.textField);
      case .toggle:
        return RPToggleView(toggle: widget.toggle);
      case .slider:
        return RPSliderView(slider: widget.slider);

      // ── Composite (180–199) ─────────────────────────────
      case .card:
        return RPCardView(card: widget.card);
      case .listTile:
        return RPListTileView(listTile: widget.listTile);
      case .appBar:
        return RPAppBarView(appBar: widget.appBar);
      case .bottomNavBar:
        return RPBottomNavBarView(bottomNavBar: widget.bottomNavBar);
      case .badge:
        return RPBadgeView(badge: widget.badge);
      case .scaffold:
        return RPScaffoldView(scaffold: widget.scaffold);

      // ── Interactive (200–219) ───────────────────────────
      case .gestureDetector:
        return RPGestureDetectorView(gestureDetector: widget.gestureDetector);

      case .notSet:
        return const SizedBox();
    }
  }
}
