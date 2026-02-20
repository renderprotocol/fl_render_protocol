import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPWrapView extends StatelessWidget {
  const RPWrapView({super.key, required this.wrap});

  final RPWrap wrap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: wrap.spacing,
      runSpacing: wrap.runSpacing,
      alignment: _toWrapAlignment(wrap.alignment),
      children: wrap.children.map((w) => RPWidgetView(widget: w)).toList(),
    );
  }

  WrapAlignment _toWrapAlignment(RPAlignment alignment) {
    switch (alignment) {
      case .RP_ALIGNMENT_CENTER:
        return WrapAlignment.center;
      case .RP_ALIGNMENT_LEADING:
      case .RP_ALIGNMENT_TOP_LEADING:
      case .RP_ALIGNMENT_BOTTOM_LEADING:
        return WrapAlignment.start;
      case .RP_ALIGNMENT_TRAILING:
      case .RP_ALIGNMENT_TOP_TRAILING:
      case .RP_ALIGNMENT_BOTTOM_TRAILING:
        return WrapAlignment.end;
      default:
        return WrapAlignment.start;
    }
  }
}
