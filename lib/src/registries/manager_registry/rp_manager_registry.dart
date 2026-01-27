import 'package:fl_render_protocol/src/registries/manager_registry/rp_manager.dart';

class RPManagerRegistry {
  static final shared = RPManagerRegistry._();
  RPManagerRegistry._();

  Map<String, RPManager> store = {};

  Future<void> register<M extends RPManager>({required M manager}) async {
    store[manager.id] = manager;
    await manager.didRegister();
  }

  Future<void> unregister({required String id}) async {
    await store[id]?.willUnregister();
    store.remove(id);
  }

  M? getManager<M extends RPManager>({required String id}) => store[id] as M?;

  Future<List<R>> forEachManager<R>(Future<R> Function(RPManager) body) async {
    return await Future.wait(store.values.map(body));
  }
}
