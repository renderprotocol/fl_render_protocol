import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPIconView extends StatelessWidget {
  const RPIconView({super.key, required this.icon});

  final RPIcon icon;

  @override
  Widget build(BuildContext context) {
    final size = icon.hasSize() ? icon.size : 24.0;
    final color = icon.hasColor() ? icon.color.toFlutterColor() : null;

    return Icon(
      iconFromRPCodePoint(icon.name),
      size: size,
      color: color,
    );
  }
}
