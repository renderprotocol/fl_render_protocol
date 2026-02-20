import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPStackView extends StatelessWidget {
  const RPStackView({super.key, required this.stack});

  final RPStack stack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: stack.alignment.toAlignmentGeometry(),
      children: stack.children.map((w) => RPWidgetView(widget: w)).toList(),
    );
  }
}
