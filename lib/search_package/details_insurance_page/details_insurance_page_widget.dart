import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'details_insurance_page_model.dart';
export 'details_insurance_page_model.dart';

class DetailsInsurancePageWidget extends StatefulWidget {
  const DetailsInsurancePageWidget({
    Key? key,
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
            'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
        super(key: key);

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

  @override
  _DetailsInsurancePageWidgetState createState() =>
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
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
              'รายละเอียดประกันรถยนต์',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF002D5E),
                    fontSize: 19.0,
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
                                  valueOrDefault<String>(
                                    functions.stringToImgPath(widget.logoUrl),
                                    'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                  ),
                                  width: 59.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.insurerFullName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF002D5E),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'ประเภทประกัน ',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF646464),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ประเภทซ่อม',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF646464),
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      functions.showCoverTypeThai(
                                          widget.coverTypeCode),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF646464),
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      functions.showGarageType(
                                          widget.garageTypeName),
                                      textAlign: TextAlign.justify,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF646464),
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    functions.showDateBE(widget.currentDate),
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF002D5E),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.brandName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.modelName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.year == '-'
                                      ? '-'
                                      : (int.parse(widget.year) + 543)
                                          .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.driverType,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.grossTotal == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget.grossTotal)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.sumInsured == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget.sumInsured)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.tpbiAccident == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget.tpbiAccident)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.pa == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget.pa)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.grossTotal == '-'
                                      ? '-'
                                      : '${functions.showNumberWithComma(widget.grossTotal)} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF646464),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  (widget.grossTotal == '-') ||
                                          (widget.grossAct == '-') ||
                                          (widget.grossTotal == '') ||
                                          (widget.grossAct == '')
                                      ? '-'
                                      : '${functions.showNumberWithComma(functions.getGrossAct(widget.grossTotal, widget.grossAct))} บาท',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF222424),
                                        fontWeight: FontWeight.bold,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF646464),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget.expireDate == '-'
                                          ? '-'
                                          : functions
                                              .changeADToBD(widget.expireDate),
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF222424),
                                          fontWeight: FontWeight.bold,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
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
                                        context.pushNamed(
                                          'AddCustomerName',
                                          queryParameters: {
                                            'insurerId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.insurerId),
                                              ParamType.String,
                                              true,
                                            ),
                                            'insurerCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.insurerFullName),
                                              ParamType.String,
                                              true,
                                            ),
                                            'insurerShortName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.insurerShortName),
                                              ParamType.String,
                                              true,
                                            ),
                                            'insurerName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.insurerMaxName),
                                              ParamType.String,
                                              true,
                                            ),
                                            'coverTypeId': serializeParam(
                                              functions.coverTypeCodeToId(
                                                  functions
                                                      .makeStringToList1(
                                                          widget.coverTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              true,
                                            ),
                                            'coverTypeCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.coverTypeCode),
                                              ParamType.String,
                                              true,
                                            ),
                                            'coverTypeName': serializeParam(
                                              functions.coverTypeCodeToName(
                                                  functions
                                                      .makeStringToList1(
                                                          widget.coverTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              true,
                                            ),
                                            'garageTypeId': serializeParam(
                                              functions.garageTypeCodetoId(
                                                  functions
                                                      .makeStringToList1(
                                                          widget.garageTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              true,
                                            ),
                                            'garageTypeCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.garageTypeCode),
                                              ParamType.String,
                                              true,
                                            ),
                                            'garageTypeName': serializeParam(
                                              functions.garageTypeCodeToName(
                                                  functions
                                                      .makeStringToList1(
                                                          widget.garageTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              true,
                                            ),
                                            'productId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.productId),
                                              ParamType.String,
                                              true,
                                            ),
                                            'packageId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.packageId),
                                              ParamType.String,
                                              true,
                                            ),
                                            'packageName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.packageName),
                                              ParamType.String,
                                              true,
                                            ),
                                            'sumInsured': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.sumInsured),
                                              ParamType.String,
                                              true,
                                            ),
                                            'workType': serializeParam(
                                              functions.makeStringToList1(''),
                                              ParamType.String,
                                              true,
                                            ),
                                            'roadsideAssistance':
                                                serializeParam(
                                              functions.makeStringToList1(
                                                  widget.roadsideAssis),
                                              ParamType.String,
                                              true,
                                            ),
                                            'tpbiPerson': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.tpbiPerson),
                                              ParamType.String,
                                              true,
                                            ),
                                            'tpbiAccident': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.tpbiAccident),
                                              ParamType.String,
                                              true,
                                            ),
                                            'tppd': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.tppd),
                                              ParamType.String,
                                              true,
                                            ),
                                            'flood': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.flood),
                                              ParamType.String,
                                              true,
                                            ),
                                            'deductible': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.deductible),
                                              ParamType.String,
                                              true,
                                            ),
                                            'pa': serializeParam(
                                              functions
                                                  .makeStringToList1(widget.pa),
                                              ParamType.String,
                                              true,
                                            ),
                                            'me': serializeParam(
                                              functions
                                                  .makeStringToList1(widget.me),
                                              ParamType.String,
                                              true,
                                            ),
                                            'bb': serializeParam(
                                              functions
                                                  .makeStringToList1(widget.bb),
                                              ParamType.String,
                                              true,
                                            ),
                                            'assessory': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.accessory),
                                              ParamType.String,
                                              true,
                                            ),
                                            'seat': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.seat),
                                              ParamType.String,
                                              true,
                                            ),
                                            'netPremium': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.netPremium),
                                              ParamType.String,
                                              true,
                                            ),
                                            'vat': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.vat),
                                              ParamType.String,
                                              true,
                                            ),
                                            'stamp': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.stamp),
                                              ParamType.String,
                                              true,
                                            ),
                                            'grossTotal': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.grossTotal),
                                              ParamType.String,
                                              true,
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
                                                  widget.contractProcessstate),
                                              ParamType.String,
                                              true,
                                            ),
                                            'fromPage': serializeParam(
                                              'detail',
                                              ParamType.String,
                                            ),
                                            'fromBtn': serializeParam(
                                              'quotationBtn',
                                              ParamType.String,
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
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFDB771A),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
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
                                            ).toString())!) {
                                              if (functions.showCoverTypeThai(
                                                      widget.coverTypeCode) ==
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
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                    child: AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาด (${(_model.getServerDateTime?.statusCode ?? 200).toString()}), (${GetDateTimeAPICall.statusLayer1(
                                                    (_model.getServerDateTime
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString()})get date'),
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
                                          }
                                        }

                                        context.pushNamed(
                                          'AddCustomerName',
                                          queryParameters: {
                                            'insurerId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.insurerId),
                                              ParamType.String,
                                              true,
                                            ),
                                            'insurerCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.insurerFullName),
                                              ParamType.String,
                                              true,
                                            ),
                                            'insurerShortName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.insurerShortName),
                                              ParamType.String,
                                              true,
                                            ),
                                            'insurerName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.insurerMaxName),
                                              ParamType.String,
                                              true,
                                            ),
                                            'coverTypeId': serializeParam(
                                              functions.coverTypeCodeToId(
                                                  functions
                                                      .makeStringToList1(
                                                          widget.coverTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              true,
                                            ),
                                            'coverTypeCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.coverTypeCode),
                                              ParamType.String,
                                              true,
                                            ),
                                            'coverTypeName': serializeParam(
                                              functions.coverTypeCodeToName(
                                                  functions
                                                      .makeStringToList1(
                                                          widget.coverTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              true,
                                            ),
                                            'garageTypeId': serializeParam(
                                              functions.garageTypeCodetoId(
                                                  functions
                                                      .makeStringToList1(
                                                          widget.garageTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              true,
                                            ),
                                            'garageTypeCode': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.garageTypeCode),
                                              ParamType.String,
                                              true,
                                            ),
                                            'garageTypeName': serializeParam(
                                              functions.garageTypeCodeToName(
                                                  functions
                                                      .makeStringToList1(
                                                          widget.garageTypeCode)
                                                      ?.toList()),
                                              ParamType.String,
                                              true,
                                            ),
                                            'productId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.productId),
                                              ParamType.String,
                                              true,
                                            ),
                                            'packageId': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.packageId),
                                              ParamType.String,
                                              true,
                                            ),
                                            'packageName': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.packageName),
                                              ParamType.String,
                                              true,
                                            ),
                                            'sumInsured': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.sumInsured),
                                              ParamType.String,
                                              true,
                                            ),
                                            'workType': serializeParam(
                                              functions.makeStringToList1(''),
                                              ParamType.String,
                                              true,
                                            ),
                                            'roadsideAssistance':
                                                serializeParam(
                                              functions.makeStringToList1(
                                                  widget.roadsideAssis),
                                              ParamType.String,
                                              true,
                                            ),
                                            'tpbiPerson': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.tpbiPerson),
                                              ParamType.String,
                                              true,
                                            ),
                                            'tpbiAccident': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.tpbiAccident),
                                              ParamType.String,
                                              true,
                                            ),
                                            'tppd': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.tppd),
                                              ParamType.String,
                                              true,
                                            ),
                                            'flood': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.flood),
                                              ParamType.String,
                                              true,
                                            ),
                                            'deductible': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.deductible),
                                              ParamType.String,
                                              true,
                                            ),
                                            'pa': serializeParam(
                                              functions
                                                  .makeStringToList1(widget.pa),
                                              ParamType.String,
                                              true,
                                            ),
                                            'me': serializeParam(
                                              functions
                                                  .makeStringToList1(widget.me),
                                              ParamType.String,
                                              true,
                                            ),
                                            'bb': serializeParam(
                                              functions
                                                  .makeStringToList1(widget.bb),
                                              ParamType.String,
                                              true,
                                            ),
                                            'assessory': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.accessory),
                                              ParamType.String,
                                              true,
                                            ),
                                            'seat': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.seat),
                                              ParamType.String,
                                              true,
                                            ),
                                            'netPremium': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.netPremium),
                                              ParamType.String,
                                              true,
                                            ),
                                            'vat': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.vat),
                                              ParamType.String,
                                              true,
                                            ),
                                            'stamp': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.stamp),
                                              ParamType.String,
                                              true,
                                            ),
                                            'grossTotal': serializeParam(
                                              functions.makeStringToList1(
                                                  widget.grossTotal),
                                              ParamType.String,
                                              true,
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
                                                  widget.contractProcessstate),
                                              ParamType.String,
                                              true,
                                            ),
                                            'fromPage': serializeParam(
                                              'detail',
                                              ParamType.String,
                                            ),
                                            'fromBtn': serializeParam(
                                              'saveBtn',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (_shouldSetState) setState(() {});
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
                                              fontFamily: 'Noto Sans Thai',
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
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
                    ].addToEnd(SizedBox(height: 50.0)),
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
