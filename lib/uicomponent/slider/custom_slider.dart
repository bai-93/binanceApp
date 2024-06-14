import 'package:flutter/material.dart';
import 'package:sheker/uicomponent/slider/slider_track_shape.dart';
import 'package:sheker/utilities/app_colors.dart';

class CustomSlider extends StatefulWidget {
  double value;
  Function(double value) onChanged;
  CustomSlider(this.value, this.onChanged, {super.key});
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: AppColorsUtility.onboardingPrimary,
        inactiveTrackColor: AppColorsUtility.otline,
        // trackShape: SliderTrackCustomShape(widget.value)
      ),
      child: Slider(
          label: widget.value.toString(),
          value: widget.value,
          onChanged: widget.onChanged,
          min: 0.0,
          max: 100.0),
    );
  }
}
