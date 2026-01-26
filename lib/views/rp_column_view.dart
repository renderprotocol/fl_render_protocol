import 'package:fl_render_protocol/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPColumnView extends StatelessWidget {
  const RPColumnView({super.key, required this.column});

  final RPColumn column;

  @override
  Widget build(BuildContext context) {
    return Column(children: column.children.map((widget) => RPWidgetView(widget: widget)).toList());
  }
}
