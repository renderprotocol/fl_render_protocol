import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPVisibilityView extends StatelessWidget {
  const RPVisibilityView({super.key, required this.visibility});

  final RPVisibility visibility;

  @override
  Widget build(BuildContext context) {
    if (!visibility.hasChild()) return const SizedBox();

    return Visibility(
      visible: visibility.visible,
      child: RPWidgetView(widget: visibility.child),
    );
  }
}
