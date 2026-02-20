import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPCenterView extends StatelessWidget {
  const RPCenterView({super.key, required this.center});

  final RPCenter center;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: center.hasChild() ? RPWidgetView(widget: center.child) : const SizedBox(),
    );
  }
}
