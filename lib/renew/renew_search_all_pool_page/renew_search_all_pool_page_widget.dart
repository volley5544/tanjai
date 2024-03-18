import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/blank_list_com_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'renew_search_all_pool_page_model.dart';
export 'renew_search_all_pool_page_model.dart';

class RenewSearchAllPoolPageWidget extends StatefulWidget {
  const RenewSearchAllPoolPageWidget({super.key});

  @override
  State<RenewSearchAllPoolPageWidget> createState() =>
      _RenewSearchAllPoolPageWidgetState();
}

class _RenewSearchAllPoolPageWidgetState
    extends State<RenewSearchAllPoolPageWidget> with TickerProviderStateMixin {
  late RenewSearchAllPoolPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RenewSearchAllPoolPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'renewSearchAllPoolPage'});
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
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.getBuildVersion = await actions.getBuildVersion1();
      _model.buildVersionQuery = await queryBuildVersionRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.adminVersionQuery = await queryAuthorizationRecordOnce(
        queryBuilder: (authorizationRecord) => authorizationRecord.where(
          'content_name',
          isEqualTo: 'skip_build_version',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (isAndroid) {
        if (!((_model.buildVersionQuery?.appVersion ==
                _model.getBuildVersion) ||
            _model.adminVersionQuery!.employeeIdList
                .contains(FFAppState().employeeID))) {
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
          await actions.terminateAppAction();
          return;
        }
      } else {
        if (!((_model.buildVersionQuery?.appVersionIos ==
                _model.getBuildVersion) ||
            _model.adminVersionQuery!.employeeIdList
                .contains(FFAppState().employeeID))) {
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
                ),
              );
            },
          );
          await actions.terminateAppAction();
          return;
        }
      }

      Navigator.pop(context);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: min(
          valueOrDefault<int>(
            FFAppState().profileLevel == 'HO' ? 2 : 0,
            0,
          ),
          2),
    )..addListener(() => setState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
            'ค้นหาต่ออายุประกันรถ',
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
          child: Column(
            children: [
              Align(
                alignment: Alignment(0.0, 0),
                child: TabBar(
                  labelColor: FlutterFlowTheme.of(context).primaryText,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Noto Sans Thai',
                        fontSize: 16.0,
                      ),
                  unselectedLabelStyle: TextStyle(),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  padding: EdgeInsets.all(4.0),
                  tabs: [
                    Tab(
                      text: 'ลูกค้าสาขา',
                    ),
                    Tab(
                      text: 'Pool กลาง',
                    ),
                    Tab(
                      text: 'ค้นหาลูกค้า',
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [() async {}, () async {}, () async {}][i]();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (FFAppState().profileLevel != 'HO')
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 20.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1,
                                                focusNode:
                                                    _model.textFieldFocusNode1,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintText:
                                                      '    ค้นหาข้อมูล ...',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 10.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .textController1Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter2 ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(
                                                    RenewBranchListCall.call(
                                                  insuranceUrl: FFAppState()
                                                      .apiUrlInsuranceAppState,
                                                  token:
                                                      FFAppState().accessToken,
                                                  level:
                                                      FFAppState().profileLevel,
                                                  branchCode:
                                                      FFAppState().branchCode,
                                                )))
                                          .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final listViewRenewBranchListResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final poolList =
                                                RenewBranchListCall.datajson(
                                                      listViewRenewBranchListResponse
                                                          .jsonBody,
                                                    )?.toList() ??
                                                    [];
                                            if (poolList.isEmpty) {
                                              return Center(
                                                child: BlankListComWidget(),
                                              );
                                            }
                                            return RefreshIndicator(
                                              onRefresh: () async {
                                                setState(() => _model
                                                        .apiRequestCompleter2 =
                                                    null);
                                                await _model
                                                    .waitForApiRequestCompleted2();
                                              },
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: poolList.length,
                                                itemBuilder:
                                                    (context, poolListIndex) {
                                                  final poolListItem =
                                                      poolList[poolListIndex];
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  5.0,
                                                                  5.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                                      String>(
                                                                    RenewBranchListCall
                                                                        .callstatusflg(
                                                                      listViewRenewBranchListResponse
                                                                          .jsonBody,
                                                                    )?[poolListIndex],
                                                                    '-',
                                                                  ) ==
                                                                  '1'
                                                              ? Color(
                                                                  0xFFE9FFEA)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.8,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 7,
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    'ชื่อลูกค้า',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  width: 10.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    ':',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 8,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      RenewBranchListCall.titleth(
                                                                                        listViewRenewBranchListResponse.jsonBody,
                                                                                      )?[poolListIndex],
                                                                                      '-',
                                                                                    )}${valueOrDefault<String>(
                                                                                      RenewBranchListCall.firstnameth(
                                                                                        listViewRenewBranchListResponse.jsonBody,
                                                                                      )?[poolListIndex],
                                                                                      '-',
                                                                                    )} ${valueOrDefault<String>(
                                                                                      RenewBranchListCall.lastnameth(
                                                                                        listViewRenewBranchListResponse.jsonBody,
                                                                                      )?[poolListIndex],
                                                                                      '-',
                                                                                    )}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 7,
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    'ทะเบียนรถ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  width: 10.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    ':',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 8,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      RenewBranchListCall.carregistration(
                                                                                        listViewRenewBranchListResponse.jsonBody,
                                                                                      )?[poolListIndex],
                                                                                      '-',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 7,
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    'ยี่ห้อ/รุ่น',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  width: 10.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    ':',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 8,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      RenewBranchListCall.brandname(
                                                                                        listViewRenewBranchListResponse.jsonBody,
                                                                                      )?[poolListIndex],
                                                                                      '-',
                                                                                    )}/${valueOrDefault<String>(
                                                                                      RenewBranchListCall.modelname(
                                                                                        listViewRenewBranchListResponse.jsonBody,
                                                                                      )?[poolListIndex],
                                                                                      '-',
                                                                                    )}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 7,
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    'ชั้นประกัน',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  width: 10.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    ':',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 8,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      RenewBranchListCall.oldcovertypecode(
                                                                                        listViewRenewBranchListResponse.jsonBody,
                                                                                      )?[poolListIndex],
                                                                                      '-',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 7,
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    'ประเภทการซ่อม',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  width: 10.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    ':',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 8,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      RenewBranchListCall.oldgaragetypename(
                                                                                        listViewRenewBranchListResponse.jsonBody,
                                                                                      )?[poolListIndex],
                                                                                      '-',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 7,
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: AutoSizeText(
                                                                                    'วันหมดอายุประกันเดิม',
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  width: 10.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    ':',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 8,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      functions.showDateBE(valueOrDefault<String>(
                                                                                        RenewBranchListCall.oldexpirydate(
                                                                                          listViewRenewBranchListResponse.jsonBody,
                                                                                        )?[poolListIndex],
                                                                                        '-',
                                                                                      )),
                                                                                      '-',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 7,
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    'สถานะ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  width: 10.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    ':',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 8,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                              RenewBranchListCall.insurerstatus(
                                                                                                listViewRenewBranchListResponse.jsonBody,
                                                                                              )?[poolListIndex],
                                                                                              '-',
                                                                                            ) ==
                                                                                            'SUCCESS'
                                                                                        ? 'อนุมัติ'
                                                                                        : 'ปฏิเสธ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          if (functions.checkPhoneNumberChar(RenewBranchListCall.mobile1(
                                                                                listViewRenewBranchListResponse.jsonBody,
                                                                              )?[poolListIndex]) &&
                                                                              (valueOrDefault<String>(
                                                                                    RenewBranchListCall.saverenewstatus(
                                                                                      listViewRenewBranchListResponse.jsonBody,
                                                                                    )?[poolListIndex],
                                                                                    '-',
                                                                                  ) !=
                                                                                  'ตกลงทำประกัน') &&
                                                                              (valueOrDefault<String>(
                                                                                    RenewBranchListCall.insurerstatus(
                                                                                      listViewRenewBranchListResponse.jsonBody,
                                                                                    )?[poolListIndex],
                                                                                    '-',
                                                                                  ) ==
                                                                                  'SUCCESS'))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  borderRadius: BorderRadius.circular(60.0),
                                                                                  border: Border.all(
                                                                                    color: Colors.black,
                                                                                  ),
                                                                                ),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                content: Text('คุณต้องการจะโทรออกหรือไม่?'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                    child: Text('ยกเลิก'),
                                                                                                  ),
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                    child: Text('โทร'),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (!confirmDialogResponse) {
                                                                                      return;
                                                                                    }
                                                                                    showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return WebViewAware(
                                                                                          child: GestureDetector(
                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
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

                                                                                    if (!functions.checkPhoneNumberChar(RenewBranchListCall.mobile1(
                                                                                      listViewRenewBranchListResponse.jsonBody,
                                                                                    )?[poolListIndex])) {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text('เบอร์โทรไม่ถูกต้อง'),
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
                                                                                    Navigator.pop(context);
                                                                                    await actions.open3CXAction(
                                                                                      RenewBranchListCall.mobile1(
                                                                                        listViewRenewBranchListResponse.jsonBody,
                                                                                      )?[poolListIndex],
                                                                                    );
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.phone_in_talk_outlined,
                                                                                    color: Color(0xFFD9761A),
                                                                                    size: 24.0,
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          15.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'renewDetailPage',
                                                                            queryParameters:
                                                                                {
                                                                              'refRenewId': serializeParam(
                                                                                valueOrDefault<String>(
                                                                                  RenewBranchListCall.refrenewid(
                                                                                    listViewRenewBranchListResponse.jsonBody,
                                                                                  )?[poolListIndex],
                                                                                  '-',
                                                                                ),
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        text:
                                                                            'รายละเอียด',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              110.0,
                                                                          height:
                                                                              35.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              Color(0xFFD9761A),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Noto Sans Thai',
                                                                                color: Colors.white,
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            width:
                                                                                0.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'renewSaveHistory',
                                                                          queryParameters:
                                                                              {
                                                                            'title':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.titleth(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'name':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.firstnameth(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'lastname':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.lastnameth(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'brand':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.brandname(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'model':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.modelname(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'covertype':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.covertypecode(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'garagetype':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.garagetypename(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'expDate':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.oldexpirydate(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'status':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.insurerstatus(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'refRenewId':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.refrenewid(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'carregis':
                                                                                serializeParam(
                                                                              valueOrDefault<String>(
                                                                                RenewBranchListCall.carregistration(
                                                                                  listViewRenewBranchListResponse.jsonBody,
                                                                                )?[poolListIndex],
                                                                                '-',
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      text:
                                                                          'บันทึกการโทร',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            115.0,
                                                                        height:
                                                                            35.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0xFF089B70),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: Colors.white,
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(14.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          15.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'renewHistory',
                                                                            queryParameters:
                                                                                {
                                                                              'refRenewId': serializeParam(
                                                                                valueOrDefault<String>(
                                                                                  RenewBranchListCall.refrenewid(
                                                                                    listViewRenewBranchListResponse.jsonBody,
                                                                                  )?[poolListIndex],
                                                                                  '-',
                                                                                ),
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        text:
                                                                            'ประวัติ',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              110.0,
                                                                          height:
                                                                              35.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              Color(0xFF004984),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Noto Sans Thai',
                                                                                color: Colors.white,
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            width:
                                                                                0.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (FFAppState().profileLevel == 'HO')
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไม่พบข้อมูล',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 24.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (FFAppState().profileLevel != 'HO')
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 20.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
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
                                              'ค้นหารายการต่ออายุ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        setState(() => _model
                                            .poolAllListviewPagingController
                                            ?.refresh());
                                        await _model
                                            .waitForOnePageForPoolAllListview();
                                      },
                                      child: PagedListView<ApiPagingParams,
                                          dynamic>(
                                        pagingController:
                                            _model.setPoolAllListviewController(
                                          (nextPageMarker) =>
                                              RenewPoolListCall.call(
                                            insuranceUrl: FFAppState()
                                                .apiUrlInsuranceAppState,
                                            token: FFAppState().accessToken,
                                            level: FFAppState().profileLevel,
                                            branchCode:
                                                FFAppState().profileBranch,
                                            page:
                                                (nextPageMarker.nextPageNumber +
                                                        1)
                                                    .toString(),
                                            perPage: '2',
                                          ),
                                        ),
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<dynamic>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          noItemsFoundIndicatorBuilder: (_) =>
                                              Center(
                                            child: BlankListComWidget(),
                                          ),
                                          itemBuilder:
                                              (context, _, listItemIndex) {
                                            final listItemItem = _model
                                                .poolAllListviewPagingController!
                                                .itemList![listItemIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 5.0, 5.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: '1' ==
                                                            getJsonField(
                                                              listItemItem,
                                                              r'''$.call_status_flg''',
                                                            )
                                                        ? Color(0xFFE9FFEA)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.8,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ชื่อลูกค้า',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              '${getJsonField(
                                                                                listItemItem,
                                                                                r'''$.title_th''',
                                                                              ).toString()} ${getJsonField(
                                                                                listItemItem,
                                                                                r'''$.first_name_th''',
                                                                              ).toString()} ${getJsonField(
                                                                                listItemItem,
                                                                                r'''$.last_name_th''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ทะเบียนรถ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              '${getJsonField(
                                                                                listItemItem,
                                                                                r'''$.car_registration''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ยี่ห้อ/รุ่น',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              '${getJsonField(
                                                                                listItemItem,
                                                                                r'''$.brand_name''',
                                                                              ).toString()}/${getJsonField(
                                                                                listItemItem,
                                                                                r'''$.model_name''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ชั้นประกัน',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  listItemItem,
                                                                                  r'''$.old_cover_type_code''',
                                                                                )?.toString(),
                                                                                'ชั้น',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ประเภทการซ่อม',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  listItemItem,
                                                                                  r'''$.old_garage_type_name''',
                                                                                )?.toString(),
                                                                                'การซ่อม',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'วันหมดอายุประกันเดิม',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                functions.showDateBE(getJsonField(
                                                                                  listItemItem,
                                                                                  r'''$.old_expiry_date''',
                                                                                ).toString()),
                                                                                '-',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'สถานะ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'SUCCESS' ==
                                                                                      getJsonField(
                                                                                        listItemItem,
                                                                                        r'''$.insurer_status''',
                                                                                      )
                                                                                  ? 'อนุมัติ'
                                                                                  : 'ปฏิเสธ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (functions
                                                                            .checkPhoneNumberChar(getJsonField(
                                                                          listItemItem,
                                                                          r'''$.mobile1''',
                                                                        ).toString()) &&
                                                                        ('${getJsonField(
                                                                              listItemItem,
                                                                              r'''$.save_renew_status''',
                                                                            ).toString()}' !=
                                                                            'ตกลงทำประกัน') &&
                                                                        ('${getJsonField(
                                                                              listItemItem,
                                                                              r'''$.insurer_status''',
                                                                            ).toString()}' ==
                                                                            'SUCCESS'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(60.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                        child: AlertDialog(
                                                                                          content: Text('คุณต้องการจะโทรออกหรือไม่?'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('ยกเลิก'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('โทร'),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (!confirmDialogResponse) {
                                                                                return;
                                                                              }
                                                                              showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
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

                                                                              if (!functions.checkPhoneNumberChar(getJsonField(
                                                                                listItemItem,
                                                                                r'''$.mobile1''',
                                                                              ).toString())) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text('เบอร์โทรไม่ถูกต้อง'),
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
                                                                              Navigator.pop(context);
                                                                              await actions.open3CXAction(
                                                                                getJsonField(
                                                                                  listItemItem,
                                                                                  r'''$.mobile1''',
                                                                                ).toString(),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.phone_in_talk_outlined,
                                                                              color: Color(0xFFD9761A),
                                                                              size: 24.0,
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        15.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'renewDetailPage',
                                                                      queryParameters:
                                                                          {
                                                                        'refRenewId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listItemItem,
                                                                            r'''$.ref_renew_id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  text:
                                                                      'รายละเอียด',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        110.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0xFFD9761A),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'renewSaveHistory',
                                                                    queryParameters:
                                                                        {
                                                                      'title':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listItemItem,
                                                                          r'''$.title_th''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'name':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listItemItem,
                                                                          r'''$.first_name_th''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'lastname':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listItemItem,
                                                                          r'''$.last_name_th''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'brand':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listItemItem,
                                                                          r'''$.brand_name''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'model':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listItemItem,
                                                                          r'''$.model_name''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'covertype':
                                                                          serializeParam(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            listItemItem,
                                                                            r'''$.old_cover_type_code''',
                                                                          )?.toString(),
                                                                          'ชั้น',
                                                                        ),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'garagetype':
                                                                          serializeParam(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            listItemItem,
                                                                            r'''$.old_garage_type_name''',
                                                                          )?.toString(),
                                                                          'การซ่อม',
                                                                        ),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'expDate':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listItemItem,
                                                                          r'''$.old_expiry_date''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'status':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listItemItem,
                                                                          r'''$.insurer_status''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'refRenewId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listItemItem,
                                                                          r'''$.ref_renew_id''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'carregis':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listItemItem,
                                                                          r'''$.car_registration''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                text:
                                                                    'บันทึกการโทร',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 115.0,
                                                                  height: 35.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF089B70),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
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
                                                                              14.0),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        15.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'renewHistory',
                                                                      queryParameters:
                                                                          {
                                                                        'refRenewId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listItemItem,
                                                                            r'''$.ref_renew_id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  text:
                                                                      'ประวัติ',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        110.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0xFF004984),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (FFAppState().profileLevel == 'HO')
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไม่พบข้อมูล',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 24.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayIcon,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (false)
                                  Expanded(
                                    flex: 2,
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??= '',
                                      ),
                                      options: List<String>.from([
                                        'first_name_th',
                                        'last_name_th',
                                        'mobile1',
                                        'car_registration'
                                      ]),
                                      optionLabels: [
                                        'ชื่อ',
                                        'นามสกุล',
                                        'เบอร์โทร',
                                        'ทะเบียนรถ'
                                      ],
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue = val),
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'เลือก',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderWidth: 1.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode2,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText:
                                            '    ค้นหาด้วยเลขบัตรประชาชน...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 10.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      maxLength: 13,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      if (!(_model.textController2.text !=
                                              null &&
                                          _model.textController2.text != '')) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'กรุณากรอกเลขบัตรประชาชน'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
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
                                      if (!functions.checkIdCard(
                                          _model.textController2.text)!) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'กรุณากรอกรหัสบัตรประชาชน 13 หลัก'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
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
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: LoadingSceneWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      _model.checkRenewAPIOutput =
                                          await RenewCheckRenewCall.call(
                                        insuranceUrl: FFAppState()
                                            .apiUrlInsuranceAppState,
                                        token: FFAppState().accessToken,
                                        nationalThaiId:
                                            _model.textController2.text,
                                      );
                                      _shouldSetState = true;
                                      if ((_model.checkRenewAPIOutput
                                                  ?.statusCode ??
                                              200) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาด (${(_model.checkRenewAPIOutput?.statusCode ?? 200).toString()})'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        Navigator.pop(context);
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                      if (RenewCheckRenewCall.statuslayer1(
                                            (_model.checkRenewAPIOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    '${RenewCheckRenewCall.messageLayer1(
                                                  (_model.checkRenewAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        Navigator.pop(context);
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                    },
                                    child: Icon(
                                      Icons.search_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (((_model.checkRenewAPIOutput?.statusCode ?? 200) ==
                                200) &&
                            (RenewCheckRenewCall.statuslayer1(
                                  (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                ) ==
                                200))
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final poolList = RenewCheckRenewCall.datajson(
                                        (_model.checkRenewAPIOutput?.jsonBody ??
                                            ''),
                                      )?.toList() ??
                                      [];
                                  if (poolList.isEmpty) {
                                    return Center(
                                      child: BlankListComWidget(),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: poolList.length,
                                    itemBuilder: (context, poolListIndex) {
                                      final poolListItem =
                                          poolList[poolListIndex];
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: (RenewCheckRenewCall
                                                          .callstatusflg(
                                                        (_model.checkRenewAPIOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?[poolListIndex]) ==
                                                      '1'
                                                  ? Color(0xFFE9FFEA)
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.8,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ชื่อลูกค้า',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              '${RenewCheckRenewCall.titleth(
                                                                                (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                              )?[poolListIndex]}${RenewCheckRenewCall.firstnameth(
                                                                                (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                              )?[poolListIndex]}  ${RenewCheckRenewCall.lastnameth(
                                                                                (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                              )?[poolListIndex]}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ทะเบียนรถ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              RenewCheckRenewCall.carregistration(
                                                                                (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                              )![poolListIndex],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ยี่ห้อ/รุ่น',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              '${RenewCheckRenewCall.brandname(
                                                                                (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                              )?[poolListIndex]}/${RenewCheckRenewCall.modelname(
                                                                                (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                              )?[poolListIndex]}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ชั้นประกัน',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              RenewCheckRenewCall.oldcovertypecode(
                                                                                (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                              )![poolListIndex],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'ประเภทการซ่อม',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              RenewCheckRenewCall.oldgaragetypename(
                                                                                (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                              )![poolListIndex],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'วันหมดอายุประกันเดิม',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                functions.showDateBE(RenewCheckRenewCall.oldexpirydate(
                                                                                  (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                                )?[poolListIndex]),
                                                                                '-',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              7,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              'สถานะ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                10.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              8,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              (RenewCheckRenewCall.insurerstatus(
                                                                                        (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                                      )?[poolListIndex]) ==
                                                                                      'SUCCESS'
                                                                                  ? 'อนุมัติ'
                                                                                  : 'ปฏิเสธ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (functions
                                                                            .checkPhoneNumberChar(RenewCheckRenewCall.mobile1(
                                                                          (_model.checkRenewAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?[poolListIndex]) &&
                                                                        ((RenewCheckRenewCall.saverenewstatus(
                                                                              (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                            )?[poolListIndex]) !=
                                                                            'ตกลงทำประกัน') &&
                                                                        ((RenewCheckRenewCall.insurerstatus(
                                                                              (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                            )?[poolListIndex]) ==
                                                                            'SUCCESS'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(60.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                        child: AlertDialog(
                                                                                          content: Text('คุณต้องการจะโทรออกหรือไม่?'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('ยกเลิก'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('โทร'),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (!confirmDialogResponse) {
                                                                                return;
                                                                              }
                                                                              showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
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

                                                                              if (!functions.checkPhoneNumberChar(RenewCheckRenewCall.mobile1(
                                                                                (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                              )?[poolListIndex])) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text('เบอร์โทรไม่ถูกต้อง'),
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
                                                                              Navigator.pop(context);
                                                                              await actions.open3CXAction(
                                                                                RenewCheckRenewCall.mobile1(
                                                                                  (_model.checkRenewAPIOutput?.jsonBody ?? ''),
                                                                                )?[poolListIndex],
                                                                              );
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.phone_in_talk_outlined,
                                                                              color: Color(0xFFD9761A),
                                                                              size: 24.0,
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
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      15.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                'renewDetailPage',
                                                                queryParameters:
                                                                    {
                                                                  'refRenewId':
                                                                      serializeParam(
                                                                    RenewCheckRenewCall
                                                                        .refrenewid(
                                                                      (_model.checkRenewAPIOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )?[poolListIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            text: 'รายละเอียด',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 110.0,
                                                              height: 35.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFFD9761A),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              'renewSaveHistory',
                                                              queryParameters: {
                                                                'title':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .titleth(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'name':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .firstnameth(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'lastname':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .lastnameth(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'brand':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .brandname(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'model':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .modelname(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'covertype':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .covertypecode(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'garagetype':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .garagetypename(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'expDate':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .oldexpirydate(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'status':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .insurerstatus(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'refRenewId':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .refrenewid(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'carregis':
                                                                    serializeParam(
                                                                  RenewCheckRenewCall
                                                                      .carregistration(
                                                                    (_model.checkRenewAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?[poolListIndex],
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          text: 'บันทึกการโทร',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 115.0,
                                                            height: 35.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xFF089B70),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      15.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                'renewHistory',
                                                                queryParameters:
                                                                    {
                                                                  'refRenewId':
                                                                      serializeParam(
                                                                    RenewCheckRenewCall
                                                                        .refrenewid(
                                                                      (_model.checkRenewAPIOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )?[poolListIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            text: 'ประวัติ',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 110.0,
                                                              height: 35.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFF004984),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        if (true ||
                            (((_model.checkRenewAPIOutput?.statusCode ?? 200) ==
                                    200) &&
                                (RenewCheckRenewCall.statuslayer1(
                                      (_model.checkRenewAPIOutput?.jsonBody ??
                                          ''),
                                    ) ==
                                    404)))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 12.0, 20.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.carSide,
                                              color: Color(0xB0FF9936),
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          45.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'งานต่ออายุ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(() {
                                            FFAppState()
                                                .nonePackageFlagCarrier = false;
                                            FFAppState()
                                                    .nonePackageVehicleType =
                                                'กรุณาเลือกประเภทรถ';
                                            FFAppState().nonePackageBrandName =
                                                'กรุณาเลือกยี่ห้อรถ';
                                            FFAppState().nonePackageBrandId =
                                                '';
                                            FFAppState().nonePackageModelName =
                                                'กรุณากรอกรุ่นรถ';
                                            FFAppState().nonePackageModelCode =
                                                '';
                                            FFAppState().nonePackageYear =
                                                'กรุณาเลือกปีจดทะเบียน';
                                            FFAppState().nonePackageUsedTypeId =
                                                '';
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
                                            FFAppState().nonePackageCusPhone =
                                                'กรุณากรอกเบอร์โทรศัพท์';
                                            FFAppState().nonePackagePlate = '';
                                            FFAppState().nonePackageProvince =
                                                'กรุณาเลือกจังหวัดจดทะเบียน';
                                            FFAppState().nonePackageProvinceId =
                                                '';
                                            FFAppState().nonePackageSumInsured =
                                                'กรุณากรอกทุนประกัน';
                                            FFAppState().nonePackageFlagAct =
                                                true;
                                            FFAppState()
                                                    .nonePackageIsBrandSelect =
                                                false;
                                            FFAppState()
                                                .nonePackageSearchModelIdList = [];
                                            FFAppState()
                                                    .nonePackageCarrierType =
                                                'กรุณาเลือกประเภทตู้เหล็ก';
                                            FFAppState().nonePackageFlagCoop =
                                                false;
                                            FFAppState().nonePackageTruckPart =
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
                                            FFAppState().nonePackageReason = [];
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
                                            FFAppState().nonePackageFlagRenew =
                                                false;
                                            FFAppState()
                                                    .nonePackageOldVmiExpDate =
                                                'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                            FFAppState().nonePackageOldVmi = '';
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
                                            FFAppState().buttonOrdinary = false;
                                            FFAppState().buttonCorporation =
                                                false;
                                            FFAppState()
                                                .nonePackageCustomerType = '';
                                            FFAppState()
                                                .nonePackageInsurerDisplayNameOutput = '';
                                            FFAppState().nonePackageImageOther =
                                                [];
                                            FFAppState().nonePackageImageFront =
                                                [];
                                            FFAppState()
                                                .nonePackageImageRightFront = [];
                                            FFAppState().nonePackageImageRight =
                                                [];
                                            FFAppState()
                                                .nonePackageImageRightRear = [];
                                            FFAppState().nonePackageImageRear =
                                                [];
                                            FFAppState()
                                                .nonePackageImageLeftRear = [];
                                            FFAppState().nonePackageImageLeft =
                                                [];
                                            FFAppState()
                                                .nonePackageImageLeftFront = [];
                                            FFAppState().nonePackageImageRoof =
                                                [];
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
                                            FFAppState().nonePackageLeadId = '';
                                            FFAppState().nonePackageLeadNo = '';
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
                                            FFAppState().nonePackageFlagOldVmi =
                                                '';
                                            FFAppState().nonePackageWorkType =
                                                '';
                                            FFAppState().nonePackageRemark = '';
                                            FFAppState().nonePackageBranchCode =
                                                '';
                                            FFAppState().nonePackageBranchName =
                                                '';
                                            FFAppState()
                                                .nonePackageInsurerShortNameDupList = [];
                                          });
                                          setState(() {
                                            FFAppState().nonePackageFlagRenew =
                                                true;
                                            FFAppState()
                                                    .nonePackageOldVmiImageUploadedCheck =
                                                false;
                                            FFAppState()
                                                    .nonePackageIdCardWatermarkUploadedCheck =
                                                false;
                                          });
                                          setState(() {
                                            FFAppState()
                                                .nonePackageVehicleType = FFAppState()
                                                    .searchPackageCheckFilled
                                                    .first
                                                ? FFAppState()
                                                    .insuranceVehicleTypeDropDown
                                                : FFAppState()
                                                    .nonePackageVehicleType;
                                            FFAppState()
                                                .nonePackageBrandName = FFAppState()
                                                    .searchPackageCheckFilled[1]
                                                ? FFAppState()
                                                    .insuranceBasicBrandName
                                                : FFAppState()
                                                    .nonePackageBrandName;
                                            FFAppState()
                                                .nonePackageBrandId = FFAppState()
                                                    .searchPackageCheckFilled[1]
                                                ? FFAppState()
                                                    .insuranceBasicBrandId
                                                : FFAppState()
                                                    .nonePackageBrandId;
                                            FFAppState()
                                                .nonePackageModelName = FFAppState()
                                                    .searchPackageCheckFilled[2]
                                                ? FFAppState()
                                                    .insuranceBasicModelName
                                                : FFAppState()
                                                    .nonePackageModelName;
                                            FFAppState()
                                                .nonePackageModelCode = FFAppState()
                                                    .searchPackageCheckFilled[2]
                                                ? FFAppState()
                                                    .insuranceBasicModelId
                                                : FFAppState()
                                                    .nonePackageModelCode;
                                            FFAppState()
                                                .nonePackageYear = FFAppState()
                                                    .searchPackageCheckFilled[3]
                                                ? FFAppState()
                                                    .insuranceBasicYear
                                                : FFAppState().nonePackageYear;
                                            FFAppState()
                                                .nonePackageUsedTypeId = FFAppState()
                                                    .searchPackageCheckFilled[4]
                                                ? FFAppState()
                                                    .insuranceBasicVehicleUsedTypeId
                                                : FFAppState()
                                                    .nonePackageUsedTypeId;
                                            FFAppState()
                                                .nonePackageUsedTypeCode = FFAppState()
                                                    .searchPackageCheckFilled[4]
                                                ? FFAppState()
                                                    .insuranceBasicVehicleUsedTypeCode
                                                : FFAppState()
                                                    .nonePackageUsedTypeCode;
                                            FFAppState()
                                                .nonePackageUsedTypeName = FFAppState()
                                                    .searchPackageCheckFilled[4]
                                                ? FFAppState()
                                                    .insuranceBasicVehicleUsedTypeName
                                                : FFAppState()
                                                    .nonePackageUsedTypeName;
                                            FFAppState()
                                                    .nonePackageIsBrandSelect =
                                                FFAppState()
                                                    .searchPackageCheckFilled[1];
                                            FFAppState()
                                                .nonePackageSearchModelList = FFAppState()
                                                    .searchPackageCheckFilled[1]
                                                ? FFAppState()
                                                    .insuranceBasicModelNameList
                                                : FFAppState()
                                                    .nonePackageSearchModelList
                                                    .toList()
                                                    .cast<String>();
                                            FFAppState()
                                                .nonePackageSearchModelIdList = FFAppState()
                                                    .searchPackageCheckFilled[1]
                                                ? FFAppState()
                                                    .insuranceBasicModelIdList
                                                : FFAppState()
                                                    .nonePackageSearchModelIdList
                                                    .toList()
                                                    .cast<String>();
                                          });
                                          setState(() {
                                            FFAppState()
                                                    .nonePackageOldVmiExpDate =
                                                FFAppState()
                                                    .insuranceBasicOldVmiExpDate;
                                          });
                                          setState(() {
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
                                          });

                                          context.pushNamed(
                                            'NonePackageRenewPage',
                                            queryParameters: {
                                              'workType': serializeParam(
                                                'renew',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'ต่ออายุ',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFEFE2D8),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFDB771A),
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
