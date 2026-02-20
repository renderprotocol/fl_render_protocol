import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPShadowView extends StatelessWidget {
  const RPShadowView({super.key, required this.shadow});

  final RPShadow shadow;

  @override
  Widget build(BuildContext context) {
    if (!shadow.hasChild()) return const SizedBox();

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadow.hasColor() ? shadow.color.toFlutterColor() : Colors.black.withValues(alpha: 0.33),
            blurRadius: shadow.radius,
            offset: Offset(shadow.offsetX, shadow.offsetY),
          ),
        ],
      ),
      child: RPWidgetView(widget: shadow.child),
    );
  }
}
