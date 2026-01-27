import 'package:fl_render_protocol/src/registries/rp_registerable.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

abstract class RPPlugin implements RPRegisterable {
  void didRequestRenderTree(String id) {}
  void didReceiveRenderTree(RPWidget widget, String id) {}
  void didRequestDebugOverlayVisibilityChange(bool visible) {}
}
