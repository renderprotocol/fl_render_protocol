import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPCardView extends StatelessWidget {
  const RPCardView({super.key, required this.card});

  final RPCard card;

  @override
  Widget build(BuildContext context) {
    if (!card.hasChild()) return const SizedBox();

    final bgColor = card.hasBackgroundColor() ? card.backgroundColor.toFlutterColor() : Theme.of(context).cardColor;
    final radius = card.hasCornerRadius() ? card.cornerRadius : 12.0;
    final elevation = card.hasElevation() ? card.elevation : 4.0;

    return Card(
      color: bgColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: card.hasPadding() ? card.padding.toFlutterEdgeInsets() : const EdgeInsets.all(12),
        child: RPWidgetView(widget: card.child),
      ),
    );
  }
}
