import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_dialog_component_copy_widget.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_fire_insurance_widget.dart';
import '/components/save_contract_c_m_i_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import '/pages/super_app/components/step5_document_download/step5_document_download_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_info_page5_model.dart';
export 'insurance_info_page5_model.dart';

class InsuranceInfoPage5Widget extends StatefulWidget {
  const InsuranceInfoPage5Widget({
    super.key,
    required this.quotationId,
    required this.leadDtlId,
    this.fromPage,
  });

  final String? quotationId;
  final int? leadDtlId;
  final String? fromPage;

  static String routeName = 'insuranceInfoPage5';
  static String routePath = 'insuranceInfoPage5';

  @override
  State<InsuranceInfoPage5Widget> createState() =>
      _InsuranceInfoPage5WidgetState();
}

class _InsuranceInfoPage5WidgetState extends State<InsuranceInfoPage5Widget>
    with TickerProviderStateMixin {
  late InsuranceInfoPage5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceInfoPage5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insuranceInfoPage5'});
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
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      FFAppState().isProcessing = false;
      safeSetState(() {});
      _model.getDateTimeOutput = await GetDateTimeAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );

      if ((_model.getDateTimeOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    (_model.getDateTimeOutput?.statusCode ?? 200).toString()),
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
      if (GetDateTimeAPICall.statusLayer1(
            (_model.getDateTimeOutput?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(GetDateTimeAPICall.messageLayer1(
                  (_model.getDateTimeOutput?.jsonBody ?? ''),
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
        Navigator.pop(context);
        return;
      }
      FFAppState().page5DateNow = '${GetDateTimeAPICall.currentDateYMD(
        (_model.getDateTimeOutput?.jsonBody ?? ''),
      )}';
      safeSetState(() {});
      _model.applicationDetailOutput = await IbsApplicationsDetailCall.call(
        quotationId: widget!.quotationId,
        insuranceUrl: FFAppState().apiUrlInsuranceAppState,
        token: FFAppState().accessToken,
      );

      if ((_model.applicationDetailOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดConnection (${(_model.applicationDetailOutput?.statusCode ?? 200).toString()})'),
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
      if (IbsApplicationsDetailCall.statuslayer1(
            (_model.applicationDetailOutput?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(IbsApplicationsDetailCall.messageLayer1(
                  (_model.applicationDetailOutput?.jsonBody ?? ''),
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
      FFAppState().insuranceInfoFirstName =
          '${IbsApplicationsDetailCall.firstnameth(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoLastName =
          '${IbsApplicationsDetailCall.lastnameth(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoPhonenumber =
          '${IbsApplicationsDetailCall.phonenumber(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoGarageType =
          '${IbsApplicationsDetailCall.garagetypename(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )?.elementAtOrNull(functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                (_model.applicationDetailOutput?.jsonBody ?? ''),
                r'''$.results.data.leads_detail[:].lead_dtl_id''',
                true,
              )).toList(), widget!.leadDtlId))}';
      FFAppState().insuranceInfocoverType =
          '${IbsApplicationsDetailCall.covertypename(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )?.elementAtOrNull(functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                (_model.applicationDetailOutput?.jsonBody ?? ''),
                r'''$.results.data.leads_detail[:].lead_dtl_id''',
                true,
              )).toList(), widget!.leadDtlId))}';
      FFAppState().insuranceInfoGrossTotal =
          '${IbsApplicationsDetailCall.grosstotalnet(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoApplicationType =
          '${IbsApplicationsDetailCall.quotationtype(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().nonePackageWorkType = '${IbsApplicationsDetailCall.workType(
            (_model.applicationDetailOutput?.jsonBody ?? ''),
          ) == '' ? '' : IbsApplicationsDetailCall.workType(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        )}';
      FFAppState().insuranceInfoQuotationId = '${widget!.quotationId}';
      FFAppState().insuranceInfoCompayId =
          '${IbsApplicationsDetailCall.insurershortname(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )?.elementAtOrNull(functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                (_model.applicationDetailOutput?.jsonBody ?? ''),
                r'''$.results.data.leads_detail[:].lead_dtl_id''',
                true,
              )).toList(), widget!.leadDtlId))}';
      FFAppState().insuranceInfoActFlag = '${IbsApplicationsDetailCall.actflg(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoApplicationNo =
          '${IbsApplicationsDetailCall.applicationNo(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoInsuranceLogo =
          '${IbsApplicationsDetailCall.insurerlogo(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )?.elementAtOrNull(functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                (_model.applicationDetailOutput?.jsonBody ?? ''),
                r'''$.results.data.leads_detail[:].lead_dtl_id''',
                true,
              )).toList(), widget!.leadDtlId))}';
      FFAppState().nonePackageOldVmiExpDate =
          '${IbsApplicationsDetailCall.expiryDateInsure(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoPage5QuotationType =
          '${IbsApplicationsDetailCall.quotationtypebak(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoPage3PdfFileapplication =
          '${IbsApplicationsDetailCall.fileApplication(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoActType =
          '${IbsApplicationsDetailCall.subProduct(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoQuotationTypeName =
          '${IbsApplicationsDetailCall.quotationtypename(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoQuotationTypeBakName =
          '${IbsApplicationsDetailCall.quotationtypebakname(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoSubProductName =
          '${IbsApplicationsDetailCall.subproductname(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().page5RefundRemark =
          '${IbsApplicationsDetailCall.refundremark(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoQuotationType =
          '${IbsApplicationsDetailCall.quotationtype(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().page5amount = '${IbsApplicationsDetailCall.paymentamount(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().updateAppDetailNewStruct(
        (e) => e
          ..discountOther = IbsApplicationsDetailCall.discountother(
            (_model.applicationDetailOutput?.jsonBody ?? ''),
          )?.elementAtOrNull(functions.getIndexOfIntList(
              functions
                  .convertDynamicListToIntList(getJsonField(
                    (_model.applicationDetailOutput?.jsonBody ?? ''),
                    r'''$.results.data.leads_detail[:].lead_dtl_id''',
                    true,
                  ))
                  .toList(),
              widget!.leadDtlId))
          ..discountFlg = IbsApplicationsDetailCall.discountflg(
            (_model.applicationDetailOutput?.jsonBody ?? ''),
          )?.elementAtOrNull(functions.getIndexOfIntList(
              functions
                  .convertDynamicListToIntList(getJsonField(
                    (_model.applicationDetailOutput?.jsonBody ?? ''),
                    r'''$.results.data.leads_detail[:].lead_dtl_id''',
                    true,
                  ))
                  .toList(),
              widget!.leadDtlId))
          ..discountPercent = IbsApplicationsDetailCall.discountpercent(
            (_model.applicationDetailOutput?.jsonBody ?? ''),
          )?.elementAtOrNull(functions.getIndexOfIntList(
              functions
                  .convertDynamicListToIntList(getJsonField(
                    (_model.applicationDetailOutput?.jsonBody ?? ''),
                    r'''$.results.data.leads_detail[:].lead_dtl_id''',
                    true,
                  ))
                  .toList(),
              widget!.leadDtlId)),
      );
      safeSetState(() {});
      if (FFAppState().insuranceinfoActType == 'House') {
        FFAppState().leadsHouse = IbsApplicationsDetailCall.apphouse(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<LeadsHouseStruct>();
        FFAppState().leadsDetailHouse =
            IbsApplicationsDetailCall.appdetailhouse(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<LeadsDetailHouseStruct>();
        safeSetState(() {});
      }
      _model.getPolicy = await GetInsurancePolicyApiCall.call(
        apiUrl: FFAppState().apiUrlInsuranceAppState,
        token: FFAppState().accessToken,
        quotationId: widget!.quotationId,
      );

      if ((_model.getPolicy?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดConnection (${(_model.getPolicy?.statusCode ?? 200).toString()})'),
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
      if (GetInsurancePolicyApiCall.statuslayer1(
            (_model.getPolicy?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(GetInsurancePolicyApiCall.messageLayer1(
                  (_model.getPolicy?.jsonBody ?? ''),
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
      FFAppState().page5QuotationStatus =
          '${IbsApplicationsDetailCall.quotationstatus(
        (_model.applicationDetailOutput?.jsonBody ?? ''),
      )}';
      FFAppState().page5CreatedDate = '${GetInsurancePolicyApiCall.createDate(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? functions.convertToBDYearAndTime(GetInsurancePolicyApiCall.createDate(
          (_model.getPolicy?.jsonBody ?? ''),
        )) : '-'}';
      FFAppState().page5CompletedDate = '${GetInsurancePolicyApiCall.completeDate(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? functions.convertToBDYearAndTime(GetInsurancePolicyApiCall.completeDate(
          (_model.getPolicy?.jsonBody ?? ''),
        )) : '-'}';
      FFAppState().page5ContractId = '${GetInsurancePolicyApiCall.contractId(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? GetInsurancePolicyApiCall.contractId(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : '-'}';
      FFAppState().page5VmiPolicyNo = '${GetInsurancePolicyApiCall.policyNumber(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? GetInsurancePolicyApiCall.policyNumber(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : '-'}';
      FFAppState().page5Reason = '${() {
        if (GetInsurancePolicyApiCall.cancelReason(
              (_model.getPolicy?.jsonBody ?? ''),
            ) !=
            '') {
          return GetInsurancePolicyApiCall.cancelReason(
            (_model.getPolicy?.jsonBody ?? ''),
          );
        } else if (GetInsurancePolicyApiCall.vmiMessage(
              (_model.getPolicy?.jsonBody ?? ''),
            ) !=
            '') {
          return GetInsurancePolicyApiCall.vmiMessage(
            (_model.getPolicy?.jsonBody ?? ''),
          );
        } else if (GetInsurancePolicyApiCall.cmiMessage(
              (_model.getPolicy?.jsonBody ?? ''),
            ) !=
            '') {
          return GetInsurancePolicyApiCall.cmiMessage(
            (_model.getPolicy?.jsonBody ?? ''),
          );
        } else {
          return '-';
        }
      }()}';
      FFAppState().page5PaymentStatus =
          '${GetInsurancePolicyApiCall.paymenttatus(
                (_model.getPolicy?.jsonBody ?? ''),
              ) != '' ? GetInsurancePolicyApiCall.paymenttatus(
              (_model.getPolicy?.jsonBody ?? ''),
            ) : '-'}';
      FFAppState().page5PaymentType = '${GetInsurancePolicyApiCall.paymentype(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? GetInsurancePolicyApiCall.paymentype(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : '-'}';
      FFAppState().page5PaymentChannel =
          '${GetInsurancePolicyApiCall.paymentChannel(
                (_model.getPolicy?.jsonBody ?? ''),
              ) != '' ? GetInsurancePolicyApiCall.paymentChannel(
              (_model.getPolicy?.jsonBody ?? ''),
            ) : '-'}';
      FFAppState().page5NetPremium = '${GetInsurancePolicyApiCall.netPremiumTotal(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? (FFAppState().insuranceinfoActType == 'House' ? GetInsurancePolicyApiCall.housenetpremiumtotal(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : GetInsurancePolicyApiCall.netPremiumTotal(
          (_model.getPolicy?.jsonBody ?? ''),
        )) : '-'}';
      FFAppState().page5ActPrice = '${GetInsurancePolicyApiCall.actTotal(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? GetInsurancePolicyApiCall.actTotal(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : '-'}';
      FFAppState().page5GrossTotalNet = '${GetInsurancePolicyApiCall.grossTotalNet(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? (FFAppState().insuranceinfoActType == 'House' ? GetInsurancePolicyApiCall.housegrosstotalnet(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : GetInsurancePolicyApiCall.grossTotalNet(
          (_model.getPolicy?.jsonBody ?? ''),
        )) : '-'}';
      FFAppState().page5FirstDue = '${GetInsurancePolicyApiCall.installmentFirstDue(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? (FFAppState().insuranceinfoActType == 'House' ? GetInsurancePolicyApiCall.houseinstallmentfirstdue(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : GetInsurancePolicyApiCall.installmentFirstDue(
          (_model.getPolicy?.jsonBody ?? ''),
        )) : '-'}';
      FFAppState().page5LastDue = '${GetInsurancePolicyApiCall.installmentLastDue(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? (FFAppState().insuranceinfoActType == 'House' ? GetInsurancePolicyApiCall.houseinstallmentlastdue(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : GetInsurancePolicyApiCall.installmentLastDue(
          (_model.getPolicy?.jsonBody ?? ''),
        )) : '-'}';
      FFAppState().page5VloneContNo = '${GetInsurancePolicyApiCall.vloneContNo(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? GetInsurancePolicyApiCall.vloneContNo(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : '-'}';
      FFAppState().page5CusIdCardNo = '${GetInsurancePolicyApiCall.vloanCuscod(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? GetInsurancePolicyApiCall.vloanCuscod(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : '-'}';
      FFAppState().page5Tenor = '${GetInsurancePolicyApiCall.tenor(
            (_model.getPolicy?.jsonBody ?? ''),
          ) != '' ? GetInsurancePolicyApiCall.tenor(
          (_model.getPolicy?.jsonBody ?? ''),
        ) : '-'}';
      FFAppState().insuranceInfoPage5Document =
          '${GetInsurancePolicyApiCall.vmiDocumentUrl(
                (_model.getPolicy?.jsonBody ?? ''),
              ) != '' ? GetInsurancePolicyApiCall.vmiDocumentUrl(
              (_model.getPolicy?.jsonBody ?? ''),
            ) : '-'}';
      FFAppState().insuranceInfoPage5CMIDocUrl =
          '${GetInsurancePolicyApiCall.cMIdocumentUrl(
                (_model.getPolicy?.jsonBody ?? ''),
              ) != '' ? GetInsurancePolicyApiCall.cMIdocumentUrl(
              (_model.getPolicy?.jsonBody ?? ''),
            ) : '-'}';
      safeSetState(() {});
      FFAppState().insuranceInfoPage5DocumentURL = '';
      safeSetState(() {});
      Navigator.pop(context);
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: Visibility(
                visible: widget!.fromPage == 'FollowUpPage',
                child: FlutterFlowIconButton(
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
              ),
              title: AutoSizeText(
                '5.ส่งเรื่องให้บริษัทประกันพิจารณา',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.notoSansThai(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Color(0xFF003063),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.file_download_outlined,
                    color: Color(0xFFDB771A),
                    size: 30.0,
                  ),
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Color(0xB3000000),
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.5,
                                child: Step5DocumentDownloadWidget(),
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
              child: FutureBuilder<List<RoleMenuRecord>>(
                future: queryRoleMenuRecordOnce(
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
                  List<RoleMenuRecord> columnRoleMenuRecordList =
                      snapshot.data!;
                  final columnRoleMenuRecord =
                      columnRoleMenuRecordList.isNotEmpty
                          ? columnRoleMenuRecordList.first
                          : null;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (FFAppState().insuranceinfoActType == 'House')
                              wrapWithModel(
                                model:
                                    _model.infomationCustomerFireInsuranceModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InfomationCustomerFireInsuranceWidget(),
                              ),
                            if ((FFAppState().insuranceinfoActType != 'CMI') &&
                                (FFAppState().insuranceinfoActType != 'House'))
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.65,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ใบเสนอราคา',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState()
                                                                .insuranceInfoQuotationId,
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
                                                                  fontSize:
                                                                      15.0,
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'App No.',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState()
                                                                .insuranceinfoApplicationNo,
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
                                                                  fontSize:
                                                                      15.0,
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ชื่อลูกค้า',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            '${FFAppState().insuranceInfoFirstName}  ${FFAppState().insuranceInfoLastName}',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'เบอร์โทร',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState()
                                                                .insuranceInfoPhonenumber,
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
                                                                  fontSize:
                                                                      15.0,
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'การซ่อม',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState()
                                                                .insuranceInfoGarageType,
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
                                                                  fontSize:
                                                                      15.0,
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ประกัน',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState()
                                                                .insuranceInfocoverType,
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
                                                                  fontSize:
                                                                      15.0,
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
                                                    if (FFAppState()
                                                            .nonePackageOldVmiExpDate !=
                                                        '')
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'วันหมดอายุ',
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
                                                                    fontSize:
                                                                        15.0,
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
                                                          Container(
                                                            width: 10.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              ':',
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
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState()
                                                                            .nonePackageOldVmiExpDate !=
                                                                        ''
                                                                    ? functions.showDateBE(
                                                                        FFAppState()
                                                                            .nonePackageOldVmiExpDate)
                                                                    : '-',
                                                                '-',
                                                              ),
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
                                                                    fontSize:
                                                                        15.0,
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ราคาเบี้ย',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState().insuranceInfoApplicationType ==
                                                                    'auto'
                                                                ? '${functions.returnNumberWithComma2Decimal(FFAppState().page5NetPremium)} บาท'
                                                                : '${functions.showNumberWithComma(FFAppState().page5NetPremium)} บาท',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (FFAppState()
                                                            .insuranceInfoActFlag ==
                                                        '1')
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'ราคา พ.ร.บ',
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
                                                                    fontSize:
                                                                        15.0,
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
                                                          Container(
                                                            width: 10.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              ':',
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
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                functions.showNumberWithComma(
                                                                    FFAppState()
                                                                        .page5ActPrice),
                                                                '-',
                                                              )} บาท',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSansThai(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    if (FFAppState()
                                                            .appDetailNew
                                                            .discountFlg ==
                                                        '1')
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'เปอร์เซ็นต์ส่วนลด',
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
                                                                    fontSize:
                                                                        15.0,
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
                                                          Container(
                                                            width: 10.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              ':',
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
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                functions.showNumberWithComma(
                                                                    FFAppState()
                                                                        .appDetailNew
                                                                        .discountPercent),
                                                                '-',
                                                              )}%',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSansThai(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    if (FFAppState()
                                                            .appDetailNew
                                                            .discountFlg ==
                                                        '1')
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'ราคาที่ลด',
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
                                                                    fontSize:
                                                                        15.0,
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
                                                          Container(
                                                            width: 10.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              ':',
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
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                functions.showNumberWithComma(
                                                                    FFAppState()
                                                                        .appDetailNew
                                                                        .discountOther),
                                                                '-',
                                                              )} บาท',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSansThai(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    if ((FFAppState()
                                                                .insuranceInfoActFlag ==
                                                            '1') ||
                                                        (FFAppState()
                                                                .appDetailNew
                                                                .discountFlg ==
                                                            '1'))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'ราคารวม',
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
                                                                    fontSize:
                                                                        15.0,
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
                                                          Container(
                                                            width: 10.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              ':',
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
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                functions.showNumberWithComma(
                                                                    FFAppState()
                                                                        .page5GrossTotalNet),
                                                                '-',
                                                              )} บาท',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoSansThai(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ขอเบี้ย',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Text(
                                                                FFAppState()
                                                                    .insuranceinfoQuotationTypeBakName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSansThai(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (false)
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  '(${FFAppState().nonePackageWorkType})',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansThai(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'แจ้งงาน',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Text(
                                                                FFAppState()
                                                                    .insuranceinfoQuotationTypeName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSansThai(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (false)
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  '(${FFAppState().nonePackageWorkType})',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansThai(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ผลิตภัณฑ์',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Text(
                                                                FFAppState()
                                                                    .insuranceinfoSubProductName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSansThai(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (false)
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  '(${FFAppState().nonePackageWorkType})',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansThai(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        height: 75.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            getCORSProxyUrl(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.stringToImgPath(FFAppState()
                                                                            .insuranceInfoInsuranceLogo !=
                                                                        ''
                                                                    ? FFAppState()
                                                                        .insuranceInfoInsuranceLogo
                                                                    : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37'),
                                                                'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                              ),
                                                            ),
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
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
                                    ],
                                  ),
                                ),
                              ),
                            if (FFAppState().insuranceinfoActType == 'CMI')
                              wrapWithModel(
                                model: _model.infomationCustomerActModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InfomationCustomerActWidget(),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1.0,
                                      color: Color(0x33000000),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFE6E6E6),
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFD9761A),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '1',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                            Color(0xFFFAFAFA),
                                                        fontSize: 15.0,
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
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.06,
                                          height: 100.0,
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
                                                width: 32.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFFD9761A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
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
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '2',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
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
                                                  color: Color(0xFFFAFAFA),
                                                  fontSize: 15.0,
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
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.06,
                                          height: 100.0,
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
                                                width: 32.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFFD9761A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
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
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '3',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
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
                                                  color: Color(0xFFFAFAFA),
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
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.06,
                                          height: 100.0,
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
                                                width: 32.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFFD9761A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
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
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '4',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
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
                                                  color: Color(0xFFFAFAFA),
                                                  fontSize: 15.0,
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
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.06,
                                          height: 100.0,
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
                                                width: 32.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFFD9761A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
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
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '5',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
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
                                                  color: Color(0xFFF1F4F8),
                                                  fontSize: 15.0,
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
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
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
                                            'สถานะการดำเนินงาน',
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
                                                  fontSize: 15.0,
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFB3B3B3),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFAppState()
                                                    .page5QuotationStatus,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansThai(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: () {
                                                            if (FFAppState()
                                                                    .page5QuotationStatus ==
                                                                'อนุมัติ') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .success;
                                                            } else if (FFAppState()
                                                                    .page5QuotationStatus ==
                                                                'ไม่อนุมัติ') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .error;
                                                            } else {
                                                              return Color(
                                                                  0xFFDB771A);
                                                            }
                                                          }(),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            if (!FFAppState().isProcessing)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
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
                                                    var _shouldSetState = false;
                                                    if (FFAppState()
                                                        .isProcessing) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณากดรีเฟรชใหม่ในอีก 10 วินาที'),
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
                                                    } else {
                                                      FFAppState()
                                                          .isProcessing = true;
                                                      safeSetState(() {});
                                                    }

                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    LoadingSceneWidget(),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    _model.getDateTimeOutput2 =
                                                        await GetDateTimeAPICall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .apiURLLocalState,
                                                      token: FFAppState()
                                                          .accessToken,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.getDateTimeOutput2
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
                                                                  'พบข้อผิดพลาด (${(_model.getDateTimeOutput2?.statusCode ?? 200).toString()})'),
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
                                                      Navigator.pop(context);
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                    FFAppState().page5DateNow =
                                                        '${GetDateTimeAPICall.currentDateYMD(
                                                      (_model.getDateTimeOutput2
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}';
                                                    safeSetState(() {});
                                                    _model.getPolicyRefreshButton =
                                                        await GetInsurancePolicyApiCall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .apiUrlInsuranceAppState,
                                                      token: FFAppState()
                                                          .accessToken,
                                                      quotationId:
                                                          widget!.quotationId,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.getPolicyRefreshButton
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
                                                                  'พบข้อผิดพลาดConnection (${(_model.getPolicyRefreshButton?.statusCode ?? 200).toString()})'),
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
                                                    if (GetInsurancePolicyApiCall
                                                            .statuslayer1(
                                                          (_model.getPolicyRefreshButton
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
                                                                  'พบข้อผิดพลาด (${GetInsurancePolicyApiCall.statuslayer1(
                                                                (_model.getPolicyRefreshButton
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toString()})'),
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
                                                    FFAppState()
                                                            .page5QuotationStatus =
                                                        '${GetInsurancePolicyApiCall.quotationStatus(
                                                      (_model.getPolicyRefreshButton
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}';
                                                    FFAppState()
                                                            .page5CreatedDate =
                                                        '${GetInsurancePolicyApiCall.createDate(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? functions.convertToBDYearAndTime(GetInsurancePolicyApiCall.createDate(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )) : '-'}';
                                                    FFAppState()
                                                            .page5CompletedDate =
                                                        '${GetInsurancePolicyApiCall.completeDate(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? functions.convertToBDYearAndTime(GetInsurancePolicyApiCall.completeDate(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )) : '-'}';
                                                    FFAppState()
                                                            .page5ContractId =
                                                        '${GetInsurancePolicyApiCall.contractId(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.contractId(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState()
                                                            .page5VmiPolicyNo =
                                                        '${GetInsurancePolicyApiCall.policyNumber(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.policyNumber(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState().page5Reason =
                                                        '${() {
                                                      if (GetInsurancePolicyApiCall
                                                              .vmiMessage(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          '') {
                                                        return GetInsurancePolicyApiCall
                                                            .vmiMessage(
                                                          (_model.getPolicyRefreshButton
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                      } else if (GetInsurancePolicyApiCall
                                                              .cmiMessage(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          '') {
                                                        return GetInsurancePolicyApiCall
                                                            .cmiMessage(
                                                          (_model.getPolicyRefreshButton
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                      } else {
                                                        return '-';
                                                      }
                                                    }()}';
                                                    FFAppState()
                                                            .page5PaymentStatus =
                                                        '${GetInsurancePolicyApiCall.paymenttatus(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.paymenttatus(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState()
                                                            .page5PaymentType =
                                                        '${GetInsurancePolicyApiCall.paymentype(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.paymentype(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState()
                                                            .page5PaymentChannel =
                                                        '${GetInsurancePolicyApiCall.paymentChannel(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.paymentChannel(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState()
                                                            .page5NetPremium =
                                                        '${GetInsurancePolicyApiCall.netPremiumTotal(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? (FFAppState().insuranceinfoActType == 'House' ? GetInsurancePolicyApiCall.housenetpremiumtotal(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : GetInsurancePolicyApiCall.netPremiumTotal(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )) : '-'}';
                                                    FFAppState().page5ActPrice =
                                                        '${GetInsurancePolicyApiCall.actTotal(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.actTotal(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState()
                                                            .page5GrossTotalNet =
                                                        '${GetInsurancePolicyApiCall.grossTotalNet(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? (FFAppState().insuranceinfoActType == 'House' ? GetInsurancePolicyApiCall.housegrosstotalnet(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : GetInsurancePolicyApiCall.grossTotalNet(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )) : '-'}';
                                                    FFAppState().page5FirstDue =
                                                        '${GetInsurancePolicyApiCall.installmentFirstDue(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? (FFAppState().insuranceinfoActType == 'House' ? GetInsurancePolicyApiCall.houseinstallmentfirstdue(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : GetInsurancePolicyApiCall.installmentFirstDue(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )) : '-'}';
                                                    FFAppState().page5LastDue =
                                                        '${GetInsurancePolicyApiCall.installmentLastDue(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? (FFAppState().insuranceinfoActType == 'House' ? GetInsurancePolicyApiCall.houseinstallmentlastdue(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : GetInsurancePolicyApiCall.installmentLastDue(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )) : '-'}';
                                                    FFAppState()
                                                            .page5VloneContNo =
                                                        '${GetInsurancePolicyApiCall.vloneContNo(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.vloneContNo(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState()
                                                            .page5CusIdCardNo =
                                                        '${GetInsurancePolicyApiCall.vloanCuscod(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.vloanCuscod(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState().page5Tenor =
                                                        '${GetInsurancePolicyApiCall.tenor(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.tenor(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState()
                                                            .insuranceInfoPage5Document =
                                                        '${GetInsurancePolicyApiCall.vmiDocumentUrl(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.vmiDocumentUrl(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    FFAppState()
                                                            .insuranceInfoPage5CMIDocUrl =
                                                        '${GetInsurancePolicyApiCall.cMIdocumentUrl(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) != '' ? GetInsurancePolicyApiCall.cMIdocumentUrl(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) : '-'}';
                                                    safeSetState(() {});
                                                    Navigator.pop(context);
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 10000,
                                                      ),
                                                    );
                                                    FFAppState().isProcessing =
                                                        false;
                                                    safeSetState(() {});
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.refresh,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
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
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'วันที่สถานะการดำเนินงาน',
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
                                                  fontSize: 15.0,
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFB3B3B3),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFAppState().page5CreatedDate,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                          fontSize: 15.0,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
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
                                            'วันที่-เวลา ที่พิจารณาเสร็จ',
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
                                                  fontSize: 15.0,
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFB3B3B3),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFAppState().page5CompletedDate,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                          fontSize: 15.0,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (FFAppState().page5QuotationStatus == 'อนุมัติ')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'เลขที่รับแจ้ง',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFAppState().page5ContractId,
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (FFAppState().page5QuotationStatus == 'อนุมัติ')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'เลขกรมธรรม์',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 45.0,
                                          constraints: BoxConstraints(
                                            minHeight: 60.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFAppState().page5VmiPolicyNo,
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (FFAppState().page5QuotationStatus !=
                                'ขอคืนเงิน')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'เหตุผล',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              FFAppState().page5Reason,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        fontSize: 15.0,
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
                                    ],
                                  ),
                                ),
                              ),
                            if (FFAppState().page5QuotationStatus ==
                                'ขอคืนเงิน')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'เหตุผลขอคืนเงิน',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              FFAppState().page5RefundRemark,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        fontSize: 15.0,
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
                                    ],
                                  ),
                                ),
                              ),
                            if (FFAppState().page5QuotationStatus == 'อนุมัติ')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'สถานะการชำระเงิน',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFAppState()
                                                      .page5PaymentStatus,
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (FFAppState().page5QuotationStatus == 'อนุมัติ')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'ประเภทการชำระเงิน',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFAppState().page5PaymentType,
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (FFAppState().page5QuotationStatus == 'อนุมัติ')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'ช่องการชำระเงิน',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFAppState()
                                                      .page5PaymentChannel,
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if ((FFAppState().page5QuotationStatus ==
                                    'อนุมัติ') &&
                                (FFAppState().insuranceinfoActType != 'CMI'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'ราคาเบี้ย',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions.showNumberWithComma(
                                                        FFAppState()
                                                            .page5NetPremium),
                                                    '-',
                                                  ),
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if ((FFAppState().page5QuotationStatus ==
                                    'อนุมัติ') &&
                                (FFAppState().insuranceinfoActType != 'CMI'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'ราคาเบี้ยจ่ายล่วงหน้า (รวม พ.ร.บ. ถ้ามี)',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .showNumberWithComma(
                                                            FFAppState()
                                                                .page5amount),
                                                    '-',
                                                  ),
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if ((FFAppState().page5QuotationStatus ==
                                    'อนุมัติ') &&
                                (FFAppState().insuranceinfoActType != 'CMI') &&
                                (FFAppState().insuranceinfoActType != 'House'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'ราคา พ.ร.บ. (ถ้ามี)',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .showNumberWithComma(
                                                            FFAppState()
                                                                .page5ActPrice),
                                                    '-',
                                                  ),
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (FFAppState().page5QuotationStatus == 'อนุมัติ')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'ราคาทั้งหมด',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions.showNumberWithComma(
                                                        FFAppState()
                                                            .page5GrossTotalNet),
                                                    '-',
                                                  ),
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if ((FFAppState().page5QuotationStatus ==
                                    'อนุมัติ') &&
                                (FFAppState().page5PaymentType == 'ผ่อนชำระ'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
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
                                              'ระบุงวด',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFAppState().page5Tenor,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansThai(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if ((FFAppState().page5QuotationStatus ==
                                    'อนุมัติ') &&
                                (FFAppState().page5PaymentStatus == 'ผ่อนชำระ'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'ผ่อนงวดละ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .showNumberWithComma(
                                                            FFAppState()
                                                                .page5FirstDue),
                                                    '-',
                                                  ),
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if ((FFAppState().page5QuotationStatus ==
                                    'อนุมัติ') &&
                                (FFAppState().page5PaymentType == 'ผ่อนชำระ'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
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
                                              'ผ่อนงวดสุดท้าย',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .showNumberWithComma(
                                                            FFAppState()
                                                                .page5LastDue),
                                                    '-',
                                                  ),
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
                                                        fontSize: 15.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if ((FFAppState().page5QuotationStatus ==
                                    'อนุมัติ') &&
                                (FFAppState().page5PaymentType == 'ผ่อนชำระ'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
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
                                              'สัญญาเป้า ง',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 1.0,
                                                color: Color(0x33000000),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFE6E6E6),
                                            ),
                                          ),
                                          child: ListView(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'รหัสสัญญา',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
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
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 10.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  ':',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  FFAppState()
                                                                      .page5VloneContNo,
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
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
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
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'รหัสลูกค้า',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
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
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 10.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  ':',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  FFAppState()
                                                                      .page5CusIdCardNo,
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
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
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
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'จำนวนงวด',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
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
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 10.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  ':',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  FFAppState()
                                                                      .page5Tenor,
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
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
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
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'ผ่อนงวดละ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
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
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 10.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  ':',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.showNumberWithComma(
                                                                        FFAppState()
                                                                            .page5FirstDue),
                                                                    '-',
                                                                  ),
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
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
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
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  'ผ่อนงวดสุดท้าย',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
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
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 10.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  ':',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.showNumberWithComma(
                                                                        FFAppState()
                                                                            .page5LastDue),
                                                                    '-',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSansThai(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
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
                            if ((FFAppState().page5QuotationStatus ==
                                    'อนุมัติ') &&
                                (FFAppState().page5PaymentType == 'ผ่อนชำระ') &&
                                (FFAppState().page5VloneContNo != '') &&
                                (FFAppState().page5VloneContNo != '-'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 12.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await launchURL(
                                              '${FFAppState().isProduction ? 'http://ssw-api.srisawadpower.com/api/v1/prod/gec_arcard?server=VL&comcode=S14&contno=' : 'http://49.229.60.115/api/v1/dev/gec_arcard?server=VL&comcode=S14&contno='}${FFAppState().page5VloneContNo}');
                                        },
                                        text: 'การ์ดค่างวด',
                                        icon: Icon(
                                          Icons.qr_code,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.42,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF1A73E7),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Color(0xFF204A77),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            if ((GetInsurancePolicyApiCall.quotationStatus(
                                      (_model.getPolicy?.jsonBody ?? ''),
                                    ) ==
                                    'ไม่อนุมัติ') ||
                                (GetInsurancePolicyApiCall.quotationStatus(
                                      (_model.getPolicy?.jsonBody ?? ''),
                                    ) ==
                                    'ยกเลิก'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed(
                                          SearchInsurancePageWidget.routeName,
                                          queryParameters: {
                                            'fromIcon': serializeParam(
                                              'page5',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: 'ทำรายการใหม่',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 60.0,
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
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFD9761A),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Color(0xFFFCEFE4),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (FFAppState()
                                                        .insuranceInfoApplicationType ==
                                                    'auto'
                                                ? (((FFAppState()
                                                                .page5QuotationStatus ==
                                                            'อนุมัติ') &&
                                                        functions.checkDatePage5(
                                                            FFAppState()
                                                                .page5CompletedDate,
                                                            FFAppState()
                                                                .page5DateNow)!) ||
                                                    (FFAppState()
                                                            .page5QuotationStatus ==
                                                        'อยู่ระหว่างตรวจสอบสภาพรถ'))
                                                : false)
                                              Expanded(
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      InsuranceInfoPage5CancelWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'quotationId':
                                                            serializeParam(
                                                          widget!.quotationId,
                                                          ParamType.String,
                                                        ),
                                                        'leadDtlId':
                                                            serializeParam(
                                                          widget!.leadDtlId,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: 'ยกเลิก',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.42,
                                                    height: 60.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansThai(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF204A77),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Color(0xFF204A77),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                      if ((FFAppState().page5QuotationStatus ==
                                              'อนุมัติ') &&
                                          (FFAppState()
                                                  .insuranceInfoPage5CMIDocUrl !=
                                              '-'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if ((FFAppState()
                                                          .page5QuotationStatus ==
                                                      'อนุมัติ') &&
                                                  (FFAppState()
                                                          .insuranceinfoSubProductName ==
                                                      'พ.ร.บ.') &&
                                                  functions
                                                      .containsValueInDataTypeList(
                                                          columnRoleMenuRecord
                                                              ?.adminRoleGroup
                                                              ?.toList(),
                                                          FFAppState()
                                                              .employeeID,
                                                          'บันทึก พ.ร.บ.')!)
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.3,
                                                                  child:
                                                                      SaveContractCMIWidget(
                                                                    quotationID:
                                                                        FFAppState()
                                                                            .insuranceInfoQuotationId,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    text: 'บันทึก พ.ร.บ.',
                                                    icon: Icon(
                                                      Icons.save_as_sharp,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.42,
                                                      height: 60.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFFE7B71A),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFFCEFE4),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      if ((FFAppState().page5QuotationStatus ==
                                              'อยู่ระหว่างตรวจสอบสภาพรถ') &&
                                          (FFAppState()
                                                  .insuranceInfoPage5Document !=
                                              '-'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (FFAppState()
                                                                .insuranceInfoPage5Document !=
                                                            '-') {
                                                          if (!isAndroid) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          CustomDialogComponentCopyWidget(
                                                                        linkUrl:
                                                                            FFAppState().insuranceInfoPage5Document,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            return;
                                                          }
                                                          await actions
                                                              .urlLauncherAction(
                                                            FFAppState()
                                                                .insuranceInfoPage5Document,
                                                            'android',
                                                          );
                                                          return;
                                                        }
                                                        await launchURL(FFAppState()
                                                            .insuranceInfoPage5Document);
                                                      },
                                                      text: 'ดูความคุ้มครอง',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
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
                                                            Color(0xFFF39C96),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFFCEFE4),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await Clipboard.setData(
                                                          ClipboardData(
                                                              text: FFAppState()
                                                                  .insuranceInfoPage5Document));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'คัดลอดลิ้งค์กรมธรรม์เรียบร้อย',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              Color(0xCB101213),
                                                        ),
                                                      );
                                                    },
                                                    text: 'คัดลอกความคุ้มครอง',
                                                    icon: Icon(
                                                      Icons.content_copy,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 60.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary400,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      if ((FFAppState().page5QuotationStatus ==
                                              'อนุมัติ') &&
                                          (FFAppState()
                                                  .insuranceInfoPage5Document !=
                                              '-'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        _model.getFileVmi =
                                                            await GetFileVmiApiCall
                                                                .call(
                                                          apiUrl: FFAppState()
                                                              .apiUrlInsuranceAppState,
                                                          token: FFAppState()
                                                              .accessToken,
                                                          quotationId: FFAppState()
                                                              .insuranceInfoQuotationId,
                                                          ownerId: FFAppState()
                                                              .employeeID,
                                                        );

                                                        _shouldSetState = true;
                                                        if ((_model.getFileVmi
                                                                    ?.statusCode ??
                                                                200) !=
                                                            200) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'พบข้อผิดพลาดConnection (${(_model.getFileVmi?.statusCode ?? 200).toString()})'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
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
                                                        if (GetFileVmiApiCall
                                                                .statusLayer1(
                                                              (_model.getFileVmi
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            200) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      GetFileVmiApiCall
                                                                          .messageLayer1(
                                                                    (_model.getFileVmi
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
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
                                                        FFAppState()
                                                                .insuranceInfoPage5Document =
                                                            '${GetFileVmiApiCall.vmiDocumentUrl(
                                                          (_model.getFileVmi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}';
                                                        safeSetState(() {});
                                                        if ((FFAppState()
                                                                    .insuranceInfoCompayId ==
                                                                'TNI') &&
                                                            (FFAppState()
                                                                    .insuranceInfocoverType ==
                                                                'ชั้น 1') &&
                                                            (FFAppState()
                                                                    .insuranceInfoQuotationType ==
                                                                'auto')) {
                                                          if (!isAndroid) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          CustomDialogComponentCopyWidget(
                                                                        linkUrl:
                                                                            FFAppState().insuranceInfoPage5Document,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                          await actions
                                                              .urlLauncherAction(
                                                            FFAppState()
                                                                .insuranceInfoPage5Document,
                                                            'android',
                                                          );
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                        await launchURL(FFAppState()
                                                            .insuranceInfoPage5Document);
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                      },
                                                      text: 'ดูกรมธรรม์',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
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
                                                            Color(0xFFD9761A),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansThai(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFFCEFE4),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.getFileVmiCopyButton =
                                                          await GetFileVmiApiCall
                                                              .call(
                                                        apiUrl: FFAppState()
                                                            .apiUrlInsuranceAppState,
                                                        token: FFAppState()
                                                            .accessToken,
                                                        quotationId: FFAppState()
                                                            .insuranceInfoQuotationId,
                                                        ownerId: FFAppState()
                                                            .employeeID,
                                                      );

                                                      _shouldSetState = true;
                                                      if ((_model.getFileVmiCopyButton
                                                                  ?.statusCode ??
                                                              200) !=
                                                          200) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'พบข้อผิดพลาดConnection (${(_model.getFileVmiCopyButton?.statusCode ?? 200).toString()})'),
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
                                                      if (GetFileVmiApiCall
                                                              .statusLayer1(
                                                            (_model.getFileVmiCopyButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          200) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    GetFileVmiApiCall
                                                                        .messageLayer1(
                                                                  (_model.getFileVmiCopyButton
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!),
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
                                                      FFAppState()
                                                              .insuranceInfoPage5Document =
                                                          GetFileVmiApiCall
                                                              .vmiDocumentUrl(
                                                        (_model.getFileVmiCopyButton
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      safeSetState(() {});
                                                      await Clipboard.setData(
                                                          ClipboardData(
                                                              text: FFAppState()
                                                                  .insuranceInfoPage5Document));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'คัดลอดลิ้งค์กรมธรรม์เรียบร้อย',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              Color(0xCB101213),
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                    text:
                                                        'คัดลอกลิ้งค์กรมธรรม์',
                                                    icon: Icon(
                                                      Icons.content_copy,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 60.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary400,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      if ((FFAppState().page5QuotationStatus ==
                                              'อนุมัติ') &&
                                          (FFAppState()
                                                  .insuranceInfoPage5CMIDocUrl !=
                                              '-'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.cmiAPIOutput =
                                                          await GetFileCmiApiCall
                                                              .call(
                                                        apiUrl: FFAppState()
                                                            .apiUrlInsuranceAppState,
                                                        token: FFAppState()
                                                            .accessToken,
                                                        quotationId:
                                                            widget!.quotationId,
                                                        ownerId: FFAppState()
                                                            .employeeID,
                                                      );

                                                      _shouldSetState = true;
                                                      if ((_model.cmiAPIOutput
                                                                  ?.statusCode ??
                                                              200) !=
                                                          200) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'พบข้อผิดพลาด (${(_model.cmiAPIOutput?.statusCode ?? 200).toString()})'),
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
                                                      if (GetFileCmiApiCall
                                                              .statusLayer1(
                                                            (_model.cmiAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          200) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    '${GetFileCmiApiCall.messageLayer1(
                                                                  (_model.cmiAPIOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )}'),
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
                                                      FFAppState()
                                                              .insuranceInfoPage5CMIDocUrl =
                                                          GetFileCmiApiCall
                                                              .cMIdocumentUrl(
                                                        (_model.cmiAPIOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      safeSetState(() {});
                                                      await launchURL(FFAppState()
                                                          .insuranceInfoPage5CMIDocUrl);
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                    text: 'ดู พ.ร.บ',
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
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
                                                      color: Color(0xFF5D78FF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFFCEFE4),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.cmiAPIOutputCopyButton =
                                                          await GetFileCmiApiCall
                                                              .call(
                                                        apiUrl: FFAppState()
                                                            .apiUrlInsuranceAppState,
                                                        token: FFAppState()
                                                            .accessToken,
                                                        quotationId:
                                                            widget!.quotationId,
                                                        ownerId: FFAppState()
                                                            .employeeID,
                                                      );

                                                      _shouldSetState = true;
                                                      if ((_model.cmiAPIOutputCopyButton
                                                                  ?.statusCode ??
                                                              200) !=
                                                          200) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'พบข้อผิดพลาด (${(_model.cmiAPIOutputCopyButton?.statusCode ?? 200).toString()})'),
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
                                                      if (GetFileCmiApiCall
                                                              .statusLayer1(
                                                            (_model.cmiAPIOutputCopyButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          200) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    '${GetFileCmiApiCall.statusLayer1(
                                                                  (_model.cmiAPIOutputCopyButton
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toString()}'),
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
                                                      FFAppState()
                                                              .insuranceInfoPage5CMIDocUrl =
                                                          GetFileCmiApiCall
                                                              .cMIdocumentUrl(
                                                        (_model.cmiAPIOutputCopyButton
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      safeSetState(() {});
                                                      await Clipboard.setData(
                                                          ClipboardData(
                                                              text: GetFileCmiApiCall
                                                                  .cMIdocumentUrl(
                                                        (_model.cmiAPIOutputCopyButton
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'คัดลอดลิ้งค์ พ.ร.บ เรียบร้อย',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                    text: 'คัดลอกลิ้งค์ พ.ร.บ',
                                                    icon: Icon(
                                                      Icons.content_copy,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 60.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary400,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 100.0)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
