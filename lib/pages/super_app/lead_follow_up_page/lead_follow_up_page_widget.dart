import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lead_follow_up_page_model.dart';
export 'lead_follow_up_page_model.dart';

class LeadFollowUpPageWidget extends StatefulWidget {
  const LeadFollowUpPageWidget({Key? key}) : super(key: key);

  @override
  _LeadFollowUpPageWidgetState createState() => _LeadFollowUpPageWidgetState();
}

class _LeadFollowUpPageWidgetState extends State<LeadFollowUpPageWidget>
    with TickerProviderStateMixin {
  late LeadFollowUpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadFollowUpPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LeadFollowUpPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
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
              child: Container(
                height: double.infinity,
                child: LoadingSceneWidget(),
              ),
            ),
          ));
        },
      ).then((value) => safeSetState(() {}));

      _model.getBuildVersion = await actions.getBuildVersion1();
      _model.buildVersionQuery = await queryBuildVersionRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (isAndroid) {
        if (_model.buildVersionQuery?.appVersion != _model.getBuildVersion) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content: Text(
                    'มีประกันทันใจเวอร์ชั่นใหม่แล้ว! กรุณาอัพเดท ประกันทันใจใน Play Store ให้เป็นเวอร์ชั่นล่าสุด'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ));
            },
          );
          await actions.terminateAppAction();
          return;
        }
      } else {
        if (_model.buildVersionQuery?.appVersionIos != _model.getBuildVersion) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content: Text(
                    'มีประกันทันใจเวอร์ชั่นใหม่แล้ว! กรุณาอัพเดท ประกันทันใจใน TestFlight ให้เป็นเวอร์ชั่นล่าสุด'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ));
            },
          );
          await actions.terminateAppAction();
          return;
        }
      }

      _model.getRequestList = await InsuranceRequestListAPICall.call(
        apiUrl: FFAppState().apiUrlInsuranceAppState,
        token: FFAppState().accessToken,
        ownerId: FFAppState().employeeID,
        mode: 'arunsawad',
        list: 'list',
      );
      if (InsuranceRequestListAPICall.statusLayer1(
            (_model.getRequestList?.jsonBody ?? ''),
          ) !=
          200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(
                  'พบข้อผิดพลาดConnection (${InsuranceRequestListAPICall.messageLayer1(
                (_model.getRequestList?.jsonBody ?? ''),
              ).toString()})'),
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
      if (!((InsuranceRequestListAPICall.statusLayer2(
                (_model.getRequestList?.jsonBody ?? ''),
              ) ==
              200) ||
          (InsuranceRequestListAPICall.statusLayer2(
                (_model.getRequestList?.jsonBody ?? ''),
              ) ==
              404))) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${InsuranceRequestListAPICall.messageLayer2(
                (_model.getRequestList?.jsonBody ?? ''),
              ).toString()})'),
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFFDB771A),
                size: 30.0,
              ),
              onPressed: () async {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                        child: GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: LoadingSceneWidget(),
                      ),
                    ));
                  },
                ).then((value) => safeSetState(() {}));

                await Future.delayed(const Duration(milliseconds: 500));

                context.goNamed('SuperAppPage');

                Navigator.pop(context);
              },
            ),
            title: Text(
              'ติดตามสถานะ',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF003063),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF6BD67),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF6BD67),
                                      borderRadius: BorderRadius.circular(60.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.person_outline_sharp,
                                      color: Color(0xFF204A77),
                                      size: 30.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      InsuranceRequestListAPICall.listTotal(
                                        (_model.getRequestList?.jsonBody ?? ''),
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF204A77),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'จำนวนงานทั้งหมด',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          decoration: BoxDecoration(
                            color: Color(0xFFF9DCC3),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.0,
                                color: FlutterFlowTheme.of(context).lineColor,
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF9DCC3),
                                    borderRadius: BorderRadius.circular(60.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.directions_car_outlined,
                                    color: Color(0xFF204A77),
                                    size: 30.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    InsuranceRequestListAPICall.auto(
                                      (_model.getRequestList?.jsonBody ?? ''),
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ),
                                Text(
                                  'งานในเรท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF204A77),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.0,
                                color: FlutterFlowTheme.of(context).lineColor,
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(60.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.directions_car_outlined,
                                    color: Color(0xFF204A77),
                                    size: 30.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    InsuranceRequestListAPICall.manual(
                                      (_model.getRequestList?.jsonBody ?? ''),
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ),
                                Text(
                                  'งานนอกเรท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF204A77),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MakeInsuranceListPage',
                              queryParameters: {
                                'checkTotal': serializeParam(
                                  InsuranceRequestListAPICall.waitingInfo(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.int,
                                ),
                                'list': serializeParam(
                                  InsuranceRequestListAPICall.waitingInfoList(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.JSON,
                                  true,
                                ),
                                'checkPayment': serializeParam(
                                  '0',
                                  ParamType.String,
                                ),
                                'fromPage': serializeParam(
                                  'FollowUpPage',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFFF6EFB4),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF6EFB4),
                                      borderRadius: BorderRadius.circular(60.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FaIcon(
                                        FontAwesomeIcons.clipboardList,
                                        color: Color(0xFF204A77),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      InsuranceRequestListAPICall.waitingInfo(
                                        (_model.getRequestList?.jsonBody ?? ''),
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF204A77),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'เตรียมข้อมูล',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MakeInsuranceListPage',
                              queryParameters: {
                                'checkTotal': serializeParam(
                                  InsuranceRequestListAPICall.waitingCar(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.int,
                                ),
                                'list': serializeParam(
                                  InsuranceRequestListAPICall.waitingCarList(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.JSON,
                                  true,
                                ),
                                'checkPayment': serializeParam(
                                  '0',
                                  ParamType.String,
                                ),
                                'fromPage': serializeParam(
                                  'FollowUpPage',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFFB6BFE3),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFB6BFE3),
                                      borderRadius: BorderRadius.circular(60.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.directions_car_outlined,
                                      color: Color(0xFF204A77),
                                      size: 30.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      InsuranceRequestListAPICall.waitingCar(
                                        (_model.getRequestList?.jsonBody ?? ''),
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF204A77),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'ตรวจสอบสภาพรถ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MakeInsuranceListPage',
                              queryParameters: {
                                'checkTotal': serializeParam(
                                  InsuranceRequestListAPICall.approve(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.int,
                                ),
                                'list': serializeParam(
                                  InsuranceRequestListAPICall.approveList(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.JSON,
                                  true,
                                ),
                                'checkPayment': serializeParam(
                                  '0',
                                  ParamType.String,
                                ),
                                'fromPage': serializeParam(
                                  'FollowUpPage',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFF8DEEA7),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF8DEEA7),
                                        borderRadius:
                                            BorderRadius.circular(60.0),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: FaIcon(
                                          FontAwesomeIcons.userCheck,
                                          color: Color(0xFF204A77),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      InsuranceRequestListAPICall.approve(
                                        (_model.getRequestList?.jsonBody ?? ''),
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF204A77),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'อนุมัติ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MakeInsuranceListPage',
                              queryParameters: {
                                'checkTotal': serializeParam(
                                  InsuranceRequestListAPICall.notApprove(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.int,
                                ),
                                'list': serializeParam(
                                  InsuranceRequestListAPICall.notApproveList(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.JSON,
                                  true,
                                ),
                                'checkPayment': serializeParam(
                                  '0',
                                  ParamType.String,
                                ),
                                'fromPage': serializeParam(
                                  'FollowUpPage',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFFE5B2C3),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE5B2C3),
                                      borderRadius: BorderRadius.circular(60.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.highlight_off_outlined,
                                      color: Color(0xFF204A77),
                                      size: 30.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      InsuranceRequestListAPICall.notApprove(
                                        (_model.getRequestList?.jsonBody ?? ''),
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF204A77),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'ไม่อนุมัติ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MakeInsuranceListPage',
                              queryParameters: {
                                'checkTotal': serializeParam(
                                  InsuranceRequestListAPICall.payment(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.int,
                                ),
                                'list': serializeParam(
                                  InsuranceRequestListAPICall.paymentList(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.JSON,
                                  true,
                                ),
                                'checkPayment': serializeParam(
                                  '1',
                                  ParamType.String,
                                ),
                                'fromPage': serializeParam(
                                  'FollowUpPage',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFFC3F9D2),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC3F9D2),
                                        borderRadius:
                                            BorderRadius.circular(60.0),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.attach_money_sharp,
                                          color: Color(0xFF204A77),
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      InsuranceRequestListAPICall.payment(
                                        (_model.getRequestList?.jsonBody ?? ''),
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF204A77),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'รายการลูกค้าชำระเงิน',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MakeInsuranceListPage',
                              queryParameters: {
                                'checkTotal': serializeParam(
                                  InsuranceRequestListAPICall.cancle(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.int,
                                ),
                                'list': serializeParam(
                                  InsuranceRequestListAPICall.cancleList(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.JSON,
                                  true,
                                ),
                                'checkPayment': serializeParam(
                                  'cancle',
                                  ParamType.String,
                                ),
                                'fromPage': serializeParam(
                                  'FollowUpPage',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFFE5B2C3),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5B2C3),
                                        borderRadius:
                                            BorderRadius.circular(60.0),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: FaIcon(
                                          FontAwesomeIcons.ban,
                                          color: Color(0xFF204A77),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      InsuranceRequestListAPICall.cancle(
                                        (_model.getRequestList?.jsonBody ?? ''),
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF204A77),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'ยกเลิก',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MakeInsuranceListPage',
                              queryParameters: {
                                'checkTotal': serializeParam(
                                  InsuranceRequestListAPICall.refund(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.int,
                                ),
                                'list': serializeParam(
                                  InsuranceRequestListAPICall.refundList(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.JSON,
                                  true,
                                ),
                                'checkPayment': serializeParam(
                                  'cancle',
                                  ParamType.String,
                                ),
                                'fromPage': serializeParam(
                                  'FollowUpPage',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFCC99),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFCC99),
                                        borderRadius:
                                            BorderRadius.circular(60.0),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.reply_all_sharp,
                                          color: Color(0xFF204A77),
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      InsuranceRequestListAPICall.refund(
                                        (_model.getRequestList?.jsonBody ?? ''),
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF204A77),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'ขอคืนเงิน',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'MakeInsuranceListPage',
                              queryParameters: {
                                'checkTotal': serializeParam(
                                  InsuranceRequestListAPICall.refundSuccess(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.int,
                                ),
                                'list': serializeParam(
                                  InsuranceRequestListAPICall.refundSuccessList(
                                    (_model.getRequestList?.jsonBody ?? ''),
                                  ),
                                  ParamType.JSON,
                                  true,
                                ),
                                'checkPayment': serializeParam(
                                  'cancle',
                                  ParamType.String,
                                ),
                                'fromPage': serializeParam(
                                  'FollowUpPage',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFF99FFCC),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF99FFCC),
                                        borderRadius:
                                            BorderRadius.circular(60.0),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: FaIcon(
                                          FontAwesomeIcons.moneyCheckAlt,
                                          color: Color(0xFF204A77),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      InsuranceRequestListAPICall.refundSuccess(
                                        (_model.getRequestList?.jsonBody ?? ''),
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF204A77),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'คืนเงินสำเร็จ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF204A77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
