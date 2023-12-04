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
import 'compare_insurance_page_model.dart';
export 'compare_insurance_page_model.dart';

class CompareInsurancePageWidget extends StatefulWidget {
  const CompareInsurancePageWidget({
    Key? key,
    required this.insurerFullName,
    String? currentDate,
    String? brandId,
    String? brandName,
    String? modelCode,
    String? modelName,
    required this.year,
    required this.driverType,
    required this.grossTotal,
    required this.sumInsured,
    required this.tpbiPerson,
    required this.tpbiAccident,
    required this.grossAct,
    required this.expireDate,
    required this.coverTypeId,
    required this.coverTypeCode,
    required this.coverTypeName,
    required this.garageTypeId,
    required this.garageTypeName,
    required this.insurerId,
    required this.insurerShortName,
    required this.garageTypeCode,
    required this.insurerLogoUrl,
    required this.yearProduct,
    required this.accessory,
    required this.pa,
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
    required this.tppd,
    required this.contractProcessstate,
  })  : this.currentDate = currentDate ?? '-',
        this.brandId = brandId ?? '-',
        this.brandName = brandName ?? '-',
        this.modelCode = modelCode ?? '-',
        this.modelName = modelName ?? '-',
        super(key: key);

  final List<String>? insurerFullName;
  final String currentDate;
  final String brandId;
  final String brandName;
  final String modelCode;
  final String modelName;
  final String? year;
  final String? driverType;
  final List<String>? grossTotal;
  final List<String>? sumInsured;
  final List<String>? tpbiPerson;
  final List<String>? tpbiAccident;
  final List<String>? grossAct;
  final List<String>? expireDate;
  final List<String>? coverTypeId;
  final List<String>? coverTypeCode;
  final List<String>? coverTypeName;
  final List<String>? garageTypeId;
  final List<String>? garageTypeName;
  final List<String>? insurerId;
  final List<String>? insurerShortName;
  final List<String>? garageTypeCode;
  final List<String>? insurerLogoUrl;
  final String? yearProduct;
  final List<String>? accessory;
  final List<String>? pa;
  final List<String>? productId;
  final List<String>? packageId;
  final List<String>? packageName;
  final List<String>? roadsideAssis;
  final List<String>? flood;
  final List<String>? deductible;
  final List<String>? me;
  final List<String>? bb;
  final List<String>? seat;
  final List<String>? netPremium;
  final List<String>? vat;
  final List<String>? stamp;
  final List<String>? insurerMaxName;
  final List<String>? tppd;
  final List<String>? contractProcessstate;

  @override
  _CompareInsurancePageWidgetState createState() =>
      _CompareInsurancePageWidgetState();
}

class _CompareInsurancePageWidgetState
    extends State<CompareInsurancePageWidget> {
  late CompareInsurancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompareInsurancePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'compareInsurancePage'});
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
          backgroundColor: Color(0xFFE5E5E5),
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
                      Container(
                        width: double.infinity,
                        height: 16.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 160.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final insurerListItem = widget.insurerFullName!
                                .toList()
                                .take(3)
                                .toList();
                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                10.0,
                                0,
                                10.0,
                                0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: insurerListItem.length,
                              separatorBuilder: (_, __) => SizedBox(width: 8.0),
                              itemBuilder: (context, insurerListItemIndex) {
                                final insurerListItemItem =
                                    insurerListItem[insurerListItemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.indexDataCompare =
                                          insurerListItemIndex;
                                    });
                                  },
                                  child: Container(
                                    width: 130.0,
                                    height: 122.0,
                                    decoration: BoxDecoration(
                                      color: _model.indexDataCompare ==
                                              insurerListItemIndex
                                          ? Color(0xFFE5E5E5)
                                          : Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            functions.stringToImgPath(
                                                widget.insurerLogoUrl?[
                                                    insurerListItemIndex]),
                                            'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                          ),
                                          height: 100.0,
                                          fit: BoxFit.cover,
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
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFFE5E5E5),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFE5E5E5),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFE5E5E5),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 17.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            functions.stringToImgPath(
                                                valueOrDefault<String>(
                                              widget.insurerLogoUrl?[
                                                  _model.indexDataCompare!],
                                              'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                            ))!,
                                            width: 59.0,
                                            height: 60.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              functions.checkNullValueAndReturn(
                                                          valueOrDefault<
                                                              String>(
                                                        widget.insurerFullName?[
                                                            _model
                                                                .indexDataCompare!],
                                                        '-',
                                                      )) ==
                                                      '-'
                                                  ? '-'
                                                  : valueOrDefault<String>(
                                                      widget.insurerFullName?[
                                                          _model
                                                              .indexDataCompare!],
                                                      '-',
                                                    ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFF002D5E),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              'ประเภทประกัน ',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFF646464),
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              functions.checkNullValueAndReturn(
                                                          valueOrDefault<
                                                              String>(
                                                        widget.coverTypeName?[_model
                                                            .indexDataCompare!],
                                                        '-',
                                                      )) ==
                                                      '-'
                                                  ? '-'
                                                  : valueOrDefault<String>(
                                                      widget.coverTypeName?[_model
                                                          .indexDataCompare!],
                                                      '-',
                                                    ),
                                              textAlign: TextAlign.justify,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFF646464),
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Text(
                                              functions.checkNullValueAndReturn(
                                                          valueOrDefault<
                                                              String>(
                                                        widget.garageTypeName?[
                                                            _model
                                                                .indexDataCompare!],
                                                        '-',
                                                      )) ==
                                                      '-'
                                                  ? '-'
                                                  : valueOrDefault<String>(
                                                      widget.garageTypeName?[
                                                          _model
                                                              .indexDataCompare!],
                                                      '-',
                                                    ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
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
                            ),
                            Divider(
                              thickness: 1.0,
                              color: Color(0xFFB9B9B9),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          functions.checkNullValueAndReturn(
                                                      widget.currentDate) ==
                                                  '-'
                                              ? '-'
                                              : functions.showDateBE(
                                                  widget.currentDate),
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
                              color: Color(0xFFB9B9B9),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        functions.checkNullValueAndReturn(
                                                    widget.brandName) ==
                                                '-'
                                            ? '-'
                                            : widget.brandName,
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
                              color: Color(0xFFB9B9B9),
                            ),
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
                                        functions.checkNullValueAndReturn(
                                                    widget.modelName) ==
                                                '-'
                                            ? '-'
                                            : widget.modelName,
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
                              color: Color(0xFFB9B9B9),
                            ),
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
                                        valueOrDefault<String>(
                                          functions.checkNullValueAndReturn(
                                                      widget.year) ==
                                                  '-'
                                              ? '-'
                                              : (int.parse(widget.year!) + 543)
                                                  .toString(),
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
                              color: Color(0xFFB9B9B9),
                            ),
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
                                        valueOrDefault<String>(
                                          functions.checkNullValueAndReturn(
                                                      widget.driverType) ==
                                                  '-'
                                              ? '-'
                                              : widget.driverType,
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
                              color: Color(0xFFB9B9B9),
                            ),
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
                                        functions.checkNullValueAndReturn(
                                                    valueOrDefault<String>(
                                                  widget.grossTotal?[
                                                      _model.indexDataCompare!],
                                                  '-',
                                                )) ==
                                                '-'
                                            ? '-'
                                            : valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    valueOrDefault<String>(
                                                  widget.grossTotal?[
                                                      _model.indexDataCompare!],
                                                  '-',
                                                )),
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
                              color: Color(0xFFB9B9B9),
                            ),
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
                                        functions.checkNullValueAndReturn(
                                                    valueOrDefault<String>(
                                                  functions.showNumberWithComma(
                                                      valueOrDefault<String>(
                                                    widget.sumInsured?[_model
                                                        .indexDataCompare!],
                                                    '-',
                                                  )),
                                                  '-',
                                                )) ==
                                                '-'
                                            ? '-'
                                            : valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    valueOrDefault<String>(
                                                  widget.sumInsured?[
                                                      _model.indexDataCompare!],
                                                  '-',
                                                )),
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
                              color: Color(0xFFB9B9B9),
                            ),
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
                                        functions.checkNullValueAndReturn(
                                                    valueOrDefault<String>(
                                                  widget.tpbiAccident?[
                                                      _model.indexDataCompare!],
                                                  '-',
                                                )) ==
                                                '-'
                                            ? '-'
                                            : valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    valueOrDefault<String>(
                                                  widget.tpbiAccident?[
                                                      _model.indexDataCompare!],
                                                  '-',
                                                )),
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
                              color: Color(0xFFB9B9B9),
                            ),
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
                                        functions.checkNullValueAndReturn(
                                                    widget.pa?[_model
                                                        .indexDataCompare!]) ==
                                                '-'
                                            ? '-'
                                            : valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    widget.pa?[_model
                                                        .indexDataCompare!]),
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
                              color: Color(0xFFB9B9B9),
                            ),
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
                                        functions.checkNullValueAndReturn(
                                                    valueOrDefault<String>(
                                                  widget.grossTotal?[
                                                      _model.indexDataCompare!],
                                                  '-',
                                                )) ==
                                                '-'
                                            ? '-'
                                            : valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    valueOrDefault<String>(
                                                  widget.grossTotal?[
                                                      _model.indexDataCompare!],
                                                  '-',
                                                )),
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
                              color: Color(0xFFB9B9B9),
                            ),
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
                                        functions.checkNullValueAndReturn(
                                                    valueOrDefault<String>(
                                                  widget.grossAct?[
                                                      _model.indexDataCompare!],
                                                  '-',
                                                )) ==
                                                '-'
                                            ? '-'
                                            : valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    functions.getGrossAct(
                                                        widget.grossTotal?[_model
                                                            .indexDataCompare!],
                                                        widget.grossAct?[_model
                                                            .indexDataCompare!])),
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
                              color: Color(0xFFB9B9B9),
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
                                            functions.checkNullValueAndReturn(
                                                        valueOrDefault<String>(
                                                      widget.expireDate?[_model
                                                          .indexDataCompare!],
                                                      '-',
                                                    )) ==
                                                    '-'
                                                ? '-'
                                                : functions.changeADToBD(
                                                    valueOrDefault<String>(
                                                    widget.expireDate?[_model
                                                        .indexDataCompare!],
                                                    '-',
                                                  )),
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
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0xFFB9B9B9),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (!FFAppState()
                                                    .addCustomerQuotationSaveSuccess)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'AddCustomerName',
                                                          queryParameters: {
                                                            'insurerId':
                                                                serializeParam(
                                                              widget.insurerId,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'insurerCode':
                                                                serializeParam(
                                                              widget
                                                                  .insurerFullName,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'insurerShortName':
                                                                serializeParam(
                                                              widget
                                                                  .insurerShortName,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'insurerName':
                                                                serializeParam(
                                                              widget
                                                                  .insurerMaxName,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'coverTypeId':
                                                                serializeParam(
                                                              widget
                                                                  .coverTypeId,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'coverTypeCode':
                                                                serializeParam(
                                                              widget
                                                                  .coverTypeCode,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'coverTypeName':
                                                                serializeParam(
                                                              widget
                                                                  .coverTypeName,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'garageTypeId':
                                                                serializeParam(
                                                              widget
                                                                  .garageTypeId,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'garageTypeCode':
                                                                serializeParam(
                                                              widget
                                                                  .garageTypeCode,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'garageTypeName':
                                                                serializeParam(
                                                              widget
                                                                  .garageTypeName,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'productId':
                                                                serializeParam(
                                                              widget.productId,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'packageId':
                                                                serializeParam(
                                                              widget.packageId,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'packageName':
                                                                serializeParam(
                                                              widget
                                                                  .packageName,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'sumInsured':
                                                                serializeParam(
                                                              widget.sumInsured,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'workType':
                                                                serializeParam(
                                                              widget
                                                                  .insurerFullName,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'roadsideAssistance':
                                                                serializeParam(
                                                              widget
                                                                  .roadsideAssis,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'tpbiPerson':
                                                                serializeParam(
                                                              widget.tpbiPerson,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'tpbiAccident':
                                                                serializeParam(
                                                              widget
                                                                  .tpbiAccident,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'tppd':
                                                                serializeParam(
                                                              widget.tppd,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'flood':
                                                                serializeParam(
                                                              widget.flood,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'deductible':
                                                                serializeParam(
                                                              widget.deductible,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'pa':
                                                                serializeParam(
                                                              widget.pa,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'me':
                                                                serializeParam(
                                                              widget.me,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'bb':
                                                                serializeParam(
                                                              widget.bb,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'assessory':
                                                                serializeParam(
                                                              widget.accessory,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'seat':
                                                                serializeParam(
                                                              widget.seat,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'netPremium':
                                                                serializeParam(
                                                              widget.netPremium,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'vat':
                                                                serializeParam(
                                                              widget.vat,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'stamp':
                                                                serializeParam(
                                                              widget.stamp,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'grossTotal':
                                                                serializeParam(
                                                              widget.grossTotal,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'carType':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceVehicleTypeDropDown,
                                                              ParamType.String,
                                                            ),
                                                            'driverType':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceVehicleTypeDropDown,
                                                              ParamType.String,
                                                            ),
                                                            'carRegistrationYear':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceBasicYear,
                                                              ParamType.String,
                                                            ),
                                                            'carBrandId':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceBasicBrandId,
                                                              ParamType.String,
                                                            ),
                                                            'carBrandName':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceBasicBrandName,
                                                              ParamType.String,
                                                            ),
                                                            'carModelName':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceBasicModelName,
                                                              ParamType.String,
                                                            ),
                                                            'carModelId':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceBasicModelId,
                                                              ParamType.String,
                                                            ),
                                                            'vehicleId':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeId,
                                                              ParamType.String,
                                                            ),
                                                            'vehicleCode':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeCode,
                                                              ParamType.String,
                                                            ),
                                                            'vehicleName':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeName,
                                                              ParamType.String,
                                                            ),
                                                            'contractProcessstate':
                                                                serializeParam(
                                                              widget
                                                                  .contractProcessstate,
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                            'fromPage':
                                                                serializeParam(
                                                              'compare',
                                                              ParamType.String,
                                                            ),
                                                            'fromBtn':
                                                                serializeParam(
                                                              '',
                                                              ParamType.String,
                                                            ),
                                                            'indexPage':
                                                                serializeParam(
                                                              _model
                                                                  .indexDataCompare,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: 'ออกใบเสนอราคา',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFFCEFE4),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFDB771A),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                    .addCustomerQuotationSaveSuccess)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            'Quotation');
                                                      },
                                                      text: 'ดูใบเสนอราคา',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFFCEFE4),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFDB771A),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  if (columnHideInAppContentRecord!
                                                      .isShowContent) {
                                                    _model.getServerDateTime =
                                                        await GetDateTimeAPICall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .apiURLLocalState,
                                                      token: FFAppState()
                                                          .accessToken,
                                                    );
                                                    _shouldSetState = true;
                                                    if (((_model.getServerDateTime
                                                                    ?.statusCode ??
                                                                200) ==
                                                            200) &&
                                                        (GetDateTimeAPICall
                                                                .statusLayer1(
                                                              (_model.getServerDateTime
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) ==
                                                            200)) {
                                                      if (functions
                                                          .checkWeekendDate(
                                                              GetDateTimeAPICall
                                                                  .currentDateYMD(
                                                        (_model.getServerDateTime
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString())!) {
                                                        if ((functions.checkNullValueAndReturn(
                                                                        valueOrDefault<
                                                                            String>(
                                                                      widget.coverTypeName?[
                                                                          _model
                                                                              .indexDataCompare!],
                                                                      '-',
                                                                    )) ==
                                                                    '-'
                                                                ? '-'
                                                                : valueOrDefault<
                                                                    String>(
                                                                    widget.coverTypeName?[
                                                                        _model
                                                                            .indexDataCompare!],
                                                                    '-',
                                                                  )) ==
                                                            'ชั้น 1') {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                content: Text(
                                                                    'วันเสาร์ / วันอาทิตย์ และวันหยุดนักขัตฤกษ์ ขายประกันรถยนต์ชั้น 2+,2, 3+ และ 3ในเรทเท่านั้น'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
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
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                              child:
                                                                  AlertDialog(
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
                                                                child:
                                                                    Text('Ok'),
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
                                                      'insurerId':
                                                          serializeParam(
                                                        widget.insurerId,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'insurerCode':
                                                          serializeParam(
                                                        widget.insurerFullName,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'insurerShortName':
                                                          serializeParam(
                                                        widget.insurerShortName,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'insurerName':
                                                          serializeParam(
                                                        widget.insurerMaxName,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'coverTypeId':
                                                          serializeParam(
                                                        widget.coverTypeId,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'coverTypeCode':
                                                          serializeParam(
                                                        widget.coverTypeCode,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'coverTypeName':
                                                          serializeParam(
                                                        widget.coverTypeName,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'garageTypeId':
                                                          serializeParam(
                                                        widget.garageTypeId,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'garageTypeCode':
                                                          serializeParam(
                                                        widget.garageTypeCode,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'garageTypeName':
                                                          serializeParam(
                                                        widget.garageTypeName,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'productId':
                                                          serializeParam(
                                                        widget.productId,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'packageId':
                                                          serializeParam(
                                                        widget.packageId,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'packageName':
                                                          serializeParam(
                                                        widget.packageName,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'sumInsured':
                                                          serializeParam(
                                                        widget.sumInsured,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'workType':
                                                          serializeParam(
                                                        widget.insurerFullName,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'roadsideAssistance':
                                                          serializeParam(
                                                        widget.roadsideAssis,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'tpbiPerson':
                                                          serializeParam(
                                                        widget.tpbiPerson,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'tpbiAccident':
                                                          serializeParam(
                                                        widget.tpbiAccident,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'tppd': serializeParam(
                                                        widget.tppd,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'flood': serializeParam(
                                                        widget.flood,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'deductible':
                                                          serializeParam(
                                                        widget.deductible,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'pa': serializeParam(
                                                        widget.pa,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'me': serializeParam(
                                                        widget.me,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'bb': serializeParam(
                                                        widget.bb,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'assessory':
                                                          serializeParam(
                                                        widget.accessory,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'seat': serializeParam(
                                                        widget.seat,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'netPremium':
                                                          serializeParam(
                                                        widget.netPremium,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'vat': serializeParam(
                                                        widget.vat,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'stamp': serializeParam(
                                                        widget.stamp,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'grossTotal':
                                                          serializeParam(
                                                        widget.grossTotal,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'carType': serializeParam(
                                                        FFAppState()
                                                            .insuranceVehicleTypeDropDown,
                                                        ParamType.String,
                                                      ),
                                                      'driverType':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceVehicleTypeDropDown,
                                                        ParamType.String,
                                                      ),
                                                      'carRegistrationYear':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceBasicYear,
                                                        ParamType.String,
                                                      ),
                                                      'carBrandId':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceBasicBrandId,
                                                        ParamType.String,
                                                      ),
                                                      'carBrandName':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceBasicBrandName,
                                                        ParamType.String,
                                                      ),
                                                      'carModelName':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceBasicModelName,
                                                        ParamType.String,
                                                      ),
                                                      'carModelId':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceBasicModelId,
                                                        ParamType.String,
                                                      ),
                                                      'vehicleId':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeId,
                                                        ParamType.String,
                                                      ),
                                                      'vehicleCode':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCode,
                                                        ParamType.String,
                                                      ),
                                                      'vehicleName':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeName,
                                                        ParamType.String,
                                                      ),
                                                      'contractProcessstate':
                                                          serializeParam(
                                                        widget
                                                            .contractProcessstate,
                                                        ParamType.String,
                                                        true,
                                                      ),
                                                      'fromPage':
                                                          serializeParam(
                                                        'compare',
                                                        ParamType.String,
                                                      ),
                                                      'fromBtn': serializeParam(
                                                        'saveBtn',
                                                        ParamType.String,
                                                      ),
                                                      'indexPage':
                                                          serializeParam(
                                                        _model.indexDataCompare,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                                text: 'ตกลงทำประกัน',
                                                options: FFButtonOptions(
                                                  width: 160.0,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFD37319),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Colors.white,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
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
                        ),
                      ),
                    ],
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
