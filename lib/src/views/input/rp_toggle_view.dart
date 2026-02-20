import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:fl_render_protocol/src/views/rp_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPToggleView extends StatefulWidget {
  const RPToggleView({super.key, required this.toggle});

  final RPToggle toggle;

  @override
  State<RPToggleView> createState() => _RPToggleViewState();
}

class _RPToggleViewState extends State<RPToggleView> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.toggle.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.toggle.hasLabel()) RPWidgetView(widget: widget.toggle.label),
        Switch(
          value: _value,
          onChanged: widget.toggle.enabled
              ? (newValue) {
                  setState(() => _value = newValue);
                  if (widget.toggle.hasOnChange()) {
                    RPActionHandler.handle(widget.toggle.onChange);
                  }
                }
              : null,
          activeThumbColor: widget.toggle.hasOnColor() ? widget.toggle.onColor.toFlutterColor() : null,
        ),
      ],
    );
  }
}
