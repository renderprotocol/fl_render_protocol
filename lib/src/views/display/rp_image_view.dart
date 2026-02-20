import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPImageView extends StatelessWidget {
  const RPImageView({super.key, required this.image});

  final RPImage image;

  @override
  Widget build(BuildContext context) {
    final width = image.hasWidth() ? image.width.toDouble() : null;
    final height = image.hasHeight() ? image.height.toDouble() : null;
    final fit = image.contentMode.toBoxFit();

    return Image.network(
      image.url,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: image.hasAltText() ? image.altText : null,
      errorBuilder: (context, error, stackTrace) {
        if (image.hasPlaceholderUrl()) {
          return Image.network(
            image.placeholderUrl,
            width: width,
            height: height,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => _defaultPlaceholder(width, height),
          );
        }
        return _defaultPlaceholder(width, height);
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          width: width,
          height: height,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _defaultPlaceholder(double? width, double? height) {
    return SizedBox(
      width: width,
      height: height,
      child: const Center(
        child: Icon(Icons.photo, color: Colors.grey),
      ),
    );
  }
}
