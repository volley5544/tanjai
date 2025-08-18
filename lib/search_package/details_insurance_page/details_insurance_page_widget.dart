import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'details_insurance_page_model.dart';
export 'details_insurance_page_model.dart';

class DetailsInsurancePageWidget extends StatefulWidget {
  const DetailsInsurancePageWidget({
    super.key,
    String? insurerFullName,
    String? currentDate,
    String? brandId,
    String? brandName,
    String? modelCode,
    String? modelName,
    String? year,
    String? driverType,
    String? grossTotal,
    String? sumInsured,
    String? tppd,
    String? pa,
    String? grossAct,
    String? expireDate,
    String? coverTypeId,
    String? coverTypeCode,
    String? coverTypeName,
    String? garageTypeId,
    String? garageTypeName,
    String? insurerId,
    String? insurerShortName,
    String? garageTypeCode,
    String? tpbiPerson,
    String? tpbiAccident,
    String? logoUrl,
    required this.yearProduct,
    required this.accessory,
    required this.productId,
    required this.packageId,
    required this.packageName,
    required this.roadsideAssis,
    required this.flood,
    required this.deductible,
    required this.me,
    required this.bb,
    required this.seat,
    required this.netPremium,
    required this.vat,
    required this.stamp,
    required this.insurerMaxName,
    required this.contractProcessstate,
    this.insurerCondition,
    required this.cc,
    required this.insurerConfig,
    required this.carLost,
    required this.motorAddOn,
    required this.driverBehavior,
    this.inspectionExcept,
  })  : this.insurerFullName = insurerFullName ?? '-',
        this.currentDate = currentDate ?? '-',
        this.brandId = brandId ?? '-',
        this.brandName = brandName ?? '-',
        this.modelCode = modelCode ?? '-',
        this.modelName = modelName ?? '-',
        this.year = year ?? '-',
        this.driverType = driverType ?? '-',
        this.grossTotal = grossTotal ?? '-',
        this.sumInsured = sumInsured ?? '-',
        this.tppd = tppd ?? '-',
        this.pa = pa ?? '-',
        this.grossAct = grossAct ?? '-',
        this.expireDate = expireDate ?? '-',
        this.coverTypeId = coverTypeId ?? '-',
        this.coverTypeCode = coverTypeCode ?? '-',
        this.coverTypeName = coverTypeName ?? '-',
        this.garageTypeId = garageTypeId ?? '-',
        this.garageTypeName = garageTypeName ?? '-',
        this.insurerId = insurerId ?? '-',
        this.insurerShortName = insurerShortName ?? '-',
        this.garageTypeCode = garageTypeCode ?? '-',
        this.tpbiPerson = tpbiPerson ?? '-',
        this.tpbiAccident = tpbiAccident ?? '-',
        this.logoUrl = logoUrl ??
            'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949';

  final String insurerFullName;
  final String currentDate;
  final String brandId;
  final String brandName;
  final String modelCode;
  final String modelName;
  final String year;
  final String driverType;
  final String grossTotal;
  final String sumInsured;
  final String tppd;
  final String pa;
  final String grossAct;
  final String expireDate;
  final String coverTypeId;
  final String coverTypeCode;
  final String coverTypeName;
  final String garageTypeId;
  final String garageTypeName;
  final String insurerId;
  final String insurerShortName;
  final String garageTypeCode;
  final String tpbiPerson;
  final String tpbiAccident;
  final String logoUrl;
  final String? yearProduct;
  final String? accessory;
  final String? productId;
  final String? packageId;
  final String? packageName;
  final String? roadsideAssis;
  final String? flood;
  final String? deductible;
  final String? me;
  final String? bb;
  final String? seat;
  final String? netPremium;
  final String? vat;
  final String? stamp;
  final String? insurerMaxName;
  final String? contractProcessstate;
  final String? insurerCondition;
  final String? cc;
  final InsurerConfig2Record? insurerConfig;
  final String? carLost;
  final String? motorAddOn;
  final String? driverBehavior;
  final String? inspectionExcept;

  static String routeName = 'detailsInsurancePage';
  static String routePath = 'detailsInsurancePage';

  @override
  State<DetailsInsurancePageWidget> createState() =>
      _DetailsInsurancePageWidgetState();
}

class _DetailsInsurancePageWidgetState
    extends State<DetailsInsurancePageWidget> {
  late DetailsInsurancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsInsurancePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'detailsInsurancePage'});
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
            backgroundColor: Color(0xFFF1F4F8),
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB771A),
                size: 30.0,
              ),
            ),
            title: Text(
              FFAppState().searchPackageSubProduct == 'MC'
                  ? 'รายละเอียดประกันมอเตอร์ไซค์'
                  : 'รายละเอียดประกันรถยนต์',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.notoSansThai(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Color(0xFF002D5E),
                    fontSize: 19.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
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
                List<HideInAppContentRecord> columnHideInAppContentRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnHideInAppContentRecord =
                    columnHideInAppContentRecordList.isNotEmpty
                        ? columnHideInAppContentRecordList.first
                        : null;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 17.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  getCORSProxyUrl(
                                    valueOrDefault<String>(
                                      functions
                                          .stringToImgPath(widget!.logoUrl),
                                      'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                    ),
                                  ),
                                  width: 59.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 24.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            widget!.insurerFullName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF002D5E),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                      if (widget!
                                              .insurerConfig?.insurerInstallment
                                              ?.contains(
                                                  widget!.insurerShortName) ??
                                          true)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'ชำระเต็มจำนวนเท่านั้น',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts
                                                        .notoSansThai(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'ประเภทประกัน ',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF646464),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            functions.showCoverTypeThai(
                                                widget!.coverTypeCode),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF646464),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'ประเภทซ่อม',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF646464),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            functions.showGarageType(
                                                widget!.garageTypeName),
                                            textAlign: TextAlign.justify,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF646464),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
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
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'วันที่ขอข้อมูล',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    functions.showDateBE(widget!.currentDate),
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (widget!.insurerCondition != '')
                        Divider(
                          thickness: 1.0,
                          color: Color(0xFFCBD8D8),
                        ),
                      if (widget!.insurerCondition != '')
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 18.0,
                                    child: VerticalDivider(
                                      thickness: 3.0,
                                      color: Color(0xFFEDBB8D),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'เงื่อนไขบริษัทประกัน',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF002D5E),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.insurerCondition,
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
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
                          ],
                        ),
                      if (valueOrDefault<String>(
                            widget!.motorAddOn,
                            '-',
                          ) !=
                          '')
                        Divider(
                          thickness: 1.0,
                          color: Color(0xFFCBD8D8),
                        ),
                      if (valueOrDefault<String>(
                            widget!.motorAddOn,
                            '-',
                          ) !=
                          '')
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 18.0,
                                    child: VerticalDivider(
                                      thickness: 3.0,
                                      color: Color(0xFFEDBB8D),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'ประกันภัยเสริมรถยนต์ Motor Add-on',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF002D5E),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.motorAddOn,
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
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
                          ],
                        ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 18.0,
                                  child: VerticalDivider(
                                    thickness: 3.0,
                                    color: Color(0xFFEDBB8D),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'รายละเอียด',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF002D5E),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ยี่ห้อรถ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.brandName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'รุ่นรถ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.modelName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ปีจดทะเบียน พ.ศ.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.year == '-'
                                      ? '-'
                                      : (int.parse(widget!.year) + 543)
                                          .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ระบุผู้ขับขี่',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.driverType,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ราคาเบี้ย',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.grossTotal == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget!.grossTotal)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ทุนประกัน',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.sumInsured == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget!.sumInsured)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ค่าเสียหายส่วนเเรก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.deductible == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget!.deductible)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ความรับผิดต่อบุคคลภายนอก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.tpbiAccident == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget!.tpbiAccident)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'อุบัติเหตุส่วนบุคคล',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.pa == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget!.pa)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'สูญหายไฟไหม้',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.carLost == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget!.carLost)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ค่าเบี้ยไม่รวม พ.ร.บ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget!.grossTotal == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget!.grossTotal)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ค่าเบี้ยรวม พ.ร.บ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF646464),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  (widget!.grossTotal == '-') ||
                                          (widget!.grossAct == '-') ||
                                          (widget!.grossTotal == '') ||
                                          (widget!.grossAct == '')
                                      ? '-'
                                      : '${functions.showNumberWithComma(functions.getGrossAct(widget!.grossTotal, widget!.grossAct))} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF222424),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFCBD8D8),
                      ),
                      if (false)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ราคานี้ใช้ใด้ถึงวันที่',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF646464),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.expireDate == '-'
                                          ? '-'
                                          : functions
                                              .changeADToBD(widget!.expireDate),
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF222424),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      if (false)
                        Divider(
                          thickness: 1.0,
                          color: Color(0xFFCBD8D8),
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (widget!.inspectionExcept == 'Y') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'แพ็กเกจที่เลือกบังคับอัปโหลดไฟล์ตารางกรมธรรม์เดิมที่ยังไม่หมดอายุ'),
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
                                        }

                                        context.pushNamed(
                                          AddCustomerNameWidget.routeName,
                                          queryParameters: {
                                            'insurerId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.insurerId),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'insurerCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.insurerFullName),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'insurerShortName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.insurerShortName),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'insurerName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.insurerMaxName),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'coverTypeId': serializeParam(
                                              functions.coverTypeCodeToId(
                                                  functions
                                                      .makeStringToList1(
                                                          widget!.coverTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'coverTypeCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.coverTypeCode),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'coverTypeName': serializeParam(
                                              functions.coverTypeCodeToName(
                                                  functions
                                                      .makeStringToList1(
                                                          widget!.coverTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'garageTypeId': serializeParam(
                                              functions.garageTypeCodetoId(
                                                  functions
                                                      .makeStringToList1(widget!
                                                          .garageTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'garageTypeCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.garageTypeCode),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'garageTypeName': serializeParam(
                                              functions.garageTypeCodeToName(
                                                  functions
                                                      .makeStringToList1(widget!
                                                          .garageTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'productId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.productId),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'packageId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.packageId),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'packageName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.packageName),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'sumInsured': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.sumInsured),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'workType': serializeParam(
                                              functions.makeStringToList1(''),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'roadsideAssistance':
                                                serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.roadsideAssis),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'tpbiPerson': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.tpbiPerson),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'tpbiAccident': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.tpbiAccident),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'tppd': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.tppd),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'flood': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.flood),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'deductible': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.deductible),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'pa': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.pa),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'me': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.me),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'bb': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.bb),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'assessory': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.accessory),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'seat': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.seat),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'netPremium': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.netPremium),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'vat': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.vat),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'stamp': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.stamp),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'grossTotal': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.grossTotal),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'carType': serializeParam(
                                              FFAppState()
                                                  .insuranceVehicleTypeDropDown,
                                              ParamType.String,
                                            ),
                                            'driverType': serializeParam(
                                              '0',
                                              ParamType.String,
                                            ),
                                            'carRegistrationYear':
                                                serializeParam(
                                              FFAppState().insuranceBasicYear,
                                              ParamType.String,
                                            ),
                                            'carBrandId': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicBrandId,
                                              ParamType.String,
                                            ),
                                            'carBrandName': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicBrandName,
                                              ParamType.String,
                                            ),
                                            'carModelName': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicModelName,
                                              ParamType.String,
                                            ),
                                            'carModelId': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicModelId,
                                              ParamType.String,
                                            ),
                                            'vehicleId': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeId,
                                              ParamType.String,
                                            ),
                                            'vehicleCode': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeCode,
                                              ParamType.String,
                                            ),
                                            'vehicleName': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeName,
                                              ParamType.String,
                                            ),
                                            'contractProcessstate':
                                                serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.contractProcessstate),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'fromPage': serializeParam(
                                              'detail',
                                              ParamType.String,
                                            ),
                                            'fromBtn': serializeParam(
                                              'quotationBtn',
                                              ParamType.String,
                                            ),
                                            'indexPage': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                            'oldVMIExpDate': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicOldVmiExpDate,
                                              ParamType.String,
                                            ),
                                            'cc': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.cc),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'carLost': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.carLost),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'motorAddOn': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.motorAddOn),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'driverBehavior': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.driverBehavior),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'inspectionExcept': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.inspectionExcept),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: 'ออกใบเสนอราคา',
                                      options: FFButtonOptions(
                                        width: 145.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFFCEFE4),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFDB771A),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if (columnHideInAppContentRecord!
                                            .isShowContent) {
                                          _model.getServerDateTime =
                                              await GetDateTimeAPICall.call(
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            token: FFAppState().accessToken,
                                          );

                                          _shouldSetState = true;
                                          if (((_model.getServerDateTime
                                                          ?.statusCode ??
                                                      200) ==
                                                  200) &&
                                              (GetDateTimeAPICall.statusLayer1(
                                                    (_model.getServerDateTime
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  200)) {
                                            if (functions.checkWeekendDate(
                                                GetDateTimeAPICall
                                                    .currentDateYMD(
                                              (_model.getServerDateTime
                                                      ?.jsonBody ??
                                                  ''),
                                            ))!) {
                                              if (functions.showCoverTypeThai(
                                                      widget!.coverTypeCode) ==
                                                  'ชั้น 1') {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'วันเสาร์ / วันอาทิตย์ และวันหยุดนักขัตฤกษ์ ขายประกันรถยนต์ชั้น 2+,2, 3+ และ 3ในเรทเท่านั้น'),
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
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'พบข้อผิดพลาด (${(_model.getServerDateTime?.statusCode ?? 200).toString()}), (${GetDateTimeAPICall.statusLayer1(
                                                      (_model.getServerDateTime
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toString()})get date'),
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
                                          }
                                        }
                                        if (widget!.inspectionExcept == 'Y') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'แพ็กเกจที่เลือกบังคับอัปโหลดไฟล์ตารางกรมธรรม์เดิมที่ยังไม่หมดอายุ'),
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
                                        }

                                        context.pushNamed(
                                          AddCustomerNameWidget.routeName,
                                          queryParameters: {
                                            'insurerId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.insurerId),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'insurerCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.insurerFullName),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'insurerShortName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.insurerShortName),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'insurerName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.insurerMaxName),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'coverTypeId': serializeParam(
                                              functions.coverTypeCodeToId(
                                                  functions
                                                      .makeStringToList1(
                                                          widget!.coverTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'coverTypeCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.coverTypeCode),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'coverTypeName': serializeParam(
                                              functions.coverTypeCodeToName(
                                                  functions
                                                      .makeStringToList1(
                                                          widget!.coverTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'garageTypeId': serializeParam(
                                              functions.garageTypeCodetoId(
                                                  functions
                                                      .makeStringToList1(widget!
                                                          .garageTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'garageTypeCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.garageTypeCode),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'garageTypeName': serializeParam(
                                              functions.garageTypeCodeToName(
                                                  functions
                                                      .makeStringToList1(widget!
                                                          .garageTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'productId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.productId),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'packageId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.packageId),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'packageName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.packageName),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'sumInsured': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.sumInsured),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'workType': serializeParam(
                                              functions.makeStringToList1(''),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'roadsideAssistance':
                                                serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.roadsideAssis),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'tpbiPerson': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.tpbiPerson),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'tpbiAccident': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.tpbiAccident),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'tppd': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.tppd),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'flood': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.flood),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'deductible': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.deductible),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'pa': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.pa),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'me': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.me),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'bb': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.bb),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'assessory': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.accessory),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'seat': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.seat),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'netPremium': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.netPremium),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'vat': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.vat),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'stamp': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.stamp),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'grossTotal': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.grossTotal),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'carType': serializeParam(
                                              FFAppState()
                                                  .insuranceVehicleTypeDropDown,
                                              ParamType.String,
                                            ),
                                            'driverType': serializeParam(
                                              '0',
                                              ParamType.String,
                                            ),
                                            'carRegistrationYear':
                                                serializeParam(
                                              FFAppState().insuranceBasicYear,
                                              ParamType.String,
                                            ),
                                            'carBrandId': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicBrandId,
                                              ParamType.String,
                                            ),
                                            'carBrandName': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicBrandName,
                                              ParamType.String,
                                            ),
                                            'carModelName': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicModelName,
                                              ParamType.String,
                                            ),
                                            'carModelId': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicModelId,
                                              ParamType.String,
                                            ),
                                            'vehicleId': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeId,
                                              ParamType.String,
                                            ),
                                            'vehicleCode': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeCode,
                                              ParamType.String,
                                            ),
                                            'vehicleName': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicVehicleUsedTypeName,
                                              ParamType.String,
                                            ),
                                            'contractProcessstate':
                                                serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.contractProcessstate),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'fromPage': serializeParam(
                                              'detail',
                                              ParamType.String,
                                            ),
                                            'fromBtn': serializeParam(
                                              'saveBtn',
                                              ParamType.String,
                                            ),
                                            'indexPage': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                            'oldVMIExpDate': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicOldVmiExpDate,
                                              ParamType.String,
                                            ),
                                            'cc': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.cc),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'carLost': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.carLost),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'motorAddOn': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.motorAddOn),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'driverBehavior': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.driverBehavior),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'inspectionExcept': serializeParam(
                                              functions.makeStringToList1(
                                                  widget!.inspectionExcept),
                                              ParamType.String,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: 'ตกลงทำประกัน',
                                      options: FFButtonOptions(
                                        width: 145.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFD37319),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ].addToEnd(SizedBox(height: 100.0)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
