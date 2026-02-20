import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPBorderView extends StatelessWidget {
  const RPBorderView({super.key, required this.border});

  final RPBorder border;

  @override
  Widget build(BuildContext context) {
    if (!border.hasChild()) return const SizedBox();

    final color = border.hasColor() ? border.color.toFlutterColor() : Theme.of(context).dividerColor;
    final width = border.width;
    final radius = border.hasRadius() ? BorderRadius.circular(border.radius) : null;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: width),
        borderRadius: radius,
      ),
      child: radius != null
          ? ClipRRect(
              borderRadius: radius,
              child: RPWidgetView(widget: border.child),
            )
          : RPWidgetView(widget: border.child),
    );
  }
}
