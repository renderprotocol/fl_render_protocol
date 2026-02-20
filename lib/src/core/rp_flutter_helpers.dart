import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

// ── RPColor → Flutter Color ──────────────────────────────

extension RPColorExtension on RPColor {
  Color toFlutterColor() {
    return Color.fromRGBO(red, green, blue, hasOpacity() ? opacity : 1.0);
  }
}

// ── RPAlignment → Flutter Alignment ─────────────────────

extension RPAlignmentExtension on RPAlignment {
  Alignment toFlutterAlignment() {
    switch (this) {
      case .RP_ALIGNMENT_CENTER:
        return .center;
      case .RP_ALIGNMENT_TOP:
        return .topCenter;
      case .RP_ALIGNMENT_BOTTOM:
        return .bottomCenter;
      case .RP_ALIGNMENT_LEADING:
        return .centerLeft;
      case .RP_ALIGNMENT_TRAILING:
        return .centerRight;
      case .RP_ALIGNMENT_TOP_LEADING:
        return .topLeft;
      case .RP_ALIGNMENT_TOP_TRAILING:
        return .topRight;
      case .RP_ALIGNMENT_BOTTOM_LEADING:
        return .bottomLeft;
      case .RP_ALIGNMENT_BOTTOM_TRAILING:
        return .bottomRight;
      default:
        return .center;
    }
  }

  AlignmentGeometry toAlignmentGeometry() {
    switch (this) {
      case .RP_ALIGNMENT_CENTER:
        return .center;
      case .RP_ALIGNMENT_TOP:
        return .topCenter;
      case .RP_ALIGNMENT_BOTTOM:
        return .bottomCenter;
      case .RP_ALIGNMENT_LEADING:
        return .centerStart;
      case .RP_ALIGNMENT_TRAILING:
        return .centerEnd;
      case .RP_ALIGNMENT_TOP_LEADING:
        return .topStart;
      case .RP_ALIGNMENT_TOP_TRAILING:
        return .topEnd;
      case .RP_ALIGNMENT_BOTTOM_LEADING:
        return .bottomStart;
      case .RP_ALIGNMENT_BOTTOM_TRAILING:
        return .bottomEnd;
      default:
        return .center;
    }
  }
}

// ── RPAxisAlignment → Flutter Alignment ─────────────────

extension RPAxisAlignmentExtension on RPAxisAlignment {
  MainAxisAlignment toMainAxisAlignment() {
    switch (this) {
      case .RP_AXIS_ALIGNMENT_CENTER:
        return .center;
      case .RP_AXIS_ALIGNMENT_LEADING:
        return .start;
      case .RP_AXIS_ALIGNMENT_TRAILING:
        return .end;
      case .RP_AXIS_ALIGNMENT_SPACE_BETWEEN:
        return .spaceBetween;
      case .RP_AXIS_ALIGNMENT_SPACE_EVENLY:
        return .spaceEvenly;
      default:
        return .start;
    }
  }

  CrossAxisAlignment toCrossAxisAlignment() {
    switch (this) {
      case .RP_AXIS_ALIGNMENT_CENTER:
        return .center;
      case .RP_AXIS_ALIGNMENT_LEADING:
        return .start;
      case .RP_AXIS_ALIGNMENT_TRAILING:
        return .end;
      default:
        return .center;
    }
  }
}

// ── RPContentMode → Flutter BoxFit ──────────────────────

extension RPContentModeExtension on RPContentMode {
  BoxFit toBoxFit() {
    switch (this) {
      case .RP_CONTENT_MODE_FIT:
        return .contain;
      case .RP_CONTENT_MODE_FILL:
        return .cover;
      case .RP_CONTENT_MODE_STRETCH:
        return .fill;
      case .RP_CONTENT_MODE_NONE:
        return .none;
      default:
        return .contain;
    }
  }
}

// ── RPFontWeight → Flutter FontWeight ───────────────────

extension RPFontWeightExtension on RPFontWeight {
  FontWeight toFlutterFontWeight() {
    switch (this) {
      case .RP_FONT_WEIGHT_THIN:
        return .w100;
      case .RP_FONT_WEIGHT_EXTRA_LIGHT:
        return .w200;
      case .RP_FONT_WEIGHT_LIGHT:
        return .w300;
      case .RP_FONT_WEIGHT_REGULAR:
        return .w400;
      case .RP_FONT_WEIGHT_MEDIUM:
        return .w500;
      case .RP_FONT_WEIGHT_SEMI_BOLD:
        return .w600;
      case .RP_FONT_WEIGHT_BOLD:
        return .w700;
      case .RP_FONT_WEIGHT_EXTRA_BOLD:
        return .w800;
      case .RP_FONT_WEIGHT_BLACK:
        return .w900;
      default:
        return .w400;
    }
  }
}

// ── RPTextAlignment → Flutter TextAlign ─────────────────

extension RPTextAlignmentExtension on RPTextAlignment {
  TextAlign toFlutterTextAlign() {
    switch (this) {
      case .RP_TEXT_ALIGNMENT_LEFT:
        return .left;
      case .RP_TEXT_ALIGNMENT_CENTER:
        return .center;
      case .RP_TEXT_ALIGNMENT_RIGHT:
        return .right;
      case .RP_TEXT_ALIGNMENT_JUSTIFY:
        return .justify;
      default:
        return .start;
    }
  }
}

// ── RPTextStyle → Flutter TextStyle ─────────────────────

extension RPTextStyleExtension on RPTextStyle {
  TextStyle toFlutterTextStyle() {
    return TextStyle(
      fontSize: hasFontSize() ? fontSize : null,
      fontWeight: fontWeight != RPFontWeight.RP_FONT_WEIGHT_UNSPECIFIED ? fontWeight.toFlutterFontWeight() : null,
      color: hasColor() ? color.toFlutterColor() : null,
      height: hasLineHeight() ? lineHeight : null,
      letterSpacing: hasLetterSpacing() ? letterSpacing : null,
      decoration: _toTextDecoration(),
      fontFamily: hasFontFamily() ? fontFamily : null,
      fontStyle: fontStyle == RPFontStyle.RP_FONT_STYLE_ITALIC ? FontStyle.italic : null,
    );
  }

  TextDecoration? _toTextDecoration() {
    switch (decoration) {
      case .RP_TEXT_DECORATION_UNDERLINE:
        return .underline;
      case .RP_TEXT_DECORATION_LINE_THROUGH:
        return .lineThrough;
      case .RP_TEXT_DECORATION_OVERLINE:
        return .overline;
      case .RP_TEXT_DECORATION_NONE:
        return .none;
      default:
        return null;
    }
  }
}

// ── RPAxis → Flutter Axis ───────────────────────────────

extension RPAxisExtension on RPAxis {
  Axis toFlutterAxis() {
    switch (this) {
      case .RP_AXIS_HORIZONTAL:
        return .horizontal;
      default:
        return .vertical;
    }
  }
}

// ── RPEdgeInsets → Flutter EdgeInsets ────────────────────

extension RPEdgeInsetsExtension on RPEdgeInsets {
  EdgeInsetsDirectional toFlutterEdgeInsets() {
    return EdgeInsetsDirectional.only(
      top: top,
      bottom: bottom,
      start: leading,
      end: trailing,
    );
  }
}

// ── RPButtonStyle helpers ───────────────────────────────

extension RPButtonStyleExtension on RPButtonStyle {
  Color foregroundColor(BuildContext context) {
    switch (this) {
      case .RP_BUTTON_STYLE_PRIMARY:
        return Colors.white;
      case .RP_BUTTON_STYLE_SECONDARY:
        return Theme.of(context).colorScheme.onSurface;
      case .RP_BUTTON_STYLE_TEXT:
        return Theme.of(context).colorScheme.primary;
      case .RP_BUTTON_STYLE_OUTLINED:
        return Theme.of(context).colorScheme.primary;
      case .RP_BUTTON_STYLE_DESTRUCTIVE:
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  Color backgroundColor(BuildContext context) {
    switch (this) {
      case .RP_BUTTON_STYLE_PRIMARY:
        return Theme.of(context).colorScheme.primary;
      case .RP_BUTTON_STYLE_SECONDARY:
        return Theme.of(context).colorScheme.surfaceContainerHighest;
      case .RP_BUTTON_STYLE_TEXT:
        return Colors.transparent;
      case .RP_BUTTON_STYLE_OUTLINED:
        return Colors.transparent;
      case .RP_BUTTON_STYLE_DESTRUCTIVE:
        return Colors.red;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  bool get hasBorder => this == .RP_BUTTON_STYLE_OUTLINED;
}

// ── RPKeyboardType → Flutter TextInputType ──────────────

extension RPKeyboardTypeExtension on RPKeyboardType {
  TextInputType toFlutterInputType() {
    switch (this) {
      case .RP_KEYBOARD_TYPE_EMAIL:
        return .emailAddress;
      case .RP_KEYBOARD_TYPE_NUMBER:
        return .number;
      case .RP_KEYBOARD_TYPE_PHONE:
        return .phone;
      case .RP_KEYBOARD_TYPE_URL:
        return .url;
      case .RP_KEYBOARD_TYPE_DECIMAL:
        return const .numberWithOptions(decimal: true);
      default:
        return .text;
    }
  }
}

// ── RPTextOverflow → Flutter TextOverflow ────────────────

extension RPTextOverflowExtension on RPTextOverflow {
  TextOverflow toFlutterOverflow() {
    switch (this) {
      case .RP_TEXT_OVERFLOW_CLIP:
        return .clip;
      case .RP_TEXT_OVERFLOW_ELLIPSIS:
        return .ellipsis;
      case .RP_TEXT_OVERFLOW_FADE:
        return .fade;
      default:
        return .clip;
    }
  }
}

// ── RPCodePoint → Flutter Icon ──────────────────────────

IconData iconFromRPCodePoint(String value) {
  final codePoint = int.tryParse(value);
  return codePoint != null ? IconData(codePoint, fontFamily: 'MaterialIcons') : Icons.question_mark_rounded;
}

// ── Action Handler ──────────────────────────────────────

class RPActionHandler {
  static void handle(RPAction action) {
    // Action handling will be wired through the plugin system.
    // This is a placeholder that can be extended by registering
    // an action handler plugin via RenderProtocol.register(plugin:).
  }
}
