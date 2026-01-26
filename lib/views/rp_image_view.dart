import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPImageView extends StatelessWidget {
  const RPImageView({super.key, required this.image});

  final RPImage image;

  @override
  Widget build(BuildContext context) {
    return Image.network(image.url);
  }
}
