import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/custom_dialog_component_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import '/pages/super_app/components/make_insurance_type_color/make_insurance_type_color_widget.dart';
import '/pages/super_app/components/none_package_show_status_component/none_package_show_status_component_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'make_fire_insurance_list_page_model.dart';
export 'make_fire_insurance_list_page_model.dart';

class MakeFireInsuranceListPageWidget extends StatefulWidget {
  const MakeFireInsuranceListPageWidget({
    super.key,
    int? checkTotal,
    required this.list,
    required this.checkPayment,
    String? checkVMI,
    this.fromPage,
    this.type,
  })  : this.checkTotal = checkTotal ?? 0,
        this.checkVMI = checkVMI ?? '3';

  final int checkTotal;
  final List<dynamic>? list;
  final String? checkPayment;
  final String checkVMI;
  final String? fromPage;
  final String? type;

  static String routeName = 'MakeFireInsuranceListPage';
  static String routePath = 'MakeFireInsuranceListPage';

  @override
  State<MakeFireInsuranceListPageWidget> createState() =>
      _MakeFireInsuranceListPageWidgetState();
}

class _MakeFireInsuranceListPageWidgetState
    extends State<MakeFireInsuranceListPageWidget>
    with TickerProviderStateMixin {
  late MakeFireInsuranceListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MakeFireInsuranceListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MakeFireInsuranceListPage'});
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

      _model.getBuildVersion = await actions.getBuildVersion1();
      _model.deviceBuildNumber = await actions.getBuildNumber();
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
        if (!((_model.buildVersionQuery!.buildNumberAndroid <=
                _model.deviceBuildNumber!) ||
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
        if (!((_model.buildVersionQuery!.buildNumberIos <=
                _model.deviceBuildNumber!) ||
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

      FFAppState().searchQuotationStatus = '0';
      FFAppState().jsonTemp = null;
      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.searchFirstnameTextController ??= TextEditingController();
    _model.searchFirstnameFocusNode ??= FocusNode();

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

    return FutureBuilder<List<UrlLinkStorageRecord>>(
      future: queryUrlLinkStorageRecordOnce(
        queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where(
          'url_name',
          isEqualTo: 'insurance_request_api_url',
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UrlLinkStorageRecord>
            makeFireInsuranceListPageUrlLinkStorageRecordList = snapshot.data!;
        final makeFireInsuranceListPageUrlLinkStorageRecord =
            makeFireInsuranceListPageUrlLinkStorageRecordList.isNotEmpty
                ? makeFireInsuranceListPageUrlLinkStorageRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 48.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFFD9761A),
                    size: 30.0,
                  ),
                  onPressed: () async {
                    if (widget!.checkVMI != '0') {
                      context.goNamed(SuperAppPageWidget.routeName);

                      return;
                    }
                    context.safePop();
                  },
                ),
                title: Text(
                  widget!.checkVMI == '0'
                      ? 'รายการ'
                      : 'รายการกรมธรรม์เดือนปัจจุบัน',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        font: GoogleFonts.notoSansThai(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                        color: Color(0xFF003063),
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                ),
                actions: [
                  Visibility(
                    visible: widget!.checkPayment == '1',
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: Color(0xFFDB771A),
                          size: 30.0,
                        ),
                        onPressed: () async {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            isDismissible: false,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.7,
                                      child: MakeInsuranceTypeColorWidget(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                  ),
                ],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 12.0, 5.0),
                                child: Text(
                                  'ค้นหาชื่อลูกค้า',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              if (widget!.checkPayment == '1')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.calendar_month_sharp,
                                      color: Color(0xFFDB771A),
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        isDismissible: false,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.7,
                                                  child:
                                                      MakeInsuranceTypeColorWidget(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 0.1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.search,
                                            color: Color(0xFF878787),
                                            size: 24.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.5, 8.0, 0.5),
                                              child: TextFormField(
                                                controller: _model
                                                    .searchFirstnameTextController,
                                                focusNode: _model
                                                    .searchFirstnameFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.searchFirstnameTextController',
                                                  Duration(milliseconds: 100),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .notoSansThai(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                  hintText: 'ค้นหาชื่อลูกค้า',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .notoSansThai(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  suffixIcon: _model
                                                          .searchFirstnameTextController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .searchFirstnameTextController
                                                                ?.clear();
                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            size: 22,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansThai(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                validator: _model
                                                    .searchFirstnameTextControllerValidator
                                                    .asValidator(context),
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
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget!.checkTotal != 0 ? true : false)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final leadListItem =
                                          widget!.list!.toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          50.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: leadListItem.length,
                                        itemBuilder:
                                            (context, leadListItemIndex) {
                                          final leadListItemItem =
                                              leadListItem[leadListItemIndex];
                                          return Visibility(
                                            visible: (_model
                                                        .searchFirstnameTextController
                                                        .text ==
                                                    '') ||
                                                functions
                                                    .containWordinStringUrl(
                                                        _model
                                                            .searchFirstnameTextController
                                                            .text,
                                                        getJsonField(
                                                          leadListItemItem,
                                                          r'''$..first_name''',
                                                        ).toString())! ||
                                                functions
                                                    .containWordinStringUrl(
                                                        _model
                                                            .searchFirstnameTextController
                                                            .text,
                                                        getJsonField(
                                                          leadListItemItem,
                                                          r'''$..last_name''',
                                                        ).toString())!,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
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
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
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
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          child:
                                                                              Image.network(
                                                                            getCORSProxyUrl(
                                                                              ('${getJsonField(
                                                                                            leadListItemItem,
                                                                                            r'''$.app_detail_house[:].image''',
                                                                                          ).toString()}' !=
                                                                                          '') &&
                                                                                      ('${getJsonField(
                                                                                            leadListItemItem,
                                                                                            r'''$.app_detail_house[:].image''',
                                                                                          ).toString()}' !=
                                                                                          'null')
                                                                                  ? getJsonField(
                                                                                      leadListItemItem,
                                                                                      r'''$.app_detail_house[:].image''',
                                                                                    ).toString()
                                                                                  : getJsonField(
                                                                                      leadListItemItem,
                                                                                      r'''$.leads_detail_house[:].image''',
                                                                                    ).toString(),
                                                                            ),
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.png',
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        widget!.checkVMI ==
                                                                                '0'
                                                                            ? (('${getJsonField(
                                                                                          leadListItemItem,
                                                                                          r'''$.app_detail_house[:].insurer_name''',
                                                                                        ).toString()}' !=
                                                                                        '') &&
                                                                                    ('${getJsonField(
                                                                                          leadListItemItem,
                                                                                          r'''$.app_detail_house[:].insurer_name''',
                                                                                        ).toString()}' !=
                                                                                        'null')
                                                                                ? getJsonField(
                                                                                    leadListItemItem,
                                                                                    r'''$.app_detail_house[:].insurer_name''',
                                                                                  ).toString()
                                                                                : getJsonField(
                                                                                    leadListItemItem,
                                                                                    r'''$.leads_detail_house[:].insurer_name''',
                                                                                  ).toString())
                                                                            : '${getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.insurer_name''',
                                                                              ).toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.notoSansThai(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF1D4774),
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Text(
                                                                                'ชื่อ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.notoSansThai(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                3,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  '${getJsonField(
                                                                                    leadListItemItem,
                                                                                    r'''$.first_name''',
                                                                                  ).toString()} ${getJsonField(
                                                                                    leadListItemItem,
                                                                                    r'''$.last_name''',
                                                                                  ).toString()}',
                                                                                  textAlign: TextAlign.end,
                                                                                  maxLines: 2,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.notoSansThai(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'ประเภทประกัน',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.notoSansThai(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.insurance_type''',
                                                                            ).toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.notoSansThai(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'เเผนประกัน',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.notoSansThai(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            widget!.checkVMI == '0'
                                                                                ? (('${getJsonField(
                                                                                              leadListItemItem,
                                                                                              r'''$.app_detail_house[:].package_name''',
                                                                                            ).toString()}' !=
                                                                                            '') &&
                                                                                        ('${getJsonField(
                                                                                              leadListItemItem,
                                                                                              r'''$.app_detail_house[:].package_name''',
                                                                                            ).toString()}' !=
                                                                                            'null')
                                                                                    ? getJsonField(
                                                                                        leadListItemItem,
                                                                                        r'''$.app_detail_house[:].package_name''',
                                                                                      ).toString()
                                                                                    : getJsonField(
                                                                                        leadListItemItem,
                                                                                        r'''$.leads_detail_house[:].package_name''',
                                                                                      ).toString())
                                                                                : '${getJsonField(
                                                                                    leadListItemItem,
                                                                                    r'''$.package_name''',
                                                                                  ).toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.notoSansThai(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Text(
                                                                              'สถานะการดำเนินงาน',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.notoSansThai(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                              child: Text(
                                                                                '${'ปฏิเสธ' != functions.checkNullValueAndReturn('${getJsonField(
                                                                                      leadListItemItem,
                                                                                      r'''$..leads_detail_house[:].insurer_status''',
                                                                                    ).toString()}') ? '${getJsonField(
                                                                                    leadListItemItem,
                                                                                    r'''$.quotation_status''',
                                                                                  ).toString()}' : functions.checkNullValueAndReturn(getJsonField(
                                                                                    leadListItemItem,
                                                                                    r'''$..leads_detail_house[:].insurer_status''',
                                                                                  ).toString())}',
                                                                                textAlign: TextAlign.end,
                                                                                maxLines: 2,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.notoSansThai(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
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
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'ใบเสนอราคา',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.notoSansThai(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            if (!(('${getJsonField(
                                                                                      leadListItemItem,
                                                                                      r'''$.leads_detail_house[:].pdf_quotation''',
                                                                                    ).toString()}' !=
                                                                                    '') &&
                                                                                ('${getJsonField(
                                                                                      leadListItemItem,
                                                                                      r'''$.leads_detail_house[:].pdf_quotation''',
                                                                                    ).toString()}' !=
                                                                                    'null'))) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text('ไม่พบไฟล์ใบเสนอราคา'),
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

                                                                            context.pushNamed(
                                                                              FireQuotationCopyWidget.routeName,
                                                                              queryParameters: {
                                                                                'quotation': serializeParam(
                                                                                  widget!.checkVMI == '0'
                                                                                      ? ((String pdfQuotation) {
                                                                                          return [
                                                                                            '$pdfQuotation'
                                                                                          ];
                                                                                        }('${getJsonField(
                                                                                          leadListItemItem,
                                                                                          r'''$.leads_detail_house[:].pdf_quotation''',
                                                                                        ).toString()}'))
                                                                                      : (getJsonField(
                                                                                          leadListItemItem,
                                                                                          r'''$.pdf_quotation''',
                                                                                          true,
                                                                                        ) as List?)
                                                                                          ?.cast<String>(),
                                                                                  ParamType.String,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          text:
                                                                              'ดูใบเสนอราคา',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                115.0,
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                Color(0xFF5D78FF),
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  font: GoogleFonts.notoSansThai(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    if ((widget!.checkVMI !=
                                                                            '0') ||
                                                                        ('${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.quotation_status''',
                                                                            ).toString()}' ==
                                                                            'อนุมัติ'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'กรมธรรม์',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.notoSansThai(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) => FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  var _shouldSetState = false;
                                                                                  _model.getFileVmiButton = await GetFileVmiApiCall.call(
                                                                                    apiUrl: FFAppState().apiUrlInsuranceAppState,
                                                                                    token: FFAppState().accessToken,
                                                                                    quotationId: getJsonField(
                                                                                      leadListItemItem,
                                                                                      r'''$.quotation_id''',
                                                                                    ).toString(),
                                                                                    ownerId: FFAppState().employeeID,
                                                                                  );

                                                                                  _shouldSetState = true;
                                                                                  if ((_model.getFileVmiButton?.statusCode ?? 200) != 200) {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return WebViewAware(
                                                                                          child: AlertDialog(
                                                                                            content: Text('พบข้อผิดพลาดConnection (${(_model.getFileVmiButton?.statusCode ?? 200).toString()})'),
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
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                  if (GetFileVmiApiCall.statusLayer1(
                                                                                        (_model.getFileVmiButton?.jsonBody ?? ''),
                                                                                      ) !=
                                                                                      200) {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return WebViewAware(
                                                                                          child: AlertDialog(
                                                                                            content: Text(GetFileVmiApiCall.messageLayer1(
                                                                                              (_model.getFileVmiButton?.jsonBody ?? ''),
                                                                                            )!),
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
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                  if (('${getJsonField(
                                                                                            widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                            r'''$.insurer_short_name''',
                                                                                          ).toString()}' ==
                                                                                          'TNI') &&
                                                                                      ('${getJsonField(
                                                                                            widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                            r'''$.cover_type_name''',
                                                                                          ).toString()}' ==
                                                                                          'ชั้น 1') &&
                                                                                      ('${getJsonField(
                                                                                            widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                            r'''$.quotation_type''',
                                                                                          ).toString()}' ==
                                                                                          'auto')) {
                                                                                    if (!isAndroid) {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (dialogContext) {
                                                                                          return Dialog(
                                                                                            elevation: 0,
                                                                                            insetPadding: EdgeInsets.zero,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: WebViewAware(
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: CustomDialogComponentCopyWidget(
                                                                                                  linkUrl: '${GetFileVmiApiCall.vmiDocumentUrl(
                                                                                                    (_model.getFileVmiButton?.jsonBody ?? ''),
                                                                                                  )}',
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );

                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                      return;
                                                                                    }
                                                                                    await actions.urlLauncherAction(
                                                                                      '${GetFileVmiApiCall.vmiDocumentUrl(
                                                                                        (_model.getFileVmiButton?.jsonBody ?? ''),
                                                                                      )}',
                                                                                      'android',
                                                                                    );
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                  await launchURL('${GetFileVmiApiCall.vmiDocumentUrl(
                                                                                    (_model.getFileVmiButton?.jsonBody ?? ''),
                                                                                  )}');
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                },
                                                                                text: 'ดูกรมธรรม์',
                                                                                options: FFButtonOptions(
                                                                                  width: 115.0,
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0xFFA75194),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.notoSansThai(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        color: Colors.white,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                  elevation: 3.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (false)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                var _shouldSetState = false;
                                                                                _model.getHistory = await GetNonePackageHistoryAPICall.call(
                                                                                  token: FFAppState().accessToken,
                                                                                  quotationId: getJsonField(
                                                                                    leadListItemItem,
                                                                                    r'''$..quotation_id''',
                                                                                  ).toString(),
                                                                                  apiUrl: FFAppState().apiUrlInsuranceAppState,
                                                                                );

                                                                                _shouldSetState = true;
                                                                                if ((_model.getHistory?.statusCode ?? 200) != 200) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                        child: AlertDialog(
                                                                                          content: Text('พบข้อผิดพลาดConnection (${(_model.getHistory?.statusCode ?? 200).toString()})'),
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
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                                if (GetNonePackageHistoryAPICall.statusLayer1(
                                                                                      (_model.getHistory?.jsonBody ?? ''),
                                                                                    ) !=
                                                                                    200) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                        child: AlertDialog(
                                                                                          content: Text(GetNonePackageHistoryAPICall.messageLayer1(
                                                                                            (_model.getHistory?.jsonBody ?? ''),
                                                                                          )!),
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
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                                await showModalBottomSheet(
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
                                                                                            height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                            child: NonePackageShowStatusComponentWidget(
                                                                                              quotationStatusList: GetNonePackageHistoryAPICall.quotationStatus(
                                                                                                (_model.getHistory?.jsonBody ?? ''),
                                                                                              )?.map((e) => e.toString()).toList(),
                                                                                              updateAtList: GetNonePackageHistoryAPICall.updateAt(
                                                                                                (_model.getHistory?.jsonBody ?? ''),
                                                                                              )?.map((e) => e.toString()).toList(),
                                                                                              updaterList: GetNonePackageHistoryAPICall.updaterName(
                                                                                                (_model.getHistory?.jsonBody ?? ''),
                                                                                              )?.map((e) => e.toString()).toList(),
                                                                                              reasonNameList: GetNonePackageHistoryAPICall.reasonName(
                                                                                                (_model.getHistory?.jsonBody ?? ''),
                                                                                              )?.map((e) => e.toString()).toList(),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));

                                                                                if (_shouldSetState) safeSetState(() {});
                                                                              },
                                                                              text: 'ติดตามงาน',
                                                                              options: FFButtonOptions(
                                                                                width: 115.0,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.notoSansThai(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 3.0,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(15.0),
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      20.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'ราคาเบี้ยประกัน/ปี \n(ไม่รวมภาษีเเละอากร)',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.notoSansThai(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '${widget!.checkVMI == '0' ? valueOrDefault<String>(
                                                                          ('' !=
                                                                                      '${getJsonField(
                                                                                        leadListItemItem,
                                                                                        r'''$.app_detail_house[:].net_premium_total''',
                                                                                      ).toString()}') &&
                                                                                  ('${getJsonField(
                                                                                        leadListItemItem,
                                                                                        r'''$.app_detail_house[:].net_premium_total''',
                                                                                      ).toString()}' !=
                                                                                      'null')
                                                                              ? functions.returnNumberWithComma2Decimal('${getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.app_detail_house[:].net_premium_total''',
                                                                                ).toString()}')
                                                                              : functions.returnNumberWithComma2Decimal('${getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.leads_detail_house[:].net_premium_total''',
                                                                                ).toString()}'),
                                                                          'net_premium_total',
                                                                        ) : '${functions.returnNumberWithComma2Decimal('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.net_premium_total''',
                                                                        ).toString()}')}'}${widget!.checkVMI == '0' ? ' บาท' : ''}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.notoSansThai(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if ('CMI' ==
                                                                  getJsonField(
                                                                    widget!.list
                                                                        ?.elementAtOrNull(
                                                                            leadListItemIndex),
                                                                    r'''$..sub_product''',
                                                                  ).toString())
                                                                Container(
                                                                  width: 100.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                ),
                                                              if (widget!
                                                                      .checkVMI ==
                                                                  '0')
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    var _shouldSetState =
                                                                        false;
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
                                                                    safeSetState(
                                                                        () {});
                                                                    if (widget!
                                                                            .checkVMI ==
                                                                        '0') {
                                                                      if (('เตรียมข้อมูล' !=
                                                                              getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.quotation_status''',
                                                                              ).toString()) &&
                                                                          ('รอตัดสินใจ' !=
                                                                              getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.quotation_status''',
                                                                              ).toString()) &&
                                                                          ('ส่งเรื่องขอใบเสนอราคา' !=
                                                                              getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.quotation_status''',
                                                                              ).toString())) {
                                                                        if (('อยู่ระหว่างตรวจสอบสภาพรถ' ==
                                                                                getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()) ||
                                                                            ('อนุมัติ' ==
                                                                                getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()) ||
                                                                            ('ไม่อนุมัติ' ==
                                                                                getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()) ||
                                                                            ('ส่งเรื่องให้บริษัทประกันพิจารณา' ==
                                                                                getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()) ||
                                                                            ('ยกเลิก' ==
                                                                                getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()) ||
                                                                            ('ขอคืนเงิน' ==
                                                                                getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()) ||
                                                                            ('โยกเงิน' ==
                                                                                getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_status''',
                                                                                ).toString())) {
                                                                          context
                                                                              .pushNamed(
                                                                            InsuranceInfoPage5Widget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'quotationId': serializeParam(
                                                                                '${getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_id''',
                                                                                ).toString()}',
                                                                                ParamType.String,
                                                                              ),
                                                                              'leadDtlId': serializeParam(
                                                                                '${getJsonField(
                                                                                          leadListItemItem,
                                                                                          r'''$.leads_detail_house[:].leads_house_dtl_id''',
                                                                                        ).toString()}' !=
                                                                                        ''
                                                                                    ? ((String leadHouseDetailId) {
                                                                                        return int.parse('$leadHouseDetailId');
                                                                                      }('${getJsonField(
                                                                                        leadListItemItem,
                                                                                        r'''$.leads_detail_house[:].leads_house_dtl_id''',
                                                                                      ).toString()}'))
                                                                                    : 0,
                                                                                ParamType.int,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }

                                                                        context
                                                                            .pushNamed(
                                                                          InsuranceInfoPage42Widget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'quotationId':
                                                                                serializeParam(
                                                                              '${getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.quotation_id''',
                                                                              ).toString()}',
                                                                              ParamType.String,
                                                                            ),
                                                                            'leadDetailId':
                                                                                serializeParam(
                                                                              '${getJsonField(
                                                                                        leadListItemItem,
                                                                                        r'''$.leads_detail_house[:].leads_house_dtl_id''',
                                                                                      ).toString()}' !=
                                                                                      ''
                                                                                  ? ((String leadHouseDetailId) {
                                                                                      return int.parse('$leadHouseDetailId');
                                                                                    }('${getJsonField(
                                                                                      leadListItemItem,
                                                                                      r'''$.leads_detail_house[:].leads_house_dtl_id''',
                                                                                    ).toString()}'))
                                                                                  : 0,
                                                                              ParamType.int,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      } else {
                                                                        if (('auto' ==
                                                                                getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_type''',
                                                                                ).toString()) ||
                                                                            true) {
                                                                          context
                                                                              .pushNamed(
                                                                            InsuranceInfoPage1Widget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'quotationId': serializeParam(
                                                                                '${getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.quotation_id''',
                                                                                ).toString()}',
                                                                                ParamType.String,
                                                                              ),
                                                                              'leadDtailId': serializeParam(
                                                                                '${getJsonField(
                                                                                          leadListItemItem,
                                                                                          r'''$.leads_detail_house[:].leads_house_dtl_id''',
                                                                                        ).toString()}' !=
                                                                                        ''
                                                                                    ? ((String leadHouseDetailId) {
                                                                                        return int.parse('$leadHouseDetailId');
                                                                                      }('${getJsonField(
                                                                                        leadListItemItem,
                                                                                        r'''$.leads_detail_house[:].leads_house_dtl_id''',
                                                                                      ).toString()}'))
                                                                                    : 0,
                                                                                ParamType.int,
                                                                              ),
                                                                              'fromPage': serializeParam(
                                                                                'FireInsurance',
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        } else {
                                                                          if ('รอตัดสินใจ' ==
                                                                              getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.quotation_status''',
                                                                              ).toString()) {
                                                                            FFAppState().insuranceInfoPage1SaveDataCheckBool =
                                                                                false;
                                                                            FFAppState().insuranceInfoPage2SaveDataCheckBool =
                                                                                false;
                                                                            FFAppState().insuranceInfoPage3SaveDataCheckBool =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            context.pushNamed(
                                                                              InsuranceInfoPage1Widget.routeName,
                                                                              queryParameters: {
                                                                                'quotationId': serializeParam(
                                                                                  getJsonField(
                                                                                    widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                    r'''$.quotation_id''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'leadDtailId': serializeParam(
                                                                                  getJsonField(
                                                                                    widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                    r'''$.lead_dtl_id''',
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }

                                                                          context
                                                                              .pushNamed(
                                                                            NonePackageSelectedInsurerPageWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'leadID': serializeParam(
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.lead_id''',
                                                                                ).toString(),
                                                                                ParamType.String,
                                                                              ),
                                                                              'coverTypeName': serializeParam(
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.cover_type_name''',
                                                                                ).toString(),
                                                                                ParamType.String,
                                                                              ),
                                                                              'garageTypeName': serializeParam(
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.garage_type_name''',
                                                                                ).toString(),
                                                                                ParamType.String,
                                                                              ),
                                                                              'insurerShortName': serializeParam(
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.insurer_short_name''',
                                                                                ).toString(),
                                                                                ParamType.String,
                                                                              ),
                                                                              'insurerName': serializeParam(
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.insurer_name''',
                                                                                ).toString(),
                                                                                ParamType.String,
                                                                              ),
                                                                              'quotationId': serializeParam(
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.quotation_id''',
                                                                                ).toString(),
                                                                                ParamType.String,
                                                                              ),
                                                                              'leadDtlId': serializeParam(
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.lead_dtl_id''',
                                                                                ),
                                                                                ParamType.int,
                                                                              ),
                                                                              'actFlag': serializeParam(
                                                                                '${getJsonField(
                                                                                      widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                      r'''$.flg_act''',
                                                                                    ).toString()}' ==
                                                                                    '1',
                                                                                ParamType.bool,
                                                                              ),
                                                                              'masterActAmount': serializeParam(
                                                                                '${getJsonField(
                                                                                          widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                          r'''$.master_act_amount''',
                                                                                        ).toString()}' ==
                                                                                        'null'
                                                                                    ? ''
                                                                                    : '${getJsonField(
                                                                                        widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                        r'''$.master_act_amount''',
                                                                                      ).toString()}',
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        }
                                                                      }
                                                                    } else {
                                                                      if ('CMI' ==
                                                                          getJsonField(
                                                                            widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                            r'''$.sub_product''',
                                                                          ).toString()) {
                                                                        context
                                                                            .pushNamed(
                                                                          InsuranceInfoPage5Widget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'quotationId':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.quotation_id''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                            'leadDtlId':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.lead_dtl_id''',
                                                                              ),
                                                                              ParamType.int,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      } else {
                                                                        if ('' !=
                                                                            '${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.VMI_documentUrl''',
                                                                            ).toString()}') {
                                                                          _model.getFileVmi =
                                                                              await GetFileVmiApiCall.call(
                                                                            apiUrl:
                                                                                FFAppState().apiUrlInsuranceAppState,
                                                                            token:
                                                                                FFAppState().accessToken,
                                                                            quotationId:
                                                                                getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.quotation_id''',
                                                                            ).toString(),
                                                                            ownerId:
                                                                                FFAppState().employeeID,
                                                                          );

                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.getFileVmi?.statusCode ?? 200) !=
                                                                              200) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    content: Text('พบข้อผิดพลาดConnection (${(_model.getFileVmi?.statusCode ?? 200).toString()})'),
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
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }
                                                                          if (GetFileVmiApiCall.statusLayer1(
                                                                                (_model.getFileVmi?.jsonBody ?? ''),
                                                                              ) !=
                                                                              200) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    content: Text(GetFileVmiApiCall.messageLayer1(
                                                                                      (_model.getFileVmi?.jsonBody ?? ''),
                                                                                    )!),
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
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }
                                                                          await launchURL(
                                                                              GetFileVmiApiCall.vmiDocumentUrl(
                                                                            (_model.getFileVmi?.jsonBody ??
                                                                                ''),
                                                                          )!);
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  title: Text('ไม่พบไฟล์ในระบบ'),
                                                                                  content: Text('กรุณารอทางทีมประกันเพิ่มข้อมูลในระบบ'),
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
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                      }
                                                                    }

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                                  text: 'อนุมัติ' ==
                                                                          getJsonField(
                                                                            leadListItemItem,
                                                                            r'''$.quotation_status''',
                                                                          ).toString()
                                                                      ? 'ดูกรมธรรม์'
                                                                      : 'ทำประกัน',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        115.0,
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0xFFDB771A),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.notoSansThai(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFFDB771A),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
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
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          if (widget!.checkTotal == 0 ? true : false)
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth:
                                          MediaQuery.sizeOf(context).width *
                                              0.9,
                                      minHeight: 100.0,
                                      maxWidth:
                                          MediaQuery.sizeOf(context).width *
                                              0.95,
                                      maxHeight: 100.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'ไม่พบข้อมูลในระบบ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
