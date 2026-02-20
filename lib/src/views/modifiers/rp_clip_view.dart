import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPClipView extends StatelessWidget {
  const RPClipView({super.key, required this.clip});

  final RPClip clip;

  @override
  Widget build(BuildContext context) {
    if (!clip.hasChild()) return const SizedBox();

    final child = RPWidgetView(widget: clip.child);

    if (!clip.hasShape()) {
      return ClipRect(child: child);
    }

    switch (clip.shape.whichValue()) {
      case .rectangle:
        return ClipRect(child: child);
      case .circle:
        return ClipOval(child: child);
      case .ellipse:
        return ClipOval(child: child);
      case .capsule:
        return ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: child,
        );
      case .roundedRectangle:
        return ClipRRect(
          borderRadius: BorderRadius.circular(
            clip.shape.roundedRectangle.radius,
          ),
          child: child,
        );
      case .notSet:
        return ClipRect(child: child);
    }
  }
}
