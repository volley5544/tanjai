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
  const RangeSliderWidget(
      {super.key,
      this.width,
      this.height,
      this.minRange,
      this.maxRange,
      this.activeColor,
      this.inactiveColors,
      this.overlayColor,
      this.startValue,
      this.endValue,
      this.step,
      this.typeName,
      this.currentMinValue,
      this.currentMaxValue,
      this.fromPage});

  final double? width;
  final double? height;
  final String? minRange;
  final String? maxRange;
  final Color? activeColor;
  final Color? inactiveColors;
  final Color? overlayColor;
  final String? startValue;
  final String? endValue;
  final String? step;
  final String? typeName;
  final String? currentMinValue;
  final String? currentMaxValue;
  final String? fromPage;

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  late dynamic _sliderValue = RangeValues(double.parse(widget.currentMinValue!),
      double.parse(widget.currentMaxValue!));
  late dynamic _startValue =
      double.parse(widget.currentMinValue!).toStringAsFixed(2);
  late dynamic _endValue =
      double.parse(widget.currentMaxValue!).toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RangeSlider(
        onChanged: (newValue) {
          newValue = newValue;
          setState(() {});
          _sliderValue = newValue;
          _startValue = newValue.start.toStringAsFixed(2);
          _endValue = newValue.end.toStringAsFixed(2);
          if (widget.typeName! == 'ราคาเบี้ย') {
            if (widget.fromPage! == 'SearchPackage1') {
              FFAppState().sliderCurrentMinValueGross = '${_startValue}';
              FFAppState().sliderCurrentMaxValueGross = '${_endValue}';
            } else if (widget.fromPage! == 'SearchPackage2') {
              FFAppState().sliderCurrentMinGrossPage2 = '${_startValue}';
              FFAppState().sliderCurrentMaxGrossPage2 = '${_endValue}';
            } else if (widget.fromPage! == 'SearchPackage3') {
              FFAppState().sliderCurrentMinGrossPage3 = '${_startValue}';
              FFAppState().sliderCurrentMaxGrossPage3 = '${_endValue}';
            }
          } else {
            if (widget.fromPage! == 'SearchPackage1') {
              FFAppState().sliderCurrentMinSumInsured = '${_startValue}';
              FFAppState().sliderCurrentMaxSumInsured = '${_endValue}';
            } else if (widget.fromPage! == 'SearchPackage2') {
              FFAppState().sliderCurrentMinSumInsuredPage2 = '${_startValue}';
              FFAppState().sliderCurrentMaxSumInsuredPage2 = '${_endValue}';
            } else if (widget.fromPage! == 'SearchPackage3') {
              FFAppState().sliderCurrentMinSumInsuredPage3 = '${_startValue}';
              FFAppState().sliderCurrentMaxSumInsuredPage3 = '${_endValue}';
            }
          }
          safeSetState(() {});
        },
        onChangeEnd: (newValue) {
          newValue = newValue;
          setState(() {});
          _sliderValue = newValue;
          _startValue = newValue.start.toStringAsFixed(2);
          _endValue = newValue.end.toStringAsFixed(2);
          safeSetState(() {});
          if (widget.typeName! == 'ราคาเบี้ย') {
            if (widget.fromPage! == 'SearchPackage1') {
              FFAppState().sliderCurrentMinValueGross = '${_startValue}';
              FFAppState().sliderCurrentMaxValueGross = '${_endValue}';
            } else if (widget.fromPage! == 'SearchPackage2') {
              FFAppState().sliderCurrentMinGrossPage2 = '${_startValue}';
              FFAppState().sliderCurrentMaxGrossPage2 = '${_endValue}';
            } else if (widget.fromPage! == 'SearchPackage3') {
              FFAppState().sliderCurrentMinGrossPage3 = '${_startValue}';
              FFAppState().sliderCurrentMaxGrossPage3 = '${_endValue}';
            }
          } else {
            if (widget.fromPage! == 'SearchPackage1') {
              FFAppState().sliderCurrentMinSumInsured = '${_startValue}';
              FFAppState().sliderCurrentMaxSumInsured = '${_endValue}';
            } else if (widget.fromPage! == 'SearchPackage2') {
              FFAppState().sliderCurrentMinSumInsuredPage2 = '${_startValue}';
              FFAppState().sliderCurrentMaxSumInsuredPage2 = '${_endValue}';
            } else if (widget.fromPage! == 'SearchPackage3') {
              FFAppState().sliderCurrentMinSumInsuredPage3 = '${_startValue}';
              FFAppState().sliderCurrentMaxSumInsuredPage3 = '${_endValue}';
            }
          }
          safeSetState(() {});
          print('_startValue : ${_startValue}');
          print('_endValue : ${_endValue}');
          print(FFAppState().searchShortName.toList());
          print(FFAppState().searchInsurerInsurershortname.toList());
          print(FFAppState().searchCoverType.toList());
          print(FFAppState().searchInsurerCovertypelist.toList());
          // FFAppState().isShowPackageCardList1 = checkPackageInRangePage2(
          //   FFAppState().searchShortName.toList(),
          //   FFAppState().searchGrossTotal.toList(),
          //   FFAppState().searchInsurerInsurershortname.toList(),
          //   '${_startValue}',
          //   '${_endValue}',
          // )!
          //     .toList()
          //     .cast<bool>();
          safeSetState(() {});
          print(
              'FFAppState().isShowPackageCardList1 : ${FFAppState().isShowPackageCardList1}');
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
        min: double.parse(widget.minRange!), // Convert minRange to double
        max: double.parse(widget.maxRange!), // Convert maxRange to double
        values: _sliderValue ??
            RangeValues(double.parse(widget.minRange!),
                double.parse(widget.maxRange!)), // Convert to double
        divisions: (double.parse(widget.maxRange!) / double.parse(widget.step!))
            .toInt(), // Convert to double and then to int for divisions
        labels: RangeLabels('${_startValue}', '${_endValue}'),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${showNumberWithComma(widget.minRange!)}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              '${showNumberWithComma(widget.maxRange!)}',
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
                          title: '${widget.typeName!}',
                          minValue: '${_startValue!}',
                          maxValue: '${_endValue!}',
                          sliderMinValue: '${widget.minRange!}',
                          sliderMaxValue: '${widget.maxRange!}',
                        ),
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {
                    print('before');
                    _startValue =
                        double.parse(value['start']).toStringAsFixed(2);
                    _endValue = double.parse(value['end']).toStringAsFixed(2);
                    print('start value : ${_startValue}');
                    print('end value : ${_endValue}');
                    _sliderValue = RangeValues(
                        double.parse(_startValue), double.parse(_endValue));
                    safeSetState(() {});
                    if (widget.typeName! == 'ราคาเบี้ย') {
                      if (widget.fromPage! == 'SearchPackage1') {
                        FFAppState().sliderCurrentMinValueGross =
                            '${_startValue}';
                        FFAppState().sliderCurrentMaxValueGross =
                            '${_endValue}';
                      } else if (widget.fromPage! == 'SearchPackage2') {
                        FFAppState().sliderCurrentMinGrossPage2 =
                            '${_startValue}';
                        FFAppState().sliderCurrentMaxGrossPage2 =
                            '${_endValue}';
                      } else if (widget.fromPage! == 'SearchPackage3') {
                        FFAppState().sliderCurrentMinGrossPage3 =
                            '${_startValue}';
                        FFAppState().sliderCurrentMaxGrossPage3 =
                            '${_endValue}';
                      }
                    } else {
                      if (widget.fromPage! == 'SearchPackage1') {
                        FFAppState().sliderCurrentMinSumInsured =
                            '${_startValue}';
                        FFAppState().sliderCurrentMaxSumInsured =
                            '${_endValue}';
                      } else if (widget.fromPage! == 'SearchPackage2') {
                        FFAppState().sliderCurrentMinSumInsuredPage2 =
                            '${_startValue}';
                        FFAppState().sliderCurrentMaxSumInsuredPage2 =
                            '${_endValue}';
                      } else if (widget.fromPage! == 'SearchPackage3') {
                        FFAppState().sliderCurrentMinSumInsuredPage3 =
                            '${_startValue}';
                        FFAppState().sliderCurrentMaxSumInsuredPage3 =
                            '${_endValue}';
                      }
                    }
                    safeSetState(() {});
                    print('after');
                  }));

              setState(() {});

              setState(() {});
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 12, end: 12),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.typeName!}ต่ำสุด : ${showNumberWithComma('${_startValue}') ?? '${showNumberWithComma(widget.minRange!)}'} บาท',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            '${widget.typeName!}สูงสุด : ${showNumberWithComma('${_endValue}') ?? '${showNumberWithComma(widget.maxRange!)}'} บาท',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 12),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(
                                    widget.activeColor!.red,
                                    widget.activeColor!.green,
                                    widget.activeColor!.blue,
                                    1.0),
                              ),
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(8)),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: Color.fromRGBO(
                                    widget.activeColor!.red,
                                    widget.activeColor!.green,
                                    widget.activeColor!.blue,
                                    1.0),
                                size: 30,
                              ),
                            )),
                      ),
                    ],
                  )),
            )),
      )
    ]);
  }
}
