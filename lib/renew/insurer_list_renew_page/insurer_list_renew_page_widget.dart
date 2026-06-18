import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'insurer_list_renew_page_model.dart';
export 'insurer_list_renew_page_model.dart';

class InsurerListRenewPageWidget extends StatefulWidget {
  const InsurerListRenewPageWidget({
    super.key,
    required this.dataPackage,
    required this.refRenewId,
  });

  final PackageDataModelStruct? dataPackage;
  final String? refRenewId;

  static String routeName = 'insurerListRenewPage';
  static String routePath = 'insurerListRenewPage';

  @override
  State<InsurerListRenewPageWidget> createState() =>
      _InsurerListRenewPageWidgetState();
}

class _InsurerListRenewPageWidgetState extends State<InsurerListRenewPageWidget>
    with TickerProviderStateMixin {
  late InsurerListRenewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsurerListRenewPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insurerListRenewPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectInsurerList = functions
          .createFalseListByItemNumber(
              false, widget!.dataPackage?.package?.length)!
          .toList()
          .cast<bool>();
      FFAppState().addCustomerQuotationSaveSuccess = false;
      safeSetState(() {});
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
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
                FFAppState().filterInsurerList = [];
                safeSetState(() {});
                context.safePop();
              },
            ),
            title: Text(
              FFAppState().searchPackageSubProduct == 'MC'
                  ? 'ค้นหาประกันมอเตอร์ไซค์'
                  : 'ค้นหาประกันรถ',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.notoSansThai(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Color(0xFF003063),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<InsurerConfig2Record>>(
                          stream: queryInsurerConfig2Record(
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
                            List<InsurerConfig2Record>
                                columnInsurerConfig2RecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnInsurerConfig2Record =
                                columnInsurerConfig2RecordList.isNotEmpty
                                    ? columnInsurerConfig2RecordList.first
                                    : null;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<List<HideInAppContentRecord>>(
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<HideInAppContentRecord>
                                        columnHideInAppContentRecordList =
                                        snapshot.data!;
                                    final columnHideInAppContentRecord =
                                        columnHideInAppContentRecordList
                                                .isNotEmpty
                                            ? columnHideInAppContentRecordList
                                                .first
                                            : null;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          'ค้นหาชื่อบริษัทประกัน ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '(เลือกเปรียบเทียบสูงสุด 3 รายการเท่านั้น)',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 8.0),
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
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
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
                                                                'ค้นหาเปรียบเทียบบริษัทประกัน',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSansThai(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 18.0,
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
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'ราคาเบี้ยต่ำสุด:${widget!.dataPackage?.minGrossTotal}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'ราคาเบี้ยสูงสุด:${widget!.dataPackage?.maxGrossTotal}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 4.0, 24.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'ทุนประกันต่ำสุด:${widget!.dataPackage?.minSumInsured}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'ทุนประกันสูงสุด:${widget!.dataPackage?.maxSumInsured}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        25.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'เลือกได้สูงสุด 3  รายการ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '(${'${functions.countTrueInBoolList(FFAppState().selectInsurerList.toList()).toString()}/ 2'})',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 0.0, 25.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  '*หากไม่ขึ้นการ์ดแพ็คเกจ หมายถึงไม่มีแพ็คเกจจากค่าที่ฟิลเตอร์*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.55,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (widget!.dataPackage!.package
                                                        .length >
                                                    0)
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listinsurance =
                                                            widget!.dataPackage
                                                                    ?.package
                                                                    ?.toList() ??
                                                                [];

                                                        return ListView.builder(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            4.0,
                                                            0,
                                                            0,
                                                          ),
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listinsurance
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listinsuranceIndex) {
                                                            final listinsuranceItem =
                                                                listinsurance[
                                                                    listinsuranceIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          8.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 1,
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
                                                                          if (functions.countTrueInBoolList(FFAppState().selectInsurerList.toList())! >
                                                                              1) {
                                                                            if (!FFAppState().selectInsurerList.elementAtOrNull(listinsuranceIndex)!) {
                                                                              return;
                                                                            }
                                                                          }
                                                                          HapticFeedback
                                                                              .mediumImpact();
                                                                          FFAppState()
                                                                              .updateSelectInsurerListAtIndex(
                                                                            listinsuranceIndex,
                                                                            (_) => FFAppState().selectInsurerList.elementAtOrNull(listinsuranceIndex) == true
                                                                                ? false
                                                                                : true,
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 15.0,
                                                                                  height: 15.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  child: Visibility(
                                                                                    visible: FFAppState().selectInsurerList.elementAtOrNull(listinsuranceIndex) ?? true,
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      color: FlutterFlowTheme.of(context).success,
                                                                                      size: 12.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 9,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            6.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 1,
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 15.0, 30.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 40.0,
                                                                                              height: 40.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                shape: BoxShape.rectangle,
                                                                                              ),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.network(
                                                                                                  getCORSProxyUrl(
                                                                                                    valueOrDefault<String>(
                                                                                                      functions.stringToImgPath(listinsuranceItem.logo),
                                                                                                      'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                                                    ),
                                                                                                  ),
                                                                                                  width: 150.0,
                                                                                                  height: 150.0,
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Text(
                                                                                                  listinsuranceItem.serialName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 11.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        if (false)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                      child: Text(
                                                                                                        listinsuranceItem.packageName,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.notoSansThai(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        if (FFAppState().searchInspectionExcept.elementAtOrNull(listinsuranceIndex) == 'Y')
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ไม่ต้องถ่ายรูปรถ',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        if (columnInsurerConfig2Record?.insurerInstallment?.contains(FFAppState().searchShortName.elementAtOrNull(listinsuranceIndex)) ?? true)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ชำระเต็มจำนวนเท่านั้น',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'ประเภทประกัน',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.notoSansThai(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      fontSize: 11.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.showCoverTypeThai(listinsuranceItem.coverType),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 11.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'ทุนประกัน',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.notoSansThai(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    functions.showNumberWithComma(listinsuranceItem.sumInsured),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'ประเภทซ่อม',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.notoSansThai(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.showGarageType(listinsuranceItem.garageType),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        if (FFAppState().searchSumInsured.elementAtOrNull(listinsuranceIndex) != '')
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'สูญหายไฟไหม้',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      functions.showNumberWithComma(listinsuranceItem.carLost),
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.notoSansThai(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        if (listinsuranceItem.motorAddOn != '')
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ประกันภัยเสริมรถยนต์ Motor Add-on',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.check_circle,
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        if (FFAppState().searchDeductible.elementAtOrNull(listinsuranceIndex) != '0')
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ค่าเสียหายส่วนเเรก',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      functions.showNumberWithComma(listinsuranceItem.deductible),
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.notoSansThai(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        if ((FFAppState().searchDiscountflg.elementAtOrNull(listinsuranceIndex) == '1') && false)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'เปอร์เซ็นต์ส่วนลด',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${FFAppState().searchDiscountpercent.elementAtOrNull(listinsuranceIndex)} %',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.notoSansThai(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        if ((FFAppState().searchDiscountflg.elementAtOrNull(listinsuranceIndex) == '1') && false)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ราคาส่วนลด',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.notoSansThai(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${functions.showNumberWithComma(FFAppState().searchDiscountother.elementAtOrNull(listinsuranceIndex))} บาท',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.notoSansThai(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        if ((FFAppState().searchDiscountflg.elementAtOrNull(listinsuranceIndex) != '1') || true) {
                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'ราคาเบี้ย',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.notoSansThai(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      '${functions.showNumberWithComma(listinsuranceItem.grossTotalNet)} บาท',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.notoSansThai(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            fontSize: 11.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        } else {
                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'ราคาเบี้ยร่วมส่วนลด',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.notoSansThai(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      '${functions.showNumberWithComma(FFAppState().searchGrosstotaldiscount.elementAtOrNull(listinsuranceIndex))} บาท',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.notoSansThai(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            fontSize: 11.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 10.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed(
                                                                                          RenewDetailPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'refRenewId': serializeParam(
                                                                                              widget!.refRenewId,
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'packageRenew': serializeParam(
                                                                                              functions.createListofOne(listinsuranceItem),
                                                                                              ParamType.DataStruct,
                                                                                              isList: true,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );

                                                                                        FFAppState().addCustomerQuotationSaveSuccess = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: 'รายละเอียด',
                                                                                      options: FFButtonOptions(
                                                                                        height: 30.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: Color(0x9EFF6500),
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.notoSansThai(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0),
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
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (widget!.dataPackage == null)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
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
                                                                0.53,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
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
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'ไม่พบข้อมูลรายการประกัน',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
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
                                        if ((FFAppState()
                                                    .searchInsurerInsurershortname
                                                    .length >
                                                0) &&
                                            (functions.countTrueInBoolList(
                                                    FFAppState()
                                                        .selectInsurerList
                                                        .toList())! >=
                                                1))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 8.0, 20.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  RenewDetailPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'refRenewId':
                                                        serializeParam(
                                                      widget!.refRenewId,
                                                      ParamType.String,
                                                    ),
                                                    'packageRenew':
                                                        serializeParam(
                                                      functions.getSelectedPackage(
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true,
                                                          widget!.dataPackage
                                                              ?.package
                                                              ?.toList()),
                                                      ParamType.DataStruct,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                FFAppState()
                                                        .addCustomerQuotationSaveSuccess =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF5CC2BC),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'เปรียบเทียบ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansThai(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 4.0, 20.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .carSide,
                                                              color: Color(
                                                                  0xB0FF9936),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'งานต่ออายุ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
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
                                                                  FFAppState()
                                                                      .nonePackageRemark = '';
                                                                  FFAppState()
                                                                      .nonePackageBranchCode = '';
                                                                  FFAppState()
                                                                      .nonePackageBranchName = '';
                                                                  FFAppState()
                                                                      .nonePackageInsurerShortNameDupList = [];
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageFlagRenew =
                                                                      true;
                                                                  FFAppState()
                                                                          .nonePackageOldVmiImageUploadedCheck =
                                                                      false;
                                                                  FFAppState()
                                                                          .nonePackageIdCardWatermarkUploadedCheck =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageVehicleType =
                                                                      FFAppState()
                                                                          .insuranceVehicleTypeDropDown;
                                                                  FFAppState()
                                                                          .nonePackageBrandName =
                                                                      FFAppState()
                                                                          .insuranceBasicBrandName;
                                                                  FFAppState()
                                                                          .nonePackageBrandId =
                                                                      FFAppState()
                                                                          .insuranceBasicBrandId;
                                                                  FFAppState()
                                                                          .nonePackageModelName =
                                                                      FFAppState()
                                                                          .insuranceBasicModelName;
                                                                  FFAppState()
                                                                          .nonePackageModelCode =
                                                                      FFAppState()
                                                                          .insuranceBasicModelId;
                                                                  FFAppState()
                                                                          .nonePackageYear =
                                                                      FFAppState()
                                                                          .insuranceBasicYear;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeId =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeId;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeCode =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeCode;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeName =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeName;
                                                                  FFAppState()
                                                                          .nonePackageSearchModelList =
                                                                      FFAppState()
                                                                          .insuranceBasicModelNameList
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                  FFAppState()
                                                                          .nonePackageSearchModelIdList =
                                                                      FFAppState()
                                                                          .insuranceBasicModelIdList
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                  FFAppState()
                                                                          .nonePackageIsBrandSelect =
                                                                      FFAppState()
                                                                          .searchPackageCheckFilled
                                                                          .elementAtOrNull(
                                                                              1)!;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageOldVmiExpDate =
                                                                      FFAppState()
                                                                          .insuranceBasicOldVmiExpDate;
                                                                  safeSetState(
                                                                      () {});
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
                                                                  safeSetState(
                                                                      () {});

                                                                  context
                                                                      .pushNamed(
                                                                    NonePackageRenewPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'workType':
                                                                          serializeParam(
                                                                        'renew',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                text: 'ต่ออายุ',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 30.0,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFEFE2D8),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansThai(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFFDB771A),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
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
                                        if (FFAppState()
                                                .searchPackageSubProduct !=
                                            'MC')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 4.0, 20.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .carSide,
                                                              color: Color(
                                                                  0xFF7A848E),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'งานนอกเรท',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
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
                                                                  FFAppState()
                                                                      .nonePackageRemark = '';
                                                                  FFAppState()
                                                                      .nonePackageBranchCode = '';
                                                                  FFAppState()
                                                                      .nonePackageBranchName = '';
                                                                  FFAppState()
                                                                      .nonePackageInsurerShortNameDupList = [];
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageFlagRenew =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageVehicleType =
                                                                      FFAppState()
                                                                          .insuranceVehicleTypeDropDown;
                                                                  FFAppState()
                                                                          .nonePackageBrandName =
                                                                      FFAppState()
                                                                          .insuranceBasicBrandName;
                                                                  FFAppState()
                                                                          .nonePackageBrandId =
                                                                      FFAppState()
                                                                          .insuranceBasicBrandId;
                                                                  FFAppState()
                                                                          .nonePackageModelName =
                                                                      FFAppState()
                                                                          .insuranceBasicModelName;
                                                                  FFAppState()
                                                                          .nonePackageModelCode =
                                                                      FFAppState()
                                                                          .insuranceBasicModelId;
                                                                  FFAppState()
                                                                          .nonePackageYear =
                                                                      FFAppState()
                                                                          .insuranceBasicYear;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeId =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeId;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeCode =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeCode;
                                                                  FFAppState()
                                                                          .nonePackageUsedTypeName =
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeName;
                                                                  FFAppState()
                                                                          .nonePackageSearchModelList =
                                                                      FFAppState()
                                                                          .insuranceBasicModelNameList
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                  FFAppState()
                                                                          .nonePackageSearchModelIdList =
                                                                      FFAppState()
                                                                          .insuranceBasicModelIdList
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                  FFAppState()
                                                                          .nonePackageIsBrandSelect =
                                                                      FFAppState()
                                                                          .searchPackageCheckFilled
                                                                          .elementAtOrNull(
                                                                              1)!;
                                                                  FFAppState()
                                                                      .nonePackageOldVmiExpDate = '';
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nonePackageOldVmiExpDate =
                                                                      FFAppState()
                                                                          .insuranceBasicOldVmiExpDate;
                                                                  safeSetState(
                                                                      () {});
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
                                                                  safeSetState(
                                                                      () {});

                                                                  context.pushNamed(
                                                                      SelectReasonPageWidget
                                                                          .routeName);
                                                                },
                                                                text: 'นอกเรท',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 30.0,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFD9D9D9),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansThai(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF090F13),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
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
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
