import 'package:fl_render_protocol/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPStackView extends StatelessWidget {
  const RPStackView({super.key, required this.stack});

  final RPStack stack;

  @override
  Widget build(BuildContext context) {
    return Stack(children: stack.children.map((widget) => RPWidgetView(widget: widget)).toList());
  }
}
