import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'text_field_component_model.dart';
export 'text_field_component_model.dart';

class TextFieldComponentWidget extends StatefulWidget {
  const TextFieldComponentWidget({
    super.key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.sliderMinValue,
    required this.sliderMaxValue,
  });

  final String? title;
  final String? minValue;
  final String? maxValue;
  final String? sliderMinValue;
  final String? sliderMaxValue;

  @override
  State<TextFieldComponentWidget> createState() =>
      _TextFieldComponentWidgetState();
}

class _TextFieldComponentWidgetState extends State<TextFieldComponentWidget> {
  late TextFieldComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldComponentModel());

    _model.carryPurposeTextFieldTextController1 ??=
        TextEditingController(text: widget!.minValue);
    _model.carryPurposeTextFieldFocusNode1 ??= FocusNode();

    _model.carryPurposeTextFieldTextController2 ??=
        TextEditingController(text: widget!.maxValue);
    _model.carryPurposeTextFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'กรอกจำนวน${widget!.title}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Noto Sans Thai',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'กรอก${widget!.title}ต่ำสุดที่ต้องการ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto Sans Thai',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFB3B3B3),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: TextFormField(
                          controller:
                              _model.carryPurposeTextFieldTextController1,
                          focusNode: _model.carryPurposeTextFieldFocusNode1,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'กรุณากรอก${widget!.title}ต่ำสุด',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          validator: _model
                              .carryPurposeTextFieldTextController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'กรอก${widget!.title}สูงสุดที่ต้องการ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto Sans Thai',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFB3B3B3),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: TextFormField(
                          controller:
                              _model.carryPurposeTextFieldTextController2,
                          focusNode: _model.carryPurposeTextFieldFocusNode2,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'กรุณากรอก${widget!.title}สูงสุด',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          validator: _model
                              .carryPurposeTextFieldTextController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (() {
                            if ((_model.carryPurposeTextFieldTextController1.text != null &&
                                    _model.carryPurposeTextFieldTextController1.text !=
                                        '') &&
                                (_model.carryPurposeTextFieldTextController2.text != null &&
                                    _model.carryPurposeTextFieldTextController2.text !=
                                        '')) {
                              return (double.parse(_model
                                      .carryPurposeTextFieldTextController1
                                      .text) <
                                  double.parse(_model
                                      .carryPurposeTextFieldTextController2
                                      .text));
                            } else if ((_model
                                            .carryPurposeTextFieldTextController1
                                            .text !=
                                        null &&
                                    _model.carryPurposeTextFieldTextController1.text !=
                                        '') &&
                                (_model.carryPurposeTextFieldTextController2.text == null ||
                                    _model.carryPurposeTextFieldTextController2.text ==
                                        '')) {
                              return (double.parse(_model
                                      .carryPurposeTextFieldTextController1
                                      .text) <
                                  double.parse((widget!.maxValue!)));
                            } else if ((_model
                                            .carryPurposeTextFieldTextController1
                                            .text ==
                                        null ||
                                    _model.carryPurposeTextFieldTextController1.text ==
                                        '') &&
                                (_model.carryPurposeTextFieldTextController2.text !=
                                        null &&
                                    _model.carryPurposeTextFieldTextController2.text != '')) {
                              return (double.parse((widget!.minValue!)) <
                                  double.parse(_model
                                      .carryPurposeTextFieldTextController2
                                      .text));
                            } else {
                              return true;
                            }
                          }()) {
                            if (double.parse(_model
                                    .carryPurposeTextFieldTextController1
                                    .text) <
                                double.parse((widget!.sliderMinValue!))) {
                              safeSetState(() {
                                _model.carryPurposeTextFieldTextController1
                                    ?.text = widget!.sliderMinValue!;
                              });
                            }
                            if (double.parse(_model
                                    .carryPurposeTextFieldTextController2
                                    .text) >
                                double.parse((widget!.sliderMaxValue!))) {
                              safeSetState(() {
                                _model.carryPurposeTextFieldTextController2
                                    ?.text = widget!.sliderMaxValue!;
                              });
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(
                                        '${widget!.title}สูงสุด จะต้องมีค่ามากกว่า${widget!.title}ต่ำสุด'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                            return;
                          }

                          Navigator.pop(context, <String, dynamic>{
                            'start': _model.carryPurposeTextFieldTextController1
                                            .text !=
                                        null &&
                                    _model.carryPurposeTextFieldTextController1
                                            .text !=
                                        ''
                                ? _model
                                    .carryPurposeTextFieldTextController1.text
                                : widget!.minValue,
                            'end': _model.carryPurposeTextFieldTextController2
                                            .text !=
                                        null &&
                                    _model.carryPurposeTextFieldTextController2
                                            .text !=
                                        ''
                                ? _model
                                    .carryPurposeTextFieldTextController2.text
                                : widget!.maxValue,
                          });
                        },
                        text: 'ถัดไป',
                        options: FFButtonOptions(
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFD9761A),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Noto Sans Thai',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ].addToStart(SizedBox(height: 12.0)).addToEnd(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
