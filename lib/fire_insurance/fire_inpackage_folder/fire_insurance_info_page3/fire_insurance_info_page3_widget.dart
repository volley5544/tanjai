import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/infomation_customer_fire_insurance_widget.dart';
import '/components/show_image_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'fire_insurance_info_page3_model.dart';
export 'fire_insurance_info_page3_model.dart';

class FireInsuranceInfoPage3Widget extends StatefulWidget {
  const FireInsuranceInfoPage3Widget({super.key});

  @override
  State<FireInsuranceInfoPage3Widget> createState() =>
      _FireInsuranceInfoPage3WidgetState();
}

class _FireInsuranceInfoPage3WidgetState
    extends State<FireInsuranceInfoPage3Widget> {
  late FireInsuranceInfoPage3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FireInsuranceInfoPage3Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'fireInsuranceInfoPage3'});
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
                await Future.delayed(const Duration(milliseconds: 500));
                context.pop();
              },
            ),
            title: Text(
              '3. เอกสารประกอบ',
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
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 0.0),
              child: FutureBuilder<List<UrlLinkStorageRecord>>(
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
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<UrlLinkStorageRecord> columnUrlLinkStorageRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnUrlLinkStorageRecord =
                      columnUrlLinkStorageRecordList.isNotEmpty
                          ? columnUrlLinkStorageRecordList.first
                          : null;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model:
                                  _model.infomationCustomerFireInsuranceModel,
                              updateCallback: () => safeSetState(() {}),
                              child: InfomationCustomerFireInsuranceWidget(),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1.0,
                                      color: Color(0x33000000),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFE6E6E6),
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFD9761A),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '1',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFFAFAFA),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.06,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 32.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFFD9761A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.11,
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.11,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD9761A),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '2',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFAFAFA),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.06,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 32.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFFD9761A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.11,
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.11,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD9761A),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '3',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFAFAFA),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.06,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 32.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFFB3B3B3),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.11,
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.11,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '4',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFB3B3B3),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.06,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 32.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFFB3B3B3),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.11,
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.11,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '5',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFB3B3B3),
                                                  fontSize: 15.0,
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await actions.urlLauncherActionCopy(
                                        'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/filePDF%2F%E0%B8%AB%E0%B8%99%E0%B8%B1%E0%B8%87%E0%B8%AA%E0%B8%B7%E0%B8%AD%E0%B8%82%E0%B8%AD%E0%B8%9A%E0%B8%AD%E0%B8%81%E0%B9%80%E0%B8%A5%E0%B8%B4%E0%B8%81%E0%B8%AA%E0%B8%B1%E0%B8%8D%E0%B8%8D%E0%B8%B2%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B1%E0%B8%99%E0%B8%AD%E0%B8%B1%E0%B8%84%E0%B8%84%E0%B8%B5%E0%B8%A0%E0%B8%B1%E0%B8%A2-v1_27122567.pdf?alt=media&token=993e0a74-0f28-4bdb-b1f1-8344cae52186',
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 33.0,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.file_download_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'หนังสือขอบอกเลิกสัญญาประกันภัย',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFF003063),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await actions.urlLauncherActionCopy(
                                        'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/filePDF%2F%E0%B8%AB%E0%B8%99%E0%B8%B1%E0%B8%87%E0%B8%AA%E0%B8%B7%E0%B8%AD%E0%B8%A1%E0%B8%AD%E0%B8%9A%E0%B8%AD%E0%B8%B3%E0%B8%99%E0%B8%B2%E0%B8%88-v1_%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B1%E0%B8%99%E0%B8%AD%E0%B8%B1%E0%B8%84%E0%B8%84%E0%B8%B5%E0%B8%A0%E0%B8%B1%E0%B8%A2_27122567.pdf?alt=media&token=20a7f59e-f74b-4dc5-b0db-cc61dbf86d5c',
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 33.0,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.file_download_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'หนังสือมอบอำนาจยกเลิกกรมธรรม์',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFF003063),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if ((FFAppState().nonePackageWorkType !=
                                        'งานต่ออายุ') &&
                                    (FFAppState().insuranceinfoActType !=
                                        'CMI') &&
                                    (FFAppState().insuranceinfoActType != 'MC'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'หนังสือขอบอกเลิกสัญญาประกันภัย',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              if (FFAppState()
                                                      .insuranceInfocoverType ==
                                                  'ชั้น 1')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
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
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.74,
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  imageQuality:
                                                                      30,
                                                                  allowPhoto:
                                                                      true,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading1 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
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

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    _model.isDataUploading1 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile1 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl1 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                FFAppState()
                                                                        .insuranceInfoPage4FileCancelLoan =
                                                                    _model
                                                                        .uploadedFileUrl1;
                                                                safeSetState(
                                                                    () {});
                                                                if (_model.uploadedFileUrl1 !=
                                                                        null &&
                                                                    _model.uploadedFileUrl1 !=
                                                                        '') {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'เลือกรูปสำเร็จ!',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              3000),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xB2000000),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'เลือกรูปล้มเหลว กรุณาลองอีกครั้ง',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              3000),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xB2000000),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFCEFE4),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .file_upload_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'อัพโหลดรูป',
                                                                            textAlign:
                                                                                TextAlign.start,
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              'สถานะ :',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (!((FFAppState()
                                                                      .insuranceInfoPage4FileCancelLoan !=
                                                                  '') &&
                                                              (FFAppState()
                                                                      .insuranceInfoPage4FileCancelLoan !=
                                                                  '') &&
                                                              (FFAppState()
                                                                          .insuranceInfoPage4FileCancelLoan !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .insuranceInfoPage4FileCancelLoan !=
                                                                      '')))
                                                            Text(
                                                              'ยังไม่อัพโหลด',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          if ((FFAppState().insuranceInfoPage4FileCancelLoan != '') &&
                                                              (FFAppState()
                                                                      .insuranceInfoPage4FileCancelLoan !=
                                                                  '') &&
                                                              (FFAppState()
                                                                          .insuranceInfoPage4FileCancelLoan !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .insuranceInfoPage4FileCancelLoan !=
                                                                      ''))
                                                            Text(
                                                              'อัพโหลดสำเร็จ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if ((FFAppState().insuranceInfoPage4FileCancelLoan != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage4FileCancelLoan !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage4FileCancelLoan !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage4FileCancelLoan !=
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
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Color(0xB3000000),
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height: double
                                                                        .infinity,
                                                                    child:
                                                                        ShowImageComponentWidget(
                                                                      imageUrl: FFAppState().insuranceInfoPage4FileCancelLoan !=
                                                                              ''
                                                                          ? functions
                                                                              .stringToImgPath(FFAppState().insuranceInfoPage4FileCancelLoan)!
                                                                          : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Icon(
                                                          Icons
                                                              .content_paste_search_rounded,
                                                          color:
                                                              Color(0xFF354052),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPage4FileCancelLoan !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage4FileCancelLoan !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage4FileCancelLoan !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage4FileCancelLoan !=
                                                              '')))
                                                    Flexible(
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Icon(
                                                          Icons.close,
                                                          color:
                                                              Color(0xFFFC0A0A),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPage4FileCancelLoan != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage4FileCancelLoan !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage4FileCancelLoan !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage4FileCancelLoan !=
                                                              ''))
                                                    Flexible(
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Icon(
                                                          Icons.check_sharp,
                                                          color:
                                                              Color(0xFF00FD76),
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
                                if (FFAppState().nonePackageWorkType !=
                                    'งานต่ออายุ')
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'หนังสือมอบอำนาจยกเลิกกรมธรรม์',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'บังคับอัพโหลดรูป',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.74,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final selectedMedia =
                                                                  await selectMediaWithSourceBottomSheet(
                                                                context:
                                                                    context,
                                                                imageQuality:
                                                                    30,
                                                                allowPhoto:
                                                                    true,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                safeSetState(() =>
                                                                    _model.isDataUploading2 =
                                                                        true);
                                                                var selectedUploadedFiles =
                                                                    <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                    <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                              FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();

                                                                  downloadUrls = (await Future
                                                                          .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                      (m) async => await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading2 =
                                                                      false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length &&
                                                                    downloadUrls
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.uploadedLocalFile2 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                    _model.uploadedFileUrl2 =
                                                                        downloadUrls
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }

                                                              FFAppState()
                                                                      .InsuranceInfoPage4PowerOfAttoney =
                                                                  _model
                                                                      .uploadedFileUrl2;
                                                              safeSetState(
                                                                  () {});
                                                              if (_model.uploadedFileUrl2 !=
                                                                      null &&
                                                                  _model.uploadedFileUrl2 !=
                                                                      '') {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'เลือกรูปสำเร็จ!',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xB2000000),
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'เลือกรูปล้มเหลว กรุณาลองอีกครั้ง',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xB2000000),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.35,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFFCEFE4),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .file_upload_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'อัพโหลดรูป',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            'สถานะ :',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        if (!((FFAppState()
                                                                    .InsuranceInfoPage4PowerOfAttoney !=
                                                                '') &&
                                                            (FFAppState()
                                                                    .InsuranceInfoPage4PowerOfAttoney !=
                                                                '') &&
                                                            (FFAppState()
                                                                        .InsuranceInfoPage4PowerOfAttoney !=
                                                                    null &&
                                                                FFAppState()
                                                                        .InsuranceInfoPage4PowerOfAttoney !=
                                                                    '')))
                                                          Text(
                                                            'ยังไม่อัพโหลด',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        if ((FFAppState().InsuranceInfoPage4PowerOfAttoney != '') &&
                                                            (FFAppState()
                                                                    .InsuranceInfoPage4PowerOfAttoney !=
                                                                '') &&
                                                            (FFAppState()
                                                                        .InsuranceInfoPage4PowerOfAttoney !=
                                                                    null &&
                                                                FFAppState()
                                                                        .InsuranceInfoPage4PowerOfAttoney !=
                                                                    ''))
                                                          Text(
                                                            'อัพโหลดสำเร็จ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if ((FFAppState().InsuranceInfoPage4PowerOfAttoney != '') &&
                                                    (FFAppState()
                                                            .InsuranceInfoPage4PowerOfAttoney !=
                                                        '') &&
                                                    (FFAppState()
                                                                .InsuranceInfoPage4PowerOfAttoney !=
                                                            null &&
                                                        FFAppState()
                                                                .InsuranceInfoPage4PowerOfAttoney !=
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
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Color(0xB3000000),
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      ShowImageComponentWidget(
                                                                    imageUrl: FFAppState().InsuranceInfoPage4PowerOfAttoney !=
                                                                            ''
                                                                        ? functions
                                                                            .stringToImgPath(FFAppState().InsuranceInfoPage4PowerOfAttoney)!
                                                                        : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Icon(
                                                        Icons
                                                            .content_paste_search_rounded,
                                                        color:
                                                            Color(0xFF354052),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                if (!((FFAppState()
                                                            .InsuranceInfoPage4PowerOfAttoney !=
                                                        '') &&
                                                    (FFAppState()
                                                            .InsuranceInfoPage4PowerOfAttoney !=
                                                        '') &&
                                                    (FFAppState()
                                                                .InsuranceInfoPage4PowerOfAttoney !=
                                                            null &&
                                                        FFAppState()
                                                                .InsuranceInfoPage4PowerOfAttoney !=
                                                            '')))
                                                  Flexible(
                                                    child: Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Icon(
                                                        Icons.close,
                                                        color:
                                                            Color(0xFFFC0A0A),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                if ((FFAppState().InsuranceInfoPage4PowerOfAttoney != '') &&
                                                    (FFAppState()
                                                            .InsuranceInfoPage4PowerOfAttoney !=
                                                        '') &&
                                                    (FFAppState()
                                                                .InsuranceInfoPage4PowerOfAttoney !=
                                                            null &&
                                                        FFAppState()
                                                                .InsuranceInfoPage4PowerOfAttoney !=
                                                            ''))
                                                  Flexible(
                                                    child: Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Icon(
                                                        Icons.check_sharp,
                                                        color:
                                                            Color(0xFF00FD76),
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
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'สำเนาบัตรประชาชนผู้เอาประกัน',
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
                                              'บังคับอัพโหลดรูป',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFFB0606),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.74,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              imageQuality: 30,
                                                              allowPhoto: true,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              safeSetState(() =>
                                                                  _model.isDataUploading3 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                _model.isDataUploading3 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.uploadedLocalFile3 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl3 =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            }

                                                            FFAppState()
                                                                    .insuranceInfoPage3ImageIdCard =
                                                                _model
                                                                    .uploadedFileUrl3;
                                                            safeSetState(() {});
                                                            if (_model.uploadedFileUrl3 !=
                                                                    null &&
                                                                _model.uploadedFileUrl3 !=
                                                                    '') {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'เลือกรูปสำเร็จ!',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          3000),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xB2000000),
                                                                ),
                                                              );
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'เลือกรูปล้มเหลว กรุณาลองอีกครั้ง',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          3000),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xB2000000),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.35,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFFCEFE4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .file_upload_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'อัพโหลดรูป',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          'สถานะ :',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!((FFAppState()
                                                                  .insuranceInfoPage3ImageIdCard !=
                                                              '') &&
                                                          (FFAppState()
                                                                  .insuranceInfoPage3ImageIdCard !=
                                                              '') &&
                                                          (FFAppState()
                                                                      .insuranceInfoPage3ImageIdCard !=
                                                                  null &&
                                                              FFAppState()
                                                                      .insuranceInfoPage3ImageIdCard !=
                                                                  '')))
                                                        Text(
                                                          'ยังไม่อัพโหลด',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      if ((FFAppState().insuranceInfoPage3ImageIdCard != '') &&
                                                          (FFAppState()
                                                                  .insuranceInfoPage3ImageIdCard !=
                                                              '') &&
                                                          (FFAppState()
                                                                      .insuranceInfoPage3ImageIdCard !=
                                                                  null &&
                                                              FFAppState()
                                                                      .insuranceInfoPage3ImageIdCard !=
                                                                  ''))
                                                        Text(
                                                          'อัพโหลดสำเร็จ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if ((FFAppState().insuranceInfoPage3ImageIdCard != '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageIdCard !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageIdCard !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageIdCard !=
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
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Color(0xB3000000),
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    ShowImageComponentWidget(
                                                                  imageUrl: FFAppState()
                                                                              .insuranceInfoPage3ImageIdCard !=
                                                                          ''
                                                                      ? functions
                                                                          .stringToImgPath(
                                                                              FFAppState().insuranceInfoPage3ImageIdCard)!
                                                                      : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons
                                                          .content_paste_search_rounded,
                                                      color: Color(0xFF354052),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              if (!((FFAppState()
                                                          .insuranceInfoPage3ImageIdCard !=
                                                      '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageIdCard !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageIdCard !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageIdCard !=
                                                          '')))
                                                Flexible(
                                                  child: Container(
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              if ((FFAppState().insuranceInfoPage3ImageIdCard != '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageIdCard !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageIdCard !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageIdCard !=
                                                          ''))
                                                Flexible(
                                                  child: Container(
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  'สำเนาบัตรประชาชนสำหรับมอบอำนาจ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'บังคับอัพโหลดรูป',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(3.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .content_paste_search_rounded,
                                                      color: Color(0xFF354052),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(3.0, 0.0,
                                                                0.0, 0.0),
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
                                                        context.pushNamed(
                                                          'SampleIDcard',
                                                          queryParameters: {
                                                            'fromPage':
                                                                serializeParam(
                                                              'Step4',
                                                              ParamType.String,
                                                            ),
                                                            'imageUrl':
                                                                serializeParam(
                                                              columnUrlLinkStorageRecord
                                                                  ?.urlLink,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Text(
                                                        'ดูตัวอย่าง',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                            ),
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
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.74,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final selectedMedia =
                                                                  await selectMediaWithSourceBottomSheet(
                                                                context:
                                                                    context,
                                                                imageQuality:
                                                                    30,
                                                                allowPhoto:
                                                                    true,
                                                              );
                                                              if (selectedMedia !=
                                                                      null &&
                                                                  selectedMedia.every((m) =>
                                                                      validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                safeSetState(() =>
                                                                    _model.isDataUploading4 =
                                                                        true);
                                                                var selectedUploadedFiles =
                                                                    <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                    <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                              FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();

                                                                  downloadUrls = (await Future
                                                                          .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                      (m) async => await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading4 =
                                                                      false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length &&
                                                                    downloadUrls
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.uploadedLocalFile4 =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                    _model.uploadedFileUrl4 =
                                                                        downloadUrls
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }

                                                              FFAppState()
                                                                      .insuranceInfoPage4IdCardPowerattorney =
                                                                  _model
                                                                      .uploadedFileUrl4;
                                                              safeSetState(
                                                                  () {});
                                                              if (_model.uploadedFileUrl4 !=
                                                                      null &&
                                                                  _model.uploadedFileUrl4 !=
                                                                      '') {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'เลือกรูปสำเร็จ!',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xB2000000),
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'เลือกรูปล้มเหลว กรุณาลองอีกครั้ง',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xB2000000),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.35,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFFCEFE4),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .file_upload_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            22.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'อัพโหลดรูป',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            'สถานะ :',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        if (_model.uploadedFileUrl4 ==
                                                                null ||
                                                            _model.uploadedFileUrl4 ==
                                                                '')
                                                          Text(
                                                            'ยังไม่อัพโหลด',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        if (_model.uploadedFileUrl4 !=
                                                                null &&
                                                            _model.uploadedFileUrl4 !=
                                                                '')
                                                          Text(
                                                            'อัพโหลดสำเร็จ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if ((FFAppState().insuranceInfoPage4IdCardPowerattorney != '') &&
                                                    (FFAppState()
                                                            .insuranceInfoPage4IdCardPowerattorney !=
                                                        '') &&
                                                    (FFAppState()
                                                                .insuranceInfoPage4IdCardPowerattorney !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoPage4IdCardPowerattorney !=
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
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Color(0xB3000000),
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      ShowImageComponentWidget(
                                                                    imageUrl: FFAppState().insuranceInfoPage4IdCardPowerattorney !=
                                                                            ''
                                                                        ? functions
                                                                            .stringToImgPath(FFAppState().insuranceInfoPage4IdCardPowerattorney)!
                                                                        : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Icon(
                                                        Icons
                                                            .content_paste_search_rounded,
                                                        color:
                                                            Color(0xFF354052),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                if (!((FFAppState()
                                                            .insuranceInfoPage4IdCardPowerattorney !=
                                                        '') &&
                                                    (FFAppState()
                                                            .insuranceInfoPage4IdCardPowerattorney !=
                                                        '') &&
                                                    (FFAppState()
                                                                .insuranceInfoPage4IdCardPowerattorney !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoPage4IdCardPowerattorney !=
                                                            '')))
                                                  Flexible(
                                                    child: Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Icon(
                                                        Icons.close,
                                                        color:
                                                            Color(0xFFFC0A0A),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                            .insuranceInfoPage4IdCardPowerattorney !=
                                                        null &&
                                                    FFAppState()
                                                            .insuranceInfoPage4IdCardPowerattorney !=
                                                        '')
                                                  Flexible(
                                                    child: Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Icon(
                                                        Icons.check_sharp,
                                                        color:
                                                            Color(0xFF00FD76),
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
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'รายละเอียดความยินยอม',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '**ต้องอ่านให้ลูกค้าฟังอย่างครบถ้วนทีละข้อ**',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 10,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '  1.การให้ความยินยอบในการเก็บรวบรวม ใช้และเปิดเผยข้อมูลส่วนบุคคล',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.3,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .sensitiveConsentValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.sensitiveConsentValue =
                                                                  newValue!);
                                                        },
                                                        side: BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        checkColor:
                                                            Color(0xFF00B505),
                                                      ),
                                                    ),
                                                    Text(
                                                      'ยินยอม',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '  2.ผู้เอาประกันภัยและผู้รับประโยชน์/ ผู้ชำระเบี้ย ไม่มีความสับพันธ์ ไม่ว่าทางตรงหรือทางอ้อม กับประเทศอิหร่าน เกาหลีเหนือ รัสเซีย ซีเรีย ในทุก\nประการ',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.3,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .sanctionConsentValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.sanctionConsentValue =
                                                                  newValue!);
                                                        },
                                                        side: BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        checkColor:
                                                            Color(0xFF00B505),
                                                      ),
                                                    ),
                                                    Text(
                                                      'ยินยอม',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '3.ข้าพเจ้ายินยอมให้บริษัทจัดเก็บรวบรวม ใช้และเปิดเผยข้อมูลส่วนบุคคลของข้าพเจ้าเพื่อประชาสัมพันธ์ วิเคราะห์การตลาด และน่าเสนอหรือให้ข้อมูลที่เกี่ยวข้อง กับผลิตภัณฑ์ การให้บริการหรือสิทธิประโยชน์ต่างๆ ของบริษัท หรือบริษัทในเครือศรีสวัสดิ์ หรือคู่สัญญาของบริษัท',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.3,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .privacyConsentValue ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.privacyConsentValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            safeSetState(() {
                                                              _model.privacyConsentCancelValue =
                                                                  false;
                                                            });
                                                          }
                                                        },
                                                        side: BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        checkColor:
                                                            Color(0xFF00B505),
                                                      ),
                                                    ),
                                                    Text(
                                                      'ยินยอม',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    if (true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Theme(
                                                          data: ThemeData(
                                                            checkboxTheme:
                                                                CheckboxThemeData(
                                                              visualDensity:
                                                                  VisualDensity
                                                                      .compact,
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                            ),
                                                            unselectedWidgetColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                          ),
                                                          child: Checkbox(
                                                            value: _model
                                                                    .privacyConsentCancelValue ??=
                                                                false,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.privacyConsentCancelValue =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.privacyConsentValue =
                                                                      false;
                                                                });
                                                              }
                                                            },
                                                            side: BorderSide(
                                                              width: 2,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                            checkColor: Color(
                                                                0xFF00B505),
                                                          ),
                                                        ),
                                                      ),
                                                    if (true)
                                                      Text(
                                                        'ไม่ยินยอม',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  letterSpacing:
                                                                      0.0,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            child: Checkbox(
                                              value: _model
                                                      .privacyConsentAllValue ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                        .privacyConsentAllValue =
                                                    newValue!);
                                                if (newValue!) {
                                                  safeSetState(() {
                                                    _model.sensitiveConsentValue =
                                                        true;
                                                  });
                                                  safeSetState(() {
                                                    _model.sanctionConsentValue =
                                                        true;
                                                  });
                                                  safeSetState(() {
                                                    _model.privacyConsentValue =
                                                        true;
                                                  });
                                                  safeSetState(() {
                                                    _model.privacyConsentCancelValue =
                                                        false;
                                                  });
                                                } else {
                                                  safeSetState(() {
                                                    _model.sensitiveConsentValue =
                                                        false;
                                                  });
                                                  safeSetState(() {
                                                    _model.sanctionConsentValue =
                                                        false;
                                                  });
                                                  safeSetState(() {
                                                    _model.privacyConsentValue =
                                                        false;
                                                  });
                                                }
                                              },
                                              side: BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              checkColor: Color(0xFF00B505),
                                            ),
                                          ),
                                          Text(
                                            'ยินยอมทั้งหมด',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 15.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  if (((FFAppState().insuranceInfoPage4FileCancelLoan != '') && (FFAppState().insuranceInfoPage4FileCancelLoan != '') && (FFAppState().insuranceInfoPage4FileCancelLoan != null && FFAppState().insuranceInfoPage4FileCancelLoan != '')) &&
                                                      ((FFAppState()
                                                                  .InsuranceInfoPage4PowerOfAttoney !=
                                                              '') &&
                                                          (FFAppState()
                                                                  .InsuranceInfoPage4PowerOfAttoney !=
                                                              '') &&
                                                          (FFAppState()
                                                                      .InsuranceInfoPage4PowerOfAttoney !=
                                                                  null &&
                                                              FFAppState()
                                                                      .InsuranceInfoPage4PowerOfAttoney !=
                                                                  '')) &&
                                                      ((FFAppState()
                                                                  .insuranceInfoPage3ImageIdCard !=
                                                              '') &&
                                                          (FFAppState()
                                                                  .insuranceInfoPage3ImageIdCard !=
                                                              '') &&
                                                          (FFAppState()
                                                                      .insuranceInfoPage3ImageIdCard !=
                                                                  null &&
                                                              FFAppState()
                                                                      .insuranceInfoPage3ImageIdCard !=
                                                                  '')) &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage4IdCardPowerattorney !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage4IdCardPowerattorney !=
                                                              '')) {
                                                    if (!(_model
                                                            .sensitiveConsentValue! &&
                                                        _model
                                                            .sanctionConsentValue! &&
                                                        (_model.privacyConsentValue! ||
                                                            _model
                                                                .privacyConsentCancelValue!))) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณาเลือกยินยอม'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
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
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  LoadingSceneWidget(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    _model.ibsAppSaveAPIOutputOther2 =
                                                        await IbsApplicationsSaveCall
                                                            .call(
                                                      action: 'save_draft',
                                                      quotationId: FFAppState()
                                                          .insuranceInfoQuotationId,
                                                      leadDtlId: FFAppState()
                                                          .insuranceInfoLeadDetailId,
                                                      insuranceUrl: FFAppState()
                                                          .apiUrlInsuranceAppState,
                                                      step: '3',
                                                      token: FFAppState()
                                                          .accessToken,
                                                      sensitiveConsent: _model
                                                              .sensitiveConsentValue!
                                                          ? '1'
                                                          : '0',
                                                      privacyConsent: _model
                                                              .privacyConsentValue!
                                                          ? '1'
                                                          : '0',
                                                      sanctionConsent: _model
                                                              .sanctionConsentValue!
                                                          ? '1'
                                                          : '0',
                                                      subProduct: FFAppState()
                                                          .insuranceinfoActType,
                                                      fileCancelLoan: FFAppState()
                                                          .insuranceInfoPage4FileCancelLoan,
                                                      powerOfAttorney: FFAppState()
                                                          .InsuranceInfoPage4PowerOfAttoney,
                                                      imageIdcard: FFAppState()
                                                          .insuranceInfoPage3ImageIdCard,
                                                      idCardPowerOfAttorney:
                                                          FFAppState()
                                                              .insuranceInfoPage4IdCardPowerattorney,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.ibsAppSaveAPIOutputOther2
                                                                ?.statusCode ??
                                                            200) !=
                                                        200) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'พบข้อผิดพลาด (${(_model.ibsAppSaveAPIOutputOther2?.statusCode ?? 200).toString()})'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      Navigator.pop(context);
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                    if (IbsApplicationsSaveCall
                                                            .statuslayer1(
                                                          (_model.ibsAppSaveAPIOutputOther2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        200) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  IbsApplicationsSaveCall
                                                                      .messageLayer1(
                                                                (_model.ibsAppSaveAPIOutputOther2
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      Navigator.pop(context);
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บันทึกเตรียมข้อมูลขั้นตอนที่ 3 สำเร็จ'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    FFAppState()
                                                            .insuranceInfoPage3SaveDataCheckBool =
                                                        true;
                                                    FFAppState()
                                                            .insuranceinfoPage3PdfFileapplication =
                                                        '${IbsApplicationsSaveCall.fileapplication(
                                                      (_model.ibsAppSaveAPIOutputOther2
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString()}';
                                                    safeSetState(() {});
                                                    Navigator.pop(context);
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับถ่ายรูปให้ครบ'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
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

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'บันทึกเตรียมข้อมูล',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.45,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFFCEFE4),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFD9761A),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFCEFE4),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (FFAppState()
                                              .insuranceInfoPage3SaveDataCheckBool)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                      'fireInsuranceInfoPage4');
                                                },
                                                text: 'ถัดไป',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.45,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFD9761A),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
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
                          ],
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
  }
}
