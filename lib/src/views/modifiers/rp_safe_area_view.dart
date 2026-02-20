import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPSafeAreaView extends StatelessWidget {
  const RPSafeAreaView({super.key, required this.safeArea});

  final RPSafeArea safeArea;

  @override
  Widget build(BuildContext context) {
    if (!safeArea.hasChild()) return const SizedBox();

    return SafeArea(
      top: safeArea.top,
      bottom: safeArea.bottom,
      left: safeArea.leading,
      right: safeArea.trailing,
      child: RPWidgetView(widget: safeArea.child),
    );
  }
}
