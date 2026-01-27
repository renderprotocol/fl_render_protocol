import 'package:fl_render_protocol/src/core/rp_constants.dart';
import 'package:fl_render_protocol/src/entities/rp_error.dart';
import 'package:fl_render_protocol/src/providers/render/rp_render_service_remote_data_source.dart';
import 'package:fl_render_protocol/src/registries/manager_registry/rp_manager.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:rp_generated_dart/proto/renderprotocol/api/v1/rp_api_render_service.pbgrpc.dart';

class RPNetworkManager extends RPManager implements RPRenderServiceRemoteDataSource {
  RPNetworkManager({required this.address, required this.port});

  final String address;
  final int port;

  grpc.ClientChannel? _channel;

  Future<void> setup() async {
    _channel = _makeChannel(address: address, port: port);
  }

  grpc.ClientChannel _makeChannel({required String address, required int port}) {
    final channel = grpc.ClientChannel(
      address,
      port: port,
      options: const grpc.ChannelOptions(
        credentials: .insecure(),
      ),
    );

    return channel;
  }

  @override
  String get id => RPConstants.networkManagerID;

  @override
  RPRenderServiceClient makeRenderServiceClient() {
    if (_channel == null) throw RPError.notInitialized;
    return RPRenderServiceClient(_channel!);
  }
}
