import '/backend/api_requests/api_calls.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_info_page5_model.dart';
export 'insurance_info_page5_model.dart';

class InsuranceInfoPage5Widget extends StatefulWidget {
  const InsuranceInfoPage5Widget({
    Key? key,
    required this.quotationId,
    required this.leadDtlId,
  }) : super(key: key);

  final String? quotationId;
  final int? leadDtlId;

  @override
  _InsuranceInfoPage5WidgetState createState() =>
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
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Container(
                height: double.infinity,
                child: LoadingSceneWidget(),
              ),
            ),
          ));
        },
      ).then((value) => safeSetState(() {}));

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
            ));
          },
        );
        Navigator.pop(context);
        return;
      }
      setState(() {
        FFAppState().page5DateNow = GetDateTimeAPICall.currentDateYMD(
          (_model.getDateTimeOutput?.jsonBody ?? ''),
        ).toString().toString();
      });
      _model.getInsurer = await InsuranceRequestGetInsurerAPICall.call(
        apiUrl: FFAppState().apiUrlInsuranceAppState,
      );
      if ((_model.getInsurer?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text((_model.getInsurer?.statusCode ?? 200).toString()),
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
        FFAppState().insuranceInfoImgUrlInsurerList =
            (InsuranceRequestGetInsurerAPICall.insurerLogo(
          (_model.getInsurer?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList()
                .cast<String>();
        FFAppState().insuranceInfoCompanyIdList =
            (InsuranceRequestGetInsurerAPICall.companyShortName(
          (_model.getInsurer?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList()
                .cast<String>();
      });
      _model.applicationDetailOutput = await IbsApplicationsDetailCall.call(
        quotationId: widget.quotationId,
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
            ));
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
              content:
                  Text('พบข้อผิดพลาด (${IbsApplicationsDetailCall.statuslayer1(
                (_model.applicationDetailOutput?.jsonBody ?? ''),
              ).toString().toString()})'),
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
      setState(() {
        FFAppState().insuranceInfoFirstName =
            IbsApplicationsDetailCall.firstnameth(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoLastName =
            IbsApplicationsDetailCall.lastnameth(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoPhonenumber =
            IbsApplicationsDetailCall.phonenumber(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoGarageType =
            (IbsApplicationsDetailCall.garagetypename(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()[functions.getIndexOfIntList(
                functions
                    .convertDynamicListToIntList(getJsonField(
                      (_model.applicationDetailOutput?.jsonBody ?? ''),
                      r'''$.results.data.leads_detail[:].lead_dtl_id''',
                      true,
                    ))
                    .toList(),
                widget.leadDtlId)];
        FFAppState().insuranceInfocoverType =
            (IbsApplicationsDetailCall.covertypename(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()[functions.getIndexOfIntList(
                functions
                    .convertDynamicListToIntList(getJsonField(
                      (_model.applicationDetailOutput?.jsonBody ?? ''),
                      r'''$.results.data.leads_detail[:].lead_dtl_id''',
                      true,
                    ))
                    .toList(),
                widget.leadDtlId)];
        FFAppState().insuranceInfoGrossTotal =
            IbsApplicationsDetailCall.grosstotalnet(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoApplicationType =
            IbsApplicationsDetailCall.quotationtype(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().nonePackageWorkType = IbsApplicationsDetailCall.workType(
                  (_model.applicationDetailOutput?.jsonBody ?? ''),
                ).toString() ==
                ''
            ? ''
            : IbsApplicationsDetailCall.workType(
                (_model.applicationDetailOutput?.jsonBody ?? ''),
              ).toString();
        FFAppState().insuranceInfoQuotationId =
            IbsApplicationsDetailCall.quotationId(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ).toString().toString();
        FFAppState().insuranceInfoCompayId =
            (IbsApplicationsDetailCall.insurershortname(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()[functions.getIndexOfIntList(
                functions
                    .convertDynamicListToIntList(getJsonField(
                      (_model.applicationDetailOutput?.jsonBody ?? ''),
                      r'''$.results.data.leads_detail[:].lead_dtl_id''',
                      true,
                    ))
                    .toList(),
                widget.leadDtlId)];
        FFAppState().insuranceInfoActFlag = IbsApplicationsDetailCall.actflg(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceinfoApplicationNo =
            IbsApplicationsDetailCall.applicationNo(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoInsuranceLogo =
            (IbsApplicationsDetailCall.insurerlogo(
          (_model.applicationDetailOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()[functions.getIndexOfIntList(
                    functions
                        .convertDynamicListToIntList(getJsonField(
                          (_model.applicationDetailOutput?.jsonBody ?? ''),
                          r'''$.results.data.leads_detail[:].lead_dtl_id''',
                          true,
                        ))
                        .toList(),
                    widget.leadDtlId)]
                .toString();
      });
      _model.getPolicy = await GetInsurancePolicyApiCall.call(
        apiUrl: FFAppState().apiUrlInsuranceAppState,
        token: FFAppState().accessToken,
        quotationId: widget.quotationId,
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
            ));
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
              content:
                  Text('พบข้อผิดพลาด (${GetInsurancePolicyApiCall.statuslayer1(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString().toString()})'),
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
      setState(() {
        FFAppState().page5QuotationStatus = valueOrDefault<String>(
          GetInsurancePolicyApiCall.quotationStatus(
            (_model.getPolicy?.jsonBody ?? ''),
          ).toString(),
          'สถานะ',
        );
        FFAppState().page5CreatedDate = GetInsurancePolicyApiCall.createDate(
                  (_model.getPolicy?.jsonBody ?? ''),
                ).toString() !=
                ''
            ? functions
                .convertToBDYearAndTime(GetInsurancePolicyApiCall.createDate(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString())!
            : '-';
        FFAppState().page5CompletedDate =
            GetInsurancePolicyApiCall.completeDate(
                      (_model.getPolicy?.jsonBody ?? ''),
                    ).toString() !=
                    ''
                ? functions.convertToBDYearAndTime(
                    GetInsurancePolicyApiCall.completeDate(
                    (_model.getPolicy?.jsonBody ?? ''),
                  ).toString())!
                : '-';
        FFAppState().page5ContractId = GetInsurancePolicyApiCall.contractId(
                  (_model.getPolicy?.jsonBody ?? ''),
                ).toString() !=
                ''
            ? GetInsurancePolicyApiCall.contractId(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString()
            : '-';
        FFAppState().page5VmiPolicyNo = GetInsurancePolicyApiCall.policyNumber(
                  (_model.getPolicy?.jsonBody ?? ''),
                ).toString() !=
                ''
            ? GetInsurancePolicyApiCall.policyNumber(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString()
            : '-';
        FFAppState().page5Reason = () {
          if (GetInsurancePolicyApiCall.vmiMessage(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString() !=
              '') {
            return GetInsurancePolicyApiCall.vmiMessage(
              (_model.getPolicy?.jsonBody ?? ''),
            ).toString();
          } else if (GetInsurancePolicyApiCall.cmiMessage(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString() !=
              '') {
            return GetInsurancePolicyApiCall.cmiMessage(
              (_model.getPolicy?.jsonBody ?? ''),
            ).toString();
          } else {
            return '-';
          }
        }();
        FFAppState().page5PaymentStatus =
            GetInsurancePolicyApiCall.paymenttatus(
                      (_model.getPolicy?.jsonBody ?? ''),
                    ).toString() !=
                    ''
                ? GetInsurancePolicyApiCall.paymenttatus(
                    (_model.getPolicy?.jsonBody ?? ''),
                  ).toString()
                : '-';
        FFAppState().page5PaymentType = GetInsurancePolicyApiCall.paymentype(
                  (_model.getPolicy?.jsonBody ?? ''),
                ).toString() !=
                ''
            ? GetInsurancePolicyApiCall.paymentype(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString()
            : '-';
        FFAppState().page5PaymentChannel =
            GetInsurancePolicyApiCall.paymentChannel(
                      (_model.getPolicy?.jsonBody ?? ''),
                    ).toString() !=
                    ''
                ? GetInsurancePolicyApiCall.paymentChannel(
                    (_model.getPolicy?.jsonBody ?? ''),
                  ).toString()
                : '-';
        FFAppState().page5NetPremium =
            GetInsurancePolicyApiCall.netPremiumTotal(
                      (_model.getPolicy?.jsonBody ?? ''),
                    ).toString() !=
                    ''
                ? GetInsurancePolicyApiCall.netPremiumTotal(
                    (_model.getPolicy?.jsonBody ?? ''),
                  ).toString()
                : '-';
        FFAppState().page5ActPrice = GetInsurancePolicyApiCall.actTotal(
                  (_model.getPolicy?.jsonBody ?? ''),
                ).toString() !=
                ''
            ? GetInsurancePolicyApiCall.actTotal(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString()
            : '-';
        FFAppState().page5GrossTotalNet =
            GetInsurancePolicyApiCall.grossTotalNet(
                      (_model.getPolicy?.jsonBody ?? ''),
                    ).toString() !=
                    ''
                ? GetInsurancePolicyApiCall.grossTotalNet(
                    (_model.getPolicy?.jsonBody ?? ''),
                  ).toString()
                : '-';
        FFAppState().page5FirstDue =
            GetInsurancePolicyApiCall.installmentFirstDue(
                      (_model.getPolicy?.jsonBody ?? ''),
                    ).toString() !=
                    ''
                ? GetInsurancePolicyApiCall.installmentFirstDue(
                    (_model.getPolicy?.jsonBody ?? ''),
                  ).toString()
                : '-';
        FFAppState().page5LastDue =
            GetInsurancePolicyApiCall.installmentLastDue(
                      (_model.getPolicy?.jsonBody ?? ''),
                    ).toString() !=
                    ''
                ? GetInsurancePolicyApiCall.installmentLastDue(
                    (_model.getPolicy?.jsonBody ?? ''),
                  ).toString()
                : '-';
        FFAppState().page5VloneContNo = GetInsurancePolicyApiCall.vloneContNo(
                  (_model.getPolicy?.jsonBody ?? ''),
                ).toString() !=
                ''
            ? GetInsurancePolicyApiCall.vloneContNo(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString()
            : '-';
        FFAppState().page5CusIdCardNo = GetInsurancePolicyApiCall.vloanCuscod(
                  (_model.getPolicy?.jsonBody ?? ''),
                ).toString() !=
                ''
            ? GetInsurancePolicyApiCall.vloanCuscod(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString()
            : '-';
        FFAppState().page5Tenor = GetInsurancePolicyApiCall.tenor(
                  (_model.getPolicy?.jsonBody ?? ''),
                ).toString() !=
                ''
            ? GetInsurancePolicyApiCall.tenor(
                (_model.getPolicy?.jsonBody ?? ''),
              ).toString()
            : '-';
        FFAppState().insuranceInfoPage5Document =
            GetInsurancePolicyApiCall.vmiDocumentUrl(
                      (_model.getPolicy?.jsonBody ?? ''),
                    ).toString() !=
                    ''
                ? GetInsurancePolicyApiCall.vmiDocumentUrl(
                    (_model.getPolicy?.jsonBody ?? ''),
                  ).toString()
                : '-';
        FFAppState().insuranceInfoPage5CMIDocUrl =
            GetInsurancePolicyApiCall.cMIdocumentUrl(
                      (_model.getPolicy?.jsonBody ?? ''),
                    ) !=
                    ''
                ? GetInsurancePolicyApiCall.cMIdocumentUrl(
                    (_model.getPolicy?.jsonBody ?? ''),
                  ).toString().toString()
                : '-';
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
            leading: Visibility(
              visible: false,
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
            title: Text(
              '5.ส่งเรื่องให้บริษัทประกันพิจารณา',
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 15.0, 15.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.65,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.2,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      'ใบเสนอราคา',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      ':',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      FFAppState()
                                                          .insuranceInfoQuotationId,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.2,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      'App No.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      ':',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      FFAppState()
                                                          .insuranceinfoApplicationNo,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.2,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      'ชื่อลูกค้า',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      ':',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      '${FFAppState().insuranceInfoFirstName}  ${FFAppState().insuranceInfoLastName}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.2,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      'เบอร์โทร',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      ':',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      FFAppState()
                                                          .insuranceInfoPhonenumber,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.2,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      'การซ่อม',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      ':',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      FFAppState()
                                                          .insuranceInfoGarageType,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.2,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      'ประกัน',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      ':',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      FFAppState()
                                                          .insuranceInfocoverType,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.2,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      'ราคาเบี้ย',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      ':',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      FFAppState().insuranceInfoApplicationType ==
                                                              'auto'
                                                          ? '${functions.showNumberWithComma(FFAppState().insuranceInfoGrossTotal)} บาท'
                                                          : '${functions.showNumberWithComma(FFAppState().page5NetPremium)} บาท',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.2,
                                                      decoration: BoxDecoration(
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
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 15.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 10.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        ':',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        '${valueOrDefault<String>(
                                                          functions
                                                              .showNumberWithComma(
                                                                  FFAppState()
                                                                      .page5ActPrice),
                                                          '-',
                                                        )} บาท',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.2,
                                                      decoration: BoxDecoration(
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
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 15.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 10.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        ':',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Text(
                                                        '${valueOrDefault<String>(
                                                          functions
                                                              .showNumberWithComma(
                                                                  FFAppState()
                                                                      .page5GrossTotalNet),
                                                          '-',
                                                        )} บาท',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.2,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      'ประเภทงาน',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Text(
                                                      ':',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
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
                                                              ? 'งานในเรท'
                                                              : 'งานนอกเรท',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      if (FFAppState()
                                                              .nonePackageWorkType !=
                                                          '')
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            '(${FFAppState().nonePackageWorkType})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                            alignment: AlignmentDirectional(
                                                1.00, 0.00),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  height: 75.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        functions.stringToImgPath(
                                                            FFAppState().insuranceInfoInsuranceLogo !=
                                                                    ''
                                                                ? FFAppState()
                                                                    .insuranceInfoInsuranceLogo
                                                                : 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37'),
                                                        'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                      ),
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
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
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Container(
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
                                            color: Color(0xFFFAFAFA),
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          '1',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFFAFAFA),
                                                fontSize: 15.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9761A),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFB3B3B3),
                                        ),
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        '2',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFFAFAFA),
                                              fontSize: 15.0,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9761A),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFB3B3B3),
                                        ),
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        '3',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFFAFAFA),
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9761A),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFB3B3B3),
                                        ),
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        '4',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFFAFAFA),
                                              fontSize: 15.0,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.11,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9761A),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0xFFB3B3B3),
                                        ),
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Text(
                                        '5',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFF1F4F8),
                                              fontSize: 15.0,
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
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
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
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFAppState().page5QuotationStatus,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
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
                                                      return Color(0xFFDB771A);
                                                    }
                                                  }(),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              var _shouldSetState = false;
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                      child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ));
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              _model.getDateTimeOutput2 =
                                                  await GetDateTimeAPICall.call(
                                                apiUrl: FFAppState()
                                                    .apiURLLocalState,
                                                token: FFAppState().accessToken,
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
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    ));
                                                  },
                                                );
                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              setState(() {
                                                FFAppState().page5DateNow =
                                                    GetDateTimeAPICall
                                                        .currentDateYMD(
                                                  (_model.getDateTimeOutput2
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                              });
                                              _model.getPolicyRefreshButton =
                                                  await GetInsurancePolicyApiCall
                                                      .call(
                                                apiUrl: FFAppState()
                                                    .apiUrlInsuranceAppState,
                                                token: FFAppState().accessToken,
                                                quotationId: widget.quotationId,
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
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              setState(() {
                                                FFAppState()
                                                        .page5QuotationStatus =
                                                    GetInsurancePolicyApiCall
                                                        .quotationStatus(
                                                  (_model.getPolicyRefreshButton
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState().page5CreatedDate =
                                                    GetInsurancePolicyApiCall
                                                                .createDate(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? functions
                                                            .convertToBDYearAndTime(
                                                                GetInsurancePolicyApiCall
                                                                    .createDate(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString())!
                                                        : '-';
                                                FFAppState()
                                                        .page5CompletedDate =
                                                    GetInsurancePolicyApiCall
                                                                .completeDate(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? functions
                                                            .convertToBDYearAndTime(
                                                                GetInsurancePolicyApiCall
                                                                    .completeDate(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString())!
                                                        : '-';
                                                FFAppState().page5ContractId =
                                                    GetInsurancePolicyApiCall
                                                                .contractId(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .contractId(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState().page5VmiPolicyNo =
                                                    GetInsurancePolicyApiCall
                                                                .policyNumber(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .policyNumber(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState()
                                                    .page5Reason = GetInsurancePolicyApiCall
                                                            .quotationStatus(
                                                          (_model.getPolicyRefreshButton
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString() ==
                                                        'ยกเลิก'
                                                    ? (GetInsurancePolicyApiCall
                                                                .cancelReason(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .cancelReason(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-')
                                                    : (GetInsurancePolicyApiCall
                                                                .vmiMessage(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .vmiMessage(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-');
                                                FFAppState()
                                                        .page5PaymentStatus =
                                                    GetInsurancePolicyApiCall
                                                                .paymenttatus(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .paymenttatus(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState().page5PaymentType =
                                                    GetInsurancePolicyApiCall
                                                                .paymentype(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .paymentype(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState()
                                                        .page5PaymentChannel =
                                                    GetInsurancePolicyApiCall
                                                                .paymentChannel(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .paymentChannel(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState().page5NetPremium =
                                                    GetInsurancePolicyApiCall
                                                                .netPremiumTotal(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .netPremiumTotal(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState().page5ActPrice =
                                                    GetInsurancePolicyApiCall
                                                                .actTotal(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .actTotal(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState()
                                                        .page5GrossTotalNet =
                                                    GetInsurancePolicyApiCall
                                                                .grossTotalNet(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .grossTotalNet(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState().page5FirstDue =
                                                    GetInsurancePolicyApiCall
                                                                .installmentFirstDue(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .installmentFirstDue(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState().page5LastDue =
                                                    GetInsurancePolicyApiCall
                                                                .installmentLastDue(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .installmentLastDue(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState().page5VloneContNo =
                                                    GetInsurancePolicyApiCall
                                                                .vloneContNo(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .vloneContNo(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState().page5CusIdCardNo =
                                                    GetInsurancePolicyApiCall
                                                                .vloanCuscod(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .vloanCuscod(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState().page5Tenor =
                                                    GetInsurancePolicyApiCall
                                                                .tenor(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .tenor(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState()
                                                        .insuranceInfoPage5Document =
                                                    GetInsurancePolicyApiCall
                                                                .vmiDocumentUrl(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .vmiDocumentUrl(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                                FFAppState()
                                                        .insuranceInfoPage5CMIDocUrl =
                                                    GetInsurancePolicyApiCall
                                                                .cMIdocumentUrl(
                                                              (_model.getPolicyRefreshButton
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            ''
                                                        ? GetInsurancePolicyApiCall
                                                            .cMIdocumentUrl(
                                                            (_model.getPolicyRefreshButton
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString()
                                                        : '-';
                                              });
                                              Navigator.pop(context);
                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                            child: Icon(
                                              Icons.refresh,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
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
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Color(0xFFB3B3B3),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFAppState().page5CreatedDate,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
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
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
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
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Color(0xFFB3B3B3),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFAppState().page5CompletedDate,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFAppState().page5ContractId,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 45.0,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFAppState().page5VmiPolicyNo,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
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
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Color(0xFFB3B3B3),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        FFAppState().page5Reason,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFAppState().page5PaymentStatus,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFAppState().page5PaymentType,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFAppState().page5PaymentChannel,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                                          'ราคาเบี้ย',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    FFAppState()
                                                        .page5NetPremium),
                                                '-',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                                          'ราคา พ.ร.บ. (ถ้ามี)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    FFAppState().page5ActPrice),
                                                '-',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    FFAppState()
                                                        .page5GrossTotalNet),
                                                '-',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                        if ((FFAppState().page5QuotationStatus == 'อนุมัติ') &&
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
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
                                                FFAppState().page5Tenor,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                        if ((FFAppState().page5QuotationStatus == 'อนุมัติ') &&
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    FFAppState().page5FirstDue),
                                                '-',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                        if ((FFAppState().page5QuotationStatus == 'อนุมัติ') &&
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions.showNumberWithComma(
                                                    FFAppState().page5LastDue),
                                                '-',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
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
                        if ((FFAppState().page5QuotationStatus == 'อนุมัติ') &&
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                                0.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 15.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'รหัสสัญญา',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        15.0,
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
                                                                  .bodyMedium,
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
                                                                  .page5VloneContNo,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        15.0,
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
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'รหัสลูกค้า',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        15.0,
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
                                                                  .bodyMedium,
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
                                                                  .page5CusIdCardNo,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        15.0,
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
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'จำนวนงวด',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        15.0,
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
                                                                  .bodyMedium,
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
                                                                  .page5Tenor,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        15.0,
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
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'ผ่อนงวดละ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        15.0,
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
                                                                  .bodyMedium,
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
                                                                functions.showNumberWithComma(
                                                                    FFAppState()
                                                                        .page5FirstDue),
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        15.0,
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
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'ผ่อนงวดสุดท้าย',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    fontSize:
                                                                        15.0,
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
                                                                  .bodyMedium,
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
                                                                functions.showNumberWithComma(
                                                                    FFAppState()
                                                                        .page5LastDue),
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
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
                        if ((GetInsurancePolicyApiCall.quotationStatus(
                                  (_model.getPolicy?.jsonBody ?? ''),
                                ).toString() ==
                                'ไม่อนุมัติ') ||
                            (GetInsurancePolicyApiCall.quotationStatus(
                                  (_model.getPolicy?.jsonBody ?? ''),
                                ).toString() ==
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
                                    context.goNamed('SearchInsurancePage');
                                  },
                                  text: 'ทำรายการใหม่',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFFCEFE4),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFD9761A),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Color(0xFFFCEFE4),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
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
                                                  'insuranceInfoPage5Cancel',
                                                  queryParameters: {
                                                    'quotationId':
                                                        serializeParam(
                                                      widget.quotationId,
                                                      ParamType.String,
                                                    ),
                                                    'leadDtlId': serializeParam(
                                                      widget.leadDtlId,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: 'ยกเลิก',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.42,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF204A77),
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                  if ((FFAppState().page5QuotationStatus ==
                                          'อนุมัติ') &&
                                      (FFAppState()
                                              .insuranceInfoPage5Document !=
                                          '-'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                  await launchURL(FFAppState()
                                                      .insuranceInfoPage5Document);
                                                },
                                                text: 'ดูกรมธรรม์',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFD9761A),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFCEFE4),
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
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text: FFAppState()
                                                              .insuranceInfoPage5Document));
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'คัดลอดลิ้งค์กรมธรรม์เรียบร้อย',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 3000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                },
                                                text: 'คัดลอกลิ้งค์กรมธรรม์',
                                                icon: Icon(
                                                  Icons.content_copy,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary400,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                  await launchURL(FFAppState()
                                                      .insuranceInfoPage5CMIDocUrl);
                                                },
                                                text: 'ดู พ.ร.บ',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF5D78FF),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFCEFE4),
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
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text: FFAppState()
                                                              .insuranceInfoPage5CMIDocUrl));
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
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
                                                          milliseconds: 3000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                },
                                                text: 'คัดลอกลิ้งค์ พ.ร.บ',
                                                icon: Icon(
                                                  Icons.content_copy,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary400,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
