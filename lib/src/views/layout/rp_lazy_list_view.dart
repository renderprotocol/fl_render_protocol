import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPLazyListView extends StatelessWidget {
  const RPLazyListView({super.key, required this.lazyList});

  final RPLazyList lazyList;

  @override
  Widget build(BuildContext context) {
    final isHorizontal = lazyList.axis == RPAxis.RP_AXIS_HORIZONTAL;

    return ListView.separated(
      scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
      shrinkWrap: true,
      itemCount: lazyList.children.length,
      separatorBuilder: (context, index) {
        if (lazyList.hasSeparator()) {
          return RPWidgetView(widget: lazyList.separator);
        }
        return SizedBox(
          width: isHorizontal ? lazyList.spacing : 0,
          height: isHorizontal ? 0 : lazyList.spacing,
        );
      },
      itemBuilder: (context, index) {
        return RPWidgetView(widget: lazyList.children[index]);
      },
    );
  }
}
