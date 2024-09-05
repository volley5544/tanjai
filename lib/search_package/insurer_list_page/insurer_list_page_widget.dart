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
  State<InsurerListPageWidget> createState() => _InsurerListPageWidgetState();
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
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      FFAppState().filterCoverTypeList = [];
      FFAppState().filterGarageTypeList = [];
      safeSetState(() {});
      if (FFAppState().searchPackageSubProduct == 'MC') {
        _model.packageAPIMCOutput = await TelePackageSearchMCAPICall.call(
          brandCode: widget!.brandCode,
          year: widget!.year,
          modelCode: widget!.modelCode,
          province: widget!.province,
          vehicleUsage: widget!.vehicleUsage,
          insuranceUrl: FFAppState().apiUrlInsuranceAppState,
          coverTypeList: widget!.coverType,
          garageTypeList: widget!.garageType,
        );

        if ((_model.packageAPIMCOutput?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาด (${(_model.packageAPIMCOutput?.statusCode ?? 200).toString()})'),
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
        if (TelePackageSearchMCAPICall.statusLayer1(
              (_model.packageAPIMCOutput?.jsonBody ?? ''),
            ) !=
            200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(TelePackageSearchMCAPICall.messageLayer1(
                    (_model.packageAPIMCOutput?.jsonBody ?? ''),
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
        if (TelePackageSearchMCAPICall.total(
              (_model.packageAPIMCOutput?.jsonBody ?? ''),
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
                ),
              );
            },
          );
          Navigator.pop(context);
          return;
        }
        FFAppState().searchSerialName = TelePackageSearchMCAPICall.serialName(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchSumInsured = TelePackageSearchMCAPICall.sumInsured(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchCoverType = TelePackageSearchMCAPICall.coverType(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchGrossTotal = TelePackageSearchMCAPICall.grossTotal(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchExpDate = TelePackageSearchMCAPICall.expiryDate(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().tpbiAccident = TelePackageSearchMCAPICall.tpbiAccident(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().tpbiPerson = TelePackageSearchMCAPICall.tpbiPerson(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().teleModelName = TelePackageSearchMCAPICall.modelName(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().teleBrandName = TelePackageSearchMCAPICall.brandName(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchGarageType = TelePackageSearchMCAPICall.garageType(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchRegisYearList =
            TelePackageSearchMCAPICall.registrationYear(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().searchFullName = TelePackageSearchMCAPICall.fullName(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchTppd = TelePackageSearchMCAPICall.tppd(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchPa = TelePackageSearchMCAPICall.pa(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().companyId = TelePackageSearchMCAPICall.companyId(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().teleBrandID = TelePackageSearchMCAPICall.brandCode(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().teleModelCode = TelePackageSearchMCAPICall.modelCode(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchActAmount = TelePackageSearchMCAPICall.actAmount(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchShortName = TelePackageSearchMCAPICall.shortName(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchLogo = TelePackageSearchMCAPICall.logo(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchAccessoryList = TelePackageSearchMCAPICall.accessory(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchInsurerCondition =
            TelePackageSearchMCAPICall.insurerCondition(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        safeSetState(() {});
        FFAppState().effectiveDate = TelePackageSearchMCAPICall.effectiveDate(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchId = TelePackageSearchMCAPICall.id(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<int>();
        FFAppState().searchPackageId = TelePackageSearchMCAPICall.packageId(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().serachPackageName = TelePackageSearchMCAPICall.packageName(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchStamp = TelePackageSearchMCAPICall.stamp(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchVat = TelePackageSearchMCAPICall.vat(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchNetPremium = TelePackageSearchMCAPICall.netPremium(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchSeat = TelePackageSearchMCAPICall.seat(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchRoadsideAssistance =
            TelePackageSearchMCAPICall.roadsideAssistance(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().searchbb = TelePackageSearchMCAPICall.bb(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchme = TelePackageSearchMCAPICall.me(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchFlood = TelePackageSearchMCAPICall.flood(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchDeductible = TelePackageSearchMCAPICall.deductible(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().searchContractProcessstate =
            TelePackageSearchMCAPICall.contractProcessstate(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().searchcc = TelePackageSearchMCAPICall.cc(
          (_model.packageAPIMCOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        safeSetState(() {});
        FFAppState().selectInsurerList = functions
            .createFalseListByItemNumber(
                false, FFAppState().searchSerialName.length)!
            .toList()
            .cast<bool>();
        FFAppState().addCustomerQuotationSaveSuccess = false;
        safeSetState(() {});
        Navigator.pop(context);
      } else {
        if (true) {
          Navigator.pop(context);
          FFAppState().selectInsurerList = functions
              .createFalseListByItemNumber(
                  false, FFAppState().searchSerialName.length)!
              .toList()
              .cast<bool>();
          FFAppState().addCustomerQuotationSaveSuccess = false;
          safeSetState(() {});
        } else {
          _model.packageAPIOutput = await TelePackageSearchAPICall.call(
            brandCode: widget!.brandCode,
            modelCode: widget!.modelCode,
            year: widget!.year,
            vehicleUsage: widget!.vehicleUsage,
            coverTypeList: widget!.coverType,
            insuranceUrl: FFAppState().apiUrlInsuranceAppState,
            garageTypeList: widget!.garageType,
            province: widget!.province,
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
          if (TelePackageSearchAPICall.total(
                (_model.packageAPIOutput?.jsonBody ?? ''),
              )?.length ==
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
          safeSetState(() {});
          FFAppState().selectInsurerList = functions
              .createFalseListByItemNumber(
                  false, FFAppState().searchSerialName.length)!
              .toList()
              .cast<bool>();
          FFAppState().addCustomerQuotationSaveSuccess = false;
          safeSetState(() {});
          Navigator.pop(context);
        }
      }
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
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFFDB771A),
                size: 30,
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
                                  width: 50,
                                  height: 50,
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
                                          width: 50,
                                          height: 50,
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
                                                  20, 0, 0, 0),
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
                                                                  0, 5, 0, 4),
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
                                                    Text(
                                                      '(เลือกเปรียบเทียบสูงสุด 3 รายการเท่านั้น)',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 12,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 8),
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
                                                              .total(
                                                            (_model.packageAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.length ==
                                                          0) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'ไม่พบข้อมูลรายการประกัน'),
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
                                                        return;
                                                      }

                                                      context.pushNamed(
                                                        'PackageFilterPage',
                                                        queryParameters: {
                                                          'fromPage':
                                                              serializeParam(
                                                            'SearchPackage3',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'ค้นหาเปรียบเทียบบริษัทประกัน',
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
                                                                        14,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        10,
                                                                        0),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 18,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(25, 0, 0, 0),
                                              child: Text(
                                                'เลือกได้สูงสุด 3  รายการ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 14,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                '(${'${functions.countTrueInBoolList(FFAppState().selectInsurerList.toList()).toString()}/ 3'})',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
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
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((FFAppState()
                                                            .searchInsurerInsurershortname
                                                            .length >
                                                        0) ||
                                                    ((TelePackageSearchMCAPICall
                                                                .total(
                                                              (_model.packageAPIMCOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            0) &&
                                                        (TelePackageSearchMCAPICall
                                                                .statusLayer1(
                                                              (_model.packageAPIMCOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) ==
                                                            200) &&
                                                        ((_model.packageAPIMCOutput
                                                                    ?.statusCode ??
                                                                200) ==
                                                            200)))
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listinsurance =
                                                            FFAppState()
                                                                .searchFullName
                                                                .toList();

                                                        return ListView.builder(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            4,
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
                                                              visible: (FFAppState().filterInsurerList.length > 0) ||
                                                                      (FFAppState()
                                                                              .filterCoverTypeList
                                                                              .length >
                                                                          0) ||
                                                                      (FFAppState()
                                                                              .filterGarageTypeList
                                                                              .length >
                                                                          0)
                                                                  ? ((FFAppState().filterInsurerList.length > 0 ? FFAppState().filterInsurerList.contains(FFAppState().searchSerialName[listinsuranceIndex]) : true) &&
                                                                      (FFAppState().filterCoverTypeList.length >
                                                                              0
                                                                          ? FFAppState().filterCoverTypeList.contains(FFAppState().searchCoverType[
                                                                              listinsuranceIndex])
                                                                          : true) &&
                                                                      (FFAppState().filterGarageTypeList.length >
                                                                              0
                                                                          ? FFAppState()
                                                                              .filterGarageTypeList
                                                                              .contains(FFAppState().searchGarageType[listinsuranceIndex])
                                                                          : true))
                                                                  : true,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            20,
                                                                            8),
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
                                                                            4,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0,
                                                                          2,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16),
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
                                                                                2) {
                                                                              if (!FFAppState().selectInsurerList[listinsuranceIndex]) {
                                                                                return;
                                                                              }
                                                                            }
                                                                            HapticFeedback.mediumImpact();
                                                                            FFAppState().updateSelectInsurerListAtIndex(
                                                                              listinsuranceIndex,
                                                                              (_) => FFAppState().selectInsurerList[listinsuranceIndex] == true ? false : true,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                  child: Container(
                                                                                    width: 15,
                                                                                    height: 15,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    child: Visibility(
                                                                                      visible: FFAppState().selectInsurerList[listinsuranceIndex],
                                                                                      child: Icon(
                                                                                        Icons.check,
                                                                                        color: FlutterFlowTheme.of(context).success,
                                                                                        size: 12,
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
                                                                              6,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(16),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 15, 30),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                              child: Container(
                                                                                                width: 40,
                                                                                                height: 40,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(0),
                                                                                                  shape: BoxShape.rectangle,
                                                                                                ),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(0),
                                                                                                  child: Image.network(
                                                                                                    valueOrDefault<String>(
                                                                                                      functions.stringToImgPath(FFAppState().searchLogo[listinsuranceIndex]),
                                                                                                      'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                                                    ),
                                                                                                    width: 150,
                                                                                                    height: 150,
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    FFAppState().searchSerialName[listinsuranceIndex],
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 11,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          if (false)
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(0, 0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Text(
                                                                                                          FFAppState().serachPackageName[listinsuranceIndex],
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Noto Sans Thai',
                                                                                                                fontSize: 12,
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          if (columnInsurerConfig2Record?.insurerInstallment?.contains(FFAppState().searchShortName[listinsuranceIndex]) ?? true)
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'ชำระเต็มจำนวนเท่านั้น',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          fontSize: 12,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ประเภทประกัน',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                                        fontSize: 11,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                                  child: Text(
                                                                                                    functions.showCoverTypeThai(FFAppState().searchCoverType[listinsuranceIndex]),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          fontSize: 11,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ทุนประกัน',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                                  child: Text(
                                                                                                    functions.showNumberWithComma(FFAppState().searchSumInsured[listinsuranceIndex])!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 10,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'ประเภทซ่อม',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 10,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                                  child: Text(
                                                                                                    functions.showGarageType(FFAppState().searchGarageType[listinsuranceIndex]),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 10,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          if (FFAppState().searchDeductible[listinsuranceIndex] != '0')
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'ค่าเสียหายส่วนเเรก',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          fontSize: 10,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                                    child: Text(
                                                                                                      functions.showNumberWithComma(FFAppState().searchDeductible[listinsuranceIndex])!,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Noto Sans Thai',
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            fontSize: 10,
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
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'ราคาเบี้ย',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 10,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            '${functions.showNumberWithComma(FFAppState().searchGrossTotal[listinsuranceIndex])} บาท',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                                  fontSize: 11,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          context.pushNamed(
                                                                                            'detailsInsurancePage',
                                                                                            queryParameters: {
                                                                                              'insurerFullName': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchSerialName[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'currentDate': serializeParam(
                                                                                                functions.checkNullValueAndReturn(getCurrentTimestamp.toString()),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'brandId': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().teleBrandID[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'brandName': serializeParam(
                                                                                                widget!.brandName,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'modelCode': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().teleModelCode[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'modelName': serializeParam(
                                                                                                widget!.modelName,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'year': serializeParam(
                                                                                                functions.checkNullValueAndReturn(widget!.year),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'driverType': serializeParam(
                                                                                                '-',
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'grossTotal': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchGrossTotal[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'sumInsured': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchSumInsured[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'tppd': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchTppd[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'pa': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchPa[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'grossAct': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchActAmount[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'expireDate': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchExpDate[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'coverTypeId': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchCoverType[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'coverTypeCode': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchCoverType[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'coverTypeName': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchCoverType[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'garageTypeId': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchGarageType[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'garageTypeName': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchGarageType[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'insurerId': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().companyId[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'insurerShortName': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchShortName[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'garageTypeCode': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchGarageType[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'tpbiPerson': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().tpbiPerson[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'tpbiAccident': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().tpbiAccident[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'logoUrl': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchLogo[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'yearProduct': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchRegisYearList[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'accessory': serializeParam(
                                                                                                functions.checkNullValueAndReturn(FFAppState().searchAccessoryList[listinsuranceIndex]),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'productId': serializeParam(
                                                                                                FFAppState().searchId[listinsuranceIndex].toString(),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'packageId': serializeParam(
                                                                                                FFAppState().searchPackageId[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'packageName': serializeParam(
                                                                                                FFAppState().serachPackageName[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'roadsideAssis': serializeParam(
                                                                                                FFAppState().searchRoadsideAssistance[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'flood': serializeParam(
                                                                                                FFAppState().searchFlood[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'deductible': serializeParam(
                                                                                                FFAppState().searchDeductible[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'me': serializeParam(
                                                                                                FFAppState().searchme[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'bb': serializeParam(
                                                                                                FFAppState().searchbb[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'seat': serializeParam(
                                                                                                FFAppState().searchSeat[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'netPremium': serializeParam(
                                                                                                FFAppState().searchNetPremium[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'vat': serializeParam(
                                                                                                FFAppState().searchVat[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'stamp': serializeParam(
                                                                                                FFAppState().searchStamp[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'insurerMaxName': serializeParam(
                                                                                                FFAppState().searchFullName[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'contractProcessstate': serializeParam(
                                                                                                FFAppState().searchContractProcessstate[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'insurerCondition': serializeParam(
                                                                                                FFAppState().searchInsurerCondition[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'cc': serializeParam(
                                                                                                FFAppState().searchcc[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'insurerConfig': serializeParam(
                                                                                                columnInsurerConfig2Record,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'carLost': serializeParam(
                                                                                                FFAppState().searchCarlost[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'motorAddOn': serializeParam(
                                                                                                FFAppState().searchMotoraddon[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'driverBehavior': serializeParam(
                                                                                                FFAppState().searchDriverbehavior[listinsuranceIndex],
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'insurerConfig': columnInsurerConfig2Record,
                                                                                            },
                                                                                          );

                                                                                          FFAppState().addCustomerQuotationSaveSuccess = false;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        text: 'รายละเอียด',
                                                                                        options: FFButtonOptions(
                                                                                          height: 30,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                          color: Color(0x9EFF6500),
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Noto Sans Thai',
                                                                                                color: Colors.white,
                                                                                                fontSize: 12,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          elevation: 3,
                                                                                          borderSide: BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 1,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(10),
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
                                                if (!((FFAppState()
                                                            .searchInsurerInsurershortname
                                                            .length >
                                                        0) ||
                                                    ((TelePackageSearchMCAPICall
                                                                .total(
                                                              (_model.packageAPIMCOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            0) &&
                                                        (TelePackageSearchMCAPICall
                                                                .statusLayer1(
                                                              (_model.packageAPIMCOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) ==
                                                            200) &&
                                                        ((_model.packageAPIMCOutput
                                                                    ?.statusCode ??
                                                                200) ==
                                                            200))))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20, 0, 20, 0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
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
                                                              blurRadius: 1,
                                                              color: Color(
                                                                  0x33000000),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Text(
                                                            'ไม่พบข้อมูลรายการประกัน',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  fontSize: 20,
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
                                        if (((FFAppState()
                                                        .searchInsurerInsurershortname
                                                        .length >
                                                    0) ||
                                                ((TelePackageSearchMCAPICall
                                                            .total(
                                                          (_model.packageAPIMCOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        0) &&
                                                    (TelePackageSearchMCAPICall
                                                            .statusLayer1(
                                                          (_model.packageAPIMCOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        200) &&
                                                    ((_model.packageAPIMCOutput
                                                                ?.statusCode ??
                                                            200) ==
                                                        200))) &&
                                            (functions.countTrueInBoolList(
                                                    FFAppState()
                                                        .selectInsurerList
                                                        .toList())! >=
                                                2))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 8, 20, 0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'compareInsurancePage',
                                                  queryParameters: {
                                                    'brandName': serializeParam(
                                                      widget!.brandName,
                                                      ParamType.String,
                                                    ),
                                                    'insurerFullName':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchSerialName
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'currentDate':
                                                        serializeParam(
                                                      getCurrentTimestamp
                                                          .toString(),
                                                      ParamType.String,
                                                    ),
                                                    'brandId': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .teleBrandID
                                                                  .toList(),
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
                                                              FFAppState()
                                                                  .teleModelCode
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true)
                                                          .first,
                                                      ParamType.String,
                                                    ),
                                                    'modelName': serializeParam(
                                                      widget!.modelName,
                                                      ParamType.String,
                                                    ),
                                                    'year': serializeParam(
                                                      widget!.year,
                                                      ParamType.String,
                                                    ),
                                                    'driverType':
                                                        serializeParam(
                                                      '-',
                                                      ParamType.String,
                                                    ),
                                                    'grossTotal':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchGrossTotal
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'sumInsured':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchSumInsured
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'grossAct': serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchActAmount
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'expireDate':
                                                        serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchExpDate
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'coverTypeId':
                                                        serializeParam(
                                                      functions.coverTypeCodeToId(functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchCoverType
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true)
                                                          .toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'coverTypeCode':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchCoverType
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'coverTypeName':
                                                        serializeParam(
                                                      functions.coverTypeCodeToName(functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchCoverType
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true)
                                                          .toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'garageTypeId':
                                                        serializeParam(
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
                                                      isList: true,
                                                    ),
                                                    'garageTypeName':
                                                        serializeParam(
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
                                                      isList: true,
                                                    ),
                                                    'insurerId': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .companyId
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'insurerShortName':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchShortName
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'garageTypeCode':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchGarageType
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'tpbiPerson':
                                                        serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .tpbiPerson
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'tpbiAccident':
                                                        serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .tpbiAccident
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'insurerLogoUrl':
                                                        serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchLogo
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'yearProduct':
                                                        serializeParam(
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
                                                          FFAppState()
                                                              .searchAccessoryList
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'pa': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchPa
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'productId': serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          functions
                                                              .changeListintToString(
                                                                  FFAppState()
                                                                      .searchId
                                                                      .toList())
                                                              ?.toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'packageId': serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchPackageId
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'packageName':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .serachPackageName
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'roadsideAssis':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchRoadsideAssistance
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'flood': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchFlood
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'deductible':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchDeductible
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'me': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchme
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'bb': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchbb
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'seat': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchSeat
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'netPremium':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchNetPremium
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'vat': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchVat
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'stamp': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchStamp
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'insurerMaxName':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchFullName
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'tppd': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchTppd
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'contractProcessstate':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchContractProcessstate
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'insurerCondition':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchInsurerCondition
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'cc': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchcc
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'insurerConfig2':
                                                        serializeParam(
                                                      columnInsurerConfig2Record,
                                                      ParamType.Document,
                                                    ),
                                                    'carLost': serializeParam(
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              FFAppState()
                                                                  .searchCarlost
                                                                  .toList(),
                                                              FFAppState()
                                                                  .selectInsurerList
                                                                  .toList(),
                                                              true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'motorAddOn':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchMotoraddon
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'driverBehavior':
                                                        serializeParam(
                                                      functions.returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .searchDriverbehavior
                                                              .toList(),
                                                          FFAppState()
                                                              .selectInsurerList
                                                              .toList(),
                                                          true),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'insurerConfig2':
                                                        columnInsurerConfig2Record,
                                                  },
                                                );

                                                FFAppState()
                                                        .addCustomerQuotationSaveSuccess =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF5CC2BC),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0,
                                                        2,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    'เปรียบเทียบ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
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
                                                    20, 4, 20, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0,
                                                      2,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                                              -1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
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
                                                                    0, 0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .carSide,
                                                              color: Color(
                                                                  0xB0FF9936),
                                                              size: 24,
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
                                                            fontSize: 16,
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
                                                                    0, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          12,
                                                                          0),
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
                                                                  height: 30,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  iconPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
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
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
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
                                                    20, 4, 20, 0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0,
                                                      2,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                                              -1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
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
                                                                    0, 0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .carSide,
                                                              color: Color(
                                                                  0xFF7A848E),
                                                              size: 24,
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
                                                            fontSize: 16,
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
                                                                    0, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          12,
                                                                          0),
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
                                                                  height: 30,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  iconPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
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
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
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
