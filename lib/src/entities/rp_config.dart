import 'package:uuid/uuid.dart';

class RPConfig {
  RPConfig({
    required this.address,
    required this.port,
  }) : id = const Uuid().v1();

  final String id;
  final String address;
  final int port;
}
