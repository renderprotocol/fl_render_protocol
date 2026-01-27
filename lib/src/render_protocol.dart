import 'package:fl_render_protocol/src/cache/rp_cache_manager.dart';
import 'package:fl_render_protocol/src/core/rp_constants.dart';
import 'package:fl_render_protocol/src/entities/rp_config.dart';
import 'package:fl_render_protocol/src/entities/rp_error.dart';
import 'package:fl_render_protocol/src/network/rp_network_manager.dart';
import 'package:fl_render_protocol/src/providers/render/rp_render_service_provider.dart';
import 'package:fl_render_protocol/src/registries/manager_registry/rp_manager_registry.dart';
import 'package:fl_render_protocol/src/registries/plugin_registry/rp_plugin.dart';
import 'package:fl_render_protocol/src/registries/plugin_registry/rp_plugin_registry.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

abstract class RenderProtocol {
  static Future<void> initialize({required RPConfig config}) async {
    final cacheManager = RPCacheManager();

    final networkManager = RPNetworkManager(address: config.address, port: config.port);
    await networkManager.setup();

    await RPManagerRegistry.shared.register(manager: cacheManager);
    await RPManagerRegistry.shared.register(manager: networkManager);
  }

  static Future<RPWidget> fetchRenderTree({required String id}) async {
    final cacheManager = RPManagerRegistry.shared.getManager<RPCacheManager>(id: RPConstants.cacheManagerID);
    final networkManager = RPManagerRegistry.shared.getManager<RPNetworkManager>(id: RPConstants.networkManagerID);

    if (cacheManager == null || networkManager == null) throw RPError.notInitialized;

    final provider = RPRenderServiceProvider(localDataSource: cacheManager, remoteDataSource: networkManager);
    return await provider.fetch();
  }

  static Future<void> invalidateRenderTreeCache({required String id}) async {}

  static Future<void> registerPlugin<Plugin extends RPPlugin>(Plugin plugin) async {
    await RPPluginRegistry.shared.register(plugin: plugin);
  }

  static Future<void> unregisterPlugin<Plugin extends RPPlugin>({required String id}) async {
    await RPPluginRegistry.shared.unregister(id: id);
  }

  static Future<void> debugOverlay({required bool visible}) async {
    await RPPluginRegistry.shared.forEachPlugin(
      (plugin) async => plugin.didRequestDebugOverlayVisibilityChange(visible),
    );
  }
}
