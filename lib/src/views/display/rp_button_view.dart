import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPButtonView extends StatelessWidget {
  const RPButtonView({super.key, required this.button});

  final RPButton button;

  @override
  Widget build(BuildContext context) {
    final style = button.style;
    final onPressed = button.disabled ? null : () => RPActionHandler.handle(button.action);
    final child = button.hasLabel() ? RPWidgetView(widget: button.label) : const SizedBox();

    if (style == RPButtonStyle.RP_BUTTON_STYLE_TEXT) {
      return TextButton(onPressed: onPressed, child: child);
    }

    if (style == RPButtonStyle.RP_BUTTON_STYLE_OUTLINED) {
      return OutlinedButton(onPressed: onPressed, child: child);
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: style.foregroundColor(context),
        backgroundColor: style.backgroundColor(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: child,
    );
  }
}
