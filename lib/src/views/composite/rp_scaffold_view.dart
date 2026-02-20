import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/composite/rp_app_bar_view.dart';
import 'package:fl_render_protocol/src/views/composite/rp_bottom_nav_bar_view.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPScaffoldView extends StatelessWidget {
  const RPScaffoldView({super.key, required this.scaffold});

  final RPScaffold scaffold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: scaffold.hasAppBar()
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: RPAppBarView(appBar: scaffold.appBar),
            )
          : null,
      body: RPWidgetView(widget: scaffold.body),
      bottomNavigationBar: scaffold.hasBottomNavBar() ? RPBottomNavBarView(bottomNavBar: scaffold.bottomNavBar) : null,
      backgroundColor: scaffold.hasBackgroundColor() ? scaffold.backgroundColor.toFlutterColor() : null,
    );
  }
}
