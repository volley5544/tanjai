import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'none_package_edit_page1_model.dart';
export 'none_package_edit_page1_model.dart';

class NonePackageEditPage1Widget extends StatefulWidget {
  const NonePackageEditPage1Widget({Key? key}) : super(key: key);

  @override
  _NonePackageEditPage1WidgetState createState() =>
      _NonePackageEditPage1WidgetState();
}

class _NonePackageEditPage1WidgetState
    extends State<NonePackageEditPage1Widget> {
  late NonePackageEditPage1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NonePackageEditPage1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NonePackageEditPage1'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().nonePackageInsurerSelectedList = functions
            .createFalseListByItemNumber(
                false, FFAppState().nonePackageInsurerDisplayName.length)!
            .toList()
            .cast<bool>();
      });
    });

    _model.textController ??= TextEditingController(
        text: FFAppState().nonePackageCusFullname == '-'
            ? ''
            : FFAppState().nonePackageCusFullname);
    _model.textFieldFocusNode ??= FocusNode();

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
            nonePackageEditPage1UrlLinkStorageRecordList = snapshot.data!;
        final nonePackageEditPage1UrlLinkStorageRecord =
            nonePackageEditPage1UrlLinkStorageRecordList.isNotEmpty
                ? nonePackageEditPage1UrlLinkStorageRecordList.first
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
                    context.goNamed('insuranceListPage');
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
                    if (!functions.checkIsStringLengthInLength(
                        FFAppState().branchCode, 2)!)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 5.0, 12.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'เลือกสาขาที่จะลงผลงาน',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF002D5E),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '(บังคับเลือก)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFFB0606),
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SearchBranchPage',
                                      queryParameters: {
                                        'fromPage': serializeParam(
                                          'NonePackage',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    await actions.hideKeyboardAction(
                                      context,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF0F0F0),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Color(0xFF737373),
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: ListTile(
                                        title: Text(
                                          (FFAppState().nonePackageBranchCode !=
                                                      '') &&
                                                  (FFAppState()
                                                          .nonePackageBranchName !=
                                                      '')
                                              ? '(${FFAppState().nonePackageBranchCode}) ${FFAppState().nonePackageBranchName}'
                                              : 'กรุณาเลือกสาขาที่จะลงผลงาน',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: (FFAppState()
                                                                .nonePackageBranchCode !=
                                                            '') &&
                                                        (FFAppState()
                                                                .nonePackageBranchName !=
                                                            '')
                                                    ? Colors.black
                                                    : Color(0xFF9F9F9F),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF474747),
                                          size: 20.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 682.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'ชื่อลูกค้า',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 10.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F0F0),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFF737373),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    autofocus: true,
                                                    readOnly: FFAppState()
                                                                .nonePackageCusFullname ==
                                                            '-'
                                                        ? false
                                                        : true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintText: 'กรุณากรอก...',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFF565656),
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 14.0,
                                                        ),
                                                    validator: _model
                                                        .textControllerValidator
                                                        .asValidator(context),
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 12.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ประเภทชั้นประกัน',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF002D5E),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 10.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F0F0),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFF737373),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFAppState().nonePackageCoverTypeName ==
                                                          '-'
                                                      ? ''
                                                      : FFAppState()
                                                          .nonePackageCoverTypeName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 19.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'บริษัทประกันที่ต้องการแก้ไขรูปถ่าย',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF002D5E),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final dataList = FFAppState()
                                      .nonePackageInsurerDisplayName
                                      .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      12.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: dataList.length,
                                    itemBuilder: (context, dataListIndex) {
                                      final dataListItem =
                                          dataList[dataListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 5.0, 12.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
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
                                                    setState(() {
                                                      FFAppState().nonePackageInsurerSelectedList = functions
                                                          .setBoolValueListAtIndex(
                                                              functions
                                                                  .createFalseListByItemNumber(
                                                                      false,
                                                                      FFAppState()
                                                                          .nonePackageInsurerDisplayName
                                                                          .length)
                                                                  ?.toList(),
                                                              dataListIndex)!
                                                          .toList()
                                                          .cast<bool>();
                                                    });
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFB3B3B3),
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
                                                                    .nonePackageInsurerDisplayName[
                                                                dataListIndex],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFB3B3B3),
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        if (!FFAppState()
                                                                .nonePackageInsurerSelectedList[
                                                            dataListIndex])
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF9F9F9F),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (FFAppState()
                                                                .nonePackageInsurerSelectedList[
                                                            dataListIndex])
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Icon(
                                                                  Icons.check,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 18.0,
                                                                ),
                                                              ),
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
                            Align(
                              alignment: AlignmentDirectional(0.00, 1.00),
                              child: Container(
                                width: double.infinity,
                                height: 69.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Color(0x34111417),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed('NonePackageEditDetailPage');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFF636366),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Icon(
                                                Icons.edit_document,
                                                color: Color(0xFF7A848E),
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'ตรวจสอบรายละเอียดการขอประกัน',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF002D5E),
                                              fontSize: 16.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 13.0, 0.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF636366),
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 50.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (!functions
                                              .checkIsStringLengthInLength(
                                                  FFAppState().branchCode,
                                                  2)!) {
                                            if (!((FFAppState()
                                                        .nonePackageBranchCode !=
                                                    '') &&
                                                (FFAppState()
                                                        .nonePackageBranchName !=
                                                    '') &&
                                                functions
                                                    .checkIsStringLengthInLength(
                                                        FFAppState()
                                                            .nonePackageBranchCode,
                                                        2)!)) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                      child: AlertDialog(
                                                    content: Text(
                                                        'กรุณาเลือกสาขาที่จะลงผลงาน'),
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
                                              return;
                                            }
                                          }
                                          if (functions.countTrueInBoolList(
                                                  FFAppState()
                                                      .nonePackageInsurerSelectedList
                                                      .toList())! <=
                                              0) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                    child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาเลือกบริษัทประกันอย่างน้อย 1 บริษัท'),
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
                                            return;
                                          }
                                          setState(() {
                                            FFAppState()
                                                .nonePackageInsurerDisplayNameOutput = FFAppState()
                                                    .nonePackageInsurerDisplayName[
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .nonePackageInsurerSelectedList
                                                        .toList(),
                                                    true)];
                                            FFAppState()
                                                    .nonePackageInsurerOutputIndex =
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .nonePackageInsurerSelectedList
                                                        .toList(),
                                                    true);
                                          });
                                          if (FFAppState()
                                              .nonePackageFlagRenew) {
                                            context.pushNamed(
                                                'NonePackageEditPage3');

                                            return;
                                          }

                                          context.pushNamed(
                                              'NonePackageEditPage2');
                                        },
                                        text: 'ถัดไป',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFDB771B),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 24.0))
                                    .addToStart(SizedBox(height: 16.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].addToStart(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
