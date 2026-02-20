import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPLazyGridView extends StatelessWidget {
  const RPLazyGridView({super.key, required this.lazyGrid});

  final RPLazyGrid lazyGrid;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: _buildDelegate(),
      itemCount: lazyGrid.children.length,
      itemBuilder: (context, index) {
        return RPWidgetView(widget: lazyGrid.children[index]);
      },
    );
  }

  SliverGridDelegate _buildDelegate() {
    if (!lazyGrid.hasLayout()) {
      return const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1);
    }

    switch (lazyGrid.layout.whichValue()) {
      case .fixed:
        return SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: lazyGrid.layout.fixed.count,
          mainAxisSpacing: lazyGrid.spacing,
          crossAxisSpacing: lazyGrid.runSpacing,
        );
      case .adaptive:
        return SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: lazyGrid.layout.adaptive.minItemWidth,
          mainAxisSpacing: lazyGrid.spacing,
          crossAxisSpacing: lazyGrid.runSpacing,
        );
      case .notSet:
        return const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        );
    }
  }
}
