import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPTextView extends StatelessWidget {
  const RPTextView({super.key, required this.text});

  final RPText text;

  @override
  Widget build(BuildContext context) {
    return Text(text.value);
  }
}
