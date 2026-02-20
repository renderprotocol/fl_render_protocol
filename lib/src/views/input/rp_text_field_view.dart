import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPTextFieldView extends StatefulWidget {
  const RPTextFieldView({super.key, required this.textField});

  final RPTextField textField;

  @override
  State<RPTextFieldView> createState() => _RPTextFieldViewState();
}

class _RPTextFieldViewState extends State<RPTextFieldView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.textField.hasInitialValue() ? widget.textField.initialValue : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: widget.textField.secureEntry,
      enabled: widget.textField.enabled,
      keyboardType: widget.textField.keyboardType.toFlutterInputType(),
      decoration: InputDecoration(
        hintText: widget.textField.hasPlaceholder() ? widget.textField.placeholder : null,
      ),
      onSubmitted: (_) {
        if (widget.textField.hasOnSubmit()) {
          RPActionHandler.handle(widget.textField.onSubmit);
        }
      },
    );
  }
}
