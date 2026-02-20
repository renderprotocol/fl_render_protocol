import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPScrollViewView extends StatelessWidget {
  const RPScrollViewView({super.key, required this.scrollView});

  final RPScrollView scrollView;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: scrollView.axis.toFlutterAxis(),
      child: scrollView.hasChild() ? RPWidgetView(widget: scrollView.child) : const SizedBox(),
    );
  }
}
