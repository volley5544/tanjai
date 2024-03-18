import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_old_vmi_model.dart';
export 'search_old_vmi_model.dart';

class SearchOldVmiWidget extends StatefulWidget {
  const SearchOldVmiWidget({super.key});

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

    _model.searchFirstnameController ??= TextEditingController();
    _model.searchFirstnameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.5, 8.0, 0.5),
                                child: TextFormField(
                                  controller: _model.searchFirstnameController,
                                  focusNode: _model.searchFirstnameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.searchFirstnameController',
                                    Duration(milliseconds: 100),
                                    () => setState(() {}),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          fontSize: 14.0,
                                        ),
                                    hintText: 'ค้นหาทะเบียนรถลูกค้า',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          fontSize: 14.0,
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
                                        fontWeight: FontWeight.w600,
                                      ),
                                  validator: _model
                                      .searchFirstnameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (!(_model.searchFirstnameController.text !=
                                        null &&
                                    _model.searchFirstnameController.text !=
                                        '')) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text('กรุณากรอกเลขทะเบียน'),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                _model.searchVmiOutput =
                                    await InsuranceRequestListAPIDashBoardCall
                                        .call(
                                  apiUrl: FFAppState().apiUrlInsuranceAppState,
                                  token: FFAppState().accessToken,
                                  mode: 'arunsawad',
                                  list: 'list',
                                  searchBy: 'car_registration',
                                  search: functions.removeSpacialLetterFromText(
                                      _model.searchFirstnameController.text),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                if (InsuranceRequestListAPIDashBoardCall
                                        .statusLayer2(
                                      (_model.searchVmiOutput?.jsonBody ?? ''),
                                    ) !=
                                    200) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              InsuranceRequestListAPIDashBoardCall
                                                  .messageLayer2(
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                context.pushNamed(
                                  'MakeInsuranceListPageSearch',
                                  queryParameters: {
                                    'checkTotal': serializeParam(
                                      InsuranceRequestListAPIDashBoardCall
                                          .approve(
                                        (_model.searchVmiOutput?.jsonBody ??
                                            ''),
                                      ),
                                      ParamType.int,
                                    ),
                                    'list': serializeParam(
                                      InsuranceRequestListAPIDashBoardCall
                                          .approveList(
                                        (_model.searchVmiOutput?.jsonBody ??
                                            ''),
                                      ),
                                      ParamType.JSON,
                                      true,
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
                                      _model.searchFirstnameController.text,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                if (_shouldSetState) setState(() {});
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
