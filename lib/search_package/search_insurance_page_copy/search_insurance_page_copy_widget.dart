import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_insurance_page_copy_model.dart';
export 'search_insurance_page_copy_model.dart';

class SearchInsurancePageCopyWidget extends StatefulWidget {
  const SearchInsurancePageCopyWidget({
    super.key,
    required this.fromIcon,
  });

  final String? fromIcon;

  @override
  State<SearchInsurancePageCopyWidget> createState() =>
      _SearchInsurancePageCopyWidgetState();
}

class _SearchInsurancePageCopyWidgetState
    extends State<SearchInsurancePageCopyWidget> with TickerProviderStateMixin {
  late SearchInsurancePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchInsurancePageCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchInsurancePageCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
            ),
          );
        },
      );
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().insuranceVehicleTypeDropDown = 'เลือกประเภทรถ';
                FFAppState().insuranceBasicBrandName = 'เลือกยี่ห้อรถ';
                FFAppState().insuranceBasicBrandId = '';
                FFAppState().isSelectBrandInPackage = false;
                FFAppState().insuranceBasicModelName = 'เลือกรุ่นรถ';
                FFAppState().insuranceBasicModelId = '';
                FFAppState().insuranceBasicYear = 'เลือกปีจดทะเบียน พ.ศ.';
                FFAppState().insuranceBasicVehicleUsedTypeName =
                    'เลือกการใช้งาน';
                FFAppState().insuranceBasicCoverTypeNameOutputList = [];
                FFAppState().insuranceBasicGarageTypeInPackage = [];
                FFAppState().insuranceCarTypeDetailSelected = '';
                safeSetState(() {});

                context.goNamed('SuperAppPage');
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB7619),
                size: 30.0,
              ),
            ),
            title: Text(
              true ? 'ค้นหาประกันมอเตอร์ไซค์' : 'ค้นหาประกันรถ',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF123063),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ประเภทรถ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF404040),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับเลือก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (widget!.fromIcon != 'MC') {
                                        context.pushNamed(
                                          'SearchableCarListPage',
                                          queryParameters: {
                                            'titleText': serializeParam(
                                              'เลือกประเภทรถ',
                                              ParamType.String,
                                            ),
                                            'searchLabel': serializeParam(
                                              'ระบุประเภทรถ',
                                              ParamType.String,
                                            ),
                                            'dataList': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicVehicleTypeDropdownList,
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'multiSelect': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                            'maxSelected': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                            'fromPage': serializeParam(
                                              'searchPackage',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                FFAppState()
                                                    .insuranceVehicleTypeDropDown,
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: functions
                                                              .containWordinStringUrl(
                                                                  'เลือก',
                                                                  FFAppState()
                                                                      .insuranceVehicleTypeDropDown)!
                                                          ? Color(0xFF9F9F9F)
                                                          : Colors.black,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF474747),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ยี่ห้อรถ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF404040),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับเลือก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'SearchableListPage',
                                        queryParameters: {
                                          'titleText': serializeParam(
                                            'เลือกยี่ห้อรถ',
                                            ParamType.String,
                                          ),
                                          'searchLabel': serializeParam(
                                            'ระบุยี่ห้อรถ',
                                            ParamType.String,
                                          ),
                                          'dataList': serializeParam(
                                            FFAppState()
                                                .insuranceBasicBrandNameList,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'multiSelect': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                FFAppState()
                                                    .insuranceBasicBrandName,
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: functions
                                                              .containWordinStringUrl(
                                                                  'เลือก',
                                                                  FFAppState()
                                                                      .insuranceBasicBrandName)!
                                                          ? Color(0xFF9F9F9F)
                                                          : Colors.black,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF474747),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().isSelectBrandInPackage)
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'รุ่นรถ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFF404040),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับเลือก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFF40606),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'SearchableListPage',
                                          queryParameters: {
                                            'titleText': serializeParam(
                                              'เลือกรุ่นรถ',
                                              ParamType.String,
                                            ),
                                            'searchLabel': serializeParam(
                                              'ระบุรุ่นรถ',
                                              ParamType.String,
                                            ),
                                            'dataList': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicModelNameList,
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'multiSelect': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                            'maxSelected': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                            'fromPage': serializeParam(
                                              'SearchPackage',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: ListTile(
                                                title: Text(
                                                  FFAppState()
                                                      .insuranceBasicModelName,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: functions
                                                                .containWordinStringUrl(
                                                                    'เลือก',
                                                                    FFAppState()
                                                                        .insuranceBasicModelName)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF474747),
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ปีจดทะเบียน พ.ศ.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF404040),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับเลือก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'SearchableListPage',
                                        queryParameters: {
                                          'titleText': serializeParam(
                                            'เลือกปีจดทะเบียน',
                                            ParamType.String,
                                          ),
                                          'searchLabel': serializeParam(
                                            'ระบุปีจดทะเบียน',
                                            ParamType.String,
                                          ),
                                          'dataList': serializeParam(
                                            functions.reverseList(functions
                                                .ganerateYearList(2500, 2567)
                                                ?.toList()),
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'multiSelect': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                FFAppState().insuranceBasicYear,
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: functions
                                                              .containWordinStringUrl(
                                                                  'เลือก',
                                                                  FFAppState()
                                                                      .insuranceBasicYear)!
                                                          ? Color(0xFF9F9F9F)
                                                          : Colors.black,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF474747),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ลักษณะการใช้รถ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF404040),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับเลือก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'SearchableListPage',
                                        queryParameters: {
                                          'titleText': serializeParam(
                                            'เลือกลักษณะการใช้รถ',
                                            ParamType.String,
                                          ),
                                          'searchLabel': serializeParam(
                                            'ระบุลักษณะการใช้รถ',
                                            ParamType.String,
                                          ),
                                          'dataList': serializeParam(
                                            functions.generateInsuranceVehicleTypeDropdown(
                                                FFAppState()
                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicVehicleUsedTypeNameList
                                                    .toList()),
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'multiSelect': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                FFAppState().insuranceBasicVehicleUsedTypeName ==
                                                        'เลือกการใช้งาน'
                                                    ? 'เลือกการใช้งาน'
                                                    : (functions.generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())![functions
                                                        .getIndexOfSomethingList(
                                                            FFAppState()
                                                                .insuranceBasicVehicleUsedTypeCodeList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicVehicleUsedTypeCode)]),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: functions
                                                              .containWordinStringUrl(
                                                                  'เลือก',
                                                                  FFAppState()
                                                                      .insuranceBasicVehicleUsedTypeName)!
                                                          ? Color(0xFF9F9F9F)
                                                          : Colors.black,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF474747),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ประเภทชั้นประกัน',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF404040),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับเลือก สามารถเลือกได้มากกว่า 1)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'SearchableListPage',
                                        queryParameters: {
                                          'titleText': serializeParam(
                                            'เลือกประเภทชั้นประกัน',
                                            ParamType.String,
                                          ),
                                          'searchLabel': serializeParam(
                                            'ระบุประเภทชั้นประกัน',
                                            ParamType.String,
                                          ),
                                          'dataList': serializeParam(
                                            FFAppState()
                                                .insuranceBasicCoverTypeNameList,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'multiSelect': serializeParam(
                                            true,
                                            ParamType.bool,
                                          ),
                                          'maxSelected': serializeParam(
                                            0,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                FFAppState()
                                                            .insuranceBasicCoverTypeNameOutputList
                                                            .length >
                                                        0
                                                    ? functions
                                                        .combineStringFromList(
                                                            FFAppState()
                                                                .insuranceBasicCoverTypeNameOutputList
                                                                .toList())!
                                                    : 'กรุณาเลือกประเภทชั้นประกัน',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: FFAppState()
                                                                  .insuranceBasicCoverTypeNameOutputList
                                                                  .length >
                                                              0
                                                          ? Colors.black
                                                          : Color(0xFF9F9F9F),
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF474747),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ประเภทการซ่อม',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF424242),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับเลือก สามารถเลือกได้มากกว่า 1)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'SearchableListPage',
                                        queryParameters: {
                                          'titleText': serializeParam(
                                            'เลือกประเภทการซ่อม',
                                            ParamType.String,
                                          ),
                                          'searchLabel': serializeParam(
                                            'ระบุประเภทการซ่อม',
                                            ParamType.String,
                                          ),
                                          'dataList': serializeParam(
                                            FFAppState()
                                                .insuranceBasicGarageTypeNameList,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'multiSelect': serializeParam(
                                            true,
                                            ParamType.bool,
                                          ),
                                          'maxSelected': serializeParam(
                                            0,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                FFAppState()
                                                            .insuranceBasicGarageTypeInPackage
                                                            .length >
                                                        0
                                                    ? functions
                                                        .combineStringFromList(
                                                            FFAppState()
                                                                .insuranceBasicGarageTypeInPackage
                                                                .toList())!
                                                    : 'กรุณาเลือกประเภทการซ่อม',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: FFAppState()
                                                                  .insuranceBasicGarageTypeInPackage
                                                                  .length >
                                                              0
                                                          ? Colors.black
                                                          : Color(0xFF9F9F9F),
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF474747),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'จังหวัดที่จดทะเบียน',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับกรอก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFB0606),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 5.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'SearchableListPage',
                                          queryParameters: {
                                            'titleText': serializeParam(
                                              'เลือกจังหวัดที่จดทะเบียน',
                                              ParamType.String,
                                            ),
                                            'searchLabel': serializeParam(
                                              'เลือกจังหวัดที่จดทะเบียน',
                                              ParamType.String,
                                            ),
                                            'dataList': serializeParam(
                                              FFAppState()
                                                  .insuranceInfoRegistrationprovinceList,
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'multiSelect': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                            'maxSelected': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );

                                        await actions.hideKeyboardAction(
                                          context,
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFB3B3B3),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: ListTile(
                                                title: Text(
                                                  FFAppState().insuranceInfoRegistrationProvinceSelect !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoRegistrationProvinceSelect !=
                                                              ''
                                                      ? FFAppState()
                                                          .insuranceInfoRegistrationProvinceSelect
                                                      : 'กรุณาเลือกจังหวัดที่จดทะเบียน',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: functions
                                                                .containWordinStringUrl(
                                                                    'เลือก',
                                                                    FFAppState()
                                                                        .insuranceInfoProductYear)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF474747),
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'วันที่หมดอายุของประกันเดิม',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF424242),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 5.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await DatePicker.showDatePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          safeSetState(() {
                                            _model.datePicked = date;
                                          });
                                        },
                                        currentTime: getCurrentTimestamp,
                                        minTime: DateTime(0, 0, 0),
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: () => LocaleType.en,
                                        ),
                                      );

                                      if (!(_model.datePicked != null)) {
                                        await actions.hideKeyboardAction(
                                          context,
                                        );
                                        return;
                                      }
                                      FFAppState().insuranceBasicOldVmiExpDate =
                                          functions.getDateFormat(
                                              _model.datePicked)!;
                                      safeSetState(() {});
                                      await actions.hideKeyboardAction(
                                        context,
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.datePicked != null
                                                    ? functions.showDateBE(
                                                        _model.datePicked
                                                            ?.toString())
                                                    : 'กรุณาเลือกวันที่หมดอายุประกันเดิม',
                                                'กรุณาเลือกวันที่หมดอายุประกันเดิม',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: _model.datePicked !=
                                                            null
                                                        ? Colors.black
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.edit_calendar_outlined,
                                              color: Color(0xFF474747),
                                              size: 24.0,
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
                        ]
                            .divide(SizedBox(height: 8.0))
                            .addToStart(SizedBox(height: 20.0))
                            .addToEnd(SizedBox(height: 36.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (!((FFAppState()
                                              .insuranceVehicleTypeDropDown !=
                                          null &&
                                      FFAppState()
                                              .insuranceVehicleTypeDropDown !=
                                          '') &&
                                  (FFAppState().insuranceVehicleTypeDropDown !=
                                      '') &&
                                  (FFAppState().insuranceVehicleTypeDropDown !=
                                      'เลือกประเภทรถ'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('กรุณาเลือกประเภทรถ'),
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
                              if (!((FFAppState().insuranceBasicBrandName !=
                                          null &&
                                      FFAppState().insuranceBasicBrandName !=
                                          '') &&
                                  (FFAppState().insuranceBasicBrandName !=
                                      '') &&
                                  (FFAppState().insuranceBasicBrandName !=
                                      'เลือกยี่ห้อรถ'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('กรุณาเลือกยี่ห้อรถ'),
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
                              if (!((FFAppState().insuranceBasicModelName !=
                                          null &&
                                      FFAppState().insuranceBasicModelName !=
                                          '') &&
                                  (FFAppState().insuranceBasicModelName !=
                                      '') &&
                                  (FFAppState().insuranceBasicModelName !=
                                      'เลือกรุ่นรถ'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('กรุณาเลือกรุ่นรถ'),
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
                              if (!((FFAppState().insuranceBasicYear != null &&
                                      FFAppState().insuranceBasicYear != '') &&
                                  (FFAppState().insuranceBasicYear != '') &&
                                  (FFAppState().insuranceBasicYear !=
                                      'เลือกปีจดทะเบียน พ.ศ.'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('กรุณาเลือกปีจดทะเบียน'),
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
                              if (!((FFAppState().insuranceBasicVehicleUsedTypeName !=
                                          null &&
                                      FFAppState()
                                              .insuranceBasicVehicleUsedTypeName !=
                                          '') &&
                                  (FFAppState()
                                          .insuranceBasicVehicleUsedTypeName !=
                                      '') &&
                                  (FFAppState()
                                          .insuranceBasicVehicleUsedTypeName !=
                                      'เลือกการใช้งาน'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content:
                                            Text('กรุณาเลือกลักษณะการใช้รถ'),
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
                              if (FFAppState()
                                      .insuranceBasicCoverTypeNameOutputList
                                      .length <=
                                  0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content:
                                            Text('กรุณาเลือกประเภทชั้นประกัน'),
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
                              if (FFAppState()
                                      .insuranceBasicGarageTypeInPackage
                                      .length <=
                                  0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content:
                                            Text('กรุณาเลือกประเภทการซ่อม'),
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
                              if (!FFAppState()
                                  .insuranceBasicModelNameList
                                  .contains(
                                      FFAppState().insuranceBasicModelName)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'ไม่พบรุ่นย่อยรถนี้ในแพ็กเกจประกัน'),
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

                                context.pushNamed('InsuranceWorkSelectPage');

                                return;
                              }
                              if (!(FFAppState()
                                          .insuranceInfoRegistrationProvinceSelect !=
                                      null &&
                                  FFAppState()
                                          .insuranceInfoRegistrationProvinceSelect !=
                                      '')) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาเลือกจังหวัดที่จดทะเบียน'),
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
                              FFAppState().filterInsurerList = [];
                              FFAppState().filterGarageTypeList = [];
                              FFAppState().filterCoverTypeList = [];
                              safeSetState(() {});

                              context.pushNamed(
                                'insurerListPage',
                                queryParameters: {
                                  'brandCode': serializeParam(
                                    FFAppState().insuranceBasicBrandId,
                                    ParamType.String,
                                  ),
                                  'modelCode': serializeParam(
                                    FFAppState().insuranceBasicModelId,
                                    ParamType.String,
                                  ),
                                  'year': serializeParam(
                                    (int.parse(FFAppState()
                                                .insuranceBasicYear) -
                                            543)
                                        .toString(),
                                    ParamType.String,
                                  ),
                                  'province': serializeParam(
                                    FFAppState()
                                        .insuranceInfoRegistrationProvinceSelect,
                                    ParamType.String,
                                  ),
                                  'vehicleUsage': serializeParam(
                                    FFAppState()
                                        .insuranceBasicVehicleUsedTypeCode,
                                    ParamType.String,
                                  ),
                                  'coverType': serializeParam(
                                    FFAppState()
                                        .insuranceBasicCoverTypeCodeOutputList,
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'garageType': serializeParam(
                                    functions.createGarageTypeCodeList(
                                        FFAppState()
                                            .insuranceBasicGarageTypeInPackage
                                            .toList()),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'brandName': serializeParam(
                                    FFAppState().insuranceBasicBrandName,
                                    ParamType.String,
                                  ),
                                  'modelName': serializeParam(
                                    FFAppState().insuranceBasicModelName,
                                    ParamType.String,
                                  ),
                                  'carTypeDetail': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                  'oldVmiExpDate': serializeParam(
                                    _model.datePicked != null
                                        ? functions
                                            .getDateFormat(_model.datePicked)
                                        : '',
                                    ParamType.String,
                                  ),
                                  'provinceCode': serializeParam(
                                    FFAppState()
                                        .insuranceInfoRegistrationCodeSelect,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'ค้นหา',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFDB771B),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
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
                      ].addToStart(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
