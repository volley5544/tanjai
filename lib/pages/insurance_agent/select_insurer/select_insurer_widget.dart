import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'select_insurer_model.dart';
export 'select_insurer_model.dart';

class SelectInsurerWidget extends StatefulWidget {
  const SelectInsurerWidget({Key? key}) : super(key: key);

  @override
  _SelectInsurerWidgetState createState() => _SelectInsurerWidgetState();
}

class _SelectInsurerWidgetState extends State<SelectInsurerWidget> {
  late SelectInsurerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectInsurerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SelectInsurer'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
              child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: LoadingSceneWidget(),
            ),
          ));
        },
      ).then((value) => safeSetState(() {}));

      _model.insurerAPIOutput = await TeleGetInsurersAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );
      if ((_model.insurerAPIOutput?.statusCode ?? 200) == 200) {
        setState(() {
          FFAppState().insuranceBasicInsurerIdList =
              (TeleGetInsurersAPICall.companyID(
            (_model.insurerAPIOutput?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicInsurerCodeList =
              (TeleGetInsurersAPICall.companyCode(
            (_model.insurerAPIOutput?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicInsurerShortNameList =
              (TeleGetInsurersAPICall.companyShortName(
            (_model.insurerAPIOutput?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicInsurerFullNameList =
              (TeleGetInsurersAPICall.companyFullName(
            (_model.insurerAPIOutput?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
        });
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(FFAppState()
                  .insuranceBasicInsurerFullNameList
                  .length
                  .toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(FFAppState()
                  .insuranceBasicInsurerFullNameOutput
                  .length
                  .toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.insurerAPIOutput?.statusCode ?? 200).toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );
        return;
      }

      Navigator.pop(context);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xCAFF6500),
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'งานนอกเรท',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Noto Sans Thai',
                  fontSize: 18.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                child: Text(
                  'บริษัทประกันที่ต้องการใบเสนอราคา',
                  style: GoogleFonts.getFont(
                    'Noto Sans Thai',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  'เลือกบริษัทประกันเพื่อขอใบเสนอราคาสูงสุด 5 บริษัทเท่านั้น',
                  style: GoogleFonts.getFont(
                    'Noto Sans Thai',
                    color: FlutterFlowTheme.of(context).error,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Builder(
                  builder: (context) {
                    final insurerList =
                        FFAppState().insuranceBasicInsurerFullNameList.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: insurerList.length,
                      itemBuilder: (context, insurerListIndex) {
                        final insurerListItem = insurerList[insurerListIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    color: Color(0x34111417),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFAppState()
                                              .insuranceBasicInsurerFullNameList[
                                          insurerListIndex],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  ),
                                  if (FFAppState().nonePackageReason.last)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        width: 25.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F8),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if ((FFAppState().checkBoxNotInRate ==
                                          false) &&
                                      (FFAppState().checkBoxNotSatisfied ==
                                          false) &&
                                      (FFAppState().checkBoxCustomCar ==
                                          false)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                            child: AlertDialog(
                                          content: Text(
                                              'กรุณาเลือกเหตุผลการทำประกัน'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ));
                                      },
                                    );
                                    return;
                                  }
                                  if ((FFAppState().buttonOrdinary == false) &&
                                      (FFAppState().buttonCorporation ==
                                          false)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                            child: AlertDialog(
                                          content:
                                              Text('กรุณาเลือกผู้ทำประกัน'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ));
                                      },
                                    );
                                    return;
                                  }
                                },
                                text: 'ถัดไป',
                                options: FFButtonOptions(
                                  width: 270.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xB6FF6500),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
