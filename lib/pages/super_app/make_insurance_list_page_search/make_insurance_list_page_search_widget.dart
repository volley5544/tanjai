import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'make_insurance_list_page_search_model.dart';
export 'make_insurance_list_page_search_model.dart';

class MakeInsuranceListPageSearchWidget extends StatefulWidget {
  const MakeInsuranceListPageSearchWidget({
    super.key,
    this.checkTotal,
    required this.list,
    required this.checkPayment,
    String? checkVMI,
    this.fromPage,
    this.type,
    required this.carRegistration,
  }) : this.checkVMI = checkVMI ?? '0';

  final int? checkTotal;
  final List<dynamic>? list;
  final String? checkPayment;
  final String checkVMI;
  final String? fromPage;
  final String? type;
  final String? carRegistration;

  @override
  State<MakeInsuranceListPageSearchWidget> createState() =>
      _MakeInsuranceListPageSearchWidgetState();
}

class _MakeInsuranceListPageSearchWidgetState
    extends State<MakeInsuranceListPageSearchWidget>
    with TickerProviderStateMixin {
  late MakeInsuranceListPageSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MakeInsuranceListPageSearchModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MakeInsuranceListPageSearch'});
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
      _model.buildVersionQuery = await queryBuildVersionRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().searchQuotationStatus = '0';
      safeSetState(() {});
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
            makeInsuranceListPageSearchUrlLinkStorageRecordList =
            snapshot.data!;
        final makeInsuranceListPageSearchUrlLinkStorageRecord =
            makeInsuranceListPageSearchUrlLinkStorageRecordList.isNotEmpty
                ? makeInsuranceListPageSearchUrlLinkStorageRecordList.first
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
                      context.goNamed('LeadFollowUpPage');

                      return;
                    }
                    context.safePop();
                  },
                ),
                title: Text(
                  widget!.checkVMI == '0' ? 'รายการ' : 'รายการกรมธรรม์',
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 12.0, 5.0),
                            child: Text(
                              'เลขทะเบียนรถลูกค้า ${widget!.carRegistration}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
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
                                                                    Text(
                                                                      getJsonField(
                                                                        widget!
                                                                            .list!
                                                                            .elementAtOrNull(leadListItemIndex),
                                                                        r'''$.insurer_name''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                Color(0xFF1D4774),
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
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
                                                                          'ชื่อ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto Sans Thai',
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          '${getJsonField(
                                                                            widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                            r'''$.first_name''',
                                                                          ).toString()} ${getJsonField(
                                                                            widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                            r'''$.last_name''',
                                                                          ).toString()}',
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto Sans Thai',
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
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
                                                                          'ประเภทประกัน',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto Sans Thai',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            widget!.list!.elementAtOrNull(leadListItemIndex),
                                                                            r'''$.cover_type_name''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto Sans Thai',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    if ('งานนอกเรท' ==
                                                                            getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.quotation_type_name''',
                                                                            ).toString()
                                                                        ? false
                                                                        : true)
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'ทุนประกัน',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '' !=
                                                                                    getJsonField(
                                                                                      widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                      r'''$.sum_insured''',
                                                                                    ).toString()
                                                                                ? getJsonField(
                                                                                    widget!.list!.elementAtOrNull(leadListItemIndex),
                                                                                    r'''$.sum_insured''',
                                                                                  ).toString()
                                                                                : '-',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
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
                                                                          'ประเภทซ่อม',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto Sans Thai',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            widget!.list!.elementAtOrNull(leadListItemIndex),
                                                                            r'''$.garage_type_name''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Noto Sans Thai',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
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
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'ปฏิเสธ' !=
                                                                                      functions.checkNullValueAndReturn(getJsonField(
                                                                                        widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                        r'''$.insurer_status''',
                                                                                      ).toString())
                                                                                  ? getJsonField(
                                                                                      widget!.list!.elementAtOrNull(leadListItemIndex),
                                                                                      r'''$.quotation_status''',
                                                                                    ).toString()
                                                                                  : functions.checkNullValueAndReturn(getJsonField(
                                                                                      widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                      r'''$.insurer_status''',
                                                                                    ).toString()),
                                                                              textAlign: TextAlign.end,
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    color: 'ปฏิเสธ' !=
                                                                                            functions.checkNullValueAndReturn(getJsonField(
                                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                              r'''$.insurer_status''',
                                                                                            ).toString())
                                                                                        ? FlutterFlowTheme.of(context).primaryText
                                                                                        : FlutterFlowTheme.of(context).error,
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    if (widget!.checkPayment ==
                                                                            '1'
                                                                        ? true
                                                                        : ('${getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.quotation_status''',
                                                                                ).toString()}' ==
                                                                                'ขอคืนเงิน'
                                                                            ? true
                                                                            : false))
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'สถานะการชำระเงิน',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              widget!.list!.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.payment_status''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'ประเภทงาน',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              widget!.list!.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.quotation_type_name''',
                                                                            ).toString(),
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
                                                                    if (('' !=
                                                                            getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.pdf_quotation''',
                                                                            ).toString()) &&
                                                                        ('manual' ==
                                                                                getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.quotation_type''',
                                                                                ).toString()
                                                                            ? ('ปฏิเสธ' !=
                                                                                functions.checkNullValueAndReturn(getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.insurer_status''',
                                                                                ).toString()))
                                                                            : true))
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'ใบเสนอราคา',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              FFAppState().jsonTemp = (widget!.list!.elementAtOrNull(leadListItemIndex))!;
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
                                                                              width: 115.0,
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: Color(0xFF5D78FF),
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
                                                                    if ('อนุมัติ' ==
                                                                        getJsonField(
                                                                          widget!
                                                                              .list
                                                                              ?.elementAtOrNull(leadListItemIndex),
                                                                          r'''$.quotation_status''',
                                                                        ).toString())
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
                                                                                await launchURL(GetFileVmiApiCall.vmiDocumentUrl(
                                                                                  (_model.getFileVmiButton?.jsonBody ?? ''),
                                                                                )!);
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if ('manual' ==
                                                                        getJsonField(
                                                                          widget!
                                                                              .list
                                                                              ?.elementAtOrNull(leadListItemIndex),
                                                                          r'''$.quotation_type''',
                                                                        ).toString())
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
                                                                    if (('manual' ==
                                                                            getJsonField(
                                                                              widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.quotation_type''',
                                                                            ).toString()) &&
                                                                        (('-' !=
                                                                                functions.checkNullValueAndReturn(getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.insurer_remark''',
                                                                                ).toString())) &&
                                                                            ('' !=
                                                                                functions.checkNullValueAndReturn(getJsonField(
                                                                                  widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                  r'''$.insurer_remark''',
                                                                                ).toString()))))
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
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text(functions.checkNullValueAndReturn(getJsonField(
                                                                                          widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                          r'''$.insurer_remark''',
                                                                                        ).toString())),
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
                                                                              },
                                                                              text: 'เงื่อนไข บ.ประกัน',
                                                                              options: FFButtonOptions(
                                                                                width: 115.0,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: Color(0xFFCC0000),
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      color: Colors.white,
                                                                                      fontSize: 15.0,
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
                                                                      'ราคาเบี้ย (ไม่รวม พรบ.)',
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
                                                                      '' !=
                                                                              getJsonField(
                                                                                widget!.list?.elementAtOrNull(leadListItemIndex),
                                                                                r'''$.net_premium_total''',
                                                                              ).toString()
                                                                          ? getJsonField(
                                                                              widget!.list!.elementAtOrNull(leadListItemIndex),
                                                                              r'''$.net_premium_total''',
                                                                            ).toString()
                                                                          : '-',
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
