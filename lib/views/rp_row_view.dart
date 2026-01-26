import 'package:fl_render_protocol/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPRowView extends StatelessWidget {
  const RPRowView({super.key, required this.row});

  final RPRow row;

  @override
  Widget build(BuildContext context) {
    return Row(children: row.children.map((widget) => RPWidgetView(widget: widget)).toList());
  }
}
