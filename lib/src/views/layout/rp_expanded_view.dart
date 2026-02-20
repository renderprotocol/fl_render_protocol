import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPExpandedView extends StatelessWidget {
  const RPExpandedView({super.key, required this.expanded});

  final RPExpanded expanded;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: expanded.flex > 0 ? expanded.flex : 1,
      child: expanded.hasChild() ? RPWidgetView(widget: expanded.child) : const SizedBox(),
    );
  }
}
