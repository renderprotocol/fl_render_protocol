import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPSizeBoxView extends StatelessWidget {
  const RPSizeBoxView({super.key, required this.sizeBox});

  final RPSizeBox sizeBox;

  @override
  Widget build(BuildContext context) {
    if (!sizeBox.hasChild()) return const SizedBox();

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: sizeBox.hasMinWidth() ? sizeBox.minWidth : 0,
        minHeight: sizeBox.hasMinHeight() ? sizeBox.minHeight : 0,
        maxWidth: sizeBox.hasMaxWidth() ? sizeBox.maxWidth : double.infinity,
        maxHeight: sizeBox.hasMaxHeight() ? sizeBox.maxHeight : double.infinity,
      ),
      child: SizedBox(
        width: sizeBox.hasWidth() ? sizeBox.width : null,
        height: sizeBox.hasHeight() ? sizeBox.height : null,
        child: RPWidgetView(widget: sizeBox.child),
      ),
    );
  }
}
