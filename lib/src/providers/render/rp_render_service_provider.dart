import 'package:fl_render_protocol/src/providers/render/rp_render_service_local_data_source.dart';
import 'package:fl_render_protocol/src/providers/render/rp_render_service_remote_data_source.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPRenderServiceProvider {
  const RPRenderServiceProvider({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final RPRenderServiceLocalDataSource localDataSource;
  final RPRenderServiceRemoteDataSource remoteDataSource;

  Future<RPWidget> fetch() async {
    final client = remoteDataSource.makeRenderServiceClient();
    final req = RPFetchRenderTreeRequest();
    final resp = await client.rPFetchRenderTree(req);
    return resp.view;
  }
}
