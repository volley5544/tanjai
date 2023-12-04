import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/show_image_component_widget.dart';
import '/components/show_image_list_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'none_package_edit_page3_model.dart';
export 'none_package_edit_page3_model.dart';

class NonePackageEditPage3Widget extends StatefulWidget {
  const NonePackageEditPage3Widget({Key? key}) : super(key: key);

  @override
  _NonePackageEditPage3WidgetState createState() =>
      _NonePackageEditPage3WidgetState();
}

class _NonePackageEditPage3WidgetState
    extends State<NonePackageEditPage3Widget> {
  late NonePackageEditPage3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NonePackageEditPage3Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NonePackageEditPage3'});
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
            nonePackageEditPage3UrlLinkStorageRecordList = snapshot.data!;
        final nonePackageEditPage3UrlLinkStorageRecord =
            nonePackageEditPage3UrlLinkStorageRecordList.isNotEmpty
                ? nonePackageEditPage3UrlLinkStorageRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
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
                  'แก้ไขรูปถ่าย',
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (FFAppState().nonePackageFlagRenew &&
                              ((FFAppState().nonePackageImageOldVmi[
                                          FFAppState()
                                              .nonePackageInsurerOutputIndex] !=
                                      '') ||
                                  (FFAppState().nonePackageImageIdCard[
                                          FFAppState()
                                              .nonePackageInsurerOutputIndex] !=
                                      '') ||
                                  (FFAppState().nonePackageImageCompanyBook[
                                          FFAppState()
                                              .nonePackageInsurerOutputIndex] !=
                                      '')))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 33.0,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'เอกสารเพิ่มเติม',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFF003063),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '(งานโอนโค้ด)',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                        ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 16.0,
                                                          12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '1. หน้าเล่มรถ รายการจดทะเบียนล่าสุด',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
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
                                                          'บังคับถ่ายรูป',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFFFC0D0D),
                                                                fontSize: 13.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '1. ตารางกรมธรรม์เดิม',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.74,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
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
                                                                  setState(() =>
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
                                                                    setState(
                                                                        () {
                                                                      _model.uploadedLocalFile1 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl1 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                if (!(_model.uploadedFileUrl1 !=
                                                                        null &&
                                                                    _model.uploadedFileUrl1 !=
                                                                        '')) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                                                  return;
                                                                }
                                                                setState(() {
                                                                  FFAppState()
                                                                          .nonePackageOldVmiImageUrl =
                                                                      _model
                                                                          .uploadedFileUrl1;
                                                                });
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปภาพสำเร็จ',
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
                                                              },
                                                              text: 'แนบไฟล์',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                height: 40.0,
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
                                                                    0xFFFCEFE4),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: Color(
                                                                          0xFFD9761A),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                                                            8.0),
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              _model.uploadedFileUrl1 !=
                                                                          null &&
                                                                      _model.uploadedFileUrl1 !=
                                                                          ''
                                                                  ? 'อัพโหลดแล้ว'
                                                                  : 'ยังไม่อัพโหลด',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState().nonePackageImageOldVmi[
                                                                FFAppState()
                                                                    .nonePackageInsurerOutputIndex] !=
                                                            ''
                                                        ? true
                                                        : false)
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
                                                                Color(
                                                                    0xB3000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
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
                                                                      imageUrl: FFAppState().nonePackageImageOldVmi[FFAppState().nonePackageInsurerOutputIndex] !=
                                                                              ''
                                                                          ? functions
                                                                              .stringToImgPath(FFAppState().nonePackageImageOldVmi[FFAppState().nonePackageInsurerOutputIndex])!
                                                                          : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .content_paste_search_rounded,
                                                          color:
                                                              Color(0xFF354052),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    if (_model.uploadedFileUrl1 !=
                                                            null &&
                                                        _model.uploadedFileUrl1 !=
                                                            '')
                                                      Icon(
                                                        Icons.check,
                                                        color:
                                                            Color(0xFF2EDD78),
                                                        size: 24.0,
                                                      ),
                                                    if (_model.uploadedFileUrl1 ==
                                                            null ||
                                                        _model.uploadedFileUrl1 ==
                                                            '')
                                                      Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Visibility(
                                                          visible: _model
                                                                      .uploadedFileUrl1 ==
                                                                  null ||
                                                              _model.uploadedFileUrl1 ==
                                                                  '',
                                                          child: Icon(
                                                            Icons.close,
                                                            color: Color(
                                                                0xFFFC0A0A),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '2. สำเนาบัตรประชาชน',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons
                                                        .content_paste_search_rounded,
                                                    color: Color(0xFF354052),
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
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
                                                          'SampleIDcard');
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
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.74,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
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
                                                                  setState(() =>
                                                                      _model.isDataUploading2 =
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
                                                                    setState(
                                                                        () {
                                                                      _model.uploadedLocalFile2 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl2 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                if (!(_model.uploadedFileUrl2 !=
                                                                        null &&
                                                                    _model.uploadedFileUrl2 !=
                                                                        '')) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                                                  return;
                                                                }
                                                                setState(() {
                                                                  FFAppState()
                                                                          .nonePackageIdCardImageUrl =
                                                                      _model
                                                                          .uploadedFileUrl2;
                                                                });
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'อัพโหลดรูปภาพสำเร็จ',
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
                                                              },
                                                              text: 'แนบไฟล์',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.35,
                                                                height: 40.0,
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
                                                                    0xFFFCEFE4),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: Color(
                                                                          0xFFD9761A),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                                                            8.0),
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              _model.uploadedFileUrl2 !=
                                                                          null &&
                                                                      _model.uploadedFileUrl2 !=
                                                                          ''
                                                                  ? 'อัพโหลดแล้ว'
                                                                  : 'ยังไม่อัพโหลด',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState().nonePackageImageIdCard[
                                                                FFAppState()
                                                                    .nonePackageInsurerOutputIndex] !=
                                                            ''
                                                        ? true
                                                        : false)
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
                                                                Color(
                                                                    0xB3000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
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
                                                                      imageUrl: FFAppState().nonePackageImageIdCard[FFAppState().nonePackageInsurerOutputIndex] !=
                                                                              ''
                                                                          ? functions
                                                                              .stringToImgPath(FFAppState().nonePackageImageIdCard[FFAppState().nonePackageInsurerOutputIndex])!
                                                                          : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .content_paste_search_rounded,
                                                          color:
                                                              Color(0xFF354052),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    if (_model.uploadedFileUrl2 !=
                                                            null &&
                                                        _model.uploadedFileUrl2 !=
                                                            '')
                                                      Icon(
                                                        Icons.check,
                                                        color:
                                                            Color(0xFF2EDD78),
                                                        size: 24.0,
                                                      ),
                                                    if (_model.uploadedFileUrl2 ==
                                                            null ||
                                                        _model.uploadedFileUrl2 ==
                                                            '')
                                                      Flexible(
                                                        child: Container(
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: _model
                                                                        .uploadedFileUrl2 ==
                                                                    null ||
                                                                _model.uploadedFileUrl2 ==
                                                                    '',
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Color(
                                                                  0xFFFC0A0A),
                                                              size: 24.0,
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
                                    ),
                                    if (FFAppState().buttonCorporation)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 20.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '3. หนังสือจดทะเบียนบริษัท',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.74,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
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
                                                                      selectedMedia.every((m) => validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                    setState(() =>
                                                                        _model.isDataUploading3 =
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
                                                                      _model.isDataUploading3 =
                                                                          false;
                                                                    }
                                                                    if (selectedUploadedFiles.length ==
                                                                            selectedMedia
                                                                                .length &&
                                                                        downloadUrls.length ==
                                                                            selectedMedia.length) {
                                                                      setState(
                                                                          () {
                                                                        _model.uploadedLocalFile3 =
                                                                            selectedUploadedFiles.first;
                                                                        _model.uploadedFileUrl3 =
                                                                            downloadUrls.first;
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {});
                                                                      return;
                                                                    }
                                                                  }

                                                                  await actions
                                                                      .hideKeyboardAction(
                                                                    context,
                                                                  );
                                                                  if (!(_model.uploadedFileUrl3 !=
                                                                          null &&
                                                                      _model.uploadedFileUrl3 !=
                                                                          '')) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
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
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .nonePackageCompanyBookImageUrl =
                                                                        _model
                                                                            .uploadedFileUrl3;
                                                                  });
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .clearSnackBars();
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'อัพโหลดรูปภาพสำเร็จ',
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
                                                                },
                                                                text: 'แนบไฟล์',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.35,
                                                                  height: 40.0,
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
                                                                      0xFFFCEFE4),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFFD9761A),
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                _model.uploadedFileUrl3 !=
                                                                            null &&
                                                                        _model.uploadedFileUrl3 !=
                                                                            ''
                                                                    ? 'อัพโหลดแล้ว'
                                                                    : 'ยังไม่อัพโหลด',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                      ),
                                                      if (_model.uploadedFileUrl3 !=
                                                              null &&
                                                          _model.uploadedFileUrl3 !=
                                                              '')
                                                        Icon(
                                                          Icons.check,
                                                          color:
                                                              Color(0xFF2EDD78),
                                                          size: 24.0,
                                                        ),
                                                      if (_model.uploadedFileUrl3 ==
                                                              null ||
                                                          _model.uploadedFileUrl3 ==
                                                              '')
                                                        Container(
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: _model
                                                                        .uploadedFileUrl3 ==
                                                                    null ||
                                                                _model.uploadedFileUrl3 ==
                                                                    '',
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Color(
                                                                  0xFFFC0A0A),
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
                              ),
                            ),
                          if ((FFAppState().nonePackageImageOldVmi[FFAppState()
                                      .nonePackageInsurerOutputIndex] ==
                                  '') &&
                              (FFAppState().nonePackageImageCompanyBook[
                                      FFAppState()
                                          .nonePackageInsurerOutputIndex] ==
                                  ''))
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'ถ่ายรูปเอกสารเพิ่มเติม',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFF002D5E),
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
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
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading4 =
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
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading4 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile4 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl4 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        setState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (!(_model.uploadedFileUrl4 !=
                                                            null &&
                                                        _model.uploadedFileUrl4 !=
                                                            '')) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              Color(0xB2000000),
                                                        ),
                                                      );
                                                      return;
                                                    }
                                                    setState(() {
                                                      FFAppState()
                                                              .nonePackageImageBlueBookUploaded =
                                                          _model
                                                              .uploadedFileUrl4;
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพสำเร็จ',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Color(0xB2000000),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 125.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFCEFE4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'ถ่ายรูป',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFFDB771A),
                                                                fontSize: 15.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedFileUrl4 !=
                                                                null &&
                                                            _model.uploadedFileUrl4 !=
                                                                ''
                                                        ? 'สถานะ : อัพโหลดแล้ว'
                                                        : 'สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                if (FFAppState().nonePackageImageBlueBook[
                                                            FFAppState()
                                                                .nonePackageInsurerOutputIndex] !=
                                                        ''
                                                    ? true
                                                    : false)
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
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
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
                                                                  imageUrl: FFAppState().nonePackageImageBlueBook[FFAppState()
                                                                              .nonePackageInsurerOutputIndex] !=
                                                                          ''
                                                                      ? functions.stringToImgPath(FFAppState()
                                                                              .nonePackageImageBlueBook[
                                                                          FFAppState()
                                                                              .nonePackageInsurerOutputIndex])!
                                                                      : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                ),
                                                              ),
                                                            ),
                                                          ));
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .content_paste_search_rounded,
                                                      color: Color(0xFF354052),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                if (_model.uploadedFileUrl4 !=
                                                        null &&
                                                    _model.uploadedFileUrl4 !=
                                                        '')
                                                  Icon(
                                                    Icons.check,
                                                    color: Color(0xFF2EDD78),
                                                    size: 24.0,
                                                  ),
                                                if (_model.uploadedFileUrl4 ==
                                                        null ||
                                                    _model.uploadedFileUrl4 ==
                                                        '')
                                                  Icon(
                                                    Icons.close,
                                                    color: Color(0xFFFC0A0A),
                                                    size: 24.0,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 16.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '2.สำเนาบัตรประชาชนผู้เอาประกัน',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'บังคับถ่ายรูป',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFC0D0D),
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
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
                                                          setState(() => _model
                                                                  .isDataUploading5 =
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
                                                                          name: m
                                                                              .storagePath
                                                                              .split('/')
                                                                              .last,
                                                                          bytes:
                                                                              m.bytes,
                                                                          height: m
                                                                              .dimensions
                                                                              ?.height,
                                                                          width: m
                                                                              .dimensions
                                                                              ?.width,
                                                                          blurHash:
                                                                              m.blurHash,
                                                                        ))
                                                                    .toList();

                                                            downloadUrls =
                                                                (await Future
                                                                        .wait(
                                                              selectedMedia.map(
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
                                                            _model.isDataUploading5 =
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
                                                            setState(() {
                                                              _model.uploadedLocalFile5 =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                              _model.uploadedFileUrl5 =
                                                                  downloadUrls
                                                                      .first;
                                                            });
                                                          } else {
                                                            setState(() {});
                                                            return;
                                                          }
                                                        }

                                                        if (!(_model.uploadedFileUrl5 !=
                                                                null &&
                                                            _model.uploadedFileUrl5 !=
                                                                '')) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
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
                                                          return;
                                                        }
                                                        setState(() {
                                                          FFAppState()
                                                                  .nonePackageIdCardImageUrl =
                                                              _model
                                                                  .uploadedFileUrl5;
                                                        });
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'อัพโหลดรูปภาพสำเร็จ',
                                                              style: TextStyle(
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
                                                      },
                                                      child: Container(
                                                        width: 125.0,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFCEFE4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'ถ่ายรูป',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: Color(
                                                                        0xFFDB771A),
                                                                    fontSize:
                                                                        15.0,
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
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        _model.uploadedFileUrl5 !=
                                                                    null &&
                                                                _model.uploadedFileUrl5 !=
                                                                    ''
                                                            ? 'สถานะ : อัพโหลดแล้ว'
                                                            : 'สถานะ : ยังไม่อัพโหลด',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    if (FFAppState().nonePackageImageIdCard[
                                                                FFAppState()
                                                                    .nonePackageInsurerOutputIndex] !=
                                                            ''
                                                        ? true
                                                        : false)
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
                                                                Color(
                                                                    0xB3000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
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
                                                                      imageUrl: FFAppState().nonePackageImageIdCard[FFAppState().nonePackageInsurerOutputIndex] !=
                                                                              ''
                                                                          ? functions
                                                                              .stringToImgPath(FFAppState().nonePackageImageIdCard[FFAppState().nonePackageInsurerOutputIndex])!
                                                                          : 'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .content_paste_search_rounded,
                                                          color:
                                                              Color(0xFF354052),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    if (_model.uploadedFileUrl5 !=
                                                            null &&
                                                        _model.uploadedFileUrl5 !=
                                                            '')
                                                      Icon(
                                                        Icons.check,
                                                        color:
                                                            Color(0xFF2EDD78),
                                                        size: 24.0,
                                                      ),
                                                    if (_model.uploadedFileUrl5 ==
                                                            null ||
                                                        _model.uploadedFileUrl5 ==
                                                            '')
                                                      Icon(
                                                        Icons.close,
                                                        color:
                                                            Color(0xFFFC0A0A),
                                                        size: 24.0,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 16.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '3. เอกสารอื่นๆ เช่น เล่มรถหางพ่วง',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(ถ่ายได้ไม่เกิน 5 รูป)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (FFAppState()
                                                      .nonePackageInsurerDisplayName
                                                      .length >
                                                  1
                                              ? (functions
                                                      .returnListInList(
                                                          FFAppState()
                                                              .nonePackageImageOther
                                                              .toList(),
                                                          FFAppState()
                                                              .nonePackageInsurerOutputIndex)
                                                      .length >
                                                  0)
                                              : (FFAppState()
                                                      .nonePackageImageOther
                                                      .length >
                                                  0))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'รูปภาพอื่นๆที่เคยอัพโหลดแล้ว',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
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
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      ShowImageListComponentWidget(
                                                                    imageUrl: FFAppState().nonePackageInsurerDisplayName.length >
                                                                            1
                                                                        ? functions.returnListInList(
                                                                            FFAppState()
                                                                                .nonePackageImageOther
                                                                                .toList(),
                                                                            FFAppState()
                                                                                .nonePackageInsurerOutputIndex)
                                                                        : FFAppState()
                                                                            .nonePackageImageOther
                                                                            .map((e) =>
                                                                                e.toString())
                                                                            .toList(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ));
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .content_paste_search_rounded,
                                                        color:
                                                            Color(0xFF354052),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
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
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      imageQuality: 30,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading6 =
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
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading6 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile6 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl6 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        setState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (!(_model.uploadedFileUrl6 !=
                                                            null &&
                                                        _model.uploadedFileUrl6 !=
                                                            '')) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              Color(0xB2000000),
                                                        ),
                                                      );
                                                      return;
                                                    }
                                                    setState(() {
                                                      FFAppState()
                                                              .nonePackageImageOther1 =
                                                          _model
                                                              .uploadedFileUrl6;
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปภาพสำเร็จ',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Color(0xB2000000),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 125.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFCEFE4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'ถ่ายรูป',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFFDB771A),
                                                                fontSize: 15.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.uploadedFileUrl6 !=
                                                                null &&
                                                            _model.uploadedFileUrl6 !=
                                                                ''
                                                        ? 'สถานะ : อัพโหลดแล้ว'
                                                        : 'สถานะ : ยังไม่อัพโหลด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                if (_model.uploadedFileUrl6 !=
                                                        null &&
                                                    _model.uploadedFileUrl6 !=
                                                        '')
                                                  Icon(
                                                    Icons.check,
                                                    color: Color(0xFF2EDD78),
                                                    size: 24.0,
                                                  ),
                                                if (_model.uploadedFileUrl6 ==
                                                        null ||
                                                    _model.uploadedFileUrl6 ==
                                                        '')
                                                  Icon(
                                                    Icons.close,
                                                    color: Color(0xFFFC0A0A),
                                                    size: 24.0,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (_model.uploadedFileUrl6 != null &&
                                              _model.uploadedFileUrl6 != '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
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
                                                        setState(() => _model
                                                                .isDataUploading7 =
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
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading7 =
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
                                                          setState(() {
                                                            _model.uploadedLocalFile7 =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl7 =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          setState(() {});
                                                          return;
                                                        }
                                                      }

                                                      if (!(_model.uploadedFileUrl7 !=
                                                              null &&
                                                          _model.uploadedFileUrl7 !=
                                                              '')) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                              style: TextStyle(
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
                                                        return;
                                                      }
                                                      setState(() {
                                                        FFAppState()
                                                                .nonePackageImageOther2 =
                                                            _model
                                                                .uploadedFileUrl7;
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'อัพโหลดรูปภาพสำเร็จ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              Color(0xB2000000),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 125.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFCEFE4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'ถ่ายรูป',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFDB771A),
                                                                  fontSize:
                                                                      15.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      _model.uploadedFileUrl7 !=
                                                                  null &&
                                                              _model.uploadedFileUrl7 !=
                                                                  ''
                                                          ? 'สถานะ : อัพโหลดแล้ว'
                                                          : 'สถานะ : ยังไม่อัพโหลด',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  if (_model.uploadedFileUrl7 !=
                                                          null &&
                                                      _model.uploadedFileUrl7 !=
                                                          '')
                                                    Icon(
                                                      Icons.check,
                                                      color: Color(0xFF2EDD78),
                                                      size: 24.0,
                                                    ),
                                                  if (_model.uploadedFileUrl7 ==
                                                          null ||
                                                      _model.uploadedFileUrl7 ==
                                                          '')
                                                    Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          if (_model.uploadedFileUrl7 != null &&
                                              _model.uploadedFileUrl7 != '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
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
                                                        setState(() => _model
                                                                .isDataUploading8 =
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
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading8 =
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
                                                          setState(() {
                                                            _model.uploadedLocalFile8 =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl8 =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          setState(() {});
                                                          return;
                                                        }
                                                      }

                                                      if (!(_model.uploadedFileUrl8 !=
                                                              null &&
                                                          _model.uploadedFileUrl8 !=
                                                              '')) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                              style: TextStyle(
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
                                                        return;
                                                      }
                                                      setState(() {
                                                        FFAppState()
                                                                .nonePackageImageOther3 =
                                                            _model
                                                                .uploadedFileUrl8;
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'อัพโหลดรูปภาพสำเร็จ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              Color(0xB2000000),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 125.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFCEFE4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'ถ่ายรูป',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFDB771A),
                                                                  fontSize:
                                                                      15.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      _model.uploadedFileUrl8 !=
                                                                  null &&
                                                              _model.uploadedFileUrl8 !=
                                                                  ''
                                                          ? 'สถานะ : อัพโหลดแล้ว'
                                                          : 'สถานะ : ยังไม่อัพโหลด',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  if (_model.uploadedFileUrl8 !=
                                                          null &&
                                                      _model.uploadedFileUrl8 !=
                                                          '')
                                                    Icon(
                                                      Icons.check,
                                                      color: Color(0xFF2EDD78),
                                                      size: 24.0,
                                                    ),
                                                  if (_model.uploadedFileUrl8 ==
                                                          null ||
                                                      _model.uploadedFileUrl8 ==
                                                          '')
                                                    Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          if (_model.uploadedFileUrl8 != null &&
                                              _model.uploadedFileUrl8 != '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
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
                                                        setState(() => _model
                                                                .isDataUploading9 =
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
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading9 =
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
                                                          setState(() {
                                                            _model.uploadedLocalFile9 =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl9 =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          setState(() {});
                                                          return;
                                                        }
                                                      }

                                                      if (!(_model.uploadedFileUrl9 !=
                                                              null &&
                                                          _model.uploadedFileUrl9 !=
                                                              '')) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                              style: TextStyle(
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
                                                        return;
                                                      }
                                                      setState(() {
                                                        FFAppState()
                                                                .nonePackageImageOther4 =
                                                            _model
                                                                .uploadedFileUrl9;
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'อัพโหลดรูปภาพสำเร็จ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              Color(0xB2000000),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 125.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFCEFE4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'ถ่ายรูป',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFDB771A),
                                                                  fontSize:
                                                                      15.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      _model.uploadedFileUrl9 !=
                                                                  null &&
                                                              _model.uploadedFileUrl9 !=
                                                                  ''
                                                          ? 'สถานะ : อัพโหลดแล้ว'
                                                          : 'สถานะ : ยังไม่อัพโหลด',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  if (_model.uploadedFileUrl9 !=
                                                          null &&
                                                      _model.uploadedFileUrl9 !=
                                                          '')
                                                    Icon(
                                                      Icons.check,
                                                      color: Color(0xFF2EDD78),
                                                      size: 24.0,
                                                    ),
                                                  if (_model.uploadedFileUrl9 ==
                                                          null ||
                                                      _model.uploadedFileUrl9 ==
                                                          '')
                                                    Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          if (_model.uploadedFileUrl9 != null &&
                                              _model.uploadedFileUrl9 != '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
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
                                                        setState(() => _model
                                                                .isDataUploading10 =
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
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading10 =
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
                                                          setState(() {
                                                            _model.uploadedLocalFile10 =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl10 =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          setState(() {});
                                                          return;
                                                        }
                                                      }

                                                      if (!(_model.uploadedFileUrl10 !=
                                                              null &&
                                                          _model.uploadedFileUrl10 !=
                                                              '')) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                              style: TextStyle(
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
                                                        return;
                                                      }
                                                      setState(() {
                                                        FFAppState()
                                                                .nonePackageImageOther5 =
                                                            _model
                                                                .uploadedFileUrl10;
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'อัพโหลดรูปภาพสำเร็จ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              Color(0xB2000000),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 125.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFCEFE4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'ถ่ายรูป',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFDB771A),
                                                                  fontSize:
                                                                      15.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      _model.uploadedFileUrl10 !=
                                                                  null &&
                                                              _model.uploadedFileUrl10 !=
                                                                  ''
                                                          ? 'สถานะ : อัพโหลดแล้ว'
                                                          : 'สถานะ : ยังไม่อัพโหลด',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  if (_model.uploadedFileUrl10 !=
                                                          null &&
                                                      _model.uploadedFileUrl10 !=
                                                          '')
                                                    Icon(
                                                      Icons.check,
                                                      color: Color(0xFF2EDD78),
                                                      size: 24.0,
                                                    ),
                                                  if (_model.uploadedFileUrl10 ==
                                                          null ||
                                                      _model.uploadedFileUrl10 ==
                                                          '')
                                                    Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24.0,
                                                    ),
                                                ],
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
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.75),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 50.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    _model.insuranceEditOutput =
                                        await InsuranceRequestEditAPICall.call(
                                      apiUrl:
                                          FFAppState().apiUrlInsuranceAppState,
                                      token: FFAppState().accessToken,
                                      leadId: FFAppState().nonePackageLeadId,
                                      leadNo: FFAppState().nonePackageLeadNo,
                                      imageFront: FFAppState()
                                          .nonePackageImageFrontUploaded,
                                      imageRightfront: FFAppState()
                                          .nonePackageImageRightFrontUploaded,
                                      imageRight: FFAppState()
                                          .nonePackageImageRightUploaded,
                                      imageRightrear: FFAppState()
                                          .nonePackageImageRightRearUploaded,
                                      imageRear: FFAppState()
                                          .nonePackageImageRearUploaded,
                                      imageLeftrear: FFAppState()
                                          .nonePackageImageLeftRearUploaded,
                                      imageLeft: FFAppState()
                                          .nonePackageImageLeftUploaded,
                                      imageLeftfront: FFAppState()
                                          .nonePackageImageLeftFrontUploaded,
                                      imageRoof: FFAppState()
                                          .nonePackageImageRoofUploaded,
                                      imageFrontTrailer: FFAppState()
                                          .nonePackageTrailerImageFrontUploaded,
                                      imageRightfrontTrailer: FFAppState()
                                          .nonePackageTrailerImageRightFrontUploaded,
                                      imageRightTrailer: FFAppState()
                                          .nonePackageTrailerImageRightUploaded,
                                      imageRightrearTrailer: FFAppState()
                                          .nonePackageTrailerImageRightRearUploaded,
                                      imageRearTrailer: FFAppState()
                                          .nonePackageTrailerImageRearUploaded,
                                      imageLeftrearTrailer: FFAppState()
                                          .nonePackageTrailerImageLeftRearUploaded,
                                      imageLeftTrailer: FFAppState()
                                          .nonePackageTrailerImageLeftUploaded,
                                      imageLeftfrontTrailer: FFAppState()
                                          .nonePackageTrailerImageLeftFrontUploaded,
                                      imageIdcard: FFAppState()
                                          .nonePackageIdCardImageUrl,
                                      imageBluebook: FFAppState()
                                          .nonePackageImageBlueBookUploaded,
                                      imageOther1:
                                          FFAppState().nonePackageImageOther1,
                                      imageOther2:
                                          FFAppState().nonePackageImageOther2,
                                      imageOther3:
                                          FFAppState().nonePackageImageOther3,
                                      imageOther4:
                                          FFAppState().nonePackageImageOther4,
                                      imageOther5:
                                          FFAppState().nonePackageImageOther5,
                                      insurerShortName: FFAppState()
                                              .nonePackageInsurerShortNameList[
                                          FFAppState()
                                              .nonePackageInsurerOutputIndex],
                                      imageOtherName: FFAppState()
                                              .nonePackageImageOtherNameList[
                                          FFAppState()
                                              .nonePackageInsurerOutputIndex],
                                      oldVMIImage: FFAppState()
                                          .nonePackageOldVmiImageUrl,
                                      imageCompanyBook: FFAppState()
                                          .nonePackageCompanyBookImageUrl,
                                      checkEdit: 'edit',
                                      branchCode: functions
                                              .checkIsStringLengthInLength(
                                                  FFAppState().branchCode, 2)!
                                          ? FFAppState().branchCode
                                          : FFAppState().nonePackageBranchCode,
                                      branchName: functions
                                              .checkIsStringLengthInLength(
                                                  FFAppState().branchCode, 2)!
                                          ? FFAppState().profileUnitCodeName
                                          : FFAppState().nonePackageBranchName,
                                    );
                                    _shouldSetState = true;
                                    if ((_model.insuranceEditOutput
                                                ?.statusCode ??
                                            200) !=
                                        200) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาดConnection (${(_model.insuranceEditOutput?.statusCode ?? 200).toString()})'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ));
                                        },
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (InsuranceRequestEditAPICall
                                            .statusLayer2(
                                          (_model.insuranceEditOutput
                                                  ?.jsonBody ??
                                              ''),
                                        ) !=
                                        FFAppState().successStatusJson) {
                                      if (InsuranceRequestEditAPICall
                                              .statusLayer2(
                                            (_model.insuranceEditOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          FFAppState().unsuccessStatusJson) {
                                        context
                                            .goNamed('InsuranceUnSuccessPage');
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                                child: AlertDialog(
                                              content: Text(
                                                  'พบข้อผิดพลาด (${InsuranceRequestEditAPICall.statusLayer2(
                                                (_model.insuranceEditOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString()})'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ));
                                          },
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                            child: AlertDialog(
                                          content: Text(
                                              InsuranceRequestEditAPICall
                                                  .messageLayer2(
                                            (_model.insuranceEditOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ).toString()),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ));
                                      },
                                    );
                                    setState(() {
                                      FFAppState().nonePackageFlagCarrier =
                                          false;
                                      FFAppState().nonePackageVehicleType =
                                          'กรุณาเลือกประเภทรถ';
                                      FFAppState().nonePackageBrandName =
                                          'กรุณาเลือกยี่ห้อรถ';
                                      FFAppState().nonePackageBrandId = '';
                                      FFAppState().nonePackageModelName =
                                          'กรุณากรอกรุ่นรถ';
                                      FFAppState().nonePackageModelCode = '';
                                      FFAppState().nonePackageYear =
                                          'กรุณาเลือกปีจดทะเบียน';
                                      FFAppState().nonePackageUsedTypeId = '';
                                      FFAppState().nonePackageSearchModelList =
                                          [];
                                      FFAppState().nonePackageUsedTypeCode = '';
                                      FFAppState().nonePackageUsedTypeName =
                                          'กรุณาเลือกลักษณะการใช้รถ';
                                      FFAppState().nonePackageCusFullname =
                                          'กรุณากรอกชื่อ';
                                      FFAppState().nonePackageCusPhone =
                                          'กรุณากรอกเบอร์โทรศัพท์';
                                      FFAppState().nonePackagePlate = '';
                                      FFAppState().nonePackageProvince =
                                          'กรุณาเลือกจังหวัดจดทะเบียน';
                                      FFAppState().nonePackageProvinceId = '';
                                      FFAppState().nonePackageSumInsured =
                                          'กรุณากรอกทุนประกัน';
                                      FFAppState().nonePackageFlagAct = true;
                                      FFAppState().nonePackageIsBrandSelect =
                                          false;
                                      FFAppState()
                                          .nonePackageSearchModelIdList = [];
                                      FFAppState().nonePackageCarrierType =
                                          'กรุณาเลือกประเภทตู้เหล็ก';
                                      FFAppState().nonePackageFlagCoop = false;
                                      FFAppState().nonePackageTruckPart =
                                          'กรุณาเลือกส่วนของรถบรรทุก';
                                      FFAppState().nonePackageCusMembership =
                                          'กรุณาเลือกประเภทลูกค้า';
                                      FFAppState()
                                              .nonePackageTruckCurrentPrice =
                                          'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                      FFAppState().nonePackagePlateAdditional =
                                          'กรุณากรอกเลขทะเบียนหางพ่วง';
                                      FFAppState()
                                              .nonePackageTruckCarryPurpose =
                                          'กรุณากรอกรถใช้บรรทุกอะไร';
                                      FFAppState()
                                              .nonePackageTrailerSumInsured =
                                          'กรุณากรอกทุนประกันหางพ่วง';
                                      FFAppState().nonePackageCarrierPrice = '';
                                      FFAppState().nonePackageInsurerIdList =
                                          [];
                                      FFAppState().nonePackageInsurerCodeList =
                                          [];
                                      FFAppState()
                                          .nonePackageInsurerShortNameList = [];
                                      FFAppState().nonePackageInsurerNameList =
                                          [];
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
                                      FFAppState().nonePackageCoverTypeId = '';
                                      FFAppState().nonePackageCoverTypeCode =
                                          '';
                                      FFAppState().nonePackageCoverTypeName =
                                          'กรุณาเลือกประเภทชั้นประกัน';
                                      FFAppState().nonePackageGarageTypeId = '';
                                      FFAppState().nonePackageGarageTypeName =
                                          'กรุณาเลือกประเภทการซ่อม';
                                      FFAppState().nonePackageGarageTypeCode =
                                          '';
                                      FFAppState().nonePackageFlagRenew = false;
                                      FFAppState().nonePackageOldVmiExpDate =
                                          'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                      FFAppState().nonePackageOldVmi = '';
                                      FFAppState().nonePackageOldVmiImageUrl =
                                          '';
                                      FFAppState().nonePackageIdCardImageUrl =
                                          '';
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
                                      FFAppState().buttonCorporation = false;
                                      FFAppState().nonePackageCustomerType = '';
                                      FFAppState()
                                          .nonePackageInsurerDisplayNameOutput = '';
                                      FFAppState().nonePackageImageOther = [];
                                      FFAppState().nonePackageImageFront = [];
                                      FFAppState().nonePackageImageRightFront =
                                          [];
                                      FFAppState().nonePackageImageRight = [];
                                      FFAppState().nonePackageImageRightRear =
                                          [];
                                      FFAppState().nonePackageImageRear = [];
                                      FFAppState().nonePackageImageLeftRear =
                                          [];
                                      FFAppState().nonePackageImageLeft = [];
                                      FFAppState().nonePackageImageLeftFront =
                                          [];
                                      FFAppState().nonePackageImageRoof = [];
                                      FFAppState()
                                          .nonePackageTrailerImageFront = [];
                                      FFAppState()
                                          .nonePackageTrailerImageRightFront = [];
                                      FFAppState()
                                          .nonePackageTrailerImageRight = [];
                                      FFAppState()
                                          .nonePackageTrailerImageRightRear = [];
                                      FFAppState().nonePackageTrailerImageRear =
                                          [];
                                      FFAppState()
                                          .nonePackageTrailerImageLeftRear = [];
                                      FFAppState().nonePackageTrailerImageLeft =
                                          [];
                                      FFAppState()
                                          .nonePackageTrailerImageLeftFront = [];
                                      FFAppState()
                                          .nonePackageInsurerOutputIndex = 0;
                                      FFAppState().nonePackageLeadId = '';
                                      FFAppState().nonePackageLeadNo = '';
                                      FFAppState()
                                          .nonePackageCarImageUploadedList = [];
                                      FFAppState().nonePackageImageOldVmi = [];
                                      FFAppState().nonePackageImageCompanyBook =
                                          [];
                                      FFAppState().nonePackageImageIdCard = [];
                                      FFAppState().nonePackageImageBlueBook =
                                          [];
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
                                      FFAppState().nonePackageImageOther1 = '';
                                      FFAppState().nonePackageImageOther2 = '';
                                      FFAppState().nonePackageImageOther3 = '';
                                      FFAppState().nonePackageImageOther4 = '';
                                      FFAppState().nonePackageImageOther5 = '';
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
                                      FFAppState().nonePackageFlagOldVmi = '';
                                      FFAppState().nonePackageWorkType = '';
                                      FFAppState().nonePackageRemark = '';
                                      FFAppState().nonePackageBranchCode = '';
                                      FFAppState().nonePackageBranchName = '';
                                      FFAppState()
                                          .nonePackageInsurerShortNameDupList = [];
                                    });

                                    context.goNamed('insuranceListPage');

                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: 'บันทึก',
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
                                          fontSize: 16.0,
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
