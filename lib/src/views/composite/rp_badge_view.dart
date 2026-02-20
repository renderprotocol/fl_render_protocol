import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPBadgeView extends StatelessWidget {
  const RPBadgeView({super.key, required this.badge});

  final RPBadge badge;

  @override
  Widget build(BuildContext context) {
    if (!badge.hasChild()) return const SizedBox();

    final badgeColor = badge.hasColor() ? badge.color.toFlutterColor() : Colors.red;
    final child = RPWidgetView(widget: badge.child);

    return Badge(
      isLabelVisible: true,
      backgroundColor: badgeColor,
      label: badge.hasValue()
          ? Text(
              badge.value,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            )
          : null,
      child: child,
    );
  }
}
