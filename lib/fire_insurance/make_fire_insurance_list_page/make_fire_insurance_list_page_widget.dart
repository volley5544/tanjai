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
    this.checkTotal,
    required this.list,
    required this.checkPayment,
    String? checkVMI,
    this.fromPage,
    this.type,
  }) : this.checkVMI = checkVMI ?? '0';

  final int? checkTotal;
  final List<dynamic>? list;
  final String? checkPayment;
  final String checkVMI;
  final String? fromPage;
  final String? type;

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
      safeSetState(() {});
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(getJsonField(
                widget!.list!.firstOrNull,
                r'''$..first_name''',
              ).toString().toString()),
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
              content: Text((functions.containWordinStringUrl(
                          _model.searchFirstnameTextController.text,
                          getJsonField(
                            widget!.list?.firstOrNull,
                            r'''$..first_name''',
                          ).toString().toString())! ||
                      (_model.searchFirstnameTextController.text == ''))
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
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              title: Text('searchQuotationStatus'),
              content: Text(FFAppState().searchQuotationStatus),
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
              title: Text('\$.payment_status'),
              content: Text(getJsonField(
                widget!.list!.firstOrNull,
                r'''$.payment_status''',
              ).toString().toString()),
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
              content: Text(((FFAppState().searchQuotationStatus == '0') ||
                      (FFAppState().searchQuotationStatus ==
                          getJsonField(
                            widget!.list?.firstOrNull,
                            r'''$.payment_status''',
                          ).toString().toString()))
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
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(
                  '${widget!.checkTotal?.toString()}${(widget!.list?.elementAtOrNull(0))?.toString()}'),
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
                widget!.list!.firstOrNull,
                r'''$..leads_detail_house[:].insurer_name''',
              ).toString().toString()),
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
                widget!.list!.firstOrNull,
                r'''$..first_name''',
              ).toString().toString()),
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
                widget!.list!.firstOrNull,
                r'''$..last_name''',
              ).toString().toString()),
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
                widget!.list!.firstOrNull,
                r'''$..sub_product''',
              ).toString().toString()),
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
                widget!.list!.firstOrNull,
                r'''$..leads_detail_house[:].package_name''',
              ).toString().toString()),
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
                widget!.list!.firstOrNull,
                r'''$..leads_detail_house[:].insurer_status''',
              ).toString().toString()),
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
                widget!.list!.firstOrNull,
                r'''$..quotation_status''',
              ).toString().toString()),
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
                widget!.list!.firstOrNull,
                r'''$..leads_detail_house[:].net_premium_total''',
              ).toString().toString()),
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
                widget!.list!.firstOrNull,
                r'''$..pdf_quotation''',
              ).toString().toString()),
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
                widget!.list!.firstOrNull,
                r'''$..quotation_type''',
              ).toString().toString()),
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
          child: WillPopScope(
            onWillPop: () async => false,
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
                    if (widget!.fromPage == 'FollowUpPage') {
                      context.goNamed('fireLeadFollowUpPage');

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
                        fontFamily: 'Noto Sans Thai',
                        color: Color(0xFF003063),
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
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
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'ค้นหาชื่อลูกค้า',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                      child: FutureBuilder<List<HideInAppContentRecord>>(
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<HideInAppContentRecord>
                              columnHideInAppContentRecordList = snapshot.data!;
                          final columnHideInAppContentRecord =
                              columnHideInAppContentRecordList.isNotEmpty
                                  ? columnHideInAppContentRecordList.first
                                  : null;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget!.checkTotal != 0 ? true : false)
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                                  leadListItem[
                                                      leadListItemIndex];
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: () {
                                                        if (getJsonField(
                                                              widget!.list!
                                                                  .elementAtOrNull(
                                                                      leadListItemIndex),
                                                              r'''$.payment_status_check''',
                                                            ) &&
                                                            (widget!.checkPayment ==
                                                                '1')) {
                                                          return Color(
                                                              0xFFFFE090);
                                                        } else if (getJsonField(
                                                              widget!.list!
                                                                  .elementAtOrNull(
                                                                      leadListItemIndex),
                                                              r'''$.payment_status_check_sec''',
                                                            ) &&
                                                            (widget!.checkPayment ==
                                                                '1')) {
                                                          return Color(
                                                              0xFFCCEBE2);
                                                        } else {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground;
                                                        }
                                                      }(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color: () {
                                                          if (getJsonField(
                                                                widget!.list!
                                                                    .elementAtOrNull(
                                                                        leadListItemIndex),
                                                                r'''$.payment_status_check''',
                                                              ) &&
                                                              (widget!.checkPayment ==
                                                                  '1')) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .warning;
                                                          } else if (getJsonField(
                                                                widget!.list!
                                                                    .elementAtOrNull(
                                                                        leadListItemIndex),
                                                                r'''$.payment_status_check_sec''',
                                                              ) &&
                                                              (widget!.checkPayment ==
                                                                  '1')) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .success;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText;
                                                          }
                                                        }(),
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
                                                                              getJsonField(
                                                                                widget!.list!.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.image''',
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
                                                                        '${getJsonField(
                                                                          widget!
                                                                              .list
                                                                              ?.elementAtOrNull(leadListItemIndex),
                                                                          r'''$..leads_detail_house[:].insurer_name''',
                                                                        ).toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: Color(0xFF1D4774),
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
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
                                                                          Text(
                                                                            'ชื่อ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$..first_name''',
                                                                            ).toString()} ${getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$..last_name''',
                                                                            ).toString()}',
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
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
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            'อัคคีภัย',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
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
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$..leads_detail_house[:].package_name''',
                                                                            ).toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
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
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                              child: Text(
                                                                                '${'ปฏิเสธ' != functions.checkNullValueAndReturn('${getJsonField(
                                                                                      widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                      r'''$..leads_detail_house[:].insurer_status''',
                                                                                    ).toString()}') ? getJsonField(
                                                                                    widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                    r'''$..quotation_status''',
                                                                                  ).toString() : functions.checkNullValueAndReturn(getJsonField(
                                                                                    widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                    r'''$..leads_detail_house[:].insurer_status''',
                                                                                  ).toString())}',
                                                                                textAlign: TextAlign.end,
                                                                                maxLines: 2,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
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
                                                                                fontFamily: 'Noto Sans Thai',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            FFAppState().jsonTemp =
                                                                                (widget!.list!.elementAtOrNull(leadListItemIndex))!;
                                                                            safeSetState(() {});

                                                                            context.pushNamed(
                                                                              'QuotationCopy',
                                                                              queryParameters: {
                                                                                'quotation': serializeParam(
                                                                                  (getJsonField(
                                                                                    FFAppState().jsonTemp,
                                                                                    r'''$.pdf_quotation''',
                                                                                    true,
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList(),
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
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: Colors.white,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
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
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                var _shouldSetState = false;
                                                                                _model.getFileVmiButton = await GetFileVmiApiCall.call(
                                                                                  apiUrl: FFAppState().apiUrlInsuranceAppState,
                                                                                  token: FFAppState().accessToken,
                                                                                  quotationId: getJsonField(
                                                                                    widget!.list?.elementAtOrNull(leadListItemIndex),
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
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      color: Colors.white,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
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
                                                                            onPressed:
                                                                                () async {
                                                                              var _shouldSetState = false;
                                                                              _model.getHistory = await GetNonePackageHistoryAPICall.call(
                                                                                token: FFAppState().accessToken,
                                                                                quotationId: getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.quotation_id''',
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

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                            text:
                                                                                'ติดตามงาน',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 115.0,
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    color: Colors.white,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
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
                                                                      'ราคาเบี้ยประกัน/ปี (ไม่รวมภาษีเเละอากร)',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '${'' != getJsonField(
                                                                            widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                            r'''$..leads_detail_house[:].net_premium_total''',
                                                                          ).toString() ? getJsonField(
                                                                          widget!
                                                                              .list
                                                                              ?.elementAtOrNull(leadListItemIndex),
                                                                          r'''$..leads_detail_house[:].net_premium_total''',
                                                                        ).toString() : '-'}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
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
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  var _shouldSetState =
                                                                      false;
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
                                                                  safeSetState(
                                                                      () {});
                                                                  if (widget!
                                                                          .checkVMI ==
                                                                      '0') {
                                                                    if (('เตรียมข้อมูล' !=
                                                                            getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.quotation_status''',
                                                                            ).toString()) &&
                                                                        ('รอตัดสินใจ' !=
                                                                            getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.quotation_status''',
                                                                            ).toString()) &&
                                                                        ('ส่งเรื่องขอใบเสนอราคา' !=
                                                                            getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.quotation_status''',
                                                                            ).toString())) {
                                                                      if (('อยู่ระหว่างตรวจสอบสภาพรถ' ==
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.quotation_status''',
                                                                              ).toString()) ||
                                                                          ('อนุมัติ' ==
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.quotation_status''',
                                                                              ).toString()) ||
                                                                          ('ไม่อนุมัติ' ==
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.quotation_status''',
                                                                              ).toString()) ||
                                                                          ('ส่งเรื่องให้บริษัทประกันพิจารณา' ==
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.quotation_status''',
                                                                              ).toString()) ||
                                                                          ('ยกเลิก' ==
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.quotation_status''',
                                                                              ).toString()) ||
                                                                          ('ขอคืนเงิน' ==
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.quotation_status''',
                                                                              ).toString()) ||
                                                                          ('โยกเงิน' ==
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.quotation_status''',
                                                                              ).toString())) {
                                                                        context
                                                                            .pushNamed(
                                                                          'insuranceInfoPage5',
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
                                                                      }

                                                                      context
                                                                          .pushNamed(
                                                                        'insuranceInfoPage4_2',
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
                                                                          'leadDetailId':
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
                                                                      if ('auto' ==
                                                                          getJsonField(
                                                                            widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                            r'''$.quotation_type''',
                                                                          ).toString()) {
                                                                        context
                                                                            .pushNamed(
                                                                          'insuranceInfoPage1',
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
                                                                            'leadDtailId':
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
                                                                        if ('รอตัดสินใจ' ==
                                                                            getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.quotation_status''',
                                                                            ).toString()) {
                                                                          FFAppState().insuranceInfoPage1SaveDataCheckBool =
                                                                              false;
                                                                          FFAppState().insuranceInfoPage2SaveDataCheckBool =
                                                                              false;
                                                                          FFAppState().insuranceInfoPage3SaveDataCheckBool =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          context
                                                                              .pushNamed(
                                                                            'insuranceInfoPage1',
                                                                            queryParameters:
                                                                                {
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
                                                                          'NonePackageSelectedInsurerPage',
                                                                          queryParameters:
                                                                              {
                                                                            'leadID':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.lead_id''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                            'coverTypeName':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.cover_type_name''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                            'garageTypeName':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.garage_type_name''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                            'insurerShortName':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.insurer_short_name''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                            'insurerName':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.insurer_name''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
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
                                                                            'actFlag':
                                                                                serializeParam(
                                                                              '${getJsonField(
                                                                                    widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                    r'''$.flg_act''',
                                                                                  ).toString()}' ==
                                                                                  '1',
                                                                              ParamType.bool,
                                                                            ),
                                                                            'masterActAmount':
                                                                                serializeParam(
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
                                                                          widget!
                                                                              .list
                                                                              ?.elementAtOrNull(leadListItemIndex),
                                                                          r'''$.sub_product''',
                                                                        ).toString()) {
                                                                      context
                                                                          .pushNamed(
                                                                        'insuranceInfoPage5',
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
                                                                          getJsonField(
                                                                            widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                            r'''$.VMI_documentUrl''',
                                                                          ).toString()) {
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
                                                                        if ((_model.getFileVmi?.statusCode ??
                                                                                200) !=
                                                                            200) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
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
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
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
                                                                          safeSetState(
                                                                              () {});
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
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      }
                                                                    }
                                                                  }

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                text: () {
                                                                  if (widget!
                                                                          .checkVMI ==
                                                                      '0') {
                                                                    return (('ยกเลิก' ==
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()) ||
                                                                            ('โยกเงิน' ==
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()) ||
                                                                            ('ขอคืนเงิน' ==
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()) ||
                                                                            ('ไม่อนุมัติ' ==
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.quotation_status''',
                                                                                ).toString())
                                                                        ? 'ดูรายละเอียด'
                                                                        : 'ทำประกัน');
                                                                  } else if ('CMI' ==
                                                                      getJsonField(
                                                                        widget!
                                                                            .list
                                                                            ?.elementAtOrNull(leadListItemIndex),
                                                                        r'''$.sub_product''',
                                                                      ).toString()) {
                                                                    return 'ทำ พ.ร.บ';
                                                                  } else {
                                                                    return 'ดูกรมธรรม์';
                                                                  }
                                                                }(),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 115.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
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
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFDB771A),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
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
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'ไม่พบข้อมูลในระบบ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
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
