import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'license_select_component_model.dart';
export 'license_select_component_model.dart';

class LicenseSelectComponentWidget extends StatefulWidget {
  const LicenseSelectComponentWidget({
    super.key,
    required this.leadID,
    required this.quotationID,
  });

  final String? leadID;
  final String? quotationID;

  @override
  State<LicenseSelectComponentWidget> createState() =>
      _LicenseSelectComponentWidgetState();
}

class _LicenseSelectComponentWidgetState
    extends State<LicenseSelectComponentWidget> {
  late LicenseSelectComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LicenseSelectComponentModel());

    _model.textController ??=
        TextEditingController(text: FFAppState().licenseSelectBeforeStep1);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        child: Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_outlined,
                          color: Color(0xFFFF0000),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Text(
                              'กรุณากรอกเลขผู้มีบัตรนายหน้าประกัน',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            readOnly:
                                FFAppState().licenseSelectBeforeStep1 != '',
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      if (FFAppState().licenseSelectBeforeStep1 == '')
                        Expanded(
                          flex: 2,
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: LoadingSceneWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              _model.getLicenseAPIOutput =
                                  await ApiLicenseGetLicenseCall.call(
                                insuranceUrl:
                                    FFAppState().apiUrlInsuranceAppState,
                                token: FFAppState().accessToken,
                                employeeCodeLicense: _model.textController.text,
                              );

                              _shouldSetState = true;
                              if ((_model.getLicenseAPIOutput?.statusCode ??
                                      200) !=
                                  200) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'พบข้อผิดพลาด (${(_model.getLicenseAPIOutput?.statusCode ?? 200).toString()})'),
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
                                Navigator.pop(context);
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              if (ApiLicenseGetLicenseCall.statuslayer1(
                                    (_model.getLicenseAPIOutput?.jsonBody ??
                                        ''),
                                  ) !=
                                  200) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            '${ApiLicenseGetLicenseCall.messageLayer1(
                                          (_model.getLicenseAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )}'),
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
                                Navigator.pop(context);
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              _model.saveLicenseAPIOutput =
                                  await ApiLicenseSaveLicenseCall.call(
                                insuranceUrl:
                                    FFAppState().apiUrlInsuranceAppState,
                                token: FFAppState().accessToken,
                                employeeCodeLicense: _model.textController.text,
                                quotationId: widget!.quotationID,
                                leadId: widget!.leadID,
                              );

                              _shouldSetState = true;
                              if ((_model.saveLicenseAPIOutput?.statusCode ??
                                      200) !=
                                  200) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'พบข้อผิดพลาด (${(_model.saveLicenseAPIOutput?.statusCode ?? 200).toString()})'),
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
                                Navigator.pop(context);
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              if (ApiLicenseSaveLicenseCall.statuslayer1(
                                    (_model.saveLicenseAPIOutput?.jsonBody ??
                                        ''),
                                  ) !=
                                  200) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            '${ApiLicenseSaveLicenseCall.messageLayer1(
                                          (_model.saveLicenseAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )}'),
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
                                Navigator.pop(context);
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      content: Text(
                                          '${ApiLicenseSaveLicenseCall.messageLayer1(
                                        (_model.saveLicenseAPIOutput
                                                ?.jsonBody ??
                                            ''),
                                      )}'),
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
                              Navigator.pop(context);
                              Navigator.pop(context);
                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'บักทึก',
                            options: FFButtonOptions(
                              height: 50,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: Color(0xFFFCEFE4),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFFD9761A),
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Color(0xFFFCEFE4),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      if (FFAppState().licenseSelectBeforeStep1 != '')
                        Expanded(
                          flex: 2,
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: LoadingSceneWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              _model.cancelAPIOutput =
                                  await ApiLicenseCancelLicenseCall.call(
                                insuranceUrl:
                                    FFAppState().apiUrlInsuranceAppState,
                                token: FFAppState().accessToken,
                                employeeCodeLicense:
                                    FFAppState().licenseSelectBeforeStep1,
                                quotationId: widget!.quotationID,
                                leadId: widget!.leadID,
                              );

                              _shouldSetState = true;
                              if ((_model.cancelAPIOutput?.statusCode ?? 200) !=
                                  200) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'พบข้อผิดพลาด (${(_model.cancelAPIOutput?.statusCode ?? 200).toString()})'),
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
                                Navigator.pop(context);
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              if (ApiLicenseCancelLicenseCall.statuslayer1(
                                    (_model.cancelAPIOutput?.jsonBody ?? ''),
                                  ) !=
                                  200) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            '${ApiLicenseCancelLicenseCall.messageLayer1(
                                          (_model.cancelAPIOutput?.jsonBody ??
                                              ''),
                                        )}'),
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
                                Navigator.pop(context);
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              Navigator.pop(context);
                              Navigator.pop(context);
                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'ยกเลิก',
                            options: FFButtonOptions(
                              height: 50,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                    ].divide(SizedBox(width: 24)),
                  ),
                ),
              ].addToStart(SizedBox(height: 12)).addToEnd(SizedBox(height: 24)),
            ),
          ),
        ),
      ),
    );
  }
}
