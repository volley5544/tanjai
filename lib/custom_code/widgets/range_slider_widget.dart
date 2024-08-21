// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({
    super.key,
    this.width,
    this.height,
    this.value,
    this.minRange,
    this.maxRange,
    this.activeColor,
    this.inactiveColors,
    this.overlayColor,
    this.startValue,
    this.endValue,
  });

  final double? width;
  final double? height;
  final String? value;
  final String? minRange;
  final String? maxRange;
  final Color? activeColor;
  final Color? inactiveColors;
  final Color? overlayColor;
  final String? startValue;
  final String? endValue;

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  late dynamic _sliderValue = const RangeValues(
      double.parse(widget.startValue!.toStringAsFixed(2)),
      double.parse(widget.endValue!.toStringAsFixed(2)));
  late dynamic _startValue =
      double.parse(widget.startValue!.toStringAsFixed(2));
  late dynamic _endValue = double.parse(widget.endValue!.toStringAsFixed(2));

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
