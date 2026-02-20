import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPAppBarView extends StatelessWidget {
  const RPAppBarView({super.key, required this.appBar});

  final RPAppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: appBar.hasLeading() ? RPWidgetView(widget: appBar.leading) : null,
      title: appBar.hasTitle() ? RPWidgetView(widget: appBar.title) : null,
      centerTitle: true,
      backgroundColor: appBar.hasBackgroundColor() ? appBar.backgroundColor.toFlutterColor() : null,
      actions: appBar.actions.map((a) => RPWidgetView(widget: a)).toList(),
    );
  }
}
