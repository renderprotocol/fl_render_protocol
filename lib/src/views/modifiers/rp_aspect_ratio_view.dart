import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPAspectRatioView extends StatelessWidget {
  const RPAspectRatioView({super.key, required this.aspectRatio});

  final RPAspectRatio aspectRatio;

  @override
  Widget build(BuildContext context) {
    if (!aspectRatio.hasChild()) return const SizedBox();

    return AspectRatio(
      aspectRatio: aspectRatio.ratio > 0 ? aspectRatio.ratio : 1.0,
      child: RPWidgetView(widget: aspectRatio.child),
    );
  }
}
