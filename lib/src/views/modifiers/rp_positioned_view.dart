import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPPositionedView extends StatelessWidget {
  const RPPositionedView({super.key, required this.positioned});

  final RPPositioned positioned;

  @override
  Widget build(BuildContext context) {
    if (!positioned.hasChild()) return const SizedBox();

    return Positioned(
      top: positioned.hasTop() ? positioned.top : null,
      bottom: positioned.hasBottom() ? positioned.bottom : null,
      left: positioned.hasLeading() ? positioned.leading : null,
      right: positioned.hasTrailing() ? positioned.trailing : null,
      child: RPWidgetView(widget: positioned.child),
    );
  }
}
