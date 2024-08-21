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

import '../../components/text_field_component_widget.dart';

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({
    super.key,
    this.width,
    this.height,
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
  late dynamic _sliderValue = RangeValues(
      double.parse(widget.startValue!), double.parse(widget.endValue!));
  late dynamic _startValue =
      double.parse(widget.startValue!).toStringAsFixed(2);
  late dynamic _endValue = double.parse(widget.endValue!).toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RangeSlider(
        onChanged: (newValue) {
          newValue = newValue;
          setState(() {
            _sliderValue = newValue;
            _startValue = newValue.start.toStringAsFixed(2);
            _endValue = newValue.end.toStringAsFixed(2);
          });
        },
        activeColor: Color.fromRGBO(widget.activeColor!.red,
            widget.activeColor!.green, widget.activeColor!.blue, 1.0),
        inactiveColor: Color.fromRGBO(widget.inactiveColors!.red,
            widget.inactiveColors!.green, widget.inactiveColors!.blue, 1.0),
        overlayColor: WidgetStateProperty.all(Color.fromRGBO(
            widget.overlayColor!.red,
            widget.overlayColor!.green,
            widget.overlayColor!.blue,
            1.0)),
        min: double.parse(widget.minRange!),
        max: double.parse(widget.maxRange!),
        values: _sliderValue ??
            RangeValues(
                double.parse(widget.minRange!), double.parse(widget.maxRange!)),
        divisions: 40,
        labels: RangeLabels('${_startValue}', '${_endValue}'),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${double.parse(widget.minRange!).toStringAsFixed(2)}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              '${double.parse(widget.maxRange!).toStringAsFixed(2)}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      child: TextFieldComponentWidget(
                        title: 'ราคาเบี้ย',
                        minValue: '${_startValue!}',
                        maxValue: '${_endValue!}',
                      ),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {
                  print('before');
                  _startValue = double.parse(value['start']).toStringAsFixed(2);
                  _endValue = double.parse(value['end']).toStringAsFixed(2);
                  _sliderValue = RangeValues(_startValue!, _endValue!);
                  print('after');
                }));

            setState(() {});

            setState(() {});
          },
          child: Text(
            'ค่าต่ำสุด : ${_startValue ?? '${double.parse(widget.minRange!).toStringAsFixed(2)}'} , ค่าสูงสุด ${_endValue ?? '${double.parse(widget.maxRange!).toStringAsFixed(2)}'}',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      )
    ]);
  }
}
