import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurer_list_overall_page_model.dart';
export 'insurer_list_overall_page_model.dart';

class InsurerListOverallPageWidget extends StatefulWidget {
  const InsurerListOverallPageWidget({
    super.key,
    this.brandCode,
    this.modelCode,
    this.year,
    this.province,
    this.vehicleUsage,
    this.coverType,
    required this.garageType,
    required this.brandName,
    required this.modelName,
    this.carTypeDetail,
    required this.oldVmiExpDate,
    required this.provinceCode,
  });

  final String? brandCode;
  final String? modelCode;
  final String? year;
  final String? province;
  final String? vehicleUsage;
  final List<String>? coverType;
  final List<String>? garageType;
  final String? brandName;
  final String? modelName;
  final String? carTypeDetail;
  final String? oldVmiExpDate;
  final String? provinceCode;

  @override
  State<InsurerListOverallPageWidget> createState() =>
      _InsurerListOverallPageWidgetState();
}

class _InsurerListOverallPageWidgetState
    extends State<InsurerListOverallPageWidget> with TickerProviderStateMixin {
  late InsurerListOverallPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsurerListOverallPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insurerListOverallPage'});
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
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.packageAPIOutput = await TelePackageSearchAPICall.call(
        brandCode: widget!.brandCode,
        modelCode: widget!.modelCode,
        year: widget!.year,
        vehicleUsage: widget!.vehicleUsage,
        coverTypeList: widget!.coverType,
        insuranceUrl: FFAppState().apiUrlInsuranceAppState,
        garageTypeList: widget!.garageType,
        province: widget!.province,
        maxGrossTotal: double.parse(FFAppState().sliderMaxGrossTotal!).toInt(),
        minGrossTotal: double.parse(FFAppState().sliderMinGrossTotal!).toInt(),
        maxSumInsured: double.parse(FFAppState().sliderMaxSumInsured!).toInt(),
        minSumInsured: double.parse(FFAppState().sliderMinSumInsured!).toInt(),
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
              ),
            );
          },
        );
        return;
      }
      if (TelePackageSearchAPICall.statusLayer1(
            (_model.packageAPIOutput?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(TelePackageSearchAPICall.messageLayer1(
                  (_model.packageAPIOutput?.jsonBody ?? ''),
                )!),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        return;
      }
      if (TelePackageSearchAPICall.data(
            (_model.packageAPIOutput?.jsonBody ?? ''),
          )!
              .length <=
          0) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('ไม่พบข้อมูลบริษัทประกัน'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        return;
      }
      if (TelePackageSearchAPICall.insurershortnameall(
            (_model.packageAPIOutput?.jsonBody ?? ''),
          )!
              .length <=
          0) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('ไม่พบข้อมูลบริษัทประกัน'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        return;
      }
      FFAppState().searchSerialName = TelePackageSearchAPICall.serialName(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchSumInsured = TelePackageSearchAPICall.sumInsured(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchCoverType = TelePackageSearchAPICall.coverType(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchGrossTotal = TelePackageSearchAPICall.grossTotal(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchExpDate = TelePackageSearchAPICall.expiryDate(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().tpbiAccident = TelePackageSearchAPICall.tpbiAccident(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().tpbiPerson = TelePackageSearchAPICall.tpbiPerson(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().teleModelName = TelePackageSearchAPICall.modelName(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().teleBrandName = TelePackageSearchAPICall.brandName(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchGarageType = TelePackageSearchAPICall.garageType(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchRegisYearList =
          TelePackageSearchAPICall.registrationYear(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchFullName = TelePackageSearchAPICall.fullName(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchTppd = TelePackageSearchAPICall.tppd(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchPa = TelePackageSearchAPICall.pa(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().companyId = TelePackageSearchAPICall.companyId(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().teleBrandID = TelePackageSearchAPICall.brandCode(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().teleModelCode = TelePackageSearchAPICall.modelCode(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchActAmount = TelePackageSearchAPICall.actAmount(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchShortName = TelePackageSearchAPICall.shortName(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchLogo = TelePackageSearchAPICall.logo(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchAccessoryList = TelePackageSearchAPICall.accessory(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchInsurerCondition =
          TelePackageSearchAPICall.insurerCondition(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      safeSetState(() {});
      FFAppState().effectiveDate = TelePackageSearchAPICall.effectiveDate(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchId = TelePackageSearchAPICall.id(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<int>();
      FFAppState().searchPackageId = TelePackageSearchAPICall.packageId(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().serachPackageName = TelePackageSearchAPICall.packageName(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchStamp = TelePackageSearchAPICall.stamp(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchVat = TelePackageSearchAPICall.vat(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchNetPremium = TelePackageSearchAPICall.netPremium(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchSeat = TelePackageSearchAPICall.seat(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchRoadsideAssistance =
          TelePackageSearchAPICall.roadsideAssistance(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchbb = TelePackageSearchAPICall.bb(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchme = TelePackageSearchAPICall.me(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchFlood = TelePackageSearchAPICall.flood(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchDeductible = TelePackageSearchAPICall.deductible(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchContractProcessstate =
          TelePackageSearchAPICall.contractProcessstate(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchcc = TelePackageSearchAPICall.cc(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchInsurerInsurershortname =
          TelePackageSearchAPICall.insurershortnameall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchInsurerInsurername =
          TelePackageSearchAPICall.insurernameall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchInsurerInsurercode =
          TelePackageSearchAPICall.insurercodeall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchInsurerCompanyid =
          TelePackageSearchAPICall.companyidall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchInsurerLogo = TelePackageSearchAPICall.logoall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchInsurerCovertypelist =
          TelePackageSearchAPICall.covertypelistall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchInsurerGaragetypelist =
          TelePackageSearchAPICall.garagetypelistall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchInsurerMaxnetpremium =
          TelePackageSearchAPICall.maxnetpremiumall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchInsurerMinnetpremium =
          TelePackageSearchAPICall.minnetpremiumall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchInsurerMaxsuminsured =
          TelePackageSearchAPICall.maxsuminsuredall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchInsurerMinsuminsured =
          TelePackageSearchAPICall.minsuminsuredall(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().searchCarlost = TelePackageSearchAPICall.carlost(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchMotoraddon = TelePackageSearchAPICall.motoraddon(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().searchDriverbehavior =
          TelePackageSearchAPICall.driverbehavior(
        (_model.packageAPIOutput?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      safeSetState(() {});
      FFAppState().sliderMinGrossTotal = functions.getMinMaxValueFromList(
          FFAppState().searchInsurerMinnetpremium.toList(), 'min')!;
      FFAppState().sliderMaxGrossTotal = functions.getMinMaxValueFromList(
          FFAppState().searchInsurerMaxnetpremium.toList(), 'max')!;
      safeSetState(() {});
      FFAppState().sliderMinGrossTotal = functions.getMinMaxValueFromList(
          FFAppState().searchInsurerMinnetpremium.toList(), 'min')!;
      FFAppState().sliderMaxGrossTotal = functions.getMinMaxValueFromList(
          FFAppState().searchInsurerMaxnetpremium.toList(), 'max')!;
      FFAppState().sliderCurrentMinValueGross =
          FFAppState().sliderMinGrossTotal;
      FFAppState().sliderCurrentMaxValueGross =
          FFAppState().sliderMaxGrossTotal;
      FFAppState().sliderMinSumInsured = functions.getMinMaxValueFromList(
          FFAppState().searchInsurerMinsuminsured.toList(), 'min')!;
      FFAppState().sliderMaxSumInsured = functions.getMinMaxValueFromList(
          FFAppState().searchInsurerMaxsuminsured.toList(), 'max')!;
      FFAppState().sliderCurrentMinSumInsured =
          FFAppState().sliderMinSumInsured;
      FFAppState().sliderCurrentMaxSumInsured =
          FFAppState().sliderMaxSumInsured;
      safeSetState(() {});
      FFAppState().isShowPackageCardList1 = functions
          .checkPackageInRangePage2(
              FFAppState().searchShortName.toList(),
              FFAppState().searchNetPremium.toList(),
              FFAppState().searchInsurerInsurershortname.toList(),
              FFAppState().sliderMinGrossTotal,
              FFAppState().sliderMaxGrossTotal)!
          .toList()
          .cast<bool>();
      safeSetState(() {});
      Navigator.pop(context);
    });
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
              'ค้นหาบริษัทประกัน',
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
                                                      CrossAxisAlignment.center,
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 8.0),
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
                                                      if (TelePackageSearchAPICall
                                                                  .data(
                                                            (_model.packageAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                              .length >
                                                          0) {
                                                        context.pushNamed(
                                                          'PackageFilterPage',
                                                          queryParameters: {
                                                            'fromPage':
                                                                serializeParam(
                                                              'SearchPackage2',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'ไม่พบบริษัทประกัน'),
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
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
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
                                                              FFAppState()
                                                                          .filterInsurerList
                                                                          .length >
                                                                      0
                                                                  ? FFAppState()
                                                                      .filterInsurerList
                                                                      .first
                                                                  : 'ค้นหาบริษัทประกัน',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (FFAppState()
                                                                      .filterInsurerList
                                                                      .length >
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .filterInsurerList = [];
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .cancel_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (FFAppState()
                                                                      .filterInsurerList
                                                                      .length ==
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.58,
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
                                                if ((TelePackageSearchAPICall
                                                                .data(
                                                          (_model.packageAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                            .length >
                                                        0) &&
                                                    (TelePackageSearchAPICall
                                                            .statusLayer1(
                                                          (_model.packageAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        200) &&
                                                    ((_model.packageAPIOutput
                                                                ?.statusCode ??
                                                            200) ==
                                                        200))
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listinsurance =
                                                            FFAppState()
                                                                .searchInsurerInsurershortname
                                                                .toList();

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
                                                            return Visibility(
                                                              visible: (FFAppState().filterInsurerList.length > 0 ? (FFAppState().filterInsurerList.length > 0 ? FFAppState().filterInsurerList.contains(FFAppState().searchInsurerInsurercode[listinsuranceIndex]) : true) : true) &&
                                                                  (functions.checkPackageInRangePage2Copy(
                                                                          FFAppState()
                                                                              .searchShortName
                                                                              .toList(),
                                                                          FFAppState()
                                                                              .searchGrossTotal
                                                                              .toList(),
                                                                          FFAppState().searchInsurerInsurershortname[
                                                                              listinsuranceIndex],
                                                                          FFAppState()
                                                                              .sliderCurrentMinValueGross,
                                                                          FFAppState()
                                                                              .sliderCurrentMaxValueGross,
                                                                          FFAppState().searchInsurerCovertypelist[
                                                                              listinsuranceIndex],
                                                                          FFAppState()
                                                                              .searchCoverType
                                                                              .toList())! &&
                                                                      functions.checkPackageInRangePage2Copy(
                                                                          FFAppState()
                                                                              .searchShortName
                                                                              .toList(),
                                                                          FFAppState().searchSumInsured.toList(),
                                                                          FFAppState().searchInsurerInsurershortname[listinsuranceIndex],
                                                                          FFAppState().sliderCurrentMinSumInsured,
                                                                          FFAppState().sliderCurrentMaxSumInsured,
                                                                          FFAppState().searchInsurerCovertypelist[listinsuranceIndex],
                                                                          FFAppState().searchCoverType.toList())!),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        8.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: columnInsurerConfig2Record!
                                                                          .insurerInstallment
                                                                          .contains(
                                                                              FFAppState().searchShortName[listinsuranceIndex])
                                                                      ? 160.0
                                                                      : 140.0,
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
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
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
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
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
                                                                                                    valueOrDefault<String>(
                                                                                                      functions.stringToImgPath(FFAppState().searchInsurerLogo[listinsuranceIndex]),
                                                                                                      'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
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
                                                                                                    FFAppState().searchInsurerInsurercode[listinsuranceIndex],
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 11.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          if (columnInsurerConfig2Record?.insurerInstallment?.contains(FFAppState().searchInsurerInsurershortname[listinsuranceIndex]) ?? true)
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'ชำระเต็มจำนวนเท่านั้น',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
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
                                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                                        fontSize: 11.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      functions.addCoverType(FFAppState().searchInsurerCovertypelist[listinsuranceIndex]),
                                                                                                      '-',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 11.0,
                                                                                                          letterSpacing: 0.0,
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
                                                                                                  'ราคาเบี้ยเริ่มต้น',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFAppState().searchInsurerMinnetpremium[listinsuranceIndex],
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
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
                                                                                                  'ทุนประกันสูงสุด',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFAppState().searchInsurerMaxsuminsured[listinsuranceIndex],
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
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
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            FFAppState().addCustomerQuotationSaveSuccess = false;
                                                                                            FFAppState().filterInsurerList = [];
                                                                                            safeSetState(() {});
                                                                                            FFAppState().addToFilterInsurerList(FFAppState().searchInsurerInsurercode[listinsuranceIndex]);
                                                                                            safeSetState(() {});
                                                                                            if (functions.containWordinStringUrl('1', FFAppState().searchInsurerCovertypelist[listinsuranceIndex])!) {
                                                                                              FFAppState().filterCoverTypeList = FFAppState().listType1.toList().cast<String>();
                                                                                              safeSetState(() {});
                                                                                            } else {
                                                                                              FFAppState().filterCoverTypeList = FFAppState().listNonType1.toList().cast<String>();
                                                                                              safeSetState(() {});
                                                                                            }

                                                                                            context.pushNamed(
                                                                                              'insurerListPage',
                                                                                              queryParameters: {
                                                                                                'garageType': serializeParam(
                                                                                                  widget!.garageType,
                                                                                                  ParamType.String,
                                                                                                  isList: true,
                                                                                                ),
                                                                                                'brandName': serializeParam(
                                                                                                  widget!.brandName,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'modelName': serializeParam(
                                                                                                  widget!.modelName,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'oldVmiExpDate': serializeParam(
                                                                                                  widget!.oldVmiExpDate,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'provinceCode': serializeParam(
                                                                                                  widget!.provinceCode,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'brandCode': serializeParam(
                                                                                                  widget!.brandCode,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'modelCode': serializeParam(
                                                                                                  widget!.modelCode,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'year': serializeParam(
                                                                                                  widget!.year,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'province': serializeParam(
                                                                                                  widget!.province,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'vehicleUsage': serializeParam(
                                                                                                  widget!.vehicleUsage,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                                'coverType': serializeParam(
                                                                                                  widget!.coverType,
                                                                                                  ParamType.String,
                                                                                                  isList: true,
                                                                                                ),
                                                                                                'carTypeDetail': serializeParam(
                                                                                                  widget!.carTypeDetail,
                                                                                                  ParamType.String,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          text: 'รายละเอียด',
                                                                                          options: FFButtonOptions(
                                                                                            height: 30.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: Color(0x9EFF6500),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
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
                                                if (TelePackageSearchAPICall
                                                        .data(
                                                      (_model.packageAPIOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.length ==
                                                    0)
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
                                                            'ไม่พบข้อมูลบริษัทประกัน',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
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
                                                                          .searchPackageCheckFilled[1];
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
                                                                    'NonePackageRenewPage',
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
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFFDB771A),
                                                                        letterSpacing:
                                                                            0.0,
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
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
                                                                          .searchPackageCheckFilled[1];
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
                                                                      'SelectReasonPage');
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
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFF090F13),
                                                                        letterSpacing:
                                                                            0.0,
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
