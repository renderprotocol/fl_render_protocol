import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPRowView extends StatelessWidget {
  const RPRowView({super.key, required this.row});

  final RPRow row;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: row.alignment.toCrossAxisAlignment(),
      mainAxisSize: MainAxisSize.min,
      children: row.children.map((w) => RPWidgetView(widget: w)).toList(),
    );
  }
}
