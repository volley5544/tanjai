import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_old_vmi_model.dart';
export 'search_old_vmi_model.dart';

class SearchOldVmiWidget extends StatefulWidget {
  const SearchOldVmiWidget({
    super.key,
    bool? isSearchCarVmi,
  }) : this.isSearchCarVmi = isSearchCarVmi ?? false;

  final bool isSearchCarVmi;

  @override
  State<SearchOldVmiWidget> createState() => _SearchOldVmiWidgetState();
}

class _SearchOldVmiWidgetState extends State<SearchOldVmiWidget> {
  late SearchOldVmiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchOldVmiModel());

    _model.searchCarTextController ??= TextEditingController();
    _model.searchCarFocusNode ??= FocusNode();

    _model.searchFireTextController ??= TextEditingController();
    _model.searchFireFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 18.0,
                            child: VerticalDivider(
                              thickness: 3.0,
                              color: Color(0xFFE8903E),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'ค้นหากรมธรรม์ย้อนหลัง',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFF003063),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                widget!.isSearchCarVmi
                                    ? 'ประกันรถ'
                                    : 'ประกันอัคคีภัย',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFF003063),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xFF878787),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (widget!.isSearchCarVmi) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.5, 8.0, 0.5),
                                      child: TextFormField(
                                        controller:
                                            _model.searchCarTextController,
                                        focusNode: _model.searchCarFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.searchCarTextController',
                                          Duration(milliseconds: 100),
                                          () => safeSetState(() {}),
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'ค้นหาทะเบียนรถลูกค้า',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        validator: _model
                                            .searchCarTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.5, 8.0, 0.5),
                                      child: TextFormField(
                                        controller:
                                            _model.searchFireTextController,
                                        focusNode: _model.searchFireFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.searchFireTextController',
                                          Duration(milliseconds: 100),
                                          () => safeSetState(() {}),
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'ค้นหาเลขบัตรประชาชนลูกค้า',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        keyboardType: TextInputType.phone,
                                        validator: _model
                                            .searchFireTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          _model.searchFireMask
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (widget!.isSearchCarVmi) {
                                  if (!(_model.searchCarTextController.text !=
                                          null &&
                                      _model.searchCarTextController.text !=
                                          '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณากรอกทะเบียนรถลูกค้า'),
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
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  if (!(_model.searchFireTextController.text !=
                                          null &&
                                      _model.searchFireTextController.text !=
                                          '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณากรอกเลขบัตรประชาชนลูกค้า'),
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
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                }

                                _model.searchVmiOutput =
                                    await SearchOldVmiApiCall.call(
                                  apiUrl: FFAppState().apiUrlInsuranceAppState,
                                  token: FFAppState().accessToken,
                                  mode: 'arunsawad',
                                  list: 'list',
                                  searchBy: widget!.isSearchCarVmi
                                      ? 'car_registration'
                                      : 'id_card',
                                  search: widget!.isSearchCarVmi
                                      ? functions.removeSpacialLetterFromText(
                                          _model.searchCarTextController.text)
                                      : functions.removeSpacialLetterFromText(
                                          _model.searchFireTextController.text),
                                  subProduct: widget!.isSearchCarVmi
                                      ? 'motor'
                                      : 'house',
                                  ownerId: FFAppState().employeeID,
                                );

                                _shouldSetState = true;
                                if ((_model.searchVmiOutput?.statusCode ??
                                        200) !=
                                    200) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'พบข้อผิดพลาดConnection (${(_model.searchVmiOutput?.statusCode ?? 200).toString()})'),
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
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                                if ('${getJsonField(
                                      (_model.searchVmiOutput?.jsonBody ?? ''),
                                      r'''$.results.statusCode''',
                                    ).toString()}' !=
                                    '200') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              SearchOldVmiApiCall.messageLayer2(
                                            (_model.searchVmiOutput?.jsonBody ??
                                                ''),
                                          )!),
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
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                                if (!widget!.isSearchCarVmi) {
                                  context.goNamed(
                                    'MakeFireInsuranceListPage',
                                    queryParameters: {
                                      'list': serializeParam(
                                        SearchOldVmiApiCall.approveList(
                                          (_model.searchVmiOutput?.jsonBody ??
                                              ''),
                                        ),
                                        ParamType.JSON,
                                        isList: true,
                                      ),
                                      'checkPayment': serializeParam(
                                        '0',
                                        ParamType.String,
                                      ),
                                      'checkVMI': serializeParam(
                                        '1',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                context.pushNamed(
                                  'MakeInsuranceListPageSearch',
                                  queryParameters: {
                                    'checkTotal': serializeParam(
                                      SearchOldVmiApiCall.approve(
                                        (_model.searchVmiOutput?.jsonBody ??
                                            ''),
                                      ),
                                      ParamType.int,
                                    ),
                                    'list': serializeParam(
                                      SearchOldVmiApiCall.approveList(
                                        (_model.searchVmiOutput?.jsonBody ??
                                            ''),
                                      ),
                                      ParamType.JSON,
                                      isList: true,
                                    ),
                                    'checkPayment': serializeParam(
                                      '0',
                                      ParamType.String,
                                    ),
                                    'checkVMI': serializeParam(
                                      '1',
                                      ParamType.String,
                                    ),
                                    'carRegistration': serializeParam(
                                      _model.searchCarTextController.text,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: 'ค้นหา',
                              options: FFButtonOptions(
                                height: 40.0,
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
                                      letterSpacing: 0.0,
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
                  ].addToStart(SizedBox(height: 24.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
