import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurer_list_overall_renew_page_model.dart';
export 'insurer_list_overall_renew_page_model.dart';

class InsurerListOverallRenewPageWidget extends StatefulWidget {
  const InsurerListOverallRenewPageWidget({
    super.key,
    required this.dataRenew,
    required this.refRenewId,
  });

  final dynamic dataRenew;
  final String? refRenewId;

  static String routeName = 'insurerListOverallRenewPage';
  static String routePath = 'insurerListOverallRenewPage';

  @override
  State<InsurerListOverallRenewPageWidget> createState() =>
      _InsurerListOverallRenewPageWidgetState();
}

class _InsurerListOverallRenewPageWidgetState
    extends State<InsurerListOverallRenewPageWidget>
    with TickerProviderStateMixin {
  late InsurerListOverallRenewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsurerListOverallRenewPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insurerListOverallRenewPage'});
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
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(widget!.dataRenew!.toString()),
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
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(getJsonField(
                widget!.dataRenew,
                r'''$.brand_id''',
              ).toString()),
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
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(getJsonField(
                widget!.dataRenew,
                r'''$.model_id''',
              ).toString()),
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
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(FFAppState().apiUrlInsuranceAppState),
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
      _model.packageRENEWAPIOutput = await TelePackageSearchAPIRENEWCall.call(
        brandCode: '${getJsonField(
          widget!.dataRenew,
          r'''$.brand_id''',
        ).toString()}',
        modelCode: '${getJsonField(
          widget!.dataRenew,
          r'''$.model_id''',
        ).toString()}',
        year: '${getJsonField(
          widget!.dataRenew,
          r'''$.year''',
        ).toString()}',
        province: '${getJsonField(
          widget!.dataRenew,
          r'''$.registration_province''',
        ).toString()}',
        carRegistration: '${getJsonField(
          widget!.dataRenew,
          r'''$.car_registration''',
        ).toString()}',
        driver: '${getJsonField(
          widget!.dataRenew,
          r'''$.driver_type''',
        ).toString()}',
        vehicleUsage: '${getJsonField(
          widget!.dataRenew,
          r'''$.vehicle_code''',
        ).toString()}',
        coverTypeList: ["VMI1", "VMI2", "VMI2+", "VMI3", "VMI3+"],
        insuranceUrl: FFAppState().apiUrlInsuranceAppState,
        garageTypeList: ["COMPANY", "DEALER"],
        driverBehaviorList: ["0", "0", "0", "0", "0"],
        grossTotal: '${getJsonField(
          widget!.dataRenew,
          r'''$.gross_total''',
        ).toString()}',
      );

      if ((_model.packageRENEWAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.packageRENEWAPIOutput?.statusCode ?? 200).toString()})'),
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
        return;
      }
      if ('${getJsonField(
            (_model.packageRENEWAPIOutput?.jsonBody ?? ''),
            r'''$.code''',
          ).toString()}' ==
          '200') {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(getJsonField(
                  (_model.packageRENEWAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data[*][*]''',
                ).toString()),
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
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(((getJsonField(
                  (_model.packageRENEWAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data[*][*]''',
                  true,
                ) as List?)!
                        .map<String>((e) => e.toString())
                        .toList()
                        .cast<String>()
                        .length)
                    .toString()),
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
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('${'${getJsonField(
                  (_model.packageRENEWAPIOutput?.jsonBody ?? ''),
                  r'''$.message''',
                ).toString()}'}'),
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
        return;
      }

      if (TelePackageSearchAPIRENEWCall.dataAll(
            (_model.packageRENEWAPIOutput?.jsonBody ?? ''),
          )!
              .length >
          0) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('1'),
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
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('ไม่พบข้อมูลบริษัทประกัน'),
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
        Navigator.pop(context);
        return;
      }

      _model.dataRenewPage = TelePackageSearchAPIRENEWCall.dataAll(
        (_model.packageRENEWAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<PackageDataModelStruct>();
      safeSetState(() {});
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text('2'),
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
      Navigator.pop(context);
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
      child: PopScope(
        canPop: false,
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
                context.safePop();
              },
            ),
            title: Text(
              'ค้นหาบริษัทประกัน',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.notoSansThai(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Color(0xFF003063),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<InsurerConfig2Record>>(
                          stream: queryInsurerConfig2Record(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<InsurerConfig2Record>
                                columnInsurerConfig2RecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnInsurerConfig2Record =
                                columnInsurerConfig2RecordList.isNotEmpty
                                    ? columnInsurerConfig2RecordList.first
                                    : null;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<List<HideInAppContentRecord>>(
                                  future: queryHideInAppContentRecordOnce(
                                    queryBuilder: (hideInAppContentRecord) =>
                                        hideInAppContentRecord.where(
                                      'content_name',
                                      isEqualTo: 'disable_work_weekend',
                                    ),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<HideInAppContentRecord>
                                        columnHideInAppContentRecordList =
                                        snapshot.data!;
                                    final columnHideInAppContentRecord =
                                        columnHideInAppContentRecordList
                                                .isNotEmpty
                                            ? columnHideInAppContentRecordList
                                                .first
                                            : null;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          'ค้นหาชื่อบริษัทประกัน ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {},
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                            .filterInsurerList
                                                                            .length >
                                                                        0
                                                                    ? FFAppState()
                                                                        .filterInsurerList
                                                                        .firstOrNull!
                                                                    : 'ค้นหาบริษัทประกัน',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSansThai(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (FFAppState()
                                                                        .filterInsurerList
                                                                        .length >
                                                                    0)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState().filterInsurerList =
                                                                            [];
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .cancel_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .filterInsurerList
                                                                        .length ==
                                                                    0)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        if (false)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 4.0, 24.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'ราคาเบี้ยต่ำสุด:${functions.showNumberWithComma(FFAppState().sliderCurrentMinGrossPage2)}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'ราคาเบี้ยสูงสุด:${functions.showNumberWithComma(FFAppState().sliderCurrentMaxGrossPage2)}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 4.0, 24.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'ทุนประกันต่ำสุด:${functions.showNumberWithComma(FFAppState().sliderCurrentMinSumInsuredPage2)}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'ทุนประกันสูงสุด:${functions.showNumberWithComma(FFAppState().sliderCurrentMaxSumInsuredPage2)}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.58,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((TelePackageSearchAPIRENEWCall
                                                            .statusLayer1(
                                                          (_model.packageRENEWAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        200) &&
                                                    ((_model.packageRENEWAPIOutput
                                                                ?.statusCode ??
                                                            200) ==
                                                        200))
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listinsurance =
                                                            _model.dataRenewPage
                                                                .toList();

                                                        return ListView.builder(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            4.0,
                                                            0,
                                                            0,
                                                          ),
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listinsurance
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listinsuranceIndex) {
                                                            final listinsuranceItem =
                                                                listinsurance[
                                                                    listinsuranceIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          8.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: columnInsurerConfig2Record!
                                                                        .insurerInstallment
                                                                        .contains(FFAppState()
                                                                            .searchShortName
                                                                            .elementAtOrNull(listinsuranceIndex))
                                                                    ? 160.0
                                                                    : 140.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 9,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            6.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 1,
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 15.0, 30.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 40.0,
                                                                                              height: 40.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.network(
                                                                                                  getCORSProxyUrl(
                                                                                                    valueOrDefault<String>(
                                                                                                      functions.stringToImgPath(listinsuranceItem.logo),
                                                                                                      'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                                                    ),
                                                                                                  ),
                                                                                                  width: 150.0,
                                                                                                  height: 150.0,
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Text(
                                                                                                  listinsuranceItem.insurerCode,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 11.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        if (columnInsurerConfig2Record?.insurerInstallment?.contains(listinsuranceItem.insurerShortName) ?? true)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ชำระเต็มจำนวนเท่านั้น',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'ประเภทประกัน',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.notoSansThai(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      fontSize: 11.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    functions.addCoverType(listinsuranceItem.coverTypeList),
                                                                                                    '-',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 11.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'ราคาเบี้ยเริ่มต้น',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.notoSansThai(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                child: Text(
                                                                                                  listinsuranceItem.minGrossTotal,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'ทุนประกันสูงสุด',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.notoSansThai(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                child: Text(
                                                                                                  listinsuranceItem.maxSumInsured,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          context.pushNamed(
                                                                                            InsurerListRenewPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'dataPackage': serializeParam(
                                                                                                listinsuranceItem,
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                              'refRenewId': serializeParam(
                                                                                                widget!.refRenewId,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                        text: 'รายละเอียด',
                                                                                        options: FFButtonOptions(
                                                                                          height: 30.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: Color(0x9EFF6500),
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                font: GoogleFonts.notoSansThai(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                          elevation: 3.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
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
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (TelePackageSearchAPIRENEWCall
                                                        .dataAll(
                                                      (_model.packageRENEWAPIOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.length ==
                                                    0)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.53,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 1.0,
                                                              color: Color(
                                                                  0x33000000),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'ไม่พบข้อมูลบริษัทประกัน',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
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
                                        if (false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 4.0, 20.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .carSide,
                                                              color: Color(
                                                                  0xB0FF9936),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'งานต่ออายุ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (columnHideInAppContentRecord!
                                                                      .isShowContent) {}
                                                                  FFAppState()
                                                                          .nonePackageFlagCarrier =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageVehicleType =
                                                                      'กรุณาเลือกประเภทรถ';
                                                                  FFAppState()
                                                                          .nonePackageBrandName =
                                                                      'กรุณาเลือกยี่ห้อรถ';
                                                                  FFAppState()
                                                                      .nonePackageBrandId = '';
                                                                  FFAppState()
                                                                          .nonePackageModelName =
                                                                      'กรุณากรอกรุ่นรถ';
                                                                  FFAppState()
                                                                      .nonePackageModelCode = '';
                                                                  FFAppState()
                                                                          .nonePackageYear =
                                                                      'กรุณาเลือกปีจดทะเบียน';
                                                                  FFAppState()
                                                                      .nonePackageUsedTypeId = '';
                                                                  FFAppState()
                                                                      .nonePackageSearchModelList = [];
                                                                  FFAppState()
                                                                      .nonePackageUsedTypeCode = '';
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeName =
                                                                      'กรุณาเลือกลักษณะการใช้รถ';
                                                                  FFAppState()
                                                                          .nonePackageCusFullname =
                                                                      'กรุณากรอกชื่อ';
                                                                  FFAppState()
                                                                          .nonePackageCusPhone =
                                                                      'กรุณากรอกเบอร์โทรศัพท์';
                                                                  FFAppState()
                                                                      .nonePackagePlate = '';
                                                                  FFAppState()
                                                                          .nonePackageProvince =
                                                                      'กรุณาเลือกจังหวัดจดทะเบียน';
                                                                  FFAppState()
                                                                      .nonePackageProvinceId = '';
                                                                  FFAppState()
                                                                          .nonePackageSumInsured =
                                                                      'กรุณากรอกทุนประกัน';
                                                                  FFAppState()
                                                                          .nonePackageFlagAct =
                                                                      true;
                                                                  FFAppState()
                                                                          .nonePackageIsBrandSelect =
                                                                      false;
                                                                  FFAppState()
                                                                      .nonePackageSearchModelIdList = [];
                                                                  FFAppState()
                                                                          .nonePackageCarrierType =
                                                                      'กรุณาเลือกประเภทตู้เหล็ก';
                                                                  FFAppState()
                                                                          .nonePackageFlagCoop =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageTruckPart =
                                                                      'กรุณาเลือกส่วนของรถบรรทุก';
                                                                  FFAppState()
                                                                          .nonePackageCusMembership =
                                                                      'กรุณาเลือกประเภทลูกค้า';
                                                                  FFAppState()
                                                                          .nonePackageTruckCurrentPrice =
                                                                      'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                                                  FFAppState()
                                                                          .nonePackagePlateAdditional =
                                                                      'กรุณากรอกเลขทะเบียนหางพ่วง';
                                                                  FFAppState()
                                                                          .nonePackageTruckCarryPurpose =
                                                                      'กรุณากรอกรถใช้บรรทุกอะไร';
                                                                  FFAppState()
                                                                          .nonePackageTrailerSumInsured =
                                                                      'กรุณากรอกทุนประกันหางพ่วง';
                                                                  FFAppState()
                                                                      .nonePackageCarrierPrice = '';
                                                                  FFAppState()
                                                                      .nonePackageInsurerIdList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerCodeList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerShortNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerDisplayName = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerIdOutputList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerCodeOutputList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerShortNameOutputList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerNameOutputList = [];
                                                                  FFAppState()
                                                                      .nonePackageReason = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerSelectedList = [];
                                                                  FFAppState()
                                                                      .nonePackageCoverTypeId = '';
                                                                  FFAppState()
                                                                      .nonePackageCoverTypeCode = '';
                                                                  FFAppState()
                                                                          .nonePackageCoverTypeName =
                                                                      'กรุณาเลือกประเภทชั้นประกัน';
                                                                  FFAppState()
                                                                      .nonePackageGarageTypeId = '';
                                                                  FFAppState()
                                                                          .nonePackageGarageTypeName =
                                                                      'กรุณาเลือกประเภทการซ่อม';
                                                                  FFAppState()
                                                                      .nonePackageGarageTypeCode = '';
                                                                  FFAppState()
                                                                          .nonePackageFlagRenew =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageOldVmiExpDate =
                                                                      'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                                                  FFAppState()
                                                                      .nonePackageOldVmi = '';
                                                                  FFAppState()
                                                                      .nonePackageOldVmiImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageIdCardImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageRenewImageUrlList = [];
                                                                  FFAppState()
                                                                      .nonePackageRenewImageCheckList = [];
                                                                  FFAppState()
                                                                          .nonePackageOldVmiImageUploadedCheck =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageIdCardWatermarkUploadedCheck =
                                                                      false;
                                                                  FFAppState()
                                                                          .buttonOrdinary =
                                                                      false;
                                                                  FFAppState()
                                                                          .buttonCorporation =
                                                                      false;
                                                                  FFAppState()
                                                                      .nonePackageCustomerType = '';
                                                                  FFAppState()
                                                                      .nonePackageInsurerDisplayNameOutput = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther = [];
                                                                  FFAppState()
                                                                      .nonePackageImageFront = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRightFront = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRight = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRightRear = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRear = [];
                                                                  FFAppState()
                                                                      .nonePackageImageLeftRear = [];
                                                                  FFAppState()
                                                                      .nonePackageImageLeft = [];
                                                                  FFAppState()
                                                                      .nonePackageImageLeftFront = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRoof = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageFront = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightFront = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRight = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightRear = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRear = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftRear = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeft = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftFront = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerOutputIndex = 0;
                                                                  FFAppState()
                                                                      .nonePackageLeadId = '';
                                                                  FFAppState()
                                                                      .nonePackageLeadNo = '';
                                                                  FFAppState()
                                                                      .nonePackageCarImageUploadedList = [];
                                                                  FFAppState()
                                                                      .nonePackageImageOldVmi = [];
                                                                  FFAppState()
                                                                      .nonePackageImageCompanyBook = [];
                                                                  FFAppState()
                                                                      .nonePackageImageIdCard = [];
                                                                  FFAppState()
                                                                      .nonePackageImageBlueBook = [];
                                                                  FFAppState()
                                                                          .nonePackageCompanyBookImageUploadedCheck =
                                                                      false;
                                                                  FFAppState()
                                                                      .nonePackageCompanyBookImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageImageFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRoofUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageBlueBookUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther1 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther2 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther3 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther4 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther5 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOtherNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageSelectedInsurerShortName = '';
                                                                  FFAppState()
                                                                      .nonePackageSelectedInsurerName = '';
                                                                  FFAppState()
                                                                      .nonePackageSelectedInsurerShortNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageSelectedInsurerNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageFlagOldVmi = '';
                                                                  FFAppState()
                                                                      .nonePackageWorkType = '';
                                                                  FFAppState()
                                                                      .nonePackageRemark = '';
                                                                  FFAppState()
                                                                      .nonePackageBranchCode = '';
                                                                  FFAppState()
                                                                      .nonePackageBranchName = '';
                                                                  FFAppState()
                                                                      .nonePackageInsurerShortNameDupList = [];
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageFlagRenew =
                                                                      true;
                                                                  FFAppState()
                                                                          .nonePackageOldVmiImageUploadedCheck =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageIdCardWatermarkUploadedCheck =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageVehicleType =
                                                                      FFAppState()
                                                                          .insuranceVehicleTypeDropDown;
                                                                  FFAppState()
                                                                          .nonePackageBrandName =
                                                                      FFAppState()
                                                                          .insuranceBasicBrandName;
                                                                  FFAppState()
                                                                          .nonePackageBrandId =
                                                                      FFAppState()
                                                                          .insuranceBasicBrandId;
                                                                  FFAppState()
                                                                          .nonePackageModelName =
                                                                      FFAppState()
                                                                          .insuranceBasicModelName;
                                                                  FFAppState()
                                                                          .nonePackageModelCode =
                                                                      FFAppState()
                                                                          .insuranceBasicModelId;
                                                                  FFAppState()
                                                                          .nonePackageYear =
                                                                      FFAppState()
                                                                          .insuranceBasicYear;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeId =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeId;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeCode =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeCode;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeName =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeName;
                                                                  FFAppState()
                                                                          .nonePackageSearchModelList =
                                                                      FFAppState()
                                                                          .insuranceBasicModelNameList
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                  FFAppState()
                                                                          .nonePackageSearchModelIdList =
                                                                      FFAppState()
                                                                          .insuranceBasicModelIdList
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                  FFAppState()
                                                                          .nonePackageIsBrandSelect =
                                                                      FFAppState()
                                                                          .searchPackageCheckFilled
                                                                          .elementAtOrNull(
                                                                              1)!;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageOldVmiExpDate =
                                                                      FFAppState()
                                                                          .insuranceBasicOldVmiExpDate;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                      .nonePackageImageFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRoofUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageBlueBookUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther1 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther2 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther3 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther4 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther5 = '';
                                                                  FFAppState()
                                                                      .nonePackageIdCardImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageOldVmiImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageCompanyBookImageUrl = '';
                                                                  safeSetState(
                                                                      () {});

                                                                  context
                                                                      .pushNamed(
                                                                    NonePackageRenewPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'workType':
                                                                          serializeParam(
                                                                        'renew',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                text: 'ต่ออายุ',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 30.0,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFEFE2D8),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansThai(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFFDB771A),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .searchPackageSubProduct !=
                                                'MC') &&
                                            false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 4.0, 20.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .carSide,
                                                              color: Color(
                                                                  0xFF7A848E),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'งานนอกเรท',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (columnHideInAppContentRecord!
                                                                      .isShowContent) {}
                                                                  FFAppState()
                                                                          .nonePackageFlagCarrier =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageVehicleType =
                                                                      'กรุณาเลือกประเภทรถ';
                                                                  FFAppState()
                                                                          .nonePackageBrandName =
                                                                      'กรุณาเลือกยี่ห้อรถ';
                                                                  FFAppState()
                                                                      .nonePackageBrandId = '';
                                                                  FFAppState()
                                                                          .nonePackageModelName =
                                                                      'กรุณากรอกรุ่นรถ';
                                                                  FFAppState()
                                                                      .nonePackageModelCode = '';
                                                                  FFAppState()
                                                                          .nonePackageYear =
                                                                      'กรุณาเลือกปีจดทะเบียน';
                                                                  FFAppState()
                                                                      .nonePackageUsedTypeId = '';
                                                                  FFAppState()
                                                                      .nonePackageSearchModelList = [];
                                                                  FFAppState()
                                                                      .nonePackageUsedTypeCode = '';
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeName =
                                                                      'กรุณาเลือกลักษณะการใช้รถ';
                                                                  FFAppState()
                                                                          .nonePackageCusFullname =
                                                                      'กรุณากรอกชื่อ';
                                                                  FFAppState()
                                                                          .nonePackageCusPhone =
                                                                      'กรุณากรอกเบอร์โทรศัพท์';
                                                                  FFAppState()
                                                                      .nonePackagePlate = '';
                                                                  FFAppState()
                                                                          .nonePackageProvince =
                                                                      'กรุณาเลือกจังหวัดจดทะเบียน';
                                                                  FFAppState()
                                                                      .nonePackageProvinceId = '';
                                                                  FFAppState()
                                                                          .nonePackageSumInsured =
                                                                      'กรุณากรอกทุนประกัน';
                                                                  FFAppState()
                                                                          .nonePackageFlagAct =
                                                                      true;
                                                                  FFAppState()
                                                                          .nonePackageIsBrandSelect =
                                                                      false;
                                                                  FFAppState()
                                                                      .nonePackageSearchModelIdList = [];
                                                                  FFAppState()
                                                                          .nonePackageCarrierType =
                                                                      'กรุณาเลือกประเภทตู้เหล็ก';
                                                                  FFAppState()
                                                                          .nonePackageFlagCoop =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageTruckPart =
                                                                      'กรุณาเลือกส่วนของรถบรรทุก';
                                                                  FFAppState()
                                                                          .nonePackageCusMembership =
                                                                      'กรุณาเลือกประเภทลูกค้า';
                                                                  FFAppState()
                                                                          .nonePackageTruckCurrentPrice =
                                                                      'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                                                  FFAppState()
                                                                          .nonePackagePlateAdditional =
                                                                      'กรุณากรอกเลขทะเบียนหางพ่วง';
                                                                  FFAppState()
                                                                          .nonePackageTruckCarryPurpose =
                                                                      'กรุณากรอกรถใช้บรรทุกอะไร';
                                                                  FFAppState()
                                                                          .nonePackageTrailerSumInsured =
                                                                      'กรุณากรอกทุนประกันหางพ่วง';
                                                                  FFAppState()
                                                                      .nonePackageCarrierPrice = '';
                                                                  FFAppState()
                                                                      .nonePackageInsurerIdList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerCodeList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerShortNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerDisplayName = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerIdOutputList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerCodeOutputList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerShortNameOutputList = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerNameOutputList = [];
                                                                  FFAppState()
                                                                      .nonePackageReason = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerSelectedList = [];
                                                                  FFAppState()
                                                                      .nonePackageCoverTypeId = '';
                                                                  FFAppState()
                                                                      .nonePackageCoverTypeCode = '';
                                                                  FFAppState()
                                                                          .nonePackageCoverTypeName =
                                                                      'กรุณาเลือกประเภทชั้นประกัน';
                                                                  FFAppState()
                                                                      .nonePackageGarageTypeId = '';
                                                                  FFAppState()
                                                                          .nonePackageGarageTypeName =
                                                                      'กรุณาเลือกประเภทการซ่อม';
                                                                  FFAppState()
                                                                      .nonePackageGarageTypeCode = '';
                                                                  FFAppState()
                                                                          .nonePackageFlagRenew =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageOldVmiExpDate =
                                                                      'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                                                  FFAppState()
                                                                      .nonePackageOldVmi = '';
                                                                  FFAppState()
                                                                      .nonePackageOldVmiImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageIdCardImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageRenewImageUrlList = [];
                                                                  FFAppState()
                                                                      .nonePackageRenewImageCheckList = [];
                                                                  FFAppState()
                                                                          .nonePackageOldVmiImageUploadedCheck =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageIdCardWatermarkUploadedCheck =
                                                                      false;
                                                                  FFAppState()
                                                                          .buttonOrdinary =
                                                                      false;
                                                                  FFAppState()
                                                                          .buttonCorporation =
                                                                      false;
                                                                  FFAppState()
                                                                      .nonePackageCustomerType = '';
                                                                  FFAppState()
                                                                      .nonePackageInsurerDisplayNameOutput = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther = [];
                                                                  FFAppState()
                                                                      .nonePackageImageFront = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRightFront = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRight = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRightRear = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRear = [];
                                                                  FFAppState()
                                                                      .nonePackageImageLeftRear = [];
                                                                  FFAppState()
                                                                      .nonePackageImageLeft = [];
                                                                  FFAppState()
                                                                      .nonePackageImageLeftFront = [];
                                                                  FFAppState()
                                                                      .nonePackageImageRoof = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageFront = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightFront = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRight = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightRear = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRear = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftRear = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeft = [];
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftFront = [];
                                                                  FFAppState()
                                                                      .nonePackageInsurerOutputIndex = 0;
                                                                  FFAppState()
                                                                      .nonePackageLeadId = '';
                                                                  FFAppState()
                                                                      .nonePackageLeadNo = '';
                                                                  FFAppState()
                                                                      .nonePackageCarImageUploadedList = [];
                                                                  FFAppState()
                                                                      .nonePackageImageOldVmi = [];
                                                                  FFAppState()
                                                                      .nonePackageImageCompanyBook = [];
                                                                  FFAppState()
                                                                      .nonePackageImageIdCard = [];
                                                                  FFAppState()
                                                                      .nonePackageImageBlueBook = [];
                                                                  FFAppState()
                                                                          .nonePackageCompanyBookImageUploadedCheck =
                                                                      false;
                                                                  FFAppState()
                                                                      .nonePackageCompanyBookImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageImageFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRoofUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageBlueBookUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther1 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther2 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther3 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther4 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther5 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOtherNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageSelectedInsurerShortName = '';
                                                                  FFAppState()
                                                                      .nonePackageSelectedInsurerName = '';
                                                                  FFAppState()
                                                                      .nonePackageSelectedInsurerShortNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageSelectedInsurerNameList = [];
                                                                  FFAppState()
                                                                      .nonePackageFlagOldVmi = '';
                                                                  FFAppState()
                                                                      .nonePackageWorkType = '';
                                                                  FFAppState()
                                                                      .nonePackageRemark = '';
                                                                  FFAppState()
                                                                      .nonePackageBranchCode = '';
                                                                  FFAppState()
                                                                      .nonePackageBranchName = '';
                                                                  FFAppState()
                                                                      .nonePackageInsurerShortNameDupList = [];
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageFlagRenew =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageVehicleType =
                                                                      FFAppState()
                                                                          .insuranceVehicleTypeDropDown;
                                                                  FFAppState()
                                                                          .nonePackageBrandName =
                                                                      FFAppState()
                                                                          .insuranceBasicBrandName;
                                                                  FFAppState()
                                                                          .nonePackageBrandId =
                                                                      FFAppState()
                                                                          .insuranceBasicBrandId;
                                                                  FFAppState()
                                                                          .nonePackageModelName =
                                                                      FFAppState()
                                                                          .insuranceBasicModelName;
                                                                  FFAppState()
                                                                          .nonePackageModelCode =
                                                                      FFAppState()
                                                                          .insuranceBasicModelId;
                                                                  FFAppState()
                                                                          .nonePackageYear =
                                                                      FFAppState()
                                                                          .insuranceBasicYear;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeId =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeId;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeCode =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeCode;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeName =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeName;
                                                                  FFAppState()
                                                                          .nonePackageSearchModelList =
                                                                      FFAppState()
                                                                          .insuranceBasicModelNameList
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                  FFAppState()
                                                                          .nonePackageSearchModelIdList =
                                                                      FFAppState()
                                                                          .insuranceBasicModelIdList
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                  FFAppState()
                                                                          .nonePackageIsBrandSelect =
                                                                      FFAppState()
                                                                          .searchPackageCheckFilled
                                                                          .elementAtOrNull(
                                                                              1)!;
                                                                  FFAppState()
                                                                      .nonePackageOldVmiExpDate = '';
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageOldVmiExpDate =
                                                                      FFAppState()
                                                                          .insuranceBasicOldVmiExpDate;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                      .nonePackageImageFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRightRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageLeftFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageRoofUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRightRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftRearUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageTrailerImageLeftFrontUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageBlueBookUploaded = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther1 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther2 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther3 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther4 = '';
                                                                  FFAppState()
                                                                      .nonePackageImageOther5 = '';
                                                                  FFAppState()
                                                                      .nonePackageIdCardImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageOldVmiImageUrl = '';
                                                                  FFAppState()
                                                                      .nonePackageCompanyBookImageUrl = '';
                                                                  safeSetState(
                                                                      () {});

                                                                  context.pushNamed(
                                                                      SelectReasonPageWidget
                                                                          .routeName);
                                                                },
                                                                text: 'นอกเรท',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 30.0,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFD9D9D9),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansThai(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF090F13),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
