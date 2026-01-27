import 'package:fl_render_protocol/src/core/rp_constants.dart';
import 'package:fl_render_protocol/src/providers/render/rp_render_service_local_data_source.dart';
import 'package:fl_render_protocol/src/registries/manager_registry/rp_manager.dart';

class RPCacheManager extends RPManager implements RPRenderServiceLocalDataSource {
  @override
  String get id => RPConstants.cacheManagerID;
}
