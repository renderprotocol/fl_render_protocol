import 'package:fl_render_protocol/src/core/rp_flutter_helpers.dart';
import 'package:flutter/material.dart';
import 'package:rp_generated_dart/rp_generated_dart.dart';

class RPSliderView extends StatefulWidget {
  const RPSliderView({super.key, required this.slider});

  final RPSlider slider;

  @override
  State<RPSliderView> createState() => _RPSliderViewState();
}

class _RPSliderViewState extends State<RPSliderView> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.slider.hasInitialValue() ? widget.slider.initialValue : widget.slider.minValue;
  }

  @override
  Widget build(BuildContext context) {
    final divisions = widget.slider.hasStep() && widget.slider.step > 0
        ? ((widget.slider.maxValue - widget.slider.minValue) / widget.slider.step).round()
        : null;

    return Slider(
      value: _value,
      min: widget.slider.minValue,
      max: widget.slider.maxValue,
      divisions: divisions,
      activeColor: widget.slider.hasActiveColor() ? widget.slider.activeColor.toFlutterColor() : null,
      onChanged: widget.slider.enabled
          ? (newValue) {
              setState(() => _value = newValue);
              if (widget.slider.hasOnChange()) {
                RPActionHandler.handle(widget.slider.onChange);
              }
            }
          : null,
    );
  }
}
