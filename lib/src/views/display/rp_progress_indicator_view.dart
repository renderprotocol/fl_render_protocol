import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPProgressIndicatorView extends StatelessWidget {
  const RPProgressIndicatorView({super.key, required this.progressIndicator});

  final RPProgressIndicator progressIndicator;

  @override
  Widget build(BuildContext context) {
    final color = progressIndicator.hasColor() ? progressIndicator.color.toFlutterColor() : null;
    final value = progressIndicator.hasValue() ? progressIndicator.value.toDouble() : null;

    switch (progressIndicator.type) {
      case .RP_PROGRESS_INDICATOR_TYPE_LINEAR:
        return LinearProgressIndicator(value: value, color: color);
      default:
        return CircularProgressIndicator(value: value, color: color);
    }
  }
}
