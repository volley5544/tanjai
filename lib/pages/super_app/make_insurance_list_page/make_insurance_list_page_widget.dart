import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/make_insurance_type_color/make_insurance_type_color_widget.dart';
import '/components/none_package_show_status_component/none_package_show_status_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'make_insurance_list_page_model.dart';
export 'make_insurance_list_page_model.dart';

class MakeInsuranceListPageWidget extends StatefulWidget {
  const MakeInsuranceListPageWidget({
    Key? key,
    this.checkTotal,
    required this.list,
    required this.checkPayment,
    String? checkVMI,
    this.fromPage,
    this.type,
  })  : this.checkVMI = checkVMI ?? '0',
        super(key: key);

  final int? checkTotal;
  final List<dynamic>? list;
  final String? checkPayment;
  final String checkVMI;
  final String? fromPage;
  final String? type;

  @override
  _MakeInsuranceListPageWidgetState createState() =>
      _MakeInsuranceListPageWidgetState();
}

class _MakeInsuranceListPageWidgetState
    extends State<MakeInsuranceListPageWidget> with TickerProviderStateMixin {
  late MakeInsuranceListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MakeInsuranceListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MakeInsuranceListPage'});
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

      setState(() {
        FFAppState().searchQuotationStatus = '0';
      });
      Navigator.pop(context);
    });

    _model.searchFirstnameController ??= TextEditingController();
    _model.searchFirstnameFocusNode ??= FocusNode();

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
            makeInsuranceListPageUrlLinkStorageRecordList = snapshot.data!;
        final makeInsuranceListPageUrlLinkStorageRecord =
            makeInsuranceListPageUrlLinkStorageRecordList.isNotEmpty
                ? makeInsuranceListPageUrlLinkStorageRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
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
                    if (widget.fromPage == 'FollowUpPage') {
                      context.goNamed('LeadFollowUpPage');

                      return;
                    }
                    context.safePop();
                  },
                ),
                title: Text(
                  'รายการ',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Noto Sans Thai',
                        color: Color(0xFF003063),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                actions: [
                  Visibility(
                    visible: widget.checkPayment == '1',
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
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.7,
                                    child: MakeInsuranceTypeColorWidget(),
                                  ),
                                ),
                              ));
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
                              'ค้นหาชื่อลูกค้า',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    fontSize: 15.0,
                                  ),
                            ),
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
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.5, 8.0, 0.5),
                                              child: TextFormField(
                                                controller: _model
                                                    .searchFirstnameController,
                                                focusNode: _model
                                                    .searchFirstnameFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.searchFirstnameController',
                                                  Duration(milliseconds: 100),
                                                  () => setState(() {}),
                                                ),
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
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                validator: _model
                                                    .searchFirstnameControllerValidator
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
                              if (widget.checkTotal != 0 ? true : false)
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
                                              widget.list!.toList();
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
                                              return Visibility(
                                                visible: (functions
                                                            .containWordinStringUrl(
                                                                _model
                                                                    .searchFirstnameController
                                                                    .text,
                                                                getJsonField(
                                                                  widget.list?[
                                                                      leadListItemIndex],
                                                                  r'''$.first_name''',
                                                                )
                                                                    .toString())! ||
                                                        (_model.searchFirstnameController
                                                                .text ==
                                                            '')) &&
                                                    ((FFAppState()
                                                                .searchQuotationStatus ==
                                                            '0') ||
                                                        (FFAppState()
                                                                .searchQuotationStatus ==
                                                            getJsonField(
                                                              widget.list?[
                                                                  leadListItemIndex],
                                                              r'''$.payment_status''',
                                                            ))),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 16.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: () {
                                                          if (getJsonField(
                                                                widget.list![
                                                                    leadListItemIndex],
                                                                r'''$.payment_status_check''',
                                                              ) &&
                                                              (widget.checkPayment ==
                                                                  '1')) {
                                                            return Color(
                                                                0xFFFFE090);
                                                          } else if (getJsonField(
                                                                widget.list![
                                                                    leadListItemIndex],
                                                                r'''$.payment_status_check_sec''',
                                                              ) &&
                                                              (widget.checkPayment ==
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
                                                            BorderRadius
                                                                .circular(20.0),
                                                        border: Border.all(
                                                          color: () {
                                                            if (getJsonField(
                                                                  widget.list![
                                                                      leadListItemIndex],
                                                                  r'''$.payment_status_check''',
                                                                ) &&
                                                                (widget.checkPayment ==
                                                                    '1')) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning;
                                                            } else if (getJsonField(
                                                                  widget.list![
                                                                      leadListItemIndex],
                                                                  r'''$.payment_status_check_sec''',
                                                                ) &&
                                                                (widget.checkPayment ==
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        20.0,
                                                                        20.0,
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
                                                                          1.00,
                                                                          0.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
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
                                                                              getJsonField(
                                                                                widget.list![leadListItemIndex],
                                                                                r'''$.image''',
                                                                              ),
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
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
                                                                          widget
                                                                              .list![leadListItemIndex],
                                                                          r'''$.insurer_name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: Color(0xFF1D4774),
                                                                              fontSize: 13.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
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
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${getJsonField(
                                                                              widget.list?[leadListItemIndex],
                                                                              r'''$.first_name''',
                                                                            ).toString()} ${getJsonField(
                                                                              widget.list?[leadListItemIndex],
                                                                              r'''$.last_name''',
                                                                            ).toString()}',
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  fontSize: 13.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
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
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              widget.list![leadListItemIndex],
                                                                              r'''$.cover_type_name''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      if ('งานนอกเรท' ==
                                                                              getJsonField(
                                                                                widget.list?[leadListItemIndex],
                                                                                r'''$.quotation_type_name''',
                                                                              )
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
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              '' !=
                                                                                      getJsonField(
                                                                                        widget.list?[leadListItemIndex],
                                                                                        r'''$.sum_insured''',
                                                                                      )
                                                                                  ? getJsonField(
                                                                                      widget.list![leadListItemIndex],
                                                                                      r'''$.sum_insured''',
                                                                                    ).toString()
                                                                                  : '-',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'ประเภทซ่อม',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              widget.list![leadListItemIndex],
                                                                              r'''$.garage_type_name''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
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
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.00, 0.00),
                                                                              child: Text(
                                                                                'ปฏิเสธ' !=
                                                                                        functions.checkNullValueAndReturn(getJsonField(
                                                                                          widget.list?[leadListItemIndex],
                                                                                          r'''$.insurer_status''',
                                                                                        ).toString())
                                                                                    ? getJsonField(
                                                                                        widget.list![leadListItemIndex],
                                                                                        r'''$.quotation_status''',
                                                                                      ).toString()
                                                                                    : functions.checkNullValueAndReturn(getJsonField(
                                                                                        widget.list?[leadListItemIndex],
                                                                                        r'''$.insurer_status''',
                                                                                      ).toString()),
                                                                                textAlign: TextAlign.end,
                                                                                maxLines: 2,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      color: 'ปฏิเสธ' !=
                                                                                              functions.checkNullValueAndReturn(getJsonField(
                                                                                                widget.list?[leadListItemIndex],
                                                                                                r'''$.insurer_status''',
                                                                                              ).toString())
                                                                                          ? FlutterFlowTheme.of(context).primaryText
                                                                                          : FlutterFlowTheme.of(context).error,
                                                                                      fontSize: 13.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      if (widget.checkPayment ==
                                                                              '1'
                                                                          ? true
                                                                          : ('${getJsonField(
                                                                                    widget.list?[leadListItemIndex],
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
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                widget.list![leadListItemIndex],
                                                                                r'''$.payment_status''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
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
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                widget.list![leadListItemIndex],
                                                                                r'''$.quotation_type_name''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 13.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      if (('' !=
                                                                              getJsonField(
                                                                                widget.list?[leadListItemIndex],
                                                                                r'''$.pdf_quotation''',
                                                                              )) &&
                                                                          ('manual' ==
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.quotation_type''',
                                                                                  )
                                                                              ? ('ปฏิเสธ' !=
                                                                                  functions.checkNullValueAndReturn(getJsonField(
                                                                                    widget.list?[leadListItemIndex],
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
                                                                                  ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  'QuotationCopy',
                                                                                  queryParameters: {
                                                                                    'quotation': serializeParam(
                                                                                      getJsonField(
                                                                                        widget.list?[leadListItemIndex],
                                                                                        r'''$.pdf_quotation''',
                                                                                      ),
                                                                                      ParamType.JSON,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              text: 'ดูใบเสนอราคา',
                                                                              options: FFButtonOptions(
                                                                                width: 115.0,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: Color(0xFF5D78FF),
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      color: Colors.white,
                                                                                      fontSize: 13.0,
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
                                                                      if ('manual' ==
                                                                          getJsonField(
                                                                            widget.list?[leadListItemIndex],
                                                                            r'''$.quotation_type''',
                                                                          ))
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
                                                                                      widget.list?[leadListItemIndex],
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
                                                                                        ));
                                                                                      },
                                                                                    );
                                                                                    if (_shouldSetState) setState(() {});
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
                                                                                          ).toString()),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        ));
                                                                                      },
                                                                                    );
                                                                                    if (_shouldSetState) setState(() {});
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
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: Container(
                                                                                            height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                            child: NonePackageShowStatusComponentWidget(
                                                                                              quotationStatusList: (GetNonePackageHistoryAPICall.quotationStatus(
                                                                                                (_model.getHistory?.jsonBody ?? ''),
                                                                                              ) as List)
                                                                                                  .map<String>((s) => s.toString())
                                                                                                  .toList()
                                                                                                  ?.map((e) => e.toString())
                                                                                                  .toList(),
                                                                                              updateAtList: (GetNonePackageHistoryAPICall.updateAt(
                                                                                                (_model.getHistory?.jsonBody ?? ''),
                                                                                              ) as List)
                                                                                                  .map<String>((s) => s.toString())
                                                                                                  .toList()
                                                                                                  ?.map((e) => e.toString())
                                                                                                  .toList(),
                                                                                              updaterList: (GetNonePackageHistoryAPICall.updaterName(
                                                                                                (_model.getHistory?.jsonBody ?? ''),
                                                                                              ) as List)
                                                                                                  .map<String>((s) => s.toString())
                                                                                                  .toList()
                                                                                                  ?.map((e) => e.toString())
                                                                                                  .toList(),
                                                                                              reasonNameList: (GetNonePackageHistoryAPICall.reasonName(
                                                                                                (_model.getHistory?.jsonBody ?? ''),
                                                                                              ) as List)
                                                                                                  .map<String>((s) => s.toString())
                                                                                                  .toList()
                                                                                                  ?.map((e) => e.toString())
                                                                                                  .toList(),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ));
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));

                                                                                  if (_shouldSetState) setState(() {});
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
                                                                                widget.list?[leadListItemIndex],
                                                                                r'''$.quotation_type''',
                                                                              )) &&
                                                                          (('-' !=
                                                                                  functions.checkNullValueAndReturn(getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.insurer_remark''',
                                                                                  ).toString())) &&
                                                                              ('' !=
                                                                                  functions.checkNullValueAndReturn(getJsonField(
                                                                                    widget.list?[leadListItemIndex],
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
                                                                                          widget.list?[leadListItemIndex],
                                                                                          r'''$.insurer_remark''',
                                                                                        ).toString())),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      ));
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
                                                                  padding: EdgeInsetsDirectional
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
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              fontSize: 13.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '' !=
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.net_premium_total''',
                                                                                )
                                                                            ? getJsonField(
                                                                                widget.list![leadListItemIndex],
                                                                                r'''$.net_premium_total''',
                                                                              ).toString()
                                                                            : '-',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 13.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if ((widget.checkPayment !=
                                                                            'cancle') &&
                                                                        ('ส่งเรื่องขอใบเสนอราคา' !=
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.quotation_status''',
                                                                                )
                                                                            ? true
                                                                            : ('' !=
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.pdf_quotation''',
                                                                                ))) &&
                                                                        ('manual' ==
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.quotation_type''',
                                                                                )
                                                                            ? ('ปฏิเสธ' !=
                                                                                functions.checkNullValueAndReturn(getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.insurer_status''',
                                                                                ).toString()))
                                                                            : true)
                                                                    ? true
                                                                    : false)
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if (columnHideInAppContentRecord!
                                                                          .isShowContent) {
                                                                        _model.getServerDateTime =
                                                                            await GetDateTimeAPICall.call(
                                                                          apiUrl:
                                                                              FFAppState().apiURLLocalState,
                                                                          token:
                                                                              FFAppState().accessToken,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        if (((_model.getServerDateTime?.statusCode ?? 200) ==
                                                                                200) &&
                                                                            (GetDateTimeAPICall.statusLayer1(
                                                                                  (_model.getServerDateTime?.jsonBody ?? ''),
                                                                                ) ==
                                                                                200)) {
                                                                          if (functions
                                                                              .checkWeekendDate(GetDateTimeAPICall.currentDateYMD(
                                                                            (_model.getServerDateTime?.jsonBody ??
                                                                                ''),
                                                                          ).toString())!) {
                                                                            if (('${getJsonField(
                                                                                      widget.list?[leadListItemIndex],
                                                                                      r'''$.cover_type_name''',
                                                                                    ).toString()}' ==
                                                                                    'ชั้น 1') ||
                                                                                functions.containWordinStringUrl(
                                                                                    'นอกเรท',
                                                                                    getJsonField(
                                                                                      widget.list?[leadListItemIndex],
                                                                                      r'''$.quotation_type_name''',
                                                                                    ).toString())!) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                    content: Text('วันเสาร์ / วันอาทิตย์ และวันหยุดนักขัตฤกษ์ ขายประกันรถยนต์ชั้น 2+,2, 3+ และ 3ในเรทเท่านั้น'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  ));
                                                                                },
                                                                              );
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                          }
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                content: Text('พบข้อผิดพลาด (${(_model.getServerDateTime?.statusCode ?? 200).toString()}), (${GetDateTimeAPICall.statusLayer1(
                                                                                  (_model.getServerDateTime?.jsonBody ?? ''),
                                                                                ).toString()})get date'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              ));
                                                                            },
                                                                          );
                                                                        }
                                                                      }
                                                                      setState(
                                                                          () {
                                                                        FFAppState().nonePackageFlagCarrier =
                                                                            false;
                                                                        FFAppState().nonePackageVehicleType =
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
                                                                        FFAppState().nonePackageSearchModelList =
                                                                            [];
                                                                        FFAppState().nonePackageUsedTypeCode =
                                                                            '';
                                                                        FFAppState().nonePackageUsedTypeName =
                                                                            'กรุณาเลือกลักษณะการใช้รถ';
                                                                        FFAppState().nonePackageCusFullname =
                                                                            'กรุณากรอกชื่อ';
                                                                        FFAppState().nonePackageCusPhone =
                                                                            'กรุณากรอกเบอร์โทรศัพท์';
                                                                        FFAppState().nonePackagePlate =
                                                                            '';
                                                                        FFAppState().nonePackageProvince =
                                                                            'กรุณาเลือกจังหวัดจดทะเบียน';
                                                                        FFAppState().nonePackageProvinceId =
                                                                            '';
                                                                        FFAppState().nonePackageSumInsured =
                                                                            'กรุณากรอกทุนประกัน';
                                                                        FFAppState().nonePackageFlagAct =
                                                                            true;
                                                                        FFAppState().nonePackageIsBrandSelect =
                                                                            false;
                                                                        FFAppState().nonePackageSearchModelIdList =
                                                                            [];
                                                                        FFAppState().nonePackageCarrierType =
                                                                            'กรุณาเลือกประเภทตู้เหล็ก';
                                                                        FFAppState().nonePackageFlagCoop =
                                                                            false;
                                                                        FFAppState().nonePackageTruckPart =
                                                                            'กรุณาเลือกส่วนของรถบรรทุก';
                                                                        FFAppState().nonePackageCusMembership =
                                                                            'กรุณาเลือกประเภทลูกค้า';
                                                                        FFAppState().nonePackageTruckCurrentPrice =
                                                                            'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                                                        FFAppState().nonePackagePlateAdditional =
                                                                            'กรุณากรอกเลขทะเบียนหางพ่วง';
                                                                        FFAppState().nonePackageTruckCarryPurpose =
                                                                            'กรุณากรอกรถใช้บรรทุกอะไร';
                                                                        FFAppState().nonePackageTrailerSumInsured =
                                                                            'กรุณากรอกทุนประกันหางพ่วง';
                                                                        FFAppState().nonePackageCarrierPrice =
                                                                            '';
                                                                        FFAppState().nonePackageInsurerIdList =
                                                                            [];
                                                                        FFAppState().nonePackageInsurerCodeList =
                                                                            [];
                                                                        FFAppState().nonePackageInsurerShortNameList =
                                                                            [];
                                                                        FFAppState().nonePackageInsurerNameList =
                                                                            [];
                                                                        FFAppState().nonePackageInsurerDisplayName =
                                                                            [];
                                                                        FFAppState().nonePackageInsurerIdOutputList =
                                                                            [];
                                                                        FFAppState().nonePackageInsurerCodeOutputList =
                                                                            [];
                                                                        FFAppState().nonePackageInsurerShortNameOutputList =
                                                                            [];
                                                                        FFAppState().nonePackageInsurerNameOutputList =
                                                                            [];
                                                                        FFAppState().nonePackageReason =
                                                                            [];
                                                                        FFAppState().nonePackageInsurerSelectedList =
                                                                            [];
                                                                        FFAppState().nonePackageCoverTypeId =
                                                                            '';
                                                                        FFAppState().nonePackageCoverTypeCode =
                                                                            '';
                                                                        FFAppState().nonePackageCoverTypeName =
                                                                            'กรุณาเลือกประเภทชั้นประกัน';
                                                                        FFAppState().nonePackageGarageTypeId =
                                                                            '';
                                                                        FFAppState().nonePackageGarageTypeName =
                                                                            'กรุณาเลือกประเภทการซ่อม';
                                                                        FFAppState().nonePackageGarageTypeCode =
                                                                            '';
                                                                        FFAppState().nonePackageFlagRenew =
                                                                            false;
                                                                        FFAppState().nonePackageOldVmiExpDate =
                                                                            'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                                                        FFAppState().nonePackageOldVmi =
                                                                            '';
                                                                        FFAppState().nonePackageOldVmiImageUrl =
                                                                            '';
                                                                        FFAppState().nonePackageIdCardImageUrl =
                                                                            '';
                                                                        FFAppState().nonePackageRenewImageUrlList =
                                                                            [];
                                                                        FFAppState().nonePackageRenewImageCheckList =
                                                                            [];
                                                                        FFAppState().nonePackageOldVmiImageUploadedCheck =
                                                                            false;
                                                                        FFAppState().nonePackageIdCardWatermarkUploadedCheck =
                                                                            false;
                                                                        FFAppState().buttonOrdinary =
                                                                            false;
                                                                        FFAppState().buttonCorporation =
                                                                            false;
                                                                        FFAppState().nonePackageCustomerType =
                                                                            '';
                                                                        FFAppState().nonePackageInsurerDisplayNameOutput =
                                                                            '';
                                                                        FFAppState().nonePackageImageOther =
                                                                            [];
                                                                        FFAppState().nonePackageImageFront =
                                                                            [];
                                                                        FFAppState().nonePackageImageRightFront =
                                                                            [];
                                                                        FFAppState().nonePackageImageRight =
                                                                            [];
                                                                        FFAppState().nonePackageImageRightRear =
                                                                            [];
                                                                        FFAppState().nonePackageImageRear =
                                                                            [];
                                                                        FFAppState().nonePackageImageLeftRear =
                                                                            [];
                                                                        FFAppState().nonePackageImageLeft =
                                                                            [];
                                                                        FFAppState().nonePackageImageLeftFront =
                                                                            [];
                                                                        FFAppState().nonePackageImageRoof =
                                                                            [];
                                                                        FFAppState().nonePackageTrailerImageFront =
                                                                            [];
                                                                        FFAppState().nonePackageTrailerImageRightFront =
                                                                            [];
                                                                        FFAppState().nonePackageTrailerImageRight =
                                                                            [];
                                                                        FFAppState().nonePackageTrailerImageRightRear =
                                                                            [];
                                                                        FFAppState().nonePackageTrailerImageRear =
                                                                            [];
                                                                        FFAppState().nonePackageTrailerImageLeftRear =
                                                                            [];
                                                                        FFAppState().nonePackageTrailerImageLeft =
                                                                            [];
                                                                        FFAppState().nonePackageTrailerImageLeftFront =
                                                                            [];
                                                                        FFAppState()
                                                                            .nonePackageInsurerOutputIndex = 0;
                                                                        FFAppState().nonePackageLeadId =
                                                                            '';
                                                                        FFAppState().nonePackageLeadNo =
                                                                            '';
                                                                        FFAppState().nonePackageCarImageUploadedList =
                                                                            [];
                                                                        FFAppState().nonePackageImageOldVmi =
                                                                            [];
                                                                        FFAppState().nonePackageImageCompanyBook =
                                                                            [];
                                                                        FFAppState().nonePackageImageIdCard =
                                                                            [];
                                                                        FFAppState().nonePackageImageBlueBook =
                                                                            [];
                                                                        FFAppState().nonePackageCompanyBookImageUploadedCheck =
                                                                            false;
                                                                        FFAppState().nonePackageCompanyBookImageUrl =
                                                                            '';
                                                                        FFAppState().nonePackageImageFrontUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageRightFrontUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageRightUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageRightRearUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageRearUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageLeftRearUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageLeftUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageLeftFrontUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageRoofUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageTrailerImageFrontUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageTrailerImageRightFrontUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageTrailerImageRightUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageTrailerImageRightRearUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageTrailerImageRearUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageTrailerImageLeftRearUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageTrailerImageLeftUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageTrailerImageLeftFrontUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageBlueBookUploaded =
                                                                            '';
                                                                        FFAppState().nonePackageImageOther1 =
                                                                            '';
                                                                        FFAppState().nonePackageImageOther2 =
                                                                            '';
                                                                        FFAppState().nonePackageImageOther3 =
                                                                            '';
                                                                        FFAppState().nonePackageImageOther4 =
                                                                            '';
                                                                        FFAppState().nonePackageImageOther5 =
                                                                            '';
                                                                        FFAppState().nonePackageImageOtherNameList =
                                                                            [];
                                                                        FFAppState().nonePackageSelectedInsurerShortName =
                                                                            '';
                                                                        FFAppState().nonePackageSelectedInsurerName =
                                                                            '';
                                                                        FFAppState().nonePackageSelectedInsurerShortNameList =
                                                                            [];
                                                                        FFAppState().nonePackageSelectedInsurerNameList =
                                                                            [];
                                                                        FFAppState().nonePackageFlagOldVmi =
                                                                            '';
                                                                        FFAppState().nonePackageWorkType =
                                                                            '';
                                                                      });
                                                                      if (widget
                                                                              .checkVMI ==
                                                                          '0') {
                                                                        if (('เตรียมข้อมูล' !=
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.quotation_status''',
                                                                                )) &&
                                                                            ('รอตัดสินใจ' !=
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.quotation_status''',
                                                                                )) &&
                                                                            ('ส่งเรื่องขอใบเสนอราคา' !=
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.quotation_status''',
                                                                                ))) {
                                                                          if (('อยู่ระหว่างตรวจสอบสภาพรถ' ==
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.quotation_status''',
                                                                                  )) ||
                                                                              ('อนุมัติ' ==
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.quotation_status''',
                                                                                  )) ||
                                                                              ('ไม่อนุมัติ' ==
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.quotation_status''',
                                                                                  )) ||
                                                                              ('ส่งเรื่องให้บริษัทประกันพิจารณา' ==
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.quotation_status''',
                                                                                  ))) {
                                                                            context.pushNamed(
                                                                              'insuranceInfoPage5',
                                                                              queryParameters: {
                                                                                'quotationId': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.quotation_id''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'leadDtlId': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.lead_dtl_id''',
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          }

                                                                          context
                                                                              .pushNamed(
                                                                            'insuranceInfoPage4_2',
                                                                            queryParameters:
                                                                                {
                                                                              'quotationId': serializeParam(
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.quotation_id''',
                                                                                ).toString(),
                                                                                ParamType.String,
                                                                              ),
                                                                              'leadDetailId': serializeParam(
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.lead_dtl_id''',
                                                                                ),
                                                                                ParamType.int,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        } else {
                                                                          if ('auto' ==
                                                                              getJsonField(
                                                                                widget.list?[leadListItemIndex],
                                                                                r'''$.quotation_type''',
                                                                              )) {
                                                                            context.pushNamed(
                                                                              'insuranceInfoPage1',
                                                                              queryParameters: {
                                                                                'quotationId': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.quotation_id''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'leadDtailId': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.lead_dtl_id''',
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          } else {
                                                                            if ('รอตัดสินใจ' ==
                                                                                getJsonField(
                                                                                  widget.list?[leadListItemIndex],
                                                                                  r'''$.quotation_status''',
                                                                                )) {
                                                                              setState(() {
                                                                                FFAppState().insuranceInfoPage1SaveDataCheckBool = false;
                                                                                FFAppState().insuranceInfoPage2SaveDataCheckBool = false;
                                                                                FFAppState().insuranceInfoPage3SaveDataCheckBool = false;
                                                                              });
                                                                            } else {
                                                                              context.pushNamed(
                                                                                'insuranceInfoPage1',
                                                                                queryParameters: {
                                                                                  'quotationId': serializeParam(
                                                                                    getJsonField(
                                                                                      widget.list?[leadListItemIndex],
                                                                                      r'''$.quotation_id''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'leadDtailId': serializeParam(
                                                                                    getJsonField(
                                                                                      widget.list?[leadListItemIndex],
                                                                                      r'''$.lead_dtl_id''',
                                                                                    ),
                                                                                    ParamType.int,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }

                                                                            context.pushNamed(
                                                                              'NonePackageSelectedInsurerPage',
                                                                              queryParameters: {
                                                                                'leadID': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.lead_id''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'coverTypeName': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.cover_type_name''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'garageTypeName': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.garage_type_name''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'insurerShortName': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.insurer_short_name''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'insurerName': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.insurer_name''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'quotationId': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.quotation_id''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'leadDtlId': serializeParam(
                                                                                  getJsonField(
                                                                                    widget.list?[leadListItemIndex],
                                                                                    r'''$.lead_dtl_id''',
                                                                                  ),
                                                                                  ParamType.int,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }
                                                                        }
                                                                      } else {
                                                                        if ('' !=
                                                                            getJsonField(
                                                                              widget.list?[leadListItemIndex],
                                                                              r'''$.VMI_documentUrl''',
                                                                            )) {
                                                                          await launchURL(
                                                                              getJsonField(
                                                                            widget.list![leadListItemIndex],
                                                                            r'''$.VMI_documentUrl''',
                                                                          ).toString());
                                                                          if (_shouldSetState)
                                                                            setState(() {});
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
                                                                              ));
                                                                            },
                                                                          );
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }
                                                                      }

                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                    },
                                                                    text: widget.checkVMI ==
                                                                            '0'
                                                                        ? 'ทำประกัน'
                                                                        : 'ดูกรมธรรม์',
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
                                                                      color: Color(
                                                                          0xFFDB771A),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                13.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              if (widget.checkTotal == 0 ? true : false)
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
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
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Text(
                                            'ไม่พบข้อมูลในระบบ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
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
