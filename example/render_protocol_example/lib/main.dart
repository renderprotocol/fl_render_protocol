import 'package:fl_render_protocol/fl_render_protocol.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final config = RPConfig(address: "127.0.0.1", port: 50051);
  await RenderProtocol.initialize(config: config);

  runApp(const RPExampleApp());
}

class RPExampleApp extends StatefulWidget {
  const RPExampleApp({super.key});

  @override
  State<RPExampleApp> createState() => _RPExampleAppState();
}

class _RPExampleAppState extends State<RPExampleApp> {
  RPWidget? _rpWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: _rpWidget != null ? RPWidgetView(widget: _rpWidget!) : SizedBox(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            try {
              final widget = await RenderProtocol.fetchRenderTree(id: "");
              setState(() {
                _rpWidget = widget;
              });
              debugPrint("----->>> View Fetched!");
            } catch (error) {
              debugPrint("----->>> $error");
            }
          },
          label: Text("Fetch View"),
          icon: Icon(Icons.download_rounded),
        ),
      ),
    );
  }
}
