import 'package:fl_render_protocol/src/registries/plugin_registry/rp_plugin.dart';

class RPPluginRegistry {
  static final shared = RPPluginRegistry._();
  RPPluginRegistry._();

  Map<String, RPPlugin> store = {};

  Future<void> register<P extends RPPlugin>({required P plugin}) async {
    store[plugin.id] = plugin;
    await plugin.didRegister();
  }

  Future<void> unregister({required String id}) async {
    await store[id]?.willUnregister();
    store.remove(id);
  }

  P? getPlugin<P extends RPPlugin>({required String id}) => store[id] as P?;

  Future<List<R>> forEachPlugin<R>(Future<R> Function(RPPlugin) body) async {
    return await Future.wait(store.values.map(body));
  }
}
