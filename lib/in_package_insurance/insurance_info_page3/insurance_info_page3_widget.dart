import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/components/show_image_component_widget.dart';
import '/components/show_image_list_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_info_page3_model.dart';
export 'insurance_info_page3_model.dart';

class InsuranceInfoPage3Widget extends StatefulWidget {
  const InsuranceInfoPage3Widget({super.key});

  @override
  State<InsuranceInfoPage3Widget> createState() =>
      _InsuranceInfoPage3WidgetState();
}

class _InsuranceInfoPage3WidgetState extends State<InsuranceInfoPage3Widget> {
  late InsuranceInfoPage3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceInfoPage3Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insuranceInfoPage3'});
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
      onTap: () => FocusScope.of(context).unfocus(),
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
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFFDB771A),
                size: 30,
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
                    fontSize: 18,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (FFAppState().insuranceinfoActType != 'CMI')
                          wrapWithModel(
                            model: _model.infomationCustomerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: InfomationCustomerWidget(),
                          ),
                        if (FFAppState().insuranceinfoActType == 'CMI')
                          wrapWithModel(
                            model: _model.infomationCustomerActModel,
                            updateCallback: () => safeSetState(() {}),
                            child: InfomationCustomerActWidget(),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  color: Color(0x33000000),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Container(
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
                                            color: Color(0xFFFAFAFA),
                                          ),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          '1',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFFAFAFA),
                                                fontSize: 15,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.06,
                                      height: 100,
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
                                            width: 32,
                                            child: Divider(
                                              thickness: 1,
                                              color: Color(0xFFD9761A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9761A),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFB3B3B3),
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '2',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFFAFAFA),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.06,
                                      height: 100,
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
                                            width: 32,
                                            child: Divider(
                                              thickness: 1,
                                              color: Color(0xFFD9761A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9761A),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFB3B3B3),
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.06,
                                      height: 100,
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
                                            width: 32,
                                            child: Divider(
                                              thickness: 1,
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFB3B3B3),
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '4',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFB3B3B3),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.06,
                                      height: 100,
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
                                            width: 32,
                                            child: Divider(
                                              thickness: 1,
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFB3B3B3),
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '5',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFB3B3B3),
                                              fontSize: 15,
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
                            if ((FFAppState().insuranceinfoActType != 'CMI') &&
                                (FFAppState().insuranceinfoActType != 'MC'))
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await launchURL(
                                        'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/filePDF%2F%E0%B9%83%E0%B8%9A%E0%B8%95%E0%B8%A3%E0%B8%A7%E0%B8%88%E0%B8%AA%E0%B8%A0%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B8%96_ssw.pdf?alt=media&token=a4e63a2e-c74b-4c06-8b87-fb7abc80b128&_gl=1*1jny086*_ga*MTI5MzM2MTI1My4xNjkzODIzNjI0*_ga_CW55HF8NVT*MTY5NjM5OTc2OC4yMi4xLjE2OTYzOTk4NjMuMzUuMC4w');
                                  },
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 33,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.file_download_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            'ดาวน์โหลดเอกสาร ใบตรวจสภาพรถ SSW',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFF003063),
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
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
                            if ((FFAppState().nonePackageWorkType !=
                                    'งานต่ออายุ') &&
                                (FFAppState().insuranceinfoActType != 'CMI') &&
                                (FFAppState().insuranceinfoActType != 'MC'))
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 80,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'ใบตรวจสภาพรถฟอร์มศรีสวัสดิ์',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          if (FFAppState()
                                                  .insuranceInfocoverType ==
                                              'ชั้น 1')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
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
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.74,
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
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
                                                                  _model.isDataUploading1 =
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
                                                                    .insuranceInfoPage3ImageExamination =
                                                                _model
                                                                    .uploadedFileUrl1;
                                                            safeSetState(() {});
                                                            if (_model.uploadedFileUrl1 !=
                                                                    null &&
                                                                _model.uploadedFileUrl1 !=
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
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFFCEFE4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
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
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
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
                                                                              fontSize: 16,
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
                                                                .fromSTEB(10, 0,
                                                                    5, 0),
                                                        child: Text(
                                                          'สถานะ :',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!((FFAppState()
                                                                  .insuranceInfoPage3ImageExamination !=
                                                              '') &&
                                                          (FFAppState()
                                                                  .insuranceInfoPage3ImageExamination !=
                                                              '') &&
                                                          (FFAppState()
                                                                      .insuranceInfoPage3ImageExamination !=
                                                                  null &&
                                                              FFAppState()
                                                                      .insuranceInfoPage3ImageExamination !=
                                                                  '')))
                                                        Text(
                                                          'ยังไม่อัพโหลด',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      if ((FFAppState().insuranceInfoPage3ImageExamination != '') &&
                                                          (FFAppState()
                                                                  .insuranceInfoPage3ImageExamination !=
                                                              '') &&
                                                          (FFAppState()
                                                                      .insuranceInfoPage3ImageExamination !=
                                                                  null &&
                                                              FFAppState()
                                                                      .insuranceInfoPage3ImageExamination !=
                                                                  ''))
                                                        Text(
                                                          'อัพโหลดสำเร็จ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if ((FFAppState().insuranceInfoPage3ImageExamination != '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageExamination !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageExamination !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageExamination !=
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
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
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
                                                                              .insuranceInfoPage3ImageExamination !=
                                                                          ''
                                                                      ? functions
                                                                          .stringToImgPath(
                                                                              FFAppState().insuranceInfoPage3ImageExamination)!
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
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons
                                                          .content_paste_search_rounded,
                                                      color: Color(0xFF354052),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if (!((FFAppState()
                                                          .insuranceInfoPage3ImageExamination !=
                                                      '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageExamination !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageExamination !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageExamination !=
                                                          '')))
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if ((FFAppState().insuranceInfoPage3ImageExamination != '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageExamination !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageExamination !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageExamination !=
                                                          ''))
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.check_sharp,
                                                      color: Color(0xFF00FD76),
                                                      size: 24,
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 80,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'รายการจดทะเบียนรถ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
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
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.74,
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
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
                                                                    .insuranceInfoPage3ImageBluebook =
                                                                _model
                                                                    .uploadedFileUrl2;
                                                            safeSetState(() {});
                                                            if (_model.uploadedFileUrl2 !=
                                                                    null &&
                                                                _model.uploadedFileUrl2 !=
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
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFFCEFE4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
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
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
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
                                                                              fontSize: 16,
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
                                                                .fromSTEB(10, 0,
                                                                    5, 0),
                                                        child: Text(
                                                          'สถานะ :',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!((FFAppState()
                                                                  .insuranceInfoPage3ImageBluebook !=
                                                              '') &&
                                                          (FFAppState()
                                                                  .insuranceInfoPage3ImageBluebook !=
                                                              '') &&
                                                          (FFAppState()
                                                                      .insuranceInfoPage3ImageBluebook !=
                                                                  null &&
                                                              FFAppState()
                                                                      .insuranceInfoPage3ImageBluebook !=
                                                                  '')))
                                                        Text(
                                                          'ยังไม่อัพโหลด',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      if ((FFAppState().insuranceInfoPage3ImageBluebook != '') &&
                                                          (FFAppState()
                                                                  .insuranceInfoPage3ImageBluebook !=
                                                              '') &&
                                                          (FFAppState()
                                                                      .insuranceInfoPage3ImageBluebook !=
                                                                  null &&
                                                              FFAppState()
                                                                      .insuranceInfoPage3ImageBluebook !=
                                                                  ''))
                                                        Text(
                                                          'อัพโหลดสำเร็จ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if ((FFAppState().insuranceInfoPage3ImageBluebook != '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageBluebook !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageBluebook !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageBluebook !=
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
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
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
                                                                              .insuranceInfoPage3ImageBluebook !=
                                                                          ''
                                                                      ? functions
                                                                          .stringToImgPath(
                                                                              FFAppState().insuranceInfoPage3ImageBluebook)!
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
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons
                                                          .content_paste_search_rounded,
                                                      color: Color(0xFF354052),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if (!((FFAppState()
                                                          .insuranceInfoPage3ImageBluebook !=
                                                      '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageBluebook !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageBluebook !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageBluebook !=
                                                          '')))
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if ((FFAppState().insuranceInfoPage3ImageBluebook != '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageBluebook !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageBluebook !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageBluebook !=
                                                          ''))
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.check_sharp,
                                                      color: Color(0xFF00FD76),
                                                      size: 24,
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
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 80,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'สำเนาบัตรประชาชน',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            'บังคับอัพโหลดรูป',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFB0606),
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.74,
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0),
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
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
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
                                                              safeSetState(() {
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
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.35,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFCEFE4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
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
                                                                    size: 24,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'อัพโหลดรูป',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                Color(0xFFD9761A),
                                                                            fontSize:
                                                                                16,
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 5, 0),
                                                      child: Text(
                                                        'สถานะ :',
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
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                        child: GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
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
                                                                    ? functions.stringToImgPath(
                                                                        FFAppState()
                                                                            .insuranceInfoPage3ImageIdCard)!
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
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    Icons
                                                        .content_paste_search_rounded,
                                                    color: Color(0xFF354052),
                                                    size: 24,
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
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Color(0xFFFC0A0A),
                                                    size: 24,
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
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    Icons.check_sharp,
                                                    color: Color(0xFF00FD76),
                                                    size: 24,
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
                            if ((FFAppState().nonePackageWorkType !=
                                    'งานต่ออายุ') &&
                                (FFAppState().insuranceinfoActType != 'CMI') &&
                                (FFAppState().insuranceinfoActType != 'MC'))
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'รูปเอกสารอื่นๆ ถ้ามี',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Text(
                                              '(ถ่ายได้ไม่เกิน 5 รูป)',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.74,
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
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
                                                            context.pushNamed(
                                                              'uploadImgPage',
                                                              queryParameters: {
                                                                'titleText':
                                                                    serializeParam(
                                                                  'รูปเอกสารอื่นๆ',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'searchLabel':
                                                                    serializeParam(
                                                                  'รูปเอกสารอื่นๆ (ถ่ายได้ไม่เกิน 5 รูป)',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'fromPage':
                                                                    serializeParam(
                                                                  'otherImg',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.35,
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFFCEFE4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .photo_camera_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'ถ่ายรูป',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: Color(0xFFD9761A),
                                                                              fontSize: 16,
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
                                                                .fromSTEB(10, 0,
                                                                    5, 0),
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
                                                            await launchURL(
                                                                FFAppState()
                                                                    .insuranceInfoUploadImgOther
                                                                    .first);
                                                          },
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
                                                      ),
                                                      if (FFAppState()
                                                              .insuranceInfoUploadImgOther
                                                              .length ==
                                                          0)
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await launchURL(
                                                                FFAppState()
                                                                    .insuranceInfoUploadImgOther
                                                                    .last);
                                                          },
                                                          child: Text(
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
                                                        ),
                                                      if (FFAppState()
                                                              .insuranceInfoUploadImgOther
                                                              .length >
                                                          0)
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
                                              if ((FFAppState().insuranceInfoPage3ImageOther != '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageOther !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageOther !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageOther !=
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
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    ShowImageListComponentWidget(
                                                                  imageUrl: functions
                                                                              .splitStringToList(FFAppState()
                                                                                  .insuranceInfoPage3ImageOther)
                                                                              .length >
                                                                          1
                                                                      ? functions.splitStringToList(
                                                                          FFAppState()
                                                                              .insuranceInfoPage3ImageOther)
                                                                      : FFAppState()
                                                                          .insuranceInfoUploadImgOther,
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
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons
                                                          .content_paste_search_rounded,
                                                      color: Color(0xFF354052),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if (!((FFAppState()
                                                          .insuranceInfoPage3ImageOther !=
                                                      '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageOther !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageOther !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageOther !=
                                                          '')))
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if ((FFAppState().insuranceInfoPage3ImageOther != '') &&
                                                  (FFAppState()
                                                          .insuranceInfoPage3ImageOther !=
                                                      '') &&
                                                  (FFAppState()
                                                              .insuranceInfoPage3ImageOther !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoPage3ImageOther !=
                                                          ''))
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.check_sharp,
                                                      color: Color(0xFF00FD76),
                                                      size: 24,
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
                            if ((FFAppState().nonePackageWorkType !=
                                    'งานต่ออายุ') &&
                                (FFAppState().insuranceinfoActType != 'CMI') &&
                                (FFAppState().insuranceinfoActType != 'MC'))
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'รูปรอยแผล ถ้ามี',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Text(
                                              '(ถ่ายได้ไม่เกิน 6 รูป)',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.74,
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
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
                                                            context.pushNamed(
                                                              'uploadImgPage',
                                                              queryParameters: {
                                                                'titleText':
                                                                    serializeParam(
                                                                  'รูปรอยแผล',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'searchLabel':
                                                                    serializeParam(
                                                                  'รูปรอยแผล (ถ่ายได้ไม่เกิน 6 รูป)',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'fromPage':
                                                                    serializeParam(
                                                                  'otherImg',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.35,
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFFCEFE4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .photo_camera_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'ถ่ายรูป',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: Color(0xFFD9761A),
                                                                              fontSize: 16,
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
                                                                .fromSTEB(10, 0,
                                                                    5, 0),
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
                                                      if (FFAppState()
                                                              .insuranceInfoUploadImgScar
                                                              .length ==
                                                          0)
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
                                                      if (FFAppState()
                                                              .insuranceInfoUploadImgScar
                                                              .length >
                                                          0)
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
                                              if (FFAppState()
                                                      .insuranceInfoPage3ImageWound
                                                      .length >
                                                  0)
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
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    ShowImageListComponentWidget(
                                                                  imageUrl: FFAppState()
                                                                              .insuranceInfoPage3ImageWound
                                                                              .length >
                                                                          1
                                                                      ? FFAppState()
                                                                          .insuranceInfoPage3ImageWound
                                                                      : FFAppState()
                                                                          .insuranceInfoUploadImgScar,
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
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons
                                                          .content_paste_search_rounded,
                                                      color: Color(0xFF354052),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if (FFAppState()
                                                      .insuranceInfoPage3ImageWound
                                                      .length ==
                                                  0)
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if (FFAppState()
                                                      .insuranceInfoPage3ImageWound
                                                      .length >
                                                  0)
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.check_sharp,
                                                      color: Color(0xFF00FD76),
                                                      size: 24,
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
                            if ((FFAppState().nonePackageWorkType !=
                                    'งานต่ออายุ') &&
                                (FFAppState().insuranceinfoActType != 'CMI') &&
                                (FFAppState().insuranceinfoActType != 'MC'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 20),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'รูปอุปกรณ์เสริม ถ้ามี',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Text(
                                              '(ถ่ายได้ไม่เกิน 6 รูป)',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.74,
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
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
                                                            context.pushNamed(
                                                              'uploadImgPage',
                                                              queryParameters: {
                                                                'titleText':
                                                                    serializeParam(
                                                                  'รูปอุปกรณ์เสริม',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'searchLabel':
                                                                    serializeParam(
                                                                  'รูปอุปกรณ์เสริม (ถ่ายได้ไม่เกิน 6 รูป)',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'fromPage':
                                                                    serializeParam(
                                                                  'otherImg',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.35,
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFFCEFE4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .photo_camera_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'ถ่ายรูป',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: Color(0xFFD9761A),
                                                                              fontSize: 16,
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
                                                                .fromSTEB(10, 0,
                                                                    5, 0),
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
                                                      if (FFAppState()
                                                              .insuranceInfoUploadImgAccessory
                                                              .length ==
                                                          0)
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
                                                      if (FFAppState()
                                                              .insuranceInfoUploadImgAccessory
                                                              .length >
                                                          0)
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
                                              if (FFAppState()
                                                      .insuranceInfoPage3ImageAccessories
                                                      .length >
                                                  0)
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
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    ShowImageListComponentWidget(
                                                                  imageUrl: FFAppState()
                                                                              .insuranceInfoPage3ImageAccessories
                                                                              .length >
                                                                          1
                                                                      ? FFAppState()
                                                                          .insuranceInfoPage3ImageAccessories
                                                                      : FFAppState()
                                                                          .insuranceInfoUploadImgAccessory,
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
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons
                                                          .content_paste_search_rounded,
                                                      color: Color(0xFF354052),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if (FFAppState()
                                                      .insuranceInfoPage3ImageAccessories
                                                      .length ==
                                                  0)
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              if (FFAppState()
                                                      .insuranceInfoPage3ImageAccessories
                                                      .length >
                                                  0)
                                                Flexible(
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.check_sharp,
                                                      color: Color(0xFF00FD76),
                                                      size: 24,
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
                        if ((FFAppState().insuranceInfocoverType == 'ชั้น 1') &&
                            (FFAppState().nonePackageWorkType !=
                                'งานต่ออายุ') &&
                            (FFAppState().insuranceinfoActType != 'CMI'))
                          Container(
                            width: double.infinity,
                            height: 320,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/messageImage_1694485563447.jpg',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.04, 0.25),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 1 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
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
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          imageQuality: 30,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading4 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading4 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile4 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl4 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceInfoPage3ImageFront =
                                            _model.uploadedFileUrl4;
                                        safeSetState(() {});
                                        if (_model.uploadedFileUrl4 != null &&
                                            _model.uploadedFileUrl4 != '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '#B2000000',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                          return;
                                        }
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 70,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.81, -0.45),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 2 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
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
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          imageQuality: 30,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading5 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading5 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile5 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl5 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceInfoPage3ImageRightFront =
                                            _model.uploadedFileUrl5;
                                        safeSetState(() {});
                                        if (_model.uploadedFileUrl5 != null &&
                                            _model.uploadedFileUrl5 != '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 70,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.04, -0.34),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 3 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
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
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          imageQuality: 30,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading6 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading6 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile6 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl6 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceInfoPage3ImageRight =
                                            _model.uploadedFileUrl6;
                                        safeSetState(() {});
                                        if (_model.uploadedFileUrl6 != null &&
                                            _model.uploadedFileUrl6 != '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 70,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.79, -0.25),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 4 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
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
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          imageQuality: 30,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading7 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading7 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile7 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl7 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceInfoPage3ImageRightRear =
                                            _model.uploadedFileUrl7;
                                        safeSetState(() {});
                                        if (_model.uploadedFileUrl7 != null &&
                                            _model.uploadedFileUrl7 != '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 70,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.1, 0.47),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 5 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
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
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          imageQuality: 30,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading8 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading8 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile8 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl8 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceInfoPageImageRear =
                                            _model.uploadedFileUrl8;
                                        safeSetState(() {});
                                        if (_model.uploadedFileUrl8 != null &&
                                            _model.uploadedFileUrl8 != '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 70,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.8, 0.97),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 6 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
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
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          imageQuality: 30,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading9 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading9 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile9 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl9 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceInfoPage3ImageLeftRear =
                                            _model.uploadedFileUrl9;
                                        safeSetState(() {});
                                        if (_model.uploadedFileUrl9 != null &&
                                            _model.uploadedFileUrl9 != '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 70,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.02, 0.99),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 7 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
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
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          imageQuality: 30,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading10 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading10 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile10 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl10 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceInfoPage3ImageLeft =
                                            _model.uploadedFileUrl10;
                                        safeSetState(() {});
                                        if (_model.uploadedFileUrl10 != null &&
                                            _model.uploadedFileUrl10 != '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '#B2000000',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                          return;
                                        }
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 70,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.74, 0.95),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 8 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
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
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          imageQuality: 30,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading11 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading11 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile11 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl11 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceInfoPage3ImageLeftFront =
                                            _model.uploadedFileUrl11;
                                        safeSetState(() {});
                                        if (_model.uploadedFileUrl11 != null &&
                                            _model.uploadedFileUrl11 != '') {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '#B2000000',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 70,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.04, 0.32),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการถ่ายรูปที่ 9 ใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
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
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          imageQuality: 30,
                                          allowPhoto: true,
                                          includeBlurHash: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading12 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading12 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile12 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl12 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceInfoPage3ImageRoof =
                                            _model.uploadedFileUrl12;
                                        safeSetState(() {});
                                        if (_model.uploadedFileUrl12 != null &&
                                            _model.uploadedFileUrl12 != '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพสำเร็จ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 157,
                                        height: 70,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if ((FFAppState().insuranceInfocoverType == 'ชั้น 1') &&
                            (FFAppState().nonePackageWorkType !=
                                'งานต่ออายุ') &&
                            (FFAppState().insuranceinfoActType != 'CMI'))
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 33,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'ถ่ายรูปทรัพย์สิน',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF003063),
                                          fontSize: 15,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'บังคับถ่ายรูปให้ครบ 9 รูป',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFFFB0606),
                                            fontSize: 12,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if ((FFAppState().insuranceInfocoverType == 'ชั้น 1') &&
                            (FFAppState().nonePackageWorkType !=
                                'งานต่ออายุ') &&
                            (FFAppState().insuranceinfoActType != 'CMI'))
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 310,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.74,
                                              height: 100,
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '1.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 5, 0),
                                                    child: Text(
                                                      'สถานะ :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPage3ImageFront !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageFront !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageFront !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageFront !=
                                                              '')))
                                                    Text(
                                                      'ยังไม่อัพโหลด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPage3ImageFront != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageFront !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageFront !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageFront !=
                                                              ''))
                                                    Text(
                                                      'อัพโหลดสำเร็จ',
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
                                            ),
                                          ),
                                          if ((FFAppState().insuranceInfoPage3ImageFront != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageFront !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageFront !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageFront !=
                                                      ''))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                ShowImageComponentWidget(
                                                              imageUrl: FFAppState()
                                                                          .insuranceInfoPage3ImageFront !=
                                                                      ''
                                                                  ? functions.stringToImgPath(
                                                                      FFAppState()
                                                                          .insuranceInfoPage3ImageFront)!
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
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: Color(0xFF354052),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (!((FFAppState()
                                                      .insuranceInfoPage3ImageFront !=
                                                  '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageFront !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageFront !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageFront !=
                                                      '')))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xFFFC0A0A),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().insuranceInfoPage3ImageFront != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageFront !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageFront !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageFront !=
                                                      ''))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.check_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.74,
                                              height: 100,
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '2.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 5, 0),
                                                    child: Text(
                                                      'สถานะ :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPage3ImageRightFront !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageRightFront !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageRightFront !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageRightFront !=
                                                              '')))
                                                    Text(
                                                      'ยังไม่อัพโหลด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPage3ImageRightFront != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageRightFront !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageRightFront !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageRightFront !=
                                                              ''))
                                                    Text(
                                                      'อัพโหลดสำเร็จ',
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
                                            ),
                                          ),
                                          if ((FFAppState().insuranceInfoPage3ImageRightFront != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRightFront !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRightFront !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRightFront !=
                                                      ''))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                ShowImageComponentWidget(
                                                              imageUrl: FFAppState()
                                                                          .insuranceInfoPage3ImageRightFront !=
                                                                      ''
                                                                  ? functions.stringToImgPath(
                                                                      FFAppState()
                                                                          .insuranceInfoPage3ImageRightFront)!
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
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: Color(0xFF354052),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (!((FFAppState()
                                                      .insuranceInfoPage3ImageRightFront !=
                                                  '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRightFront !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRightFront !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRightFront !=
                                                      '')))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().insuranceInfoPage3ImageRightFront != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRightFront !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRightFront !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRightFront !=
                                                      ''))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Color(0xFF00B505),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.74,
                                              height: 100,
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '3.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 5, 0),
                                                    child: Text(
                                                      'สถานะ :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPage3ImageRight !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageRight !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageRight !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageRight !=
                                                              '')))
                                                    Text(
                                                      'ยังไม่อัพโหลด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPage3ImageRight != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageRight !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageRight !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageRight !=
                                                              ''))
                                                    Text(
                                                      'อัพโหลดสำเร็จ',
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
                                            ),
                                          ),
                                          if ((FFAppState().insuranceInfoPage3ImageRight != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRight !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRight !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRight !=
                                                      ''))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                ShowImageComponentWidget(
                                                              imageUrl: FFAppState()
                                                                          .insuranceInfoPage3ImageRight !=
                                                                      ''
                                                                  ? functions.stringToImgPath(
                                                                      FFAppState()
                                                                          .insuranceInfoPage3ImageRight)!
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
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: Color(0xFF354052),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (!((FFAppState()
                                                      .insuranceInfoPage3ImageRight !=
                                                  '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRight !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRight !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRight !=
                                                      '')))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().insuranceInfoPage3ImageRight != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRight !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRight !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRight !=
                                                      ''))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Color(0xFF00B505),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.74,
                                              height: 100,
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '4.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 5, 0),
                                                    child: Text(
                                                      'สถานะ :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPage3ImageRightRear !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageRightRear !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageRightRear !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageRightRear !=
                                                              '')))
                                                    Text(
                                                      'ยังไม่อัพโหลด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPage3ImageRightRear != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageRightRear !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageRightRear !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageRightRear !=
                                                              ''))
                                                    Text(
                                                      'อัพโหลดสำเร็จ',
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
                                            ),
                                          ),
                                          if ((FFAppState().insuranceInfoPage3ImageRightRear != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRightRear !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRightRear !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRightRear !=
                                                      ''))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                ShowImageComponentWidget(
                                                              imageUrl: FFAppState()
                                                                          .insuranceInfoPage3ImageRightRear !=
                                                                      ''
                                                                  ? functions.stringToImgPath(
                                                                      FFAppState()
                                                                          .insuranceInfoPage3ImageRightRear)!
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
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: Color(0xFF354052),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (!((FFAppState()
                                                      .insuranceInfoPage3ImageRightRear !=
                                                  '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRightRear !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRightRear !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRightRear !=
                                                      '')))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().insuranceInfoPage3ImageRightRear != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRightRear !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRightRear !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRightRear !=
                                                      ''))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Color(0xFF00B505),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.74,
                                              height: 100,
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '5.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 5, 0),
                                                    child: Text(
                                                      'สถานะ :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPageImageRear !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPageImageRear !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPageImageRear !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPageImageRear !=
                                                              '')))
                                                    Text(
                                                      'ยังไม่อัพโหลด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPageImageRear != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPageImageRear !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPageImageRear !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPageImageRear !=
                                                              ''))
                                                    Text(
                                                      'อัพโหลดสำเร็จ',
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
                                            ),
                                          ),
                                          if ((FFAppState().insuranceInfoPageImageRear != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPageImageRear !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPageImageRear !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPageImageRear !=
                                                      ''))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                ShowImageComponentWidget(
                                                              imageUrl: FFAppState()
                                                                          .insuranceInfoPageImageRear !=
                                                                      ''
                                                                  ? functions.stringToImgPath(
                                                                      FFAppState()
                                                                          .insuranceInfoPageImageRear)!
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
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: Color(0xFF354052),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (!((FFAppState()
                                                      .insuranceInfoPageImageRear !=
                                                  '') &&
                                              (FFAppState()
                                                      .insuranceInfoPageImageRear !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPageImageRear !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPageImageRear !=
                                                      '')))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().insuranceInfoPageImageRear != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPageImageRear !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPageImageRear !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPageImageRear !=
                                                      ''))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Color(0xFF00B505),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.74,
                                              height: 100,
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '6.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 5, 0),
                                                    child: Text(
                                                      'สถานะ :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPage3ImageLeftRear !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageLeftRear !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageLeftRear !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageLeftRear !=
                                                              '')))
                                                    Text(
                                                      'ยังไม่อัพโหลด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPage3ImageLeftRear != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageLeftRear !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageLeftRear !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageLeftRear !=
                                                              ''))
                                                    Text(
                                                      'อัพโหลดสำเร็จ',
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
                                            ),
                                          ),
                                          if ((FFAppState().insuranceInfoPage3ImageLeftRear != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageLeftRear !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageLeftRear !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageLeftRear !=
                                                      ''))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                ShowImageComponentWidget(
                                                              imageUrl: FFAppState()
                                                                          .insuranceInfoPage3ImageLeftRear !=
                                                                      ''
                                                                  ? functions.stringToImgPath(
                                                                      FFAppState()
                                                                          .insuranceInfoPage3ImageLeftRear)!
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
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: Color(0xFF354052),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (!((FFAppState()
                                                      .insuranceInfoPage3ImageLeftRear !=
                                                  '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageLeftRear !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageLeftRear !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageLeftRear !=
                                                      '')))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().insuranceInfoPage3ImageLeftRear != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageLeftRear !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageLeftRear !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageLeftRear !=
                                                      ''))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Color(0xFF00B505),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.74,
                                              height: 100,
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '7.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 5, 0),
                                                    child: Text(
                                                      'สถานะ :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPage3ImageLeft !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageLeft !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageLeft !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageLeft !=
                                                              '')))
                                                    Text(
                                                      'ยังไม่อัพโหลด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPage3ImageLeft != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageLeft !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageLeft !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageLeft !=
                                                              ''))
                                                    Text(
                                                      'อัพโหลดสำเร็จ',
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
                                            ),
                                          ),
                                          if ((FFAppState().insuranceInfoPage3ImageLeft != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageLeft !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageLeft !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageLeft !=
                                                      ''))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                ShowImageComponentWidget(
                                                              imageUrl: FFAppState()
                                                                          .insuranceInfoPage3ImageLeft !=
                                                                      ''
                                                                  ? functions.stringToImgPath(
                                                                      FFAppState()
                                                                          .insuranceInfoPage3ImageLeft)!
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
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: Color(0xFF354052),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (!((FFAppState()
                                                      .insuranceInfoPage3ImageLeft !=
                                                  '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageLeft !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageLeft !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageLeft !=
                                                      '')))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().insuranceInfoPage3ImageLeft != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageLeft !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageLeft !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageLeft !=
                                                      ''))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Color(0xFF00B505),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.74,
                                              height: 100,
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '8.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 5, 0),
                                                    child: Text(
                                                      'สถานะ :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPage3ImageLeftFront !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageLeftFront !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageLeftFront !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageLeftFront !=
                                                              '')))
                                                    Text(
                                                      'ยังไม่อัพโหลด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPage3ImageLeftFront != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageLeftFront !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageLeftFront !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageLeftFront !=
                                                              ''))
                                                    Text(
                                                      'อัพโหลดสำเร็จ',
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
                                            ),
                                          ),
                                          if ((FFAppState().insuranceInfoPage3ImageLeftFront != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageLeftFront !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageLeftFront !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageLeftFront !=
                                                      ''))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                ShowImageComponentWidget(
                                                              imageUrl: FFAppState()
                                                                          .insuranceInfoPage3ImageLeftFront !=
                                                                      ''
                                                                  ? functions.stringToImgPath(
                                                                      FFAppState()
                                                                          .insuranceInfoPage3ImageLeftFront)!
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
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: Color(0xFF354052),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (!((FFAppState()
                                                      .insuranceInfoPage3ImageLeftFront !=
                                                  '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageLeftFront !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageLeftFront !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageLeftFront !=
                                                      '')))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().insuranceInfoPage3ImageLeftFront != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageLeftFront !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageLeftFront !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageLeftFront !=
                                                      ''))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Color(0xFF00B505),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.74,
                                              height: 100,
                                              decoration: BoxDecoration(),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '9.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 5, 0),
                                                    child: Text(
                                                      'สถานะ :',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (!((FFAppState()
                                                              .insuranceInfoPage3ImageRoof !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageRoof !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageRoof !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageRoof !=
                                                              '')))
                                                    Text(
                                                      'ยังไม่อัพโหลด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  if ((FFAppState().insuranceInfoPage3ImageRoof != '') &&
                                                      (FFAppState()
                                                              .insuranceInfoPage3ImageRoof !=
                                                          '') &&
                                                      (FFAppState()
                                                                  .insuranceInfoPage3ImageRoof !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoPage3ImageRoof !=
                                                              ''))
                                                    Text(
                                                      'อัพโหลดสำเร็จ',
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
                                            ),
                                          ),
                                          if ((FFAppState().insuranceInfoPage3ImageRoof != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRoof !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRoof !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRoof !=
                                                      ''))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                ShowImageComponentWidget(
                                                              imageUrl: FFAppState()
                                                                          .insuranceInfoPage3ImageRoof !=
                                                                      ''
                                                                  ? functions.stringToImgPath(
                                                                      FFAppState()
                                                                          .insuranceInfoPage3ImageRoof)!
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
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: Color(0xFF354052),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (!((FFAppState()
                                                      .insuranceInfoPage3ImageRoof !=
                                                  '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRoof !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRoof !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRoof !=
                                                      '')))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if ((FFAppState().insuranceInfoPage3ImageRoof != '') &&
                                              (FFAppState()
                                                      .insuranceInfoPage3ImageRoof !=
                                                  '') &&
                                              (FFAppState()
                                                          .insuranceInfoPage3ImageRoof !=
                                                      null &&
                                                  FFAppState()
                                                          .insuranceInfoPage3ImageRoof !=
                                                      ''))
                                            Flexible(
                                              child: Container(
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Color(0xFF00B505),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        Divider(
                          thickness: 1,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
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
                                      0, 0, 0, 12),
                                  child: Text(
                                    'รายละเอียดความยินยอม',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          fontSize: 16,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '**ต้องอ่านให้ลูกค้าฟังอย่างครบถ้วนทีละข้อ**',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFFF0000),
                                              fontSize: 16,
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
                                        flex: 1,
                                        child: Container(
                                          height: 250,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                          .privacyConsent1Value ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() => _model
                                                            .privacyConsent1Value =
                                                        newValue!);
                                                  },
                                                  side: BorderSide(
                                                    width: 2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBtnText,
                                                  checkColor: Color(0xFF00B505),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 40, 0, 0),
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .privacyConsent2Value ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .privacyConsent2Value =
                                                          newValue!);
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 40, 0, 0),
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .privacyConsent3Value ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .privacyConsent3Value =
                                                          newValue!);
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '1.ข้าพเจ้ารับทราบว่า ข้อมูลส่วนบุคคลของข้าพเจ้าได้รับการเก็บรวบรวม ใช้ และเปิดเผย ตามคำชี้แจงเกี่ยวกับข้อมูลส่วนบุคคลของบริษัท\n\n2.ผู้เอาประกันภัยและผู้รับประโยชน์/ ผู้ชำระเบี้ย ไม่มีความสัมพันธ์ ไม่ว่าทางตรงหรือทางอ้อม กับประเทศอิหร่าน เกาหลีเหนือ รัสเซีย ซีเรีย ในทุกประการ\n\n3.ข้าพเจ้ายินยอมให้บริษัทจัดเก็บรวบรวม ใช้และเปิดเผยข้อมูลส่วนบุคคลของข้าพเจ้าเพื่อประชาสัมพันธ์ วิเคราะห์การตลาด และนำเสนอหรือให้ข้อมูลที่เกี่ยวข้องกับผลิตภัณฑ์ การให้บริการหรือสิทธิประโยชน์ต่างๆ ของบริษัทหรือบริษัทในกลุ่มอลิอันซ์ หรือคู่สัญญาของบริษัท',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.3,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.privacyConsentValue ??=
                                              false,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.privacyConsentValue =
                                                    newValue!);
                                            if (newValue!) {
                                              safeSetState(() {
                                                _model.privacyConsent1Value =
                                                    true;
                                              });
                                              safeSetState(() {
                                                _model.privacyConsent2Value =
                                                    true;
                                              });
                                              safeSetState(() {
                                                _model.privacyConsent3Value =
                                                    true;
                                              });
                                            } else {
                                              safeSetState(() {
                                                _model.privacyConsent1Value =
                                                    false;
                                              });
                                              safeSetState(() {
                                                _model.privacyConsent2Value =
                                                    false;
                                              });
                                              safeSetState(() {
                                                _model.privacyConsent3Value =
                                                    false;
                                              });
                                            }
                                          },
                                          side: BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
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
                          thickness: 1,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if ((FFAppState()
                                                      .insuranceInfocoverType ==
                                                  'ชั้น 1') &&
                                              (FFAppState()
                                                      .nonePackageWorkType !=
                                                  'งานต่ออายุ') &&
                                              (FFAppState()
                                                      .insuranceinfoActType !=
                                                  'MC') &&
                                              (FFAppState()
                                                      .insuranceinfoActType !=
                                                  'CMI'))
                                            FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                if ((FFAppState().insuranceInfocoverType == 'ชั้น 1'
                                                        ? ((FFAppState().insuranceInfoPage3ImageExamination != '') &&
                                                            (FFAppState().insuranceInfoPage3ImageExamination !=
                                                                '') &&
                                                            (FFAppState().insuranceInfoPage3ImageExamination != null &&
                                                                FFAppState().insuranceInfoPage3ImageExamination !=
                                                                    ''))
                                                        : true) &&
                                                    ((FFAppState().insuranceInfoPage3ImageBluebook != '') &&
                                                        (FFAppState().insuranceInfoPage3ImageBluebook !=
                                                            '') &&
                                                        (FFAppState().insuranceInfoPage3ImageBluebook != null &&
                                                            FFAppState().insuranceInfoPage3ImageBluebook !=
                                                                '')) &&
                                                    ((FFAppState().insuranceInfoPage3ImageIdCard != '') &&
                                                        (FFAppState().insuranceInfoPage3ImageIdCard !=
                                                            '') &&
                                                        (FFAppState().insuranceInfoPage3ImageIdCard != null &&
                                                            FFAppState().insuranceInfoPage3ImageIdCard !=
                                                                '')) &&
                                                    ((FFAppState().insuranceInfoPage3ImageFront != '') &&
                                                        (FFAppState().insuranceInfoPage3ImageFront !=
                                                            '') &&
                                                        (FFAppState().insuranceInfoPage3ImageFront != null &&
                                                            FFAppState().insuranceInfoPage3ImageFront !=
                                                                '')) &&
                                                    ((FFAppState().insuranceInfoPage3ImageRightFront != '') &&
                                                        (FFAppState().insuranceInfoPage3ImageRightFront !=
                                                            '') &&
                                                        (FFAppState().insuranceInfoPage3ImageRightFront != null &&
                                                            FFAppState().insuranceInfoPage3ImageRightFront !=
                                                                '')) &&
                                                    ((FFAppState().insuranceInfoPage3ImageRight != '') &&
                                                        (FFAppState().insuranceInfoPage3ImageRight !=
                                                            '') &&
                                                        (FFAppState().insuranceInfoPage3ImageRight != null &&
                                                            FFAppState().insuranceInfoPage3ImageRight !=
                                                                '')) &&
                                                    ((FFAppState().insuranceInfoPage3ImageRightRear != '') &&
                                                        (FFAppState().insuranceInfoPage3ImageRightRear !=
                                                            '') &&
                                                        (FFAppState().insuranceInfoPage3ImageRightRear != null &&
                                                            FFAppState().insuranceInfoPage3ImageRightRear !=
                                                                '')) &&
                                                    ((FFAppState().insuranceInfoPageImageRear != '') &&
                                                        (FFAppState().insuranceInfoPageImageRear != '') &&
                                                        (FFAppState().insuranceInfoPageImageRear != null && FFAppState().insuranceInfoPageImageRear != '')) &&
                                                    ((FFAppState().insuranceInfoPage3ImageLeftRear != '') && (FFAppState().insuranceInfoPage3ImageLeftRear != '') && (FFAppState().insuranceInfoPage3ImageLeftRear != null && FFAppState().insuranceInfoPage3ImageLeftRear != '')) &&
                                                    ((FFAppState().insuranceInfoPage3ImageLeft != '') && (FFAppState().insuranceInfoPage3ImageLeft != '') && (FFAppState().insuranceInfoPage3ImageLeft != null && FFAppState().insuranceInfoPage3ImageLeft != '')) &&
                                                    ((FFAppState().insuranceInfoPage3ImageLeftFront != '') && (FFAppState().insuranceInfoPage3ImageLeftFront != '') && (FFAppState().insuranceInfoPage3ImageLeftFront != null && FFAppState().insuranceInfoPage3ImageLeftFront != '')) &&
                                                    ((FFAppState().insuranceInfoPage3ImageRoof != '') && (FFAppState().insuranceInfoPage3ImageRoof != '') && (FFAppState().insuranceInfoPage3ImageRoof != null && FFAppState().insuranceInfoPage3ImageRoof != ''))) {
                                                  if (!(_model
                                                          .privacyConsent1Value! &&
                                                      _model
                                                          .privacyConsent2Value! &&
                                                      _model
                                                          .privacyConsent3Value!)) {
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
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
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

                                                  _model.ibsAppSaveAPIOutput2 =
                                                      await IbsApplicationsSaveCall
                                                          .call(
                                                    action: 'save_draft',
                                                    quotationId: FFAppState()
                                                        .insuranceInfoQuotationId,
                                                    leadDtlId: FFAppState()
                                                        .insuranceInfoLeadDetailId,
                                                    insuranceUrl: FFAppState()
                                                        .apiUrlInsuranceAppState,
                                                    imageExamination: FFAppState()
                                                        .insuranceInfoPage3ImageExamination,
                                                    imageBluebook: FFAppState()
                                                        .insuranceInfoPage3ImageBluebook,
                                                    imageIdcard: FFAppState()
                                                        .insuranceInfoPage3ImageIdCard,
                                                    imageOther: FFAppState()
                                                        .insuranceInfoPage3ImageOther,
                                                    imageWound: FFAppState()
                                                                .insuranceInfoPage3ImageWound
                                                                .length >
                                                            0
                                                        ? functions
                                                            .imgFirebaseListToString(
                                                                FFAppState()
                                                                    .insuranceInfoPage3ImageWound
                                                                    .toList())
                                                        : '',
                                                    imageAccessories: FFAppState()
                                                                .insuranceInfoPage3ImageAccessories
                                                                .length >
                                                            0
                                                        ? functions
                                                            .imgFirebaseListToString(
                                                                FFAppState()
                                                                    .insuranceInfoPage3ImageAccessories
                                                                    .toList())
                                                        : '',
                                                    imageFront: FFAppState()
                                                        .insuranceInfoPage3ImageFront,
                                                    imageRear: FFAppState()
                                                        .insuranceInfoPageImageRear,
                                                    imageLeft: FFAppState()
                                                        .insuranceInfoPage3ImageLeft,
                                                    imageRight: FFAppState()
                                                        .insuranceInfoPage3ImageRight,
                                                    imageRightfront: FFAppState()
                                                        .insuranceInfoPage3ImageRightFront,
                                                    imageRightrear: FFAppState()
                                                        .insuranceInfoPage3ImageRightRear,
                                                    imageLeftfront: FFAppState()
                                                        .insuranceInfoPage3ImageLeftFront,
                                                    imageLeftrear: FFAppState()
                                                        .insuranceInfoPage3ImageLeftRear,
                                                    imageRoof: FFAppState()
                                                        .insuranceInfoPage3ImageRoof,
                                                    step: '3',
                                                    token: FFAppState()
                                                        .accessToken,
                                                    sensitiveConsent: _model
                                                            .privacyConsentValue!
                                                        ? '1'
                                                        : '0',
                                                    privacyConsent: _model
                                                            .privacyConsentValue!
                                                        ? '1'
                                                        : '0',
                                                    sanctionConsent: _model
                                                            .privacyConsentValue!
                                                        ? '1'
                                                        : '0',
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.ibsAppSaveAPIOutput2
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
                                                                'พบข้อผิดพลาด (${(_model.ibsAppSaveAPIOutput2?.statusCode ?? 200).toString()})'),
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
                                                    Navigator.pop(context);
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  if (IbsApplicationsSaveCall
                                                          .statuslayer1(
                                                        (_model.ibsAppSaveAPIOutput2
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
                                                              (_model.ibsAppSaveAPIOutput2
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!),
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
                                                              child: Text('Ok'),
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
                                                    (_model.ibsAppSaveAPIOutput2
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

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: 'บันทึกเตรียมข้อมูล',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.45,
                                                height: 60,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                color: Color(0xFFFCEFE4),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                elevation: 3,
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFCEFE4),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                          if ((FFAppState()
                                                      .insuranceInfocoverType !=
                                                  'ชั้น 1') &&
                                              (FFAppState()
                                                      .nonePackageWorkType !=
                                                  'งานต่ออายุ') &&
                                              (FFAppState()
                                                      .insuranceinfoActType !=
                                                  'CMI') &&
                                              (FFAppState()
                                                      .insuranceinfoActType !=
                                                  'MC'))
                                            FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                if ((FFAppState()
                                                                .insuranceInfocoverType ==
                                                            'ชั้น 1'
                                                        ? ((FFAppState()
                                                                    .insuranceInfoPage3ImageExamination !=
                                                                '') &&
                                                            (FFAppState()
                                                                    .insuranceInfoPage3ImageExamination !=
                                                                '') &&
                                                            (FFAppState()
                                                                        .insuranceInfoPage3ImageExamination !=
                                                                    null &&
                                                                FFAppState()
                                                                        .insuranceInfoPage3ImageExamination !=
                                                                    ''))
                                                        : true) &&
                                                    ((FFAppState()
                                                                .insuranceInfoPage3ImageBluebook !=
                                                            '') &&
                                                        (FFAppState()
                                                                .insuranceInfoPage3ImageBluebook !=
                                                            '') &&
                                                        (FFAppState()
                                                                    .insuranceInfoPage3ImageBluebook !=
                                                                null &&
                                                            FFAppState()
                                                                    .insuranceInfoPage3ImageBluebook !=
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
                                                                ''))) {
                                                  if (!(_model
                                                          .privacyConsent1Value! &&
                                                      _model
                                                          .privacyConsent2Value! &&
                                                      _model
                                                          .privacyConsent3Value!)) {
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
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
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
                                                    imageExamination: FFAppState()
                                                        .insuranceInfoPage3ImageExamination,
                                                    imageBluebook: FFAppState()
                                                        .insuranceInfoPage3ImageBluebook,
                                                    imageIdcard: FFAppState()
                                                        .insuranceInfoPage3ImageIdCard,
                                                    imageOther: FFAppState()
                                                        .insuranceInfoPage3ImageOther,
                                                    imageWound: FFAppState()
                                                                .insuranceInfoPage3ImageWound
                                                                .length >
                                                            0
                                                        ? functions
                                                            .imgFirebaseListToString(
                                                                FFAppState()
                                                                    .insuranceInfoPage3ImageWound
                                                                    .toList())
                                                        : '',
                                                    imageAccessories: FFAppState()
                                                                .insuranceInfoPage3ImageAccessories
                                                                .length >
                                                            0
                                                        ? functions
                                                            .imgFirebaseListToString(
                                                                FFAppState()
                                                                    .insuranceInfoPage3ImageAccessories
                                                                    .toList())
                                                        : '',
                                                    step: '3',
                                                    token: FFAppState()
                                                        .accessToken,
                                                    sensitiveConsent: _model
                                                            .privacyConsentValue!
                                                        ? '1'
                                                        : '0',
                                                    privacyConsent: _model
                                                            .privacyConsentValue!
                                                        ? '1'
                                                        : '0',
                                                    sanctionConsent: _model
                                                            .privacyConsentValue!
                                                        ? '1'
                                                        : '0',
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
                                                                child:
                                                                    Text('Ok'),
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
                                                                child:
                                                                    Text('Ok'),
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
                                                              child: Text('Ok'),
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

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: 'บันทึกเตรียมข้อมูล',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.45,
                                                height: 60,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                color: Color(0xFFFCEFE4),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                elevation: 3,
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFCEFE4),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                          if ((FFAppState()
                                                      .nonePackageWorkType ==
                                                  'งานต่ออายุ') ||
                                              (FFAppState()
                                                      .insuranceinfoActType ==
                                                  'CMI') ||
                                              (FFAppState()
                                                      .insuranceinfoActType ==
                                                  'MC'))
                                            FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                if ((FFAppState().insuranceInfoPage3ImageIdCard != '') &&
                                                    (FFAppState()
                                                            .insuranceInfoPage3ImageIdCard !=
                                                        '') &&
                                                    (FFAppState()
                                                                .insuranceInfoPage3ImageIdCard !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoPage3ImageIdCard !=
                                                            '')) {
                                                  if (!(_model
                                                          .privacyConsent1Value! &&
                                                      _model
                                                          .privacyConsent2Value! &&
                                                      _model
                                                          .privacyConsent3Value!)) {
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
                                                  if ((FFAppState()
                                                              .insuranceinfoActType ==
                                                          'CMI') ||
                                                      (FFAppState()
                                                              .insuranceinfoActType ==
                                                          'MC')) {
                                                    if (!((FFAppState()
                                                                .insuranceInfoPage3ImageBluebook !=
                                                            '') &&
                                                        (FFAppState()
                                                                .insuranceInfoPage3ImageBluebook !=
                                                            '') &&
                                                        (FFAppState()
                                                                    .insuranceInfoPage3ImageBluebook !=
                                                                null &&
                                                            FFAppState()
                                                                    .insuranceInfoPage3ImageBluebook !=
                                                                ''))) {
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
                                                  }
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
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

                                                  _model.ibsAppSaveAPIOutputOtherRenew =
                                                      await IbsApplicationsSaveCall
                                                          .call(
                                                    action: 'save_draft',
                                                    quotationId: FFAppState()
                                                        .insuranceInfoQuotationId,
                                                    leadDtlId: FFAppState()
                                                        .insuranceInfoLeadDetailId,
                                                    insuranceUrl: FFAppState()
                                                        .apiUrlInsuranceAppState,
                                                    imageIdcard: FFAppState()
                                                        .insuranceInfoPage3ImageIdCard,
                                                    step: '3',
                                                    token: FFAppState()
                                                        .accessToken,
                                                    sensitiveConsent: _model
                                                            .privacyConsentValue!
                                                        ? '1'
                                                        : '0',
                                                    privacyConsent: _model
                                                            .privacyConsentValue!
                                                        ? '1'
                                                        : '0',
                                                    sanctionConsent: _model
                                                            .privacyConsentValue!
                                                        ? '1'
                                                        : '0',
                                                    subProduct: FFAppState()
                                                        .insuranceinfoActType,
                                                    imageBluebook: FFAppState()
                                                                .insuranceinfoActType ==
                                                            'CMI'
                                                        ? FFAppState()
                                                            .insuranceInfoPage3ImageBluebook
                                                        : '',
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.ibsAppSaveAPIOutputOtherRenew
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
                                                                'พบข้อผิดพลาด (${(_model.ibsAppSaveAPIOutputOtherRenew?.statusCode ?? 200).toString()})'),
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
                                                    Navigator.pop(context);
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  if (IbsApplicationsSaveCall
                                                          .statuslayer1(
                                                        (_model.ibsAppSaveAPIOutputOtherRenew
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
                                                              (_model.ibsAppSaveAPIOutputOtherRenew
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!),
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
                                                              child: Text('Ok'),
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
                                                    (_model.ibsAppSaveAPIOutputOtherRenew
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

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: 'บันทึกเตรียมข้อมูล',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.45,
                                                height: 60,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                color: Color(0xFFFCEFE4),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                elevation: 3,
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFCEFE4),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (FFAppState()
                                          .insuranceInfoPage3SaveDataCheckBool)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 0, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              var _shouldSetState = false;
                                              if (FFAppState()
                                                      .insuranceinfoActType !=
                                                  'CMI') {
                                                context.pushNamed(
                                                    'insuranceInfoPage4');
                                              } else {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
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

                                                _model.save4APIOutput =
                                                    await IbsApplicationsSaveCall
                                                        .call(
                                                  action: 'save_draft',
                                                  quotationId: FFAppState()
                                                      .insuranceInfoQuotationId,
                                                  step: '4',
                                                  paymentType: 'จ่ายเต็ม',
                                                  imageApplication: '',
                                                  fileLoanApplicationRegister:
                                                      '',
                                                  insuranceUrl: FFAppState()
                                                      .apiUrlInsuranceAppState,
                                                  leadDtlId: FFAppState()
                                                      .insuranceInfoLeadDetailId,
                                                  token:
                                                      FFAppState().accessToken,
                                                  subProduct: FFAppState()
                                                      .insuranceinfoActType,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.save4APIOutput
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
                                                              'พบข้อผิดพลาด (${(_model.save4APIOutput?.statusCode ?? 200).toString()})'),
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
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (IbsApplicationsSaveCall
                                                        .statuslayer1(
                                                      (_model.save4APIOutput
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
                                                            (_model.save4APIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!),
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
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                FFAppState()
                                                        .insuranceInfoPage4NetPremiumTotal =
                                                    '${IbsApplicationsSaveCall.netpremiumtotal(
                                                  (_model.save4APIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoPage4GrossTotalNet =
                                                    '${IbsApplicationsSaveCall.grosstotalnet(
                                                  (_model.save4APIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoPage4ActTotal =
                                                    '${IbsApplicationsSaveCall.acttotal(
                                                  (_model.save4APIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoPage4PaymentChannel =
                                                    '${IbsApplicationsSaveCall.paymentchannel(
                                                  (_model.save4APIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoPage4PaymentType =
                                                    '${IbsApplicationsSaveCall.paymenttype(
                                                  (_model.save4APIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfo4pagePaymentStatus =
                                                    '${IbsApplicationsSaveCall.paymentstatus(
                                                  (_model.save4APIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfo4pageStatus =
                                                    '${IbsApplicationsSaveCall.status(
                                                  (_model.save4APIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                safeSetState(() {});

                                                context.pushNamed(
                                                  'insuranceInfoPage4_2',
                                                  queryParameters: {
                                                    'quotationId':
                                                        serializeParam(
                                                      FFAppState()
                                                          .insuranceInfoQuotationId,
                                                      ParamType.String,
                                                    ),
                                                    'leadDetailId':
                                                        serializeParam(
                                                      functions.stringToInteger(
                                                          FFAppState()
                                                              .insuranceInfoLeadDetailId),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                Navigator.pop(context);
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                            text: 'ถัดไป',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.45,
                                              height: 60,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(24, 0, 24, 0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              color: Color(0xFFD9761A),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              elevation: 3,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
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
                  ].addToEnd(SizedBox(height: 50)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
