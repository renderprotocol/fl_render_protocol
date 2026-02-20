import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPColumnView extends StatelessWidget {
  const RPColumnView({super.key, required this.column});

  final RPColumn column;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: column.alignment.toCrossAxisAlignment(),
      mainAxisSize: MainAxisSize.min,
      children: column.children.map((w) => RPWidgetView(widget: w)).toList(),
    );
  }
}
