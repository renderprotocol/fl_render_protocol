import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPTextView extends StatelessWidget {
  const RPTextView({super.key, required this.text});

  final RPText text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.value,
      style: text.hasStyle() ? text.style.toFlutterTextStyle() : null,
      maxLines: text.hasMaxLines() ? text.maxLines : null,
      overflow: text.overflow != RPTextOverflow.RP_TEXT_OVERFLOW_UNSPECIFIED ? text.overflow.toFlutterOverflow() : null,
      textAlign: text.textAlignment != RPTextAlignment.RP_TEXT_ALIGNMENT_UNSPECIFIED
          ? text.textAlignment.toFlutterTextAlign()
          : null,
    );
  }
}
