import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPSpacerView extends StatelessWidget {
  const RPSpacerView({super.key, required this.spacer});

  final RPSpacer spacer;

  @override
  Widget build(BuildContext context) {
    if (spacer.hasMinLength()) {
      return SizedBox(
        width: spacer.minLength,
        height: spacer.minLength,
      );
    }
    return const Spacer();
  }
}
