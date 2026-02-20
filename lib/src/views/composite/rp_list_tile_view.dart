import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPListTileView extends StatelessWidget {
  const RPListTileView({super.key, required this.listTile});

  final RPListTile listTile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: listTile.hasLeading() ? RPWidgetView(widget: listTile.leading) : null,
      title: RPWidgetView(widget: listTile.title),
      subtitle: listTile.hasSubtitle() ? RPWidgetView(widget: listTile.subtitle) : null,
      trailing: listTile.hasTrailing() ? RPWidgetView(widget: listTile.trailing) : null,
      onTap: listTile.hasOnTap() ? () => RPActionHandler.handle(listTile.onTap) : null,
    );
  }
}
