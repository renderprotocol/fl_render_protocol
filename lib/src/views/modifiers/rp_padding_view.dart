import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPPaddingView extends StatelessWidget {
  const RPPaddingView({super.key, required this.padding});

  final RPPadding padding;

  @override
  Widget build(BuildContext context) {
    if (!padding.hasChild()) return const SizedBox();

    final child = RPWidgetView(widget: padding.child);

    switch (padding.whichValue()) {
      case .all:
        return Padding(padding: EdgeInsets.all(padding.all), child: child);
      case .symmetric:
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: padding.symmetric.vertical,
            horizontal: padding.symmetric.horizontal,
          ),
          child: child,
        );
      case .explicit:
        return Padding(
          padding: EdgeInsets.only(
            top: padding.explicit.top,
            bottom: padding.explicit.bottom,
            left: padding.explicit.left,
            right: padding.explicit.right,
          ),
          child: child,
        );
      case .notSet:
        return child;
    }
  }
}
