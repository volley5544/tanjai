import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurer_list_page_model.dart';
export 'insurer_list_page_model.dart';

class InsurerListPageWidget extends StatefulWidget {
  const InsurerListPageWidget({
    Key? key,
    this.brandCode,
    this.modelCode,
    this.year,
    this.province,
    this.vehicleUsage,
    this.coverType,
    required this.garageType,
    required this.brandName,
    required this.modelName,
  }) : super(key: key);

  final String? brandCode;
  final String? modelCode;
  final String? year;
  final String? province;
  final String? vehicleUsage;
  final List<String>? coverType;
  final List<String>? garageType;
  final String? brandName;
  final String? modelName;

  @override
  _InsurerListPageWidgetState createState() => _InsurerListPageWidgetState();
}

class _InsurerListPageWidgetState extends State<InsurerListPageWidget>
    with TickerProviderStateMixin {
  late InsurerListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsurerListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insurerListPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
              child: LoadingSceneWidget(),
            ),
          ));
        },
      ).then((value) => safeSetState(() {}));

      _model.packageAPIOutput = await TelePackageSearchAPICall.call(
        brandCode: widget.brandCode,
        modelCode: widget.modelCode,
        year: widget.year,
        vehicleUsage: widget.vehicleUsage,
        coverType:
            functions.listStringToStringForFF(widget.coverType?.toList()),
        insuranceUrl: FFAppState().apiUrlInsuranceAppState,
        garageType:
            functions.listStringToStringForFF(widget.garageType?.toList()),
      );
      if ((_model.packageAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.packageAPIOutput?.statusCode ?? 200).toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );
        return;
      }
      if (TelePackageSearchAPICall.total(
            (_model.packageAPIOutput?.jsonBody ?? ''),
          ) ==
          0) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text('ไม่พบข้อมูลประกัน'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );
        Navigator.pop(context);
        return;
      }
      setState(() {
        FFAppState().searchSerialName = (TelePackageSearchAPICall.serialName(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchSumInsured = (TelePackageSearchAPICall.sumInsured(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchCoverType = (TelePackageSearchAPICall.coverType(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchGrossTotal = (TelePackageSearchAPICall.grossTotal(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchExpDate = (TelePackageSearchAPICall.expiryDate(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().tpbiAccident = (TelePackageSearchAPICall.tpbiAccident(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().tpbiPerson = (TelePackageSearchAPICall.tpbiPerson(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().teleModelName = (TelePackageSearchAPICall.modelName(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().teleBrandName = (TelePackageSearchAPICall.brandName(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchGarageType = (TelePackageSearchAPICall.garageType(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchRegisYearList =
            (TelePackageSearchAPICall.registrationYear(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList()
                .cast<String>();
        FFAppState().searchFullName = (TelePackageSearchAPICall.fullName(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchTppd = (TelePackageSearchAPICall.tppd(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchPa = (TelePackageSearchAPICall.pa(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().companyId = (TelePackageSearchAPICall.companyId(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().teleBrandID = (TelePackageSearchAPICall.brandCode(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().teleModelCode = (TelePackageSearchAPICall.modelCode(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchActAmount = (TelePackageSearchAPICall.actAmount(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchShortName = (TelePackageSearchAPICall.shortName(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchLogo = (TelePackageSearchAPICall.logo(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchAccessoryList = (TelePackageSearchAPICall.accessory(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
      });
      setState(() {
        FFAppState().effectiveDate = (TelePackageSearchAPICall.effectiveDate(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchId = TelePackageSearchAPICall.id(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<int>();
        FFAppState().searchPackageId = (TelePackageSearchAPICall.packageId(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().serachPackageName = (TelePackageSearchAPICall.packageName(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchStamp = (TelePackageSearchAPICall.stamp(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchVat = (TelePackageSearchAPICall.vat(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchNetPremium = (TelePackageSearchAPICall.netPremium(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchSeat = (TelePackageSearchAPICall.seat(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchRoadsideAssistance =
            (TelePackageSearchAPICall.roadsideAssistance(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList()
                .cast<String>();
        FFAppState().searchbb = (TelePackageSearchAPICall.bb(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchme = (TelePackageSearchAPICall.me(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchFlood = (TelePackageSearchAPICall.flood(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchDeductible = (TelePackageSearchAPICall.deductible(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList()
            .cast<String>();
        FFAppState().searchContractProcessstate =
            (TelePackageSearchAPICall.contractProcessstate(
          (_model.packageAPIOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList()
                .cast<String>();
      });
      setState(() {
        FFAppState().selectInsurerList = functions
            .createFalseListByItemNumber(
                false, FFAppState().searchSerialName.length)!
            .toList()
            .cast<bool>();
        FFAppState().addCustomerQuotationSaveSuccess = false;
      });
      Navigator.pop(context);
    });

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
                context.safePop();
              },
            ),
            title: Text(
              'ค้นหาประกันรถ',
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
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Text(
                                    'ค้นหาชื่อบริษัทประกัน ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                  ),
                                ),
                                Text(
                                  '(เลือกเปรียบเทียบสูงสุด 3 รายการเท่านั้น)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (TelePackageSearchAPICall.total(
                                        (_model.packageAPIOutput?.jsonBody ??
                                            ''),
                                      ) ==
                                      0) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                            child: AlertDialog(
                                          content:
                                              Text('ไม่พบข้อมูลรายการประกัน'),
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
                                    return;
                                  }

                                  context.pushNamed('PackageFilterPage');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.06,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'ค้นหาเปรียบเทียบบริษัทประกัน',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 15.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'เลือกได้สูงสุด 3  รายการ',
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
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '(${'${functions.countTrueInBoolList(FFAppState().selectInsurerList.toList()).toString()}/ 3'})',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.45,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((TelePackageSearchAPICall.total(
                                    (_model.packageAPIOutput?.jsonBody ?? ''),
                                  ) !=
                                  0) &&
                              (TelePackageSearchAPICall.statusLayer1(
                                    (_model.packageAPIOutput?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              ((_model.packageAPIOutput?.statusCode ?? 200) ==
                                  200))
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final listinsurance =
                                      (TelePackageSearchAPICall.fullName(
                                            (_model.packageAPIOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()
                                              ?.toList() ??
                                          [];
                                  return ListView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      4.0,
                                      0,
                                      0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listinsurance.length,
                                    itemBuilder: (context, listinsuranceIndex) {
                                      final listinsuranceItem =
                                          listinsurance[listinsuranceIndex];
                                      return Visibility(
                                        visible: (FFAppState().filterInsurerList.length > 0) ||
                                                (FFAppState().filterCoverTypeList.length >
                                                    0) ||
                                                (FFAppState().filterGarageTypeList.length >
                                                    0)
                                            ? ((FFAppState().filterInsurerList.length > 0
                                                    ? FFAppState()
                                                        .filterInsurerList
                                                        .contains(FFAppState().searchSerialName[
                                                            listinsuranceIndex])
                                                    : true) &&
                                                (FFAppState().filterCoverTypeList.length > 0
                                                    ? FFAppState()
                                                        .filterCoverTypeList
                                                        .contains(FFAppState().searchCoverType[
                                                            listinsuranceIndex])
                                                    : true) &&
                                                (FFAppState().filterGarageTypeList.length > 0
                                                    ? FFAppState().filterGarageTypeList.contains(FFAppState().searchGarageType[listinsuranceIndex])
                                                    : true))
                                            : true,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 16.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 165.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
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
                                                      if (functions.countTrueInBoolList(
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList())! >
                                                          2) {
                                                        if (!FFAppState()
                                                                .selectInsurerList[
                                                            listinsuranceIndex]) {
                                                          return;
                                                        }
                                                      }
                                                      HapticFeedback
                                                          .mediumImpact();
                                                      setState(() {
                                                        FFAppState()
                                                            .updateSelectInsurerListAtIndex(
                                                          listinsuranceIndex,
                                                          (_) => FFAppState()
                                                                          .selectInsurerList[
                                                                      listinsuranceIndex] ==
                                                                  true
                                                              ? false
                                                              : true,
                                                        );
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              child: Visibility(
                                                                visible: FFAppState()
                                                                        .selectInsurerList[
                                                                    listinsuranceIndex],
                                                                child: Icon(
                                                                  Icons.check,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  size: 22.0,
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
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            15.0,
                                                                            30.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                65.0,
                                                                            height:
                                                                                65.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  functions.stringToImgPath(FFAppState().searchLogo[listinsuranceIndex]),
                                                                                  'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                                ),
                                                                                width: 300.0,
                                                                                height: 200.0,
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
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Text(
                                                                                FFAppState().searchSerialName[listinsuranceIndex],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      fontSize: 15.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
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
                                                                              'ประเภทประกัน',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    fontSize: 12.0,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                              child: Text(
                                                                                functions.showCoverTypeThai(FFAppState().searchCoverType[listinsuranceIndex]),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
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
                                                                              'ทุนประกัน',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 10.0,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                              child: Text(
                                                                                functions.showNumberWithComma(FFAppState().searchSumInsured[listinsuranceIndex])!,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 10.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
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
                                                                              'ประเภทซ่อม',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 10.0,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                              child: Text(
                                                                                functions.showGarageType(FFAppState().searchGarageType[listinsuranceIndex]),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Noto Sans Thai',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 10.0,
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
                                                          ),
                                                          Row(
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
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        20.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'ราคาเบี้ย',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '${functions.showNumberWithComma(FFAppState().searchGrossTotal[listinsuranceIndex])} บาท',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        20.0,
                                                                        20.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'detailsInsurancePage',
                                                                      queryParameters:
                                                                          {
                                                                        'insurerFullName':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchSerialName[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'currentDate':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(getCurrentTimestamp.toString()),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'brandId':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().teleBrandID[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'brandName':
                                                                            serializeParam(
                                                                          widget
                                                                              .brandName,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'modelCode':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().teleModelCode[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'modelName':
                                                                            serializeParam(
                                                                          widget
                                                                              .modelName,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'year':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(widget.year),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'driverType':
                                                                            serializeParam(
                                                                          '-',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'grossTotal':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchGrossTotal[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'sumInsured':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchSumInsured[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'tppd':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchTppd[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'pa':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchPa[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'grossAct':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchActAmount[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'expireDate':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchExpDate[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'coverTypeId':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchCoverType[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'coverTypeCode':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchCoverType[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'coverTypeName':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchCoverType[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'garageTypeId':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchGarageType[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'garageTypeName':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchGarageType[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'insurerId':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().companyId[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'insurerShortName':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchShortName[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'garageTypeCode':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchGarageType[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'tpbiPerson':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().tpbiPerson[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'tpbiAccident':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().tpbiAccident[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'logoUrl':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchLogo[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'yearProduct':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchRegisYearList[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'accessory':
                                                                            serializeParam(
                                                                          functions
                                                                              .checkNullValueAndReturn(FFAppState().searchAccessoryList[listinsuranceIndex]),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'productId':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchId[listinsuranceIndex]
                                                                              .toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'packageId':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchPackageId[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'packageName':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .serachPackageName[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'roadsideAssis':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchRoadsideAssistance[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'flood':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchFlood[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'deductible':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchDeductible[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'me':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchme[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'bb':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchbb[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'seat':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchSeat[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'netPremium':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchNetPremium[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'vat':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchVat[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'stamp':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchStamp[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'insurerMaxName':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchFullName[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'contractProcessstate':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .searchContractProcessstate[listinsuranceIndex],
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );

                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .addCustomerQuotationSaveSuccess =
                                                                          false;
                                                                    });
                                                                  },
                                                                  text:
                                                                      'รายละเอียด',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0x9EFF6500),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
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
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          if (TelePackageSearchAPICall.total(
                                (_model.packageAPIOutput?.jsonBody ?? ''),
                              ) ==
                              0)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.53,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        color: Color(0x33000000),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'ไม่พบข้อมูลรายการประกัน',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            fontSize: 20.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (((TelePackageSearchAPICall.total(
                                  (_model.packageAPIOutput?.jsonBody ?? ''),
                                ) !=
                                0) &&
                            (TelePackageSearchAPICall.statusLayer1(
                                  (_model.packageAPIOutput?.jsonBody ?? ''),
                                ) ==
                                200) &&
                            ((_model.packageAPIOutput?.statusCode ?? 200) ==
                                200)) &&
                        (functions.countTrueInBoolList(
                                FFAppState().selectInsurerList.toList())! >=
                            2))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'compareInsurancePage',
                              queryParameters: {
                                'brandName': serializeParam(
                                  widget.brandName,
                                  ParamType.String,
                                ),
                                'insurerFullName': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchSerialName.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'currentDate': serializeParam(
                                  getCurrentTimestamp.toString(),
                                  ParamType.String,
                                ),
                                'brandId': serializeParam(
                                  functions
                                      .returnMappedListFromBoolList(
                                          FFAppState().teleBrandID.toList(),
                                          FFAppState()
                                              .selectInsurerList
                                              .toList(),
                                          true)
                                      .first,
                                  ParamType.String,
                                ),
                                'modelCode': serializeParam(
                                  functions
                                      .returnMappedListFromBoolList(
                                          FFAppState().teleModelCode.toList(),
                                          FFAppState()
                                              .selectInsurerList
                                              .toList(),
                                          true)
                                      .first,
                                  ParamType.String,
                                ),
                                'modelName': serializeParam(
                                  widget.modelName,
                                  ParamType.String,
                                ),
                                'year': serializeParam(
                                  widget.year,
                                  ParamType.String,
                                ),
                                'driverType': serializeParam(
                                  '-',
                                  ParamType.String,
                                ),
                                'grossTotal': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchGrossTotal.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'sumInsured': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchSumInsured.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'grossAct': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchActAmount.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'expireDate': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchExpDate.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'coverTypeId': serializeParam(
                                  functions.coverTypeCodeToId(functions
                                      .returnMappedListFromBoolList(
                                          FFAppState().searchCoverType.toList(),
                                          FFAppState()
                                              .selectInsurerList
                                              .toList(),
                                          true)
                                      .toList()),
                                  ParamType.String,
                                  true,
                                ),
                                'coverTypeCode': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchCoverType.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'coverTypeName': serializeParam(
                                  functions.coverTypeCodeToName(functions
                                      .returnMappedListFromBoolList(
                                          FFAppState().searchCoverType.toList(),
                                          FFAppState()
                                              .selectInsurerList
                                              .toList(),
                                          true)
                                      .toList()),
                                  ParamType.String,
                                  true,
                                ),
                                'garageTypeId': serializeParam(
                                  functions.garageTypeCodetoId(functions
                                      .returnMappedListFromBoolList(
                                          FFAppState()
                                              .searchGarageType
                                              .toList(),
                                          FFAppState()
                                              .selectInsurerList
                                              .toList(),
                                          true)
                                      .toList()),
                                  ParamType.String,
                                  true,
                                ),
                                'garageTypeName': serializeParam(
                                  functions.garageTypeCodeToName(functions
                                      .returnMappedListFromBoolList(
                                          FFAppState()
                                              .searchGarageType
                                              .toList(),
                                          FFAppState()
                                              .selectInsurerList
                                              .toList(),
                                          true)
                                      .toList()),
                                  ParamType.String,
                                  true,
                                ),
                                'insurerId': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().companyId.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'insurerShortName': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchShortName.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'garageTypeCode': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchGarageType.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'tpbiPerson': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().tpbiPerson.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'tpbiAccident': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().tpbiAccident.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'insurerLogoUrl': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchLogo.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'yearProduct': serializeParam(
                                  functions.checkNullValueAndReturn(functions
                                      .returnMappedListFromBoolList(
                                          FFAppState()
                                              .searchRegisYearList
                                              .toList(),
                                          FFAppState()
                                              .selectInsurerList
                                              .toList(),
                                          true)
                                      .first),
                                  ParamType.String,
                                ),
                                'accessory': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchAccessoryList.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'pa': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchPa.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'productId': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      functions
                                          .changeListintToString(
                                              FFAppState().searchId.toList())
                                          ?.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'packageId': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchPackageId.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'packageName': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().serachPackageName.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'roadsideAssis': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState()
                                          .searchRoadsideAssistance
                                          .toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'flood': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchFlood.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'deductible': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchDeductible.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'me': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchme.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'bb': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchbb.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'seat': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchSeat.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'netPremium': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchNetPremium.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'vat': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchVat.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'stamp': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchStamp.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'insurerMaxName': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchFullName.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'tppd': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState().searchTppd.toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                                'contractProcessstate': serializeParam(
                                  functions.returnMappedListFromBoolList(
                                      FFAppState()
                                          .searchContractProcessstate
                                          .toList(),
                                      FFAppState().selectInsurerList.toList(),
                                      true),
                                  ParamType.String,
                                  true,
                                ),
                              }.withoutNulls,
                            );

                            setState(() {
                              FFAppState().addCustomerQuotationSaveSuccess =
                                  false;
                            });
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF5CC2BC),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                'เปรียบเทียบ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FaIcon(
                                        FontAwesomeIcons.carSide,
                                        color: Color(0xB0FF9936),
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
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            var _shouldSetState = false;
                                            if (columnHideInAppContentRecord!
                                                .isShowContent) {
                                              _model.getServerDateTimeRenew =
                                                  await GetDateTimeAPICall.call(
                                                apiUrl: FFAppState()
                                                    .apiURLLocalState,
                                                token: FFAppState().accessToken,
                                              );
                                              _shouldSetState = true;
                                              if (((_model.getServerDateTimeRenew
                                                              ?.statusCode ??
                                                          200) ==
                                                      200) &&
                                                  (GetDateTimeAPICall
                                                          .statusLayer1(
                                                        (_model.getServerDateTimeRenew
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      200)) {
                                                if (functions.checkWeekendDate(
                                                    GetDateTimeAPICall
                                                        .currentDateYMD(
                                                  (_model.getServerDateTimeRenew
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString())!) {
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                        child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาด (${(_model.getServerDateTimeRenew?.statusCode ?? 200).toString()}), (${GetDateTimeAPICall.statusLayer1(
                                                        (_model.getServerDateTimeRenew
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
                                            setState(() {
                                              FFAppState()
                                                      .nonePackageFlagCarrier =
                                                  false;
                                              FFAppState()
                                                      .nonePackageVehicleType =
                                                  'กรุณาเลือกประเภทรถ';
                                              FFAppState()
                                                      .nonePackageBrandName =
                                                  'กรุณาเลือกยี่ห้อรถ';
                                              FFAppState().nonePackageBrandId =
                                                  '';
                                              FFAppState()
                                                      .nonePackageModelName =
                                                  'กรุณากรอกรุ่นรถ';
                                              FFAppState()
                                                  .nonePackageModelCode = '';
                                              FFAppState().nonePackageYear =
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
                                              FFAppState().nonePackageCusPhone =
                                                  'กรุณากรอกเบอร์โทรศัพท์';
                                              FFAppState().nonePackagePlate =
                                                  '';
                                              FFAppState().nonePackageProvince =
                                                  'กรุณาเลือกจังหวัดจดทะเบียน';
                                              FFAppState()
                                                  .nonePackageProvinceId = '';
                                              FFAppState()
                                                      .nonePackageSumInsured =
                                                  'กรุณากรอกทุนประกัน';
                                              FFAppState().nonePackageFlagAct =
                                                  true;
                                              FFAppState()
                                                      .nonePackageIsBrandSelect =
                                                  false;
                                              FFAppState()
                                                  .nonePackageSearchModelIdList = [];
                                              FFAppState()
                                                      .nonePackageCarrierType =
                                                  'กรุณาเลือกประเภทตู้เหล็ก';
                                              FFAppState().nonePackageFlagCoop =
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
                                              FFAppState().nonePackageReason =
                                                  [];
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
                                                  .nonePackageFlagRenew = false;
                                              FFAppState()
                                                      .nonePackageOldVmiExpDate =
                                                  'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                              FFAppState().nonePackageOldVmi =
                                                  '';
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
                                              FFAppState().buttonOrdinary =
                                                  false;
                                              FFAppState().buttonCorporation =
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
                                              FFAppState().nonePackageLeadId =
                                                  '';
                                              FFAppState().nonePackageLeadNo =
                                                  '';
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
                                              FFAppState().nonePackageWorkType =
                                                  '';
                                              FFAppState().nonePackageRemark =
                                                  '';
                                              FFAppState()
                                                  .nonePackageBranchCode = '';
                                              FFAppState()
                                                  .nonePackageBranchName = '';
                                              FFAppState()
                                                  .nonePackageInsurerShortNameDupList = [];
                                            });
                                            setState(() {
                                              FFAppState()
                                                  .nonePackageFlagRenew = true;
                                              FFAppState()
                                                      .nonePackageOldVmiImageUploadedCheck =
                                                  false;
                                              FFAppState()
                                                      .nonePackageIdCardWatermarkUploadedCheck =
                                                  false;
                                            });
                                            setState(() {
                                              FFAppState()
                                                      .nonePackageVehicleType =
                                                  FFAppState()
                                                      .insuranceVehicleTypeDropDown;
                                              FFAppState()
                                                      .nonePackageBrandName =
                                                  FFAppState()
                                                      .insuranceBasicBrandName;
                                              FFAppState().nonePackageBrandId =
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
                                              FFAppState().nonePackageYear =
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
                                                      .cast<String>();
                                              FFAppState()
                                                      .nonePackageSearchModelIdList =
                                                  FFAppState()
                                                      .insuranceBasicModelIdList
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState()
                                                      .nonePackageIsBrandSelect =
                                                  FFAppState()
                                                      .searchPackageCheckFilled[1];
                                            });
                                            setState(() {
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
                                            });

                                            context.pushNamed(
                                                'NonePackageRenewPage');

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          text: 'ต่ออายุ',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFEFE2D8),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: Color(0xFFDB771A),
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FaIcon(
                                        FontAwesomeIcons.carSide,
                                        color: Color(0xFF7A848E),
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
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            var _shouldSetState = false;
                                            if (columnHideInAppContentRecord!
                                                .isShowContent) {
                                              _model.getServerDateTimeNonePackage =
                                                  await GetDateTimeAPICall.call(
                                                apiUrl: FFAppState()
                                                    .apiURLLocalState,
                                                token: FFAppState().accessToken,
                                              );
                                              _shouldSetState = true;
                                              if (((_model.getServerDateTimeNonePackage
                                                              ?.statusCode ??
                                                          200) ==
                                                      200) &&
                                                  (GetDateTimeAPICall
                                                          .statusLayer1(
                                                        (_model.getServerDateTimeNonePackage
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      200)) {
                                                if (functions.checkWeekendDate(
                                                    GetDateTimeAPICall
                                                        .currentDateYMD(
                                                  (_model.getServerDateTimeNonePackage
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString())!) {
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                        child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาด (${(_model.getServerDateTimeNonePackage?.statusCode ?? 200).toString()}), (${GetDateTimeAPICall.statusLayer1(
                                                        (_model.getServerDateTimeNonePackage
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
                                            setState(() {
                                              FFAppState()
                                                      .nonePackageFlagCarrier =
                                                  false;
                                              FFAppState()
                                                      .nonePackageVehicleType =
                                                  'กรุณาเลือกประเภทรถ';
                                              FFAppState()
                                                      .nonePackageBrandName =
                                                  'กรุณาเลือกยี่ห้อรถ';
                                              FFAppState().nonePackageBrandId =
                                                  '';
                                              FFAppState()
                                                      .nonePackageModelName =
                                                  'กรุณากรอกรุ่นรถ';
                                              FFAppState()
                                                  .nonePackageModelCode = '';
                                              FFAppState().nonePackageYear =
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
                                              FFAppState().nonePackageCusPhone =
                                                  'กรุณากรอกเบอร์โทรศัพท์';
                                              FFAppState().nonePackagePlate =
                                                  '';
                                              FFAppState().nonePackageProvince =
                                                  'กรุณาเลือกจังหวัดจดทะเบียน';
                                              FFAppState()
                                                  .nonePackageProvinceId = '';
                                              FFAppState()
                                                      .nonePackageSumInsured =
                                                  'กรุณากรอกทุนประกัน';
                                              FFAppState().nonePackageFlagAct =
                                                  true;
                                              FFAppState()
                                                      .nonePackageIsBrandSelect =
                                                  false;
                                              FFAppState()
                                                  .nonePackageSearchModelIdList = [];
                                              FFAppState()
                                                      .nonePackageCarrierType =
                                                  'กรุณาเลือกประเภทตู้เหล็ก';
                                              FFAppState().nonePackageFlagCoop =
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
                                              FFAppState().nonePackageReason =
                                                  [];
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
                                                  .nonePackageFlagRenew = false;
                                              FFAppState()
                                                      .nonePackageOldVmiExpDate =
                                                  'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                              FFAppState().nonePackageOldVmi =
                                                  '';
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
                                              FFAppState().buttonOrdinary =
                                                  false;
                                              FFAppState().buttonCorporation =
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
                                              FFAppState().nonePackageLeadId =
                                                  '';
                                              FFAppState().nonePackageLeadNo =
                                                  '';
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
                                              FFAppState().nonePackageWorkType =
                                                  '';
                                              FFAppState().nonePackageRemark =
                                                  '';
                                              FFAppState()
                                                  .nonePackageBranchCode = '';
                                              FFAppState()
                                                  .nonePackageBranchName = '';
                                              FFAppState()
                                                  .nonePackageInsurerShortNameDupList = [];
                                            });
                                            setState(() {
                                              FFAppState()
                                                  .nonePackageFlagRenew = false;
                                            });
                                            setState(() {
                                              FFAppState()
                                                      .nonePackageVehicleType =
                                                  FFAppState()
                                                      .insuranceVehicleTypeDropDown;
                                              FFAppState()
                                                      .nonePackageBrandName =
                                                  FFAppState()
                                                      .insuranceBasicBrandName;
                                              FFAppState().nonePackageBrandId =
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
                                              FFAppState().nonePackageYear =
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
                                                      .cast<String>();
                                              FFAppState()
                                                      .nonePackageSearchModelIdList =
                                                  FFAppState()
                                                      .insuranceBasicModelIdList
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState()
                                                      .nonePackageIsBrandSelect =
                                                  FFAppState()
                                                      .searchPackageCheckFilled[1];
                                            });
                                            setState(() {
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
                                            });

                                            context
                                                .pushNamed('SelectReasonPage');

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          text: 'นอกเรท',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFD9D9D9),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: Color(0xFF090F13),
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                  ].addToStart(SizedBox(height: 8.0)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
