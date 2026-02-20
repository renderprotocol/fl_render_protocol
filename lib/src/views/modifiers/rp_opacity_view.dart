import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPOpacityView extends StatelessWidget {
  const RPOpacityView({super.key, required this.opacity});

  final RPOpacity opacity;

  @override
  Widget build(BuildContext context) {
    if (!opacity.hasChild()) return const SizedBox();

    return Opacity(
      opacity: opacity.value.clamp(0.0, 1.0),
      child: RPWidgetView(widget: opacity.child),
    );
  }
}
