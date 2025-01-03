import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'package_filter_page_model.dart';
export 'package_filter_page_model.dart';

class PackageFilterPageWidget extends StatefulWidget {
  const PackageFilterPageWidget({
    super.key,
    required this.fromPage,
  });

  final String? fromPage;

  @override
  State<PackageFilterPageWidget> createState() =>
      _PackageFilterPageWidgetState();
}

class _PackageFilterPageWidgetState extends State<PackageFilterPageWidget>
    with TickerProviderStateMixin {
  late PackageFilterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PackageFilterPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PackageFilterPage'});
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
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      if (widget!.fromPage == 'SearchPackage3') {
        FFAppState().filterCoverTypeList = [];
        FFAppState().filterGarageTypeList = [];
        safeSetState(() {});
      } else {
        FFAppState().filterInsurerList = [];
        FFAppState().filterCoverTypeList = [];
        FFAppState().filterGarageTypeList = [];
        safeSetState(() {});
      }

      Navigator.pop(context);
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
                FFAppState().selectInsurerList = functions
                    .createFalseListByItemNumber(
                        false, FFAppState().searchSerialName.length)!
                    .toList()
                    .cast<bool>();
                safeSetState(() {});
                context.safePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB7619),
                size: 30.0,
              ),
            ),
            title: Text(
              widget!.fromPage == 'SearchPackage2'
                  ? 'ค้นหาบริษัทประกัน'
                  : 'ค้นหาประกันรถ',
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
                          if (FFAppState().isSelectBrandInPackage)
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          if (widget!.fromPage == 'SearchPackage2')
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
                                          'บริษัทประกัน',
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
                                              'ค้นหาเปรียบเทียบบริษัทประกัน',
                                              ParamType.String,
                                            ),
                                            'searchLabel': serializeParam(
                                              'ระบุชื่อบริษัทประกัน',
                                              ParamType.String,
                                            ),
                                            'dataList': serializeParam(
                                              functions.removeDupeInList(
                                                  FFAppState()
                                                      .searchSerialName
                                                      .toList()),
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
                                            'fromPage': serializeParam(
                                              'searchPackage',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                FFAppState()
                                                            .filterInsurerList
                                                            .length ==
                                                        0
                                                    ? 'เลือกบริษัทประกัน'
                                                    : functions
                                                        .combineStringFromList(
                                                            FFAppState()
                                                                .filterInsurerList
                                                                .toList())!,
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF9F9F9F),
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
                                ],
                              ),
                            ),
                          if (widget!.fromPage == 'SearchPackage3')
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับเลือก) สามารถเลือกได้มากกว่า 1)',
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
                                              'ค้นหาเปรียบเทียบชั้นประกัน',
                                              ParamType.String,
                                            ),
                                            'searchLabel': serializeParam(
                                              'ระบุประเภทชั้นประกัน',
                                              ParamType.String,
                                            ),
                                            'dataList': serializeParam(
                                              functions.removeDupeInList(
                                                  FFAppState()
                                                      .searchCoverType
                                                      .toList()),
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
                                            'fromPage': serializeParam(
                                              'searchPackage',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                FFAppState()
                                                            .filterCoverTypeList
                                                            .length >
                                                        0
                                                    ? functions
                                                        .combineStringFromList(
                                                            FFAppState()
                                                                .filterCoverTypeList
                                                                .toList())!
                                                    : 'กรุณาเลือกประเภทชั้นประกัน',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF9F9F9F),
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
                                ],
                              ),
                            ),
                          if (widget!.fromPage == 'SearchPackage3')
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                              'ค้นหาเปรียบเทียบประเภทการซ่อม',
                                              ParamType.String,
                                            ),
                                            'searchLabel': serializeParam(
                                              'ระบุประเภทการซ่อม',
                                              ParamType.String,
                                            ),
                                            'dataList': serializeParam(
                                              functions.removeDupeInList(
                                                  FFAppState()
                                                      .searchGarageType
                                                      .toList()),
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
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                FFAppState()
                                                            .filterGarageTypeList
                                                            .length >
                                                        0
                                                    ? functions
                                                        .combineStringFromList(
                                                            FFAppState()
                                                                .filterGarageTypeList
                                                                .toList())!
                                                    : 'กรุณาเลือกประเภทการซ่อม',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF9F9F9F),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF143678),
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
                                ],
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
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
                                        'เลือกราคาเบี้ยประกันต่ำสุด - สูงสุด',
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
                                Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  child: custom_widgets.RangeSliderWidget(
                                    width: double.infinity,
                                    height: 150.0,
                                    minRange:
                                        widget!.fromPage == 'SearchPackage2'
                                            ? FFAppState().sliderMinGrossPage2
                                            : FFAppState().sliderMinGrossPage3,
                                    maxRange:
                                        widget!.fromPage == 'SearchPackage2'
                                            ? FFAppState().sliderMaxGrossPage2
                                            : FFAppState().sliderMaxGrossPage3,
                                    activeColor: Color(0xFFDB771B),
                                    inactiveColors: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    overlayColor: Color(0xFFFFBB7C),
                                    startValue:
                                        widget!.fromPage == 'SearchPackage2'
                                            ? FFAppState().sliderMinGrossPage2
                                            : FFAppState().sliderMinGrossPage3,
                                    endValue:
                                        widget!.fromPage == 'SearchPackage2'
                                            ? FFAppState().sliderMaxGrossPage2
                                            : FFAppState().sliderMaxGrossPage3,
                                    step: '20',
                                    typeName: 'ราคาเบี้ย',
                                    currentMinValue:
                                        widget!.fromPage == 'SearchPackage2'
                                            ? FFAppState()
                                                .sliderCurrentMinGrossPage2
                                            : FFAppState()
                                                .sliderCurrentMinGrossPage3,
                                    currentMaxValue:
                                        widget!.fromPage == 'SearchPackage2'
                                            ? FFAppState()
                                                .sliderCurrentMaxGrossPage2
                                            : FFAppState()
                                                .sliderCurrentMaxGrossPage3,
                                    fromPage: widget!.fromPage,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
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
                                        'เลือกราคาทุนประกันต่ำสุด - สูงสุด',
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
                                Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  child: custom_widgets.RangeSliderWidget(
                                    width: double.infinity,
                                    height: 150.0,
                                    minRange: widget!.fromPage ==
                                            'SearchPackage2'
                                        ? FFAppState().sliderMinSumInsuredPage2
                                        : FFAppState().sliderMinSumInsuredPage3,
                                    maxRange: widget!.fromPage ==
                                            'SearchPackage2'
                                        ? FFAppState().sliderMaxSumInsuredPage2
                                        : FFAppState().sliderMaxSumInsuredPage3,
                                    activeColor: Color(0xFFDB771B),
                                    inactiveColors: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    overlayColor: Color(0xFFFFBB7C),
                                    startValue: widget!.fromPage ==
                                            'SearchPackage2'
                                        ? FFAppState().sliderMinSumInsuredPage2
                                        : FFAppState().sliderMinSumInsuredPage3,
                                    endValue: widget!.fromPage ==
                                            'SearchPackage2'
                                        ? FFAppState().sliderMaxSumInsuredPage2
                                        : FFAppState().sliderMaxSumInsuredPage3,
                                    step: '100',
                                    typeName: 'ทุนประกัน',
                                    currentMinValue: widget!.fromPage ==
                                            'SearchPackage2'
                                        ? FFAppState()
                                            .sliderCurrentMinSumInsuredPage2
                                        : FFAppState()
                                            .sliderCurrentMinSumInsuredPage3,
                                    currentMaxValue: widget!.fromPage ==
                                            'SearchPackage2'
                                        ? FFAppState()
                                            .sliderCurrentMaxSumInsuredPage2
                                        : FFAppState()
                                            .sliderCurrentMaxSumInsuredPage3,
                                    fromPage: widget!.fromPage,
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
                              20.0, 0.0, 20.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().selectInsurerList = functions
                                  .createFalseListByItemNumber(false,
                                      FFAppState().searchSerialName.length)!
                                  .toList()
                                  .cast<bool>();
                              safeSetState(() {});
                              context.safePop();
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
