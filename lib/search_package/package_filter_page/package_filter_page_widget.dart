import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'package_filter_page_model.dart';
export 'package_filter_page_model.dart';

class PackageFilterPageWidget extends StatefulWidget {
  const PackageFilterPageWidget({Key? key}) : super(key: key);

  @override
  _PackageFilterPageWidgetState createState() =>
      _PackageFilterPageWidgetState();
}

class _PackageFilterPageWidgetState extends State<PackageFilterPageWidget>
    with TickerProviderStateMixin {
  late PackageFilterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: Offset(0.0, -20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

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

      setState(() {
        FFAppState().filterInsurerList = [];
        FFAppState().filterCoverTypeList = [];
        FFAppState().filterGarageTypeList = [];
      });
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
                setState(() {
                  FFAppState().selectInsurerList = functions
                      .createFalseListByItemNumber(
                          false, FFAppState().searchSerialName.length)!
                      .toList()
                      .cast<bool>();
                });
                context.safePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB7619),
                size: 30.0,
              ),
            ),
            title: Text(
              'ค้นหาประกันรถ',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF123063),
                    fontSize: 18.0,
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
                                            true,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
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
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFF9F9F9F),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
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
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับเลือก) สามารถเลือกได้มากกว่า 1)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
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
                                            true,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
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
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFF9F9F9F),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
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
                                            true,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
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
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFF9F9F9F),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
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
                              setState(() {
                                FFAppState().selectInsurerList = functions
                                    .createFalseListByItemNumber(false,
                                        FFAppState().searchSerialName.length)!
                                    .toList()
                                    .cast<bool>();
                              });
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
