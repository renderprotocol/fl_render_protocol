import 'package:fl_render_protocol/src/views/rp_column_view.dart';
import 'package:fl_render_protocol/src/views/rp_image_view.dart';
import 'package:fl_render_protocol/src/views/rp_row_view.dart';
import 'package:fl_render_protocol/src/views/rp_stack_view.dart';
import 'package:fl_render_protocol/src/views/rp_text_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPWidgetView extends StatelessWidget {
  const RPWidgetView({super.key, required this.widget});

  final RPWidget widget;

  @override
  Widget build(BuildContext context) {
    switch (widget.whichContent()) {
      case .row:
        return RPRowView(row: widget.row);
      case .column:
        return RPColumnView(column: widget.column);
      case .stack:
        return RPStackView(stack: widget.stack);
      case .text:
        return RPTextView(text: widget.text);
      case .image:
        return RPImageView(image: widget.image);
      case .notSet:
        return const SizedBox();
    }
  }
}
