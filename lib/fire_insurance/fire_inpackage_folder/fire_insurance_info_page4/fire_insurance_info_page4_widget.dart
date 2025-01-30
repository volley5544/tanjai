import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/infomation_customer_fire_insurance_widget.dart';
import '/components/show_image_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'fire_insurance_info_page4_model.dart';
export 'fire_insurance_info_page4_model.dart';

class FireInsuranceInfoPage4Widget extends StatefulWidget {
  const FireInsuranceInfoPage4Widget({super.key});

  @override
  State<FireInsuranceInfoPage4Widget> createState() =>
      _FireInsuranceInfoPage4WidgetState();
}

class _FireInsuranceInfoPage4WidgetState
    extends State<FireInsuranceInfoPage4Widget> {
  late FireInsuranceInfoPage4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FireInsuranceInfoPage4Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'fireInsuranceInfoPage4'});
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

    return StreamBuilder<List<UrlLinkStorageRecord>>(
      stream: queryUrlLinkStorageRecord(
        queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where(
          'url_name',
          isEqualTo: 'cancel_loan',
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            fireInsuranceInfoPage4UrlLinkStorageRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final fireInsuranceInfoPage4UrlLinkStorageRecord =
            fireInsuranceInfoPage4UrlLinkStorageRecordList.isNotEmpty
                ? fireInsuranceInfoPage4UrlLinkStorageRecordList.first
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
                    context.pop();
                  },
                ),
                title: Text(
                  '4. ดำเนินงาน/ชำระเงิน',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Noto Sans Thai',
                        color: Color(0xFF003063),
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                  child: FutureBuilder<List<UrlLinkStorageRecord>>(
                    future: queryUrlLinkStorageRecordOnce(
                      queryBuilder: (urlLinkStorageRecord) =>
                          urlLinkStorageRecord.where(
                        'url_name',
                        isEqualTo: 'CTV',
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
                      List<UrlLinkStorageRecord>
                          columnCTVUrlLinkStorageRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final columnCTVUrlLinkStorageRecord =
                          columnCTVUrlLinkStorageRecordList.isNotEmpty
                              ? columnCTVUrlLinkStorageRecordList.first
                              : null;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FutureBuilder<List<UrlLinkStorageRecord>>(
                              future: queryUrlLinkStorageRecordOnce(
                                queryBuilder: (urlLinkStorageRecord) =>
                                    urlLinkStorageRecord.where(
                                  'url_name',
                                  isEqualTo: 'power_of_attorney',
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UrlLinkStorageRecord>
                                    columnAttoneyUrlLinkStorageRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final columnAttoneyUrlLinkStorageRecord =
                                    columnAttoneyUrlLinkStorageRecordList
                                            .isNotEmpty
                                        ? columnAttoneyUrlLinkStorageRecordList
                                            .first
                                        : null;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FutureBuilder<List<UrlLinkStorageRecord>>(
                                      future: queryUrlLinkStorageRecordOnce(
                                        queryBuilder: (urlLinkStorageRecord) =>
                                            urlLinkStorageRecord.where(
                                          'url_name',
                                          isEqualTo: 'idcard',
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<UrlLinkStorageRecord>
                                            columnidcardUrlLinkStorageRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final columnidcardUrlLinkStorageRecord =
                                            columnidcardUrlLinkStorageRecordList
                                                    .isNotEmpty
                                                ? columnidcardUrlLinkStorageRecordList
                                                    .first
                                                : null;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<
                                                List<UrlLinkStorageRecord>>(
                                              future:
                                                  queryUrlLinkStorageRecordOnce(
                                                queryBuilder:
                                                    (urlLinkStorageRecord) =>
                                                        urlLinkStorageRecord
                                                            .where(
                                                  'url_name',
                                                  isEqualTo: 'Motor',
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
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UrlLinkStorageRecord>
                                                    columnMotorUrlLinkStorageRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final columnMotorUrlLinkStorageRecord =
                                                    columnMotorUrlLinkStorageRecordList
                                                            .isNotEmpty
                                                        ? columnMotorUrlLinkStorageRecordList
                                                            .first
                                                        : null;

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .infomationCustomerFireInsuranceModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          InfomationCustomerFireInsuranceWidget(),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
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
                                                                0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
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
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFE6E6E6),
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.11,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.11,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFD9761A),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFFAFAFA),
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '1',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                Color(0xFFFAFAFA),
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.06,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            32.0,
                                                                        child:
                                                                            Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFFD9761A),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.11,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.11,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFD9761A),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFFB3B3B3),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '2',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFFAFAFA),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.06,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            32.0,
                                                                        child:
                                                                            Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFFD9761A),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.11,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.11,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFD9761A),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFFB3B3B3),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '3',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFFAFAFA),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.06,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            32.0,
                                                                        child:
                                                                            Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFFD9761A),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.11,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.11,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFD9761A),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFFB3B3B3),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '4',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFFAFAFA),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.06,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            32.0,
                                                                        child:
                                                                            Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFFB3B3B3),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.11,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.11,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFFB3B3B3),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '5',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFB3B3B3),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await actions
                                                              .urlLauncherActionCopy(
                                                            FFAppState()
                                                                .insuranceinfoPage3PdfFileapplication,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 33.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .file_download_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 22.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'ใบคําขอเอาประกันการประกันอัคคีภัยสําหรับที่อยู่อาศัย',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFF003063),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await actions
                                                              .urlLauncherActionCopy(
                                                            'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/filePDF%2F%E0%B8%84%E0%B8%B3%E0%B8%82%E0%B8%AD%E0%B9%81%E0%B8%9A%E0%B9%88%E0%B8%87%E0%B8%8A%E0%B8%B3%E0%B8%A3%E0%B8%B0%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B9%80%E0%B8%9A%E0%B8%B5%E0%B9%89%E0%B8%A2%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B1%E0%B8%99%E0%B8%A0%E0%B8%B1%E0%B8%A2_%E0%B8%AD%E0%B8%B1%E0%B8%84%E0%B8%84%E0%B8%B5%E0%B8%A0%E0%B8%B1%E0%B8%A2-v1_271.pdf?alt=media&token=963cdead-fe30-4cb8-b4d8-ff0f8bd7e58f',
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 33.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .file_download_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 22.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'คําขอแบ่งชําระค่าเบี้ยประกันอัคคีภัย (เป้า ง)',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFF003063),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'ใบคําขอเอาประกันอัคคีภัยสําหรับที่อยู่อาศัย',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'บังคับอัพโหลดรูป',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFFB0606),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 45.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.74,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                    context: context,
                                                                                    imageQuality: 30,
                                                                                    allowPhoto: true,
                                                                                  );
                                                                                  if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                    safeSetState(() => _model.isDataUploading1 = true);
                                                                                    var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                    var downloadUrls = <String>[];
                                                                                    try {
                                                                                      selectedUploadedFiles = selectedMedia
                                                                                          .map((m) => FFUploadedFile(
                                                                                                name: m.storagePath.split('/').last,
                                                                                                bytes: m.bytes,
                                                                                                height: m.dimensions?.height,
                                                                                                width: m.dimensions?.width,
                                                                                                blurHash: m.blurHash,
                                                                                              ))
                                                                                          .toList();

                                                                                      downloadUrls = (await Future.wait(
                                                                                        selectedMedia.map(
                                                                                          (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                        ),
                                                                                      ))
                                                                                          .where((u) => u != null)
                                                                                          .map((u) => u!)
                                                                                          .toList();
                                                                                    } finally {
                                                                                      _model.isDataUploading1 = false;
                                                                                    }
                                                                                    if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                      safeSetState(() {
                                                                                        _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                        _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                      });
                                                                                    } else {
                                                                                      safeSetState(() {});
                                                                                      return;
                                                                                    }
                                                                                  }

                                                                                  FFAppState().insuranceInfoImageApplication = _model.uploadedFileUrl1;
                                                                                  FFAppState().insuranceInfoPage4ImageApplication = _model.uploadedFileUrl1;
                                                                                  safeSetState(() {});
                                                                                  if (_model.uploadedFileUrl1 != null && _model.uploadedFileUrl1 != '') {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'เลือกรูปสำเร็จ!',
                                                                                          style: TextStyle(
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 3000),
                                                                                        backgroundColor: Color(0xB2000000),
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'เลือกรูปล้มเหลว กรุณาลองอีกครั้ง',
                                                                                          style: TextStyle(
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 3000),
                                                                                        backgroundColor: Color(0xB2000000),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  width: 150.0,
                                                                                  height: 60.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFFCEFE4),
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.file_upload_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'อัพโหลดรูปที่ 1',
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFFD9761A),
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                                                                              child: Text(
                                                                                'สถานะ :',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            if (_model.uploadedFileUrl1 == null ||
                                                                                _model.uploadedFileUrl1 == '')
                                                                              Text(
                                                                                'ยังไม่อัพโหลด',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            if (_model.uploadedFileUrl1 != null &&
                                                                                _model.uploadedFileUrl1 != '')
                                                                              Text(
                                                                                'อัพโหลดสำเร็จ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if ((FFAppState().insuranceInfoPage4ImageApplication != '') &&
                                                                        (FFAppState().insuranceInfoPage4ImageApplication !=
                                                                            '') &&
                                                                        (FFAppState().insuranceInfoPage4ImageApplication !=
                                                                                null &&
                                                                            FFAppState().insuranceInfoPage4ImageApplication !=
                                                                                ''))
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
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Color(0xB3000000),
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
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
                                                                                      child: ShowImageComponentWidget(
                                                                                        imageUrl: FFAppState().insuranceInfoPage4ImageApplication != '' ? functions.stringToImgPath(FFAppState().insuranceInfoPage4ImageApplication)! : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Icon(
                                                                            Icons.content_paste_search_rounded,
                                                                            color:
                                                                                Color(0xFF354052),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (!((FFAppState().insuranceInfoPage4ImageApplication != '') &&
                                                                        (FFAppState().insuranceInfoPage4ImageApplication !=
                                                                            '') &&
                                                                        (FFAppState().insuranceInfoPage4ImageApplication !=
                                                                                null &&
                                                                            FFAppState().insuranceInfoPage4ImageApplication !=
                                                                                '')))
                                                                      Flexible(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                Color(0xFFFC0A0A),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (FFAppState().insuranceInfoPage4ImageApplication !=
                                                                            null &&
                                                                        FFAppState().insuranceInfoPage4ImageApplication !=
                                                                            '')
                                                                      Flexible(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_sharp,
                                                                            color:
                                                                                Color(0xFF00FD76),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model.uploadedFileUrl1 !=
                                                                    null &&
                                                                _model.uploadedFileUrl1 !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 45.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.74,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                      context: context,
                                                                                      imageQuality: 30,
                                                                                      allowPhoto: true,
                                                                                    );
                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                      safeSetState(() => _model.isDataUploading2 = true);
                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                      var downloadUrls = <String>[];
                                                                                      try {
                                                                                        selectedUploadedFiles = selectedMedia
                                                                                            .map((m) => FFUploadedFile(
                                                                                                  name: m.storagePath.split('/').last,
                                                                                                  bytes: m.bytes,
                                                                                                  height: m.dimensions?.height,
                                                                                                  width: m.dimensions?.width,
                                                                                                  blurHash: m.blurHash,
                                                                                                ))
                                                                                            .toList();

                                                                                        downloadUrls = (await Future.wait(
                                                                                          selectedMedia.map(
                                                                                            (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                          ),
                                                                                        ))
                                                                                            .where((u) => u != null)
                                                                                            .map((u) => u!)
                                                                                            .toList();
                                                                                      } finally {
                                                                                        _model.isDataUploading2 = false;
                                                                                      }
                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                        safeSetState(() {
                                                                                          _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                          _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                        });
                                                                                      } else {
                                                                                        safeSetState(() {});
                                                                                        return;
                                                                                      }
                                                                                    }

                                                                                    FFAppState().insuranceInfoPage4ImageApp2 = _model.uploadedFileUrl2;
                                                                                    safeSetState(() {});
                                                                                    if (_model.uploadedFileUrl2 != null && _model.uploadedFileUrl2 != '') {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'เลือกรูปสำเร็จ!',
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 3000),
                                                                                          backgroundColor: Color(0xB2000000),
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'เลือกรูปล้มเหลว กรุณาลองอีกครั้ง',
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 3000),
                                                                                          backgroundColor: Color(0xB2000000),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 150.0,
                                                                                    height: 60.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFFCEFE4),
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.file_upload_outlined,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 22.0,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'อัพโหลดรูปที่ 2',
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                                      color: Color(0xFFD9761A),
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  'สถานะ :',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              if (_model.uploadedFileUrl2 == null || _model.uploadedFileUrl2 == '')
                                                                                Text(
                                                                                  'ยังไม่อัพโหลด',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              if (_model.uploadedFileUrl2 != null && _model.uploadedFileUrl2 != '')
                                                                                Text(
                                                                                  'อัพโหลดสำเร็จ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if ((FFAppState().insuranceInfoPage4ImageApp2 != '') &&
                                                                          (FFAppState().insuranceInfoPage4ImageApp2 !=
                                                                              '') &&
                                                                          (FFAppState().insuranceInfoPage4ImageApp2 != null &&
                                                                              FFAppState().insuranceInfoPage4ImageApp2 != ''))
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
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Color(0xB3000000),
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
                                                                                        child: ShowImageComponentWidget(
                                                                                          imageUrl: FFAppState().insuranceInfoPage4ImageApp2 != '' ? functions.stringToImgPath(FFAppState().insuranceInfoPage4ImageApp2)! : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Icon(
                                                                              Icons.content_paste_search_rounded,
                                                                              color: Color(0xFF354052),
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (!((FFAppState().insuranceInfoPage4ImageApp2 != '') &&
                                                                          (FFAppState().insuranceInfoPage4ImageApp2 !=
                                                                              '') &&
                                                                          (FFAppState().insuranceInfoPage4ImageApp2 != null &&
                                                                              FFAppState().insuranceInfoPage4ImageApp2 != '')))
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Icon(
                                                                              Icons.close,
                                                                              color: Color(0xFFFC0A0A),
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if ((FFAppState().insuranceInfoPage4ImageApp2 != '') &&
                                                                          (FFAppState().insuranceInfoPage4ImageApp2 !=
                                                                              '') &&
                                                                          (FFAppState().insuranceInfoPage4ImageApp2 != null &&
                                                                              FFAppState().insuranceInfoPage4ImageApp2 != ''))
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Icon(
                                                                              Icons.check_sharp,
                                                                              color: Color(0xFF00FD76),
                                                                              size: 24.0,
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'คําขอแบ่งชําระค่าเบี้ยประกันอัคคีภัย (เป้า ง)',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'บังคับอัพโหลดรูป',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFFB0606),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 45.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.74,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                    context: context,
                                                                                    imageQuality: 30,
                                                                                    allowPhoto: true,
                                                                                  );
                                                                                  if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                    safeSetState(() => _model.isDataUploading3 = true);
                                                                                    var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                    var downloadUrls = <String>[];
                                                                                    try {
                                                                                      selectedUploadedFiles = selectedMedia
                                                                                          .map((m) => FFUploadedFile(
                                                                                                name: m.storagePath.split('/').last,
                                                                                                bytes: m.bytes,
                                                                                                height: m.dimensions?.height,
                                                                                                width: m.dimensions?.width,
                                                                                                blurHash: m.blurHash,
                                                                                              ))
                                                                                          .toList();

                                                                                      downloadUrls = (await Future.wait(
                                                                                        selectedMedia.map(
                                                                                          (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                        ),
                                                                                      ))
                                                                                          .where((u) => u != null)
                                                                                          .map((u) => u!)
                                                                                          .toList();
                                                                                    } finally {
                                                                                      _model.isDataUploading3 = false;
                                                                                    }
                                                                                    if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                      safeSetState(() {
                                                                                        _model.uploadedLocalFile3 = selectedUploadedFiles.first;
                                                                                        _model.uploadedFileUrl3 = downloadUrls.first;
                                                                                      });
                                                                                    } else {
                                                                                      safeSetState(() {});
                                                                                      return;
                                                                                    }
                                                                                  }

                                                                                  FFAppState().insuranceInfoImageFileloanApplicationRegister = _model.uploadedFileUrl3;
                                                                                  FFAppState().insuranceInfoPage4FileLoanApplicationRegister = _model.uploadedFileUrl3;
                                                                                  safeSetState(() {});
                                                                                  if (_model.uploadedFileUrl3 != null && _model.uploadedFileUrl3 != '') {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'เลือกรูปสำเร็จ!',
                                                                                          style: TextStyle(
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 3000),
                                                                                        backgroundColor: Color(0xB2000000),
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'เลือกรูปล้มเหลว กรุณาลองอีกครั้ง',
                                                                                          style: TextStyle(
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 3000),
                                                                                        backgroundColor: Color(0xB2000000),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                  height: 60.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFFCEFE4),
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.file_upload_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'อัพโหลดรูป',
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFFD9761A),
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                                                                              child: Text(
                                                                                'สถานะ :',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            if (_model.uploadedFileUrl3 == null ||
                                                                                _model.uploadedFileUrl3 == '')
                                                                              Text(
                                                                                'ยังไม่อัพโหลด',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            if (_model.uploadedFileUrl3 != null &&
                                                                                _model.uploadedFileUrl3 != '')
                                                                              Text(
                                                                                'อัพโหลดสำเร็จ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if ((FFAppState().insuranceInfoPage4FileLoanApplicationRegister != '') &&
                                                                        (FFAppState().insuranceInfoPage4FileLoanApplicationRegister !=
                                                                            '') &&
                                                                        (FFAppState().insuranceInfoPage4FileLoanApplicationRegister !=
                                                                                null &&
                                                                            FFAppState().insuranceInfoPage4FileLoanApplicationRegister !=
                                                                                ''))
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
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Color(0xB3000000),
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
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
                                                                                      child: ShowImageComponentWidget(
                                                                                        imageUrl: FFAppState().insuranceInfoPage4FileLoanApplicationRegister != '' ? functions.stringToImgPath(FFAppState().insuranceInfoPage4FileLoanApplicationRegister)! : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Icon(
                                                                            Icons.content_paste_search_rounded,
                                                                            color:
                                                                                Color(0xFF354052),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (!((FFAppState().insuranceInfoPage4FileLoanApplicationRegister != '') &&
                                                                        (FFAppState().insuranceInfoPage4FileLoanApplicationRegister !=
                                                                            '') &&
                                                                        (FFAppState().insuranceInfoPage4FileLoanApplicationRegister !=
                                                                                null &&
                                                                            FFAppState().insuranceInfoPage4FileLoanApplicationRegister !=
                                                                                '')))
                                                                      Flexible(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                Color(0xFFFC0A0A),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (FFAppState().insuranceInfoPage4FileLoanApplicationRegister !=
                                                                            null &&
                                                                        FFAppState().insuranceInfoPage4FileLoanApplicationRegister !=
                                                                            '')
                                                                      Flexible(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_sharp,
                                                                            color:
                                                                                Color(0xFF00FD76),
                                                                            size:
                                                                                24.0,
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
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
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9761A),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (!(FFAppState()
                                                .insuranceInfoPage4ImageApplication !=
                                            null &&
                                        FFAppState()
                                                .insuranceInfoPage4ImageApplication !=
                                            '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณาอัพโหลดรูปหลักฐานการเซ็นใบคำขอเอาประกัน'),
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
                                      return;
                                    }
                                    if (!(FFAppState()
                                                .insuranceInfoPage4FileLoanApplicationRegister !=
                                            null &&
                                        FFAppState()
                                                .insuranceInfoPage4FileLoanApplicationRegister !=
                                            '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณาอัพโหลดรูปเอกสาร ใบคำขอสินเชื่อเป้า ง'),
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
                                      return;
                                    }

                                    context.pushNamed('Homepage_Request_4_1');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.payment,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-0.3, 0.0),
                                          child: Text(
                                            'ชำระเงิน',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 50.0)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
