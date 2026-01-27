import 'package:fl_render_protocol/src/registries/rp_registerable.dart';

abstract class RPManager implements RPRegisterable {
  @override
  Future<void> didRegister() async {}

  @override
  Future<void> willUnregister() async {}
}
