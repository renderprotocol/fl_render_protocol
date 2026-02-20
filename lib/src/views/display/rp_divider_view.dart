import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPDividerView extends StatelessWidget {
  const RPDividerView({super.key, required this.divider});

  final RPDivider divider;

  @override
  Widget build(BuildContext context) {
    final color = divider.hasColor() ? divider.color.toFlutterColor() : null;
    final thickness = divider.hasThickness() ? divider.thickness : 1.0;
    final indent = divider.hasIndent() ? divider.indent.leading : 0.0;
    final endIndent = divider.hasIndent() ? divider.indent.trailing : 0.0;

    return Divider(
      color: color,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
