import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPBackgroundView extends StatelessWidget {
  const RPBackgroundView({super.key, required this.background});

  final RPBackground background;

  @override
  Widget build(BuildContext context) {
    if (!background.hasChild()) return const SizedBox();

    return ColoredBox(
      color: background.hasColor() ? background.color.toFlutterColor() : Colors.transparent,
      child: RPWidgetView(widget: background.child),
    );
  }
}
