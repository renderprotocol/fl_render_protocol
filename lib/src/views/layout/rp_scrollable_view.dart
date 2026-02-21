import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPScrollableView extends StatelessWidget {
  const RPScrollableView({super.key, required this.scrollable});

  final RPScrollable scrollable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: scrollable.axis.toFlutterAxis(),
      child: scrollable.hasChild() ? RPWidgetView(widget: scrollable.child) : const SizedBox(),
    );
  }
}
