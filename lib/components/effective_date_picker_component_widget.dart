import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'effective_date_picker_component_model.dart';
export 'effective_date_picker_component_model.dart';

class EffectiveDatePickerComponentWidget extends StatefulWidget {
  const EffectiveDatePickerComponentWidget({
    super.key,
    required this.effectiveDateInsurerFlag,
    required this.effectiveDateActFlag,
    required this.effectiveDateInsurer,
    required this.effectiveFateAct,
    required this.currentDate,
    required this.actFlag,
  });

  final bool? effectiveDateInsurerFlag;
  final bool? effectiveDateActFlag;
  final String? effectiveDateInsurer;
  final String? effectiveFateAct;
  final String? currentDate;
  final bool? actFlag;

  @override
  State<EffectiveDatePickerComponentWidget> createState() =>
      _EffectiveDatePickerComponentWidgetState();
}

class _EffectiveDatePickerComponentWidgetState
    extends State<EffectiveDatePickerComponentWidget> {
  late EffectiveDatePickerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EffectiveDatePickerComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!widget.effectiveDateInsurerFlag!)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'เลือกวันคุ้มครองประกัน',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            await DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (date) {
                                safeSetState(() {
                                  _model.datePicked1 = date;
                                });
                              },
                              currentTime: functions
                                  .parseStringToDatetime(widget.currentDate)!,
                              minTime: functions
                                  .parseStringToDatetime(widget.currentDate)!,
                              locale: LocaleType.values.firstWhere(
                                (l) =>
                                    l.name ==
                                    FFLocalizations.of(context).languageCode,
                                orElse: () => LocaleType.en,
                              ),
                            );
                          },
                          text: _model.datePicked1 != null
                              ? functions
                                  .showDateBE(_model.datePicked1?.toString())!
                              : 'เลือกวันคุ้มครอง',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (widget.actFlag! ? !widget.effectiveDateActFlag! : false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'เลือกวันคุ้มครอง พ.ร.บ.',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            await DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (date) {
                                safeSetState(() {
                                  _model.datePicked2 = date;
                                });
                              },
                              currentTime: functions
                                  .parseStringToDatetime(widget.currentDate)!,
                              minTime: functions
                                  .parseStringToDatetime(widget.currentDate)!,
                              locale: LocaleType.values.firstWhere(
                                (l) =>
                                    l.name ==
                                    FFLocalizations.of(context).languageCode,
                                orElse: () => LocaleType.en,
                              ),
                            );
                          },
                          text: _model.datePicked2 != null
                              ? functions
                                  .showDateBE(_model.datePicked2?.toString())!
                              : 'เลือกวันคุ้มครอง',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (() {
                if (!widget.effectiveDateInsurerFlag! && !widget.actFlag!) {
                  return (_model.datePicked1 != null
                      ? (functions.checkCurrentDateIsBeforeInputDate(
                              widget.currentDate,
                              functions.getDateFormat(_model.datePicked1))!
                          ? true
                          : false)
                      : false);
                } else if (widget.actFlag!
                    ? (widget.effectiveDateInsurerFlag! &&
                        !widget.effectiveDateActFlag!)
                    : false) {
                  return (_model.datePicked2 != null
                      ? (functions.checkCurrentDateIsBeforeInputDate(
                              widget.currentDate,
                              functions.getDateFormat(_model.datePicked2))!
                          ? true
                          : false)
                      : false);
                } else if (widget.actFlag!
                    ? (!widget.effectiveDateInsurerFlag! &&
                        widget.effectiveDateActFlag!)
                    : false) {
                  return (_model.datePicked1 != null
                      ? (functions.checkCurrentDateIsBeforeInputDate(
                              widget.currentDate,
                              functions.getDateFormat(_model.datePicked1))!
                          ? true
                          : false)
                      : false);
                } else {
                  return ((_model.datePicked1 != null) &&
                          (_model.datePicked2 != null)
                      ? (functions.checkCurrentDateIsBeforeInputDate(
                                  widget.currentDate,
                                  functions
                                      .getDateFormat(_model.datePicked1))! &&
                              functions.checkCurrentDateIsBeforeInputDate(
                                  widget.currentDate,
                                  functions.getDateFormat(_model.datePicked2))!
                          ? true
                          : false)
                      : false);
                }
              }())
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (!widget.effectiveDateInsurerFlag! &&
                                    !widget.actFlag!) {
                                  if (!(_model.datePicked1 != null)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณาเลือกวันที่คุ้มครองประกัน'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  if (!functions
                                      .checkCurrentDateIsBeforeInputDate(
                                          widget.currentDate,
                                          functions.getDateFormat(
                                              _model.datePicked1))!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ไม่สามารถเลือกวันที่คุ้มครองประกันย้อนหลังได้'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  setState(() {
                                    FFAppState()
                                            .insuranceInfoEffectiveDateInsure =
                                        functions.getDateFormat(
                                            functions.parseStringToDatetime(
                                                _model.datePicked1
                                                    ?.toString()))!;
                                  });
                                } else if (widget.actFlag!
                                    ? (widget.effectiveDateInsurerFlag! &&
                                        !widget.effectiveDateActFlag!)
                                    : false) {
                                  if (!(_model.datePicked2 != null)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณาเลือกวันที่คุ้มครอง พ.ร.บ.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  if (!functions
                                      .checkCurrentDateIsBeforeInputDate(
                                          widget.currentDate,
                                          functions.getDateFormat(
                                              _model.datePicked2))!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ไม่สามารถเลือกวันที่คุ้มครอง พ.ร.บ. ย้อนหลังได้'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  setState(() {
                                    FFAppState().insuranceInfoEffectiveDateAct =
                                        functions.getDateFormat(
                                            functions.parseStringToDatetime(
                                                _model.datePicked2
                                                    ?.toString()))!;
                                  });
                                } else if (widget.actFlag!
                                    ? (!widget.effectiveDateInsurerFlag! &&
                                        widget.effectiveDateActFlag!)
                                    : false) {
                                  if (!(_model.datePicked1 != null)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณาเลือกวันที่คุ้มครองประกัน'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  if (!functions
                                      .checkCurrentDateIsBeforeInputDate(
                                          widget.currentDate,
                                          functions.getDateFormat(
                                              _model.datePicked1))!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ไม่สามารถเลือกวันที่คุ้มครองประกันย้อนหลังได้'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  setState(() {
                                    FFAppState()
                                            .insuranceInfoEffectiveDateInsure =
                                        functions.getDateFormat(
                                            functions.parseStringToDatetime(
                                                _model.datePicked1
                                                    ?.toString()))!;
                                  });
                                } else {
                                  if (!(_model.datePicked1 != null)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณาเลือกวันที่คุ้มครองประกัน'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  if (!functions
                                      .checkCurrentDateIsBeforeInputDate(
                                          widget.currentDate,
                                          functions.getDateFormat(
                                              _model.datePicked1))!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ไม่สามารถเลือกวันที่คุ้มครองประกันย้อนหลังได้'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  if (!(_model.datePicked2 != null)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณาเลือกวันที่คุ้มครอง พ.ร.บ.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  if (!functions
                                      .checkCurrentDateIsBeforeInputDate(
                                          widget.currentDate,
                                          functions.getDateFormat(
                                              _model.datePicked2))!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ไม่สามารถเลือกวันที่คุ้มครอง พ.ร.บ. ย้อนหลังได้'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  setState(() {
                                    FFAppState()
                                            .insuranceInfoEffectiveDateInsure =
                                        functions.getDateFormat(
                                            functions.parseStringToDatetime(
                                                _model.datePicked1
                                                    ?.toString()))!;
                                    FFAppState().insuranceInfoEffectiveDateAct =
                                        functions.getDateFormat(
                                            functions.parseStringToDatetime(
                                                _model.datePicked2
                                                    ?.toString()))!;
                                  });
                                }

                                Navigator.pop(context);
                              },
                              text: 'ตกลง',
                              options: FFButtonOptions(
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFD9761A),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ]
                .addToStart(SizedBox(height: 24.0))
                .addToEnd(SizedBox(height: 24.0)),
          ),
        ),
      ],
    );
  }
}
