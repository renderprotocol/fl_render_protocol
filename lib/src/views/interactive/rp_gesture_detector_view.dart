import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPGestureDetectorView extends StatelessWidget {
  const RPGestureDetectorView({super.key, required this.gestureDetector});

  final RPGestureDetector gestureDetector;

  @override
  Widget build(BuildContext context) {
    if (!gestureDetector.hasChild()) return const SizedBox();

    return GestureDetector(
      onTap: gestureDetector.hasOnTap() ? () => RPActionHandler.handle(gestureDetector.onTap) : null,
      onLongPress: gestureDetector.hasOnLongPress() ? () => RPActionHandler.handle(gestureDetector.onLongPress) : null,
      onDoubleTap: gestureDetector.hasOnDoubleTap() ? () => RPActionHandler.handle(gestureDetector.onDoubleTap) : null,
      child: RPWidgetView(widget: gestureDetector.child),
    );
  }
}
