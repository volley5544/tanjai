import '/backend/api_requests/api_calls.dart';
import '/components/effective_date_picker_component_widget.dart';
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
import 'insurance_info_page42_model.dart';
export 'insurance_info_page42_model.dart';

class InsuranceInfoPage42Widget extends StatefulWidget {
  const InsuranceInfoPage42Widget({
    Key? key,
    this.quotationId,
    this.leadDetailId,
  }) : super(key: key);

  final String? quotationId;
  final int? leadDetailId;

  @override
  _InsuranceInfoPage42WidgetState createState() =>
      _InsuranceInfoPage42WidgetState();
}

class _InsuranceInfoPage42WidgetState extends State<InsuranceInfoPage42Widget>
    with TickerProviderStateMixin {
  late InsuranceInfoPage42Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceInfoPage42Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insuranceInfoPage4_2'});
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

      setState(() {
        FFAppState().insuranceInfoPage4SelectTenor = '';
        FFAppState().insuranceInfoPage4SelectInstallMentFirstDue = '';
        FFAppState().insuranceInfoPage4SelectInstallMentLastDue = '';
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
              content: Text(
                  'พบข้อผิดพลาด (${(_model.getInsurer?.statusCode ?? 200).toString()})'),
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
      if (InsuranceRequestGetInsurerAPICall.statusLayer1(
            (_model.getInsurer?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(InsuranceRequestGetInsurerAPICall.messageLayer1(
                (_model.getInsurer?.jsonBody ?? ''),
              ).toString()),
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
      _model.ibsDetailAPIOutput = await IbsApplicationsDetailCall.call(
        quotationId: (widget.quotationId != null && widget.quotationId != '') &&
                (widget.quotationId != '')
            ? widget.quotationId
            : FFAppState().insuranceInfoQuotationId,
        insuranceUrl: FFAppState().apiUrlInsuranceAppState,
        token: FFAppState().accessToken,
      );
      if ((_model.ibsDetailAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.ibsDetailAPIOutput?.statusCode ?? 200).toString()})'),
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
      if (IbsApplicationsDetailCall.statuslayer1(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content:
                  Text('พบข้อผิดพลาด (${IbsApplicationsDetailCall.statuslayer1(
                (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
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
        Navigator.pop(context);
        return;
      }
      setState(() {
        FFAppState().insuranceInfoGrossTotal =
            IbsApplicationsDetailCall.grosstotalnet(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoActAmount =
            IbsApplicationsDetailCall.acttotal(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoVehicleCode =
            IbsApplicationsDetailCall.vehiclecode(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoQuotationId =
            IbsApplicationsDetailCall.quotationId(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString().toString();
        FFAppState().insuranceInfoLeadDetailId =
            (IbsApplicationsDetailCall.leaddtlid(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()[functions.getIndexOfIntList(
                    functions
                        .convertDynamicListToIntList(getJsonField(
                          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                          r'''$.results.data.leads_detail[:].lead_dtl_id''',
                          true,
                        ))
                        .toList(),
                    widget.leadDetailId)]
                .toString();
        FFAppState().insuranceInfoFirstName =
            IbsApplicationsDetailCall.firstnameth(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoLastName =
            IbsApplicationsDetailCall.lastnameth(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoPhonenumber =
            IbsApplicationsDetailCall.phonenumber(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().nonePackageWorkType = IbsApplicationsDetailCall.workType(
                  (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                ).toString() ==
                ''
            ? ''
            : IbsApplicationsDetailCall.workType(
                (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
              ).toString();
        FFAppState().insuranceInfocoverType =
            (IbsApplicationsDetailCall.covertypename(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()[functions.getIndexOfIntList(
                functions
                    .convertDynamicListToIntList(getJsonField(
                      (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                      r'''$.results.data.leads_detail[:].lead_dtl_id''',
                      true,
                    ))
                    .toList(),
                widget.leadDetailId)];
        FFAppState().insuranceInfoGarageType =
            (IbsApplicationsDetailCall.garagetypename(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()[functions.getIndexOfIntList(
                functions
                    .convertDynamicListToIntList(getJsonField(
                      (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                      r'''$.results.data.leads_detail[:].lead_dtl_id''',
                      true,
                    ))
                    .toList(),
                widget.leadDetailId)];
        FFAppState().insuranceInfoApplicationType =
            IbsApplicationsDetailCall.quotationtype(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoCompayId =
            (IbsApplicationsDetailCall.insurershortname(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()[functions.getIndexOfIntList(
                functions
                    .convertDynamicListToIntList(getJsonField(
                      (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                      r'''$.results.data.leads_detail[:].lead_dtl_id''',
                      true,
                    ))
                    .toList(),
                widget.leadDetailId)];
        FFAppState().insuranceInfoActFlag = IbsApplicationsDetailCall.actflg(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoInsuranceLogo =
            (IbsApplicationsDetailCall.insurerlogo(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()[functions.getIndexOfIntList(
                    functions
                        .convertDynamicListToIntList(getJsonField(
                          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                          r'''$.results.data.leads_detail[:].lead_dtl_id''',
                          true,
                        ))
                        .toList(),
                    widget.leadDetailId)]
                .toString();
        FFAppState().insuranceInfoEffectiveDateAct =
            IbsApplicationsDetailCall.effectiveDateAct(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoEffectiveDateInsure =
            IbsApplicationsDetailCall.effectiveDateInsure(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
      });
      if (IbsApplicationsDetailCall.quotationstatus(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ).toString() ==
          'เตรียมข้อมูล') {
        setState(() {
          FFAppState().insuranceInfo4pageStatus =
              IbsApplicationsDetailCall.quotationstatus(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ).toString();
        });
        Navigator.pop(context);
        return;
      }
      setState(() {
        FFAppState().insuranceInfoPage4PaymentType =
            IbsApplicationsDetailCall.paymenttype(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoPage4PaymentChannel =
            IbsApplicationsDetailCall.paymentchannel(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfo4pagePaymentStatus =
            IbsApplicationsDetailCall.paymentstatus(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoGrossTotal =
            IbsApplicationsDetailCall.grosstotalnet(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoActAmount =
            IbsApplicationsDetailCall.acttotal(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoVehicleCode =
            IbsApplicationsDetailCall.vehiclecode(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoQuotationId =
            IbsApplicationsDetailCall.quotationId(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString().toString();
        FFAppState().insuranceInfoPage4SelectTenor =
            IbsApplicationsDetailCall.tenor(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfo4pageStatus =
            IbsApplicationsDetailCall.quotationstatus(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoPage4SelectInstallMentFirstDue =
            IbsApplicationsDetailCall.installmentfirstdue(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoPage4SelectInstallMentLastDue =
            IbsApplicationsDetailCall.installmentlastdue(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoPage4FirstPay =
            IbsApplicationsDetailCall.firstPayAmount(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoFirstName =
            IbsApplicationsDetailCall.firstnameth(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoLastName =
            IbsApplicationsDetailCall.lastnameth(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
        FFAppState().insuranceInfoPage4NetPremiumTotal =
            IbsApplicationsDetailCall.netpremiumtotal(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        ).toString();
      });
      if (FFAppState().insuranceInfoPage4PaymentType == 'จ่ายเต็ม') {
        setState(() {
          _model.paymentTypeController?.text =
              FFAppState().insuranceInfoPage4PaymentType;
        });
        setState(() {
          _model.paymentChannelController?.text =
              FFAppState().insuranceInfoPage4PaymentChannel;
        });
        setState(() {
          _model.actTotalController?.text =
              functions.showNumberWithComma(IbsApplicationsDetailCall.acttotal(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ).toString())!;
        });
        setState(() {
          _model.grossNetTotalController?.text = functions
              .showNumberWithComma(IbsApplicationsDetailCall.grosstotalnet(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ).toString())!;
        });
        setState(() {
          _model.netPremiumTotalController?.text = functions
              .showNumberWithComma(IbsApplicationsDetailCall.netpremiumtotal(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ).toString())!;
        });
        Navigator.pop(context);
      } else {
        _model.calInstallmentAPIOutput = await IbsCalculateInstallmentCall.call(
          grossTotalNet: FFAppState().insuranceInfoGrossTotal,
          vehicleCode: FFAppState().insuranceInfoVehicleCode,
          actTotal: FFAppState().insuranceInfoActAmount,
          insuranceUrl: FFAppState().apiUrlInsuranceAppState,
          token: FFAppState().accessToken,
        );
        if ((_model.calInstallmentAPIOutput?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.calInstallmentAPIOutput?.statusCode ?? 200).toString()})'),
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
        if (IbsCalculateInstallmentCall.statuslayer1(
              (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
            ) !=
            200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${IbsCalculateInstallmentCall.statuslayer1(
                  (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
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
          Navigator.pop(context);
          return;
        }
        setState(() {
          FFAppState().InsuranceInfoPage4PaymentFirst =
              (IbsCalculateInstallmentCall.paymentfirst(
            (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().InsuranceInfoPage4InstallmentFirstDue =
              (IbsCalculateInstallmentCall.installmentfirstdue(
            (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().InsuranceInfoPage4InstallmentLastDue =
              (IbsCalculateInstallmentCall.installmentlastdue(
            (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().InsuranceInfoPage4Tenor =
              (IbsCalculateInstallmentCall.tenor(
            (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
        });
        setState(() {
          _model.paymentTypeController?.text =
              FFAppState().insuranceInfoPage4PaymentType;
        });
        setState(() {
          _model.paymentChannelController?.text =
              FFAppState().insuranceInfoPage4PaymentChannel;
        });
        setState(() {
          _model.netPremiumTotalController?.text = functions
              .showNumberWithComma(IbsApplicationsDetailCall.netpremiumtotal(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ).toString())!;
        });
        setState(() {
          _model.actTotalController?.text =
              functions.showNumberWithComma(IbsApplicationsDetailCall.acttotal(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ).toString())!;
        });
        setState(() {
          _model.grossNetTotalController?.text = functions
              .showNumberWithComma(IbsApplicationsDetailCall.grosstotalnet(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ).toString())!;
        });
        Navigator.pop(context);
      }
    });

    _model.paymentTypeController ??=
        TextEditingController(text: FFAppState().insuranceInfoPage4PaymentType);
    _model.paymentTypeFocusNode ??= FocusNode();

    _model.paymentChannelController ??= TextEditingController(
        text: FFAppState().insuranceInfoPage4PaymentChannel);
    _model.paymentChannelFocusNode ??= FocusNode();

    _model.netPremiumTotalController ??= TextEditingController(
        text: functions.showNumberWithComma(
            FFAppState().insuranceInfoPage4NetPremiumTotal));
    _model.netPremiumTotalFocusNode ??= FocusNode();

    _model.actTotalController ??= TextEditingController(
        text: functions
            .showNumberWithComma(FFAppState().insuranceInfoPage4ActTotal));
    _model.actTotalFocusNode ??= FocusNode();

    _model.grossNetTotalController ??= TextEditingController(
        text: functions
            .showNumberWithComma(FFAppState().insuranceInfoPage4GrossTotalNet));
    _model.grossNetTotalFocusNode ??= FocusNode();

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
              visible: FFAppState().insuranceInfo4pageStatus == 'เตรียมข้อมูล',
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
              '4. ดำเนินงาน/ชำระเงิน',
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
              child: RefreshIndicator(
                onRefresh: () async {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return WebViewAware(
                          child: GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: LoadingSceneWidget(),
                        ),
                      ));
                    },
                  ).then((value) => safeSetState(() {}));

                  if (FFAppState().insuranceInfo4pageStatus == 'เตรียมข้อมูล') {
                    return;
                  }
                  _model.ibsDetailAPIOutputCopy =
                      await IbsApplicationsDetailCall.call(
                    quotationId: (widget.quotationId != null &&
                                widget.quotationId != '') &&
                            (widget.quotationId != '')
                        ? FFAppState().insuranceInfoQuotationId
                        : FFAppState().insuranceInfoQuotationId,
                    insuranceUrl: FFAppState().apiUrlInsuranceAppState,
                    token: FFAppState().accessToken,
                  );
                  if ((_model.ibsDetailAPIOutputCopy?.statusCode ?? 200) !=
                      200) {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                            child: AlertDialog(
                          content: Text(
                              'พบข้อผิดพลาด (${(_model.ibsDetailAPIOutputCopy?.statusCode ?? 200).toString()})'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        ));
                      },
                    );
                    Navigator.pop(context);
                    return;
                  }
                  if (IbsApplicationsDetailCall.statuslayer1(
                        (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                      ) !=
                      200) {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                            child: AlertDialog(
                          content: Text(
                              'พบข้อผิดพลาด (${IbsApplicationsDetailCall.statuslayer1(
                            (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                          ).toString()})'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
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
                    FFAppState().insuranceInfoPage4PaymentType =
                        IbsApplicationsDetailCall.paymenttype(
                      (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                    ).toString();
                    FFAppState().insuranceInfoPage4PaymentChannel =
                        IbsApplicationsDetailCall.paymentchannel(
                      (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                    ).toString();
                    FFAppState().insuranceInfo4pagePaymentStatus =
                        IbsApplicationsDetailCall.paymentstatus(
                      (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                    ).toString();
                    FFAppState().insuranceInfoGrossTotal =
                        IbsApplicationsDetailCall.grosstotalnet(
                      (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                    ).toString();
                    FFAppState().insuranceInfoActAmount =
                        IbsApplicationsDetailCall.acttotal(
                      (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                    ).toString();
                    FFAppState().insuranceInfoVehicleCode =
                        IbsApplicationsDetailCall.vehiclecode(
                      (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                    ).toString();
                    FFAppState().insuranceInfo4pageStatus =
                        IbsApplicationsDetailCall.quotationstatus(
                      (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                    ).toString();
                  });
                  Navigator.pop(context);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
                        primary: false,
                        child: Column(
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
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
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
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.65,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
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
                                                              .insuranceInfoQuotationId,
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
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
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
                                                          '${FFAppState().insuranceInfoFirstName}  ${FFAppState().insuranceInfoLastName}',
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
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
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
                                                              .insuranceInfoPhonenumber,
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
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
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
                                                              .insuranceInfoGarageType,
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
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
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
                                                              .insuranceInfocoverType,
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
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 15.0,
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
                                                          FFAppState().insuranceInfoApplicationType ==
                                                                  'auto'
                                                              ? '${functions.showNumberWithComma(FFAppState().insuranceInfoPage4GrossTotalNet)} บาท'
                                                              : '${functions.showNumberWithComma(FFAppState().insuranceInfoPage4NetPremiumTotal)} บาท',
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
                                                            'ราคา พ.ร.บ',
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
                                                            '${functions.showNumberWithComma(FFAppState().insuranceInfoActAmount)} บาท',
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
                                                  if (FFAppState()
                                                          .insuranceInfoActFlag ==
                                                      '1')
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
                                                            'ราคารวม',
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
                                                            '${functions.showNumberWithComma(FFAppState().insuranceInfoGrosstotalNet)} บาท',
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
                                                          'ประเภทงาน',
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
                                                                    fontSize:
                                                                        15.0,
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      height: 75.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            functions
                                                                .stringToImgPath(
                                                                    FFAppState()
                                                                        .insuranceInfoInsuranceLogo),
                                                            'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
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
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              '1',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFFAFAFA),
                                                        fontSize: 15.0,
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
                                                  color: Color(0xFFB3B3B3),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                                  color: Color(0xFFB3B3B3),
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
                                                    .insuranceInfo4pageStatus,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                    .insuranceInfo4pagePaymentStatus,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                        ),
                                              ),
                                            ),
                                            if (FFAppState()
                                                    .insuranceInfo4pageStatus !=
                                                'เตรียมข้อมูล')
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
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                LoadingSceneWidget(),
                                                          ),
                                                        ));
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    _model.ibsDetailAPIOutputCopyRefresh =
                                                        await IbsApplicationsDetailCall
                                                            .call(
                                                      quotationId: (widget.quotationId !=
                                                                      null &&
                                                                  widget.quotationId !=
                                                                      '') &&
                                                              (widget.quotationId !=
                                                                  '')
                                                          ? widget.quotationId
                                                          : FFAppState()
                                                              .insuranceInfoQuotationId,
                                                      insuranceUrl: FFAppState()
                                                          .apiUrlInsuranceAppState,
                                                      token: FFAppState()
                                                          .accessToken,
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model.ibsDetailAPIOutputCopyRefresh
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
                                                                'พบข้อผิดพลาด (${(_model.ibsDetailAPIOutputCopyRefresh?.statusCode ?? 200).toString()})'),
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
                                                      Navigator.pop(context);
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }
                                                    if (IbsApplicationsDetailCall
                                                            .statuslayer1(
                                                          (_model.ibsDetailAPIOutputCopyRefresh
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
                                                                'พบข้อผิดพลาด (${IbsApplicationsDetailCall.statuslayer1(
                                                              (_model.ibsDetailAPIOutputCopyRefresh
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString()})'),
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
                                                      Navigator.pop(context);
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }
                                                    setState(() {
                                                      FFAppState()
                                                              .insuranceInfoPage4PaymentType =
                                                          IbsApplicationsDetailCall
                                                              .paymenttype(
                                                        (_model.ibsDetailAPIOutputCopyRefresh
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .insuranceInfoPage4PaymentChannel =
                                                          IbsApplicationsDetailCall
                                                              .paymentchannel(
                                                        (_model.ibsDetailAPIOutputCopyRefresh
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .insuranceInfo4pagePaymentStatus =
                                                          IbsApplicationsDetailCall
                                                              .paymentstatus(
                                                        (_model.ibsDetailAPIOutputCopyRefresh
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .insuranceInfoGrossTotal =
                                                          IbsApplicationsDetailCall
                                                              .grosstotalnet(
                                                        (_model.ibsDetailAPIOutputCopyRefresh
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .insuranceInfoActAmount =
                                                          IbsApplicationsDetailCall
                                                              .acttotal(
                                                        (_model.ibsDetailAPIOutputCopyRefresh
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .insuranceInfoVehicleCode =
                                                          IbsApplicationsDetailCall
                                                              .vehiclecode(
                                                        (_model.ibsDetailAPIOutputCopyRefresh
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .insuranceInfo4pageStatus =
                                                          IbsApplicationsDetailCall
                                                              .quotationstatus(
                                                        (_model.ibsDetailAPIOutputCopyRefresh
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                    });
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                            child: AlertDialog(
                                                          content: Text(
                                                              'รีเฟรชสำเร็จ'),
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
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .paymentTypeController,
                                                  focusNode: _model
                                                      .paymentTypeFocusNode,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintText: FFAppState()
                                                        .insuranceInfoPage4PaymentType,
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      .bodyMedium,
                                                  validator: _model
                                                      .paymentTypeControllerValidator
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
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .paymentChannelController,
                                                  focusNode: _model
                                                      .paymentChannelFocusNode,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintText: FFAppState()
                                                        .insuranceInfoPage4PaymentChannel,
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
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
                                                      .bodyMedium,
                                                  validator: _model
                                                      .paymentChannelControllerValidator
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
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .netPremiumTotalController,
                                              focusNode: _model
                                                  .netPremiumTotalFocusNode,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                hintText: FFAppState()
                                                    .insuranceInfoPage4NetPremiumTotal,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .netPremiumTotalControllerValidator
                                                  .asValidator(context),
                                            ),
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
                                            'ราคา พ.ร.บ (ถ้ามี)',
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
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .actTotalController,
                                                    focusNode: _model
                                                        .actTotalFocusNode,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintText: FFAppState()
                                                          .insuranceInfoPage4ActTotal,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFFB3B3B3),
                                                                fontSize: 15.0,
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
                                                        .bodyMedium,
                                                    validator: _model
                                                        .actTotalControllerValidator
                                                        .asValidator(context),
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
                            if (FFAppState().insuranceInfoPage4PaymentType !=
                                'ผ่อนชำระ')
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
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .grossNetTotalController,
                                                      focusNode: _model
                                                          .grossNetTotalFocusNode,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintText: FFAppState()
                                                            .insuranceInfoPage4GrossTotalNet,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFB3B3B3),
                                                                  fontSize:
                                                                      15.0,
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .grossNetTotalControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if ((FFAppState()
                                                          .insuranceInfo4pageStatus !=
                                                      'เตรียมข้อมูล') &&
                                                  (FFAppState()
                                                          .insuranceInfo4pagePaymentStatus !=
                                                      'ชำระแล้ว'))
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
                                                      var _shouldSetState =
                                                          false;
                                                      showModalBottomSheet(
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
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  LoadingSceneWidget(),
                                                            ),
                                                          ));
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      _model.regenQRCodeOutput =
                                                          await IbsPaymentRegenerateCodeCall
                                                              .call(
                                                        insuranceUrl: FFAppState()
                                                            .apiUrlInsuranceAppState,
                                                        quotationId: (widget.quotationId !=
                                                                        null &&
                                                                    widget.quotationId !=
                                                                        '') &&
                                                                (widget.quotationId !=
                                                                    '')
                                                            ? widget.quotationId
                                                            : FFAppState()
                                                                .insuranceInfoQuotationId,
                                                        token: FFAppState()
                                                            .accessToken,
                                                      );
                                                      _shouldSetState = true;
                                                      if ((_model.regenQRCodeOutput
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
                                                                  'พบข้อผิดพลาด (${(_model.regenQRCodeOutput?.statusCode ?? 200).toString()})'),
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
                                                        Navigator.pop(context);
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }
                                                      if (IbsPaymentRegenerateCodeCall
                                                              .statuslayer1(
                                                            (_model.regenQRCodeOutput
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
                                                                  'พบข้อผิดพลาด (${IbsPaymentRegenerateCodeCall.statuslayer1(
                                                                (_model.regenQRCodeOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString()})'),
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
                                                        Navigator.pop(context);
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }
                                                      setState(() {
                                                        FFAppState()
                                                                .insuranceInfoQrcodeRef2 =
                                                            IbsPaymentRegenerateCodeCall
                                                                .ref2(
                                                          (_model.regenQRCodeOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString();
                                                        FFAppState()
                                                                .insuranceInfoQrcodeRef1 =
                                                            IbsPaymentRegenerateCodeCall
                                                                .ref1(
                                                          (_model.regenQRCodeOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString();
                                                        FFAppState()
                                                                .insuranceInfoQrcodeSuffix =
                                                            IbsPaymentRegenerateCodeCall
                                                                .suffix(
                                                          (_model.regenQRCodeOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString();
                                                        FFAppState()
                                                                .insuranceInfoQrcodeTaxId =
                                                            IbsPaymentRegenerateCodeCall
                                                                .taxid(
                                                          (_model.regenQRCodeOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString();
                                                        FFAppState()
                                                                .insuranceInfoQrcodeAmount =
                                                            IbsPaymentRegenerateCodeCall
                                                                .amount(
                                                          (_model.regenQRCodeOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString();
                                                      });

                                                      context.pushNamed(
                                                        'PaywithQRcode',
                                                        queryParameters: {
                                                          'taxId':
                                                              serializeParam(
                                                            FFAppState()
                                                                .insuranceInfoQrcodeTaxId,
                                                            ParamType.String,
                                                          ),
                                                          'suffix':
                                                              serializeParam(
                                                            FFAppState()
                                                                .insuranceInfoQrcodeSuffix,
                                                            ParamType.String,
                                                          ),
                                                          'ref1':
                                                              serializeParam(
                                                            FFAppState()
                                                                .insuranceInfoQrcodeRef1,
                                                            ParamType.String,
                                                          ),
                                                          'ref2':
                                                              serializeParam(
                                                            FFAppState()
                                                                .insuranceInfoQrcodeRef2,
                                                            ParamType.String,
                                                          ),
                                                          'amount':
                                                              serializeParam(
                                                            FFAppState()
                                                                .insuranceInfoQrcodeAmount,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      Navigator.pop(context);
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.qr_code,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              if (FFAppState()
                                                      .insuranceInfo4pagePaymentStatus ==
                                                  'ชำระแล้ว')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Icon(
                                                    Icons.qr_code,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
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
                            if (FFAppState().insuranceInfoPage4PaymentType ==
                                'ผ่อนชำระ')
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
                                              'ระบุงวด',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '(บังคับเลือก)',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
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
                                              'SearchableListPage',
                                              queryParameters: {
                                                'titleText': serializeParam(
                                                  'จำนวนงวด',
                                                  ParamType.String,
                                                ),
                                                'searchLabel': serializeParam(
                                                  'เลือกงวดชำระ',
                                                  ParamType.String,
                                                ),
                                                'dataList': serializeParam(
                                                  FFAppState()
                                                      .InsuranceInfoPage4Tenor,
                                                  ParamType.String,
                                                  true,
                                                ),
                                                'multiSelect': serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                                'maxSelected': serializeParam(
                                                  0,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFFB3B3B3),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    (FFAppState().insuranceInfoPage4SelectTenor !=
                                                                    null &&
                                                                FFAppState().insuranceInfoPage4SelectTenor !=
                                                                    '') &&
                                                            (FFAppState()
                                                                    .insuranceInfoPage4SelectTenor !=
                                                                '') &&
                                                            (FFAppState()
                                                                    .insuranceInfoPage4SelectTenor !=
                                                                '')
                                                        ? FFAppState()
                                                            .insuranceInfoPage4SelectTenor
                                                        : 'เลือกงวด',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (FFAppState().insuranceInfoPage4PaymentType ==
                                'ผ่อนชำระ')
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
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                  valueOrDefault<String>(
                                                    functions.showNumberWithComma(
                                                        FFAppState()
                                                            .insuranceInfoPage4SelectInstallMentFirstDue),
                                                    '-',
                                                  ),
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
                              ),
                            if (FFAppState().insuranceInfoPage4PaymentType ==
                                'ผ่อนชำระ')
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
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
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
                                                            .insuranceInfoPage4SelectInstallMentLastDue),
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
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
                            if ((FFAppState().insuranceInfoPage4PaymentType ==
                                    'ผ่อนชำระ') &&
                                (FFAppState().insuranceInfo4pageStatus !=
                                    'เตรียมข้อมูล'))
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
                                              'ยอดที่ต้องชำระตอนนี้',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions.showNumberWithComma(
                                                          FFAppState()
                                                              .insuranceInfoPage4FirstPay),
                                                      '-',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                if ((FFAppState()
                                                            .insuranceInfo4pageStatus !=
                                                        'เตรียมข้อมูล') &&
                                                    (FFAppState()
                                                            .insuranceInfo4pagePaymentStatus !=
                                                        'ชำระแล้ว'))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
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
                                                        var _shouldSetState =
                                                            false;
                                                        showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    LoadingSceneWidget(),
                                                              ),
                                                            ));
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));

                                                        _model.regenQRCodeOutput2 =
                                                            await IbsPaymentRegenerateCodeCall
                                                                .call(
                                                          insuranceUrl: FFAppState()
                                                              .apiUrlInsuranceAppState,
                                                          quotationId: (widget.quotationId !=
                                                                          null &&
                                                                      widget.quotationId !=
                                                                          '') &&
                                                                  (widget.quotationId !=
                                                                      '')
                                                              ? widget
                                                                  .quotationId
                                                              : FFAppState()
                                                                  .insuranceInfoQuotationId,
                                                          token: FFAppState()
                                                              .accessToken,
                                                        );
                                                        _shouldSetState = true;
                                                        if ((_model.regenQRCodeOutput2
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
                                                                    'พบข้อผิดพลาด (${(_model.regenQRCodeOutput2?.statusCode ?? 200).toString()})'),
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
                                                          Navigator.pop(
                                                              context);
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                        if (IbsPaymentRegenerateCodeCall
                                                                .statuslayer1(
                                                              (_model.regenQRCodeOutput2
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
                                                                    'พบข้อผิดพลาด (${IbsPaymentRegenerateCodeCall.statuslayer1(
                                                                  (_model.regenQRCodeOutput2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ).toString()})'),
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
                                                          Navigator.pop(
                                                              context);
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                        setState(() {
                                                          FFAppState()
                                                                  .insuranceInfoQrcodeRef2 =
                                                              IbsPaymentRegenerateCodeCall
                                                                  .ref2(
                                                            (_model.regenQRCodeOutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString();
                                                          FFAppState()
                                                                  .insuranceInfoQrcodeRef1 =
                                                              IbsPaymentRegenerateCodeCall
                                                                  .ref1(
                                                            (_model.regenQRCodeOutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString();
                                                          FFAppState()
                                                                  .insuranceInfoQrcodeSuffix =
                                                              IbsPaymentRegenerateCodeCall
                                                                  .suffix(
                                                            (_model.regenQRCodeOutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString();
                                                          FFAppState()
                                                                  .insuranceInfoQrcodeTaxId =
                                                              IbsPaymentRegenerateCodeCall
                                                                  .taxid(
                                                            (_model.regenQRCodeOutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString();
                                                          FFAppState()
                                                                  .insuranceInfoQrcodeAmount =
                                                              IbsPaymentRegenerateCodeCall
                                                                  .amount(
                                                            (_model.regenQRCodeOutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString();
                                                        });

                                                        context.pushNamed(
                                                          'PaywithQRcode',
                                                          queryParameters: {
                                                            'taxId':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceInfoQrcodeTaxId,
                                                              ParamType.String,
                                                            ),
                                                            'suffix':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceInfoQrcodeSuffix,
                                                              ParamType.String,
                                                            ),
                                                            'ref1':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceInfoQrcodeRef1,
                                                              ParamType.String,
                                                            ),
                                                            'ref2':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceInfoQrcodeRef2,
                                                              ParamType.String,
                                                            ),
                                                            'amount':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .insuranceInfoQrcodeAmount,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        Navigator.pop(context);
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.qr_code,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .insuranceInfo4pagePaymentStatus ==
                                                    'ชำระแล้ว')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      Icons.qr_code,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                            if (false)
                              Align(
                                alignment: AlignmentDirectional(0.00, 1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 1.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: 'บันทึก',
                                                          options:
                                                              FFButtonOptions(
                                                            width: MediaQuery
                                                                        .sizeOf(
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
                                                            color: Color(
                                                                0xFFFCEFE4),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: Color(
                                                                          0xFFDF8633),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed:
                                                              () async {},
                                                          text:
                                                              'ส่งเรื่องให้บริษัทประกัน',
                                                          options:
                                                              FFButtonOptions(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.42,
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
                                                            color: Color(
                                                                0xFFD9761A),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
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
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 1.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 1.00),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 1.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if (FFAppState()
                                                          .insuranceInfo4pagePaymentStatus ==
                                                      'รอชำระเงิน')
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            if (FFAppState()
                                                                    .insuranceInfoPage4PaymentType !=
                                                                'จ่ายเต็ม') {
                                                              if (!(FFAppState()
                                                                          .insuranceInfoPage4SelectTenor !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .insuranceInfoPage4SelectTenor !=
                                                                      '')) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                      content: Text(
                                                                          'บังคับเลือกงวด'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ));
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                            }
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                          content:
                                                                              Text('คุณต้องการบันทึกใช่หรือไม่'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('ยกเลิก'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('ยืนยัน'),
                                                                            ),
                                                                          ],
                                                                        ));
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (!confirmDialogResponse) {
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        LoadingSceneWidget(),
                                                                  ),
                                                                ));
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.paymentAPIOutpu =
                                                                await IbsApplicationsPaymentSaveCall
                                                                    .call(
                                                              quotationId: (widget.quotationId !=
                                                                              null &&
                                                                          widget.quotationId !=
                                                                              '') &&
                                                                      (widget.quotationId !=
                                                                          '')
                                                                  ? widget
                                                                      .quotationId
                                                                  : FFAppState()
                                                                      .insuranceInfoQuotationId,
                                                              leadDtlId: widget
                                                                          .leadDetailId !=
                                                                      null
                                                                  ? widget
                                                                      .leadDetailId
                                                                      ?.toString()
                                                                  : FFAppState()
                                                                      .insuranceInfoLeadDetailId,
                                                              insuranceUrl:
                                                                  FFAppState()
                                                                      .apiUrlInsuranceAppState,
                                                              paymentType:
                                                                  FFAppState()
                                                                      .insuranceInfoPage4PaymentType,
                                                              paymentChannel:
                                                                  FFAppState()
                                                                      .insuranceInfoPage4PaymentChannel,
                                                              tenor: FFAppState()
                                                                          .insuranceInfoPage4PaymentType !=
                                                                      'จ่ายเต็ม'
                                                                  ? FFAppState()
                                                                      .insuranceInfoPage4SelectTenor
                                                                  : '0',
                                                              netPremiumTotal:
                                                                  FFAppState()
                                                                      .insuranceInfoPage4NetPremiumTotal,
                                                              actTotal: FFAppState()
                                                                  .insuranceInfoPage4ActTotal,
                                                              installmentFirstDue: FFAppState()
                                                                          .insuranceInfoPage4PaymentType !=
                                                                      'จ่ายเต็ม'
                                                                  ? FFAppState()
                                                                      .insuranceInfoPage4SelectInstallMentFirstDue
                                                                  : '0',
                                                              installmentLastDue: FFAppState()
                                                                          .insuranceInfoPage4PaymentType !=
                                                                      'จ่ายเต็ม'
                                                                  ? FFAppState()
                                                                      .insuranceInfoPage4SelectInstallMentLastDue
                                                                  : '0',
                                                              token: FFAppState()
                                                                  .accessToken,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.paymentAPIOutpu
                                                                        ?.statusCode ??
                                                                    200) !=
                                                                200) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                    content: Text(
                                                                        'คุณชำระเงินเรียบร้อยแล้ว กรุณากดปุ่มรีเฟรชเพื่อทำรายการต่อ'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ));
                                                                },
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            if (IbsApplicationsPaymentSaveCall
                                                                    .statuslayer1(
                                                                  (_model.paymentAPIOutpu
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                200) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                    content: Text(
                                                                        'พบข้อผิดพลาด (${IbsApplicationsPaymentSaveCall.statuslayer1(
                                                                      (_model.paymentAPIOutpu
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()})'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ));
                                                                },
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            setState(() {
                                                              FFAppState()
                                                                      .insuranceInfo4pageStatus =
                                                                  IbsApplicationsPaymentSaveCall
                                                                      .quotationstatus(
                                                                (_model.paymentAPIOutpu
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString();
                                                            });
                                                            _model.ibsDetailAPIOutputSavebtn =
                                                                await IbsApplicationsDetailCall
                                                                    .call(
                                                              quotationId: (widget.quotationId !=
                                                                              null &&
                                                                          widget.quotationId !=
                                                                              '') &&
                                                                      (widget.quotationId !=
                                                                          '')
                                                                  ? widget
                                                                      .quotationId
                                                                  : FFAppState()
                                                                      .insuranceInfoQuotationId,
                                                              insuranceUrl:
                                                                  FFAppState()
                                                                      .apiUrlInsuranceAppState,
                                                              token: FFAppState()
                                                                  .accessToken,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.ibsDetailAPIOutputSavebtn
                                                                        ?.statusCode ??
                                                                    200) !=
                                                                200) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                    content: Text(
                                                                        'พบข้อผิดพลาด (${(_model.ibsDetailAPIOutputSavebtn?.statusCode ?? 200).toString()})'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ));
                                                                },
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            if (IbsApplicationsDetailCall
                                                                    .statuslayer1(
                                                                  (_model.ibsDetailAPIOutputSavebtn
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                200) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                    content: Text(
                                                                        'พบข้อผิดพลาด (${IbsApplicationsDetailCall.statuslayer1(
                                                                      (_model.ibsDetailAPIOutputSavebtn
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()})'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ));
                                                                },
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            setState(() {
                                                              FFAppState()
                                                                      .insuranceInfoPage4FirstPay =
                                                                  IbsApplicationsDetailCall
                                                                      .firstPayAmount(
                                                                (_model.ibsDetailAPIOutputSavebtn
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString();
                                                              FFAppState()
                                                                      .insuranceInfo4pagePaymentStatus =
                                                                  IbsApplicationsDetailCall
                                                                      .paymentstatus(
                                                                (_model.ibsDetailAPIOutputSavebtn
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString();
                                                            });
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                  content: Text(
                                                                      'บันทึกสำเร็จ'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ));
                                                              },
                                                            );
                                                            Navigator.pop(
                                                                context);
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                          },
                                                          text: 'บันทึก',
                                                          options:
                                                              FFButtonOptions(
                                                            width: MediaQuery
                                                                        .sizeOf(
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
                                                            color: Color(
                                                                0xFFFCEFE4),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: Color(
                                                                          0xFFDF8633),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (FFAppState()
                                                          .insuranceInfo4pagePaymentStatus ==
                                                      'ชำระแล้ว')
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        LoadingSceneWidget(),
                                                                  ),
                                                                ));
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.getServerTime =
                                                                await GetDateTimeAPICall
                                                                    .call(
                                                              apiUrl: FFAppState()
                                                                  .apiURLLocalState,
                                                              token: FFAppState()
                                                                  .accessToken,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.getServerTime
                                                                        ?.statusCode ??
                                                                    200) !=
                                                                200) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                    content: Text(
                                                                        'พบข้อผิดพลาดConnection (${(_model.getServerTime?.statusCode ?? 200).toString()})'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
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
                                                            if (GetDateTimeAPICall
                                                                    .statusLayer1(
                                                                  (_model.getServerTime
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                200) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                    content: Text(
                                                                        'พบข้อผิดพลาด (${GetDateTimeAPICall.statusLayer1(
                                                                      (_model.getServerTime
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()})'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
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
                                                            if (!(functions
                                                                    .checkCurrentDateIsBeforeInputDate(
                                                                        GetDateTimeAPICall
                                                                                .currentDateYMD(
                                                                          (_model.getServerTime?.jsonBody ??
                                                                              ''),
                                                                        )
                                                                            .toString(),
                                                                        FFAppState()
                                                                            .insuranceInfoEffectiveDateInsure)! &&
                                                                (FFAppState()
                                                                            .insuranceInfoActFlag ==
                                                                        '1'
                                                                    ? functions.checkCurrentDateIsBeforeInputDate(
                                                                        GetDateTimeAPICall.currentDateYMD(
                                                                          (_model.getServerTime?.jsonBody ??
                                                                              ''),
                                                                        ).toString(),
                                                                        FFAppState().insuranceInfoEffectiveDateAct)!
                                                                    : true))) {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Color(
                                                                    0xBD000000),
                                                                isDismissible:
                                                                    false,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            250.0,
                                                                        child:
                                                                            EffectiveDatePickerComponentWidget(
                                                                          effectiveDateInsurerFlag: functions.checkCurrentDateIsBeforeInputDate(
                                                                              GetDateTimeAPICall.currentDateYMD(
                                                                                (_model.getServerTime?.jsonBody ?? ''),
                                                                              ).toString(),
                                                                              FFAppState().insuranceInfoEffectiveDateInsure)!,
                                                                          effectiveDateActFlag: FFAppState().insuranceInfoActFlag == '1'
                                                                              ? functions.checkCurrentDateIsBeforeInputDate(
                                                                                  GetDateTimeAPICall.currentDateYMD(
                                                                                    (_model.getServerTime?.jsonBody ?? ''),
                                                                                  ).toString(),
                                                                                  FFAppState().insuranceInfoEffectiveDateAct)!
                                                                              : true,
                                                                          effectiveDateInsurer:
                                                                              FFAppState().insuranceInfoEffectiveDateInsure,
                                                                          effectiveFateAct:
                                                                              FFAppState().insuranceInfoEffectiveDateAct,
                                                                          currentDate:
                                                                              GetDateTimeAPICall.currentDateYMD(
                                                                            (_model.getServerTime?.jsonBody ??
                                                                                ''),
                                                                          ).toString(),
                                                                          actFlag: FFAppState().insuranceInfoActFlag == '1'
                                                                              ? true
                                                                              : false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ));
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));

                                                              if (!(functions.checkCurrentDateIsBeforeInputDate(
                                                                      GetDateTimeAPICall.currentDateYMD(
                                                                        (_model.getServerTime?.jsonBody ??
                                                                            ''),
                                                                      ).toString(),
                                                                      FFAppState().insuranceInfoEffectiveDateInsure)! &&
                                                                  (FFAppState().insuranceInfoActFlag == '1'
                                                                      ? functions.checkCurrentDateIsBeforeInputDate(
                                                                          GetDateTimeAPICall.currentDateYMD(
                                                                            (_model.getServerTime?.jsonBody ??
                                                                                ''),
                                                                          ).toString(),
                                                                          FFAppState().insuranceInfoEffectiveDateAct)!
                                                                      : true))) {
                                                                Navigator.pop(
                                                                    context);
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                      content: Text(
                                                                          'กรุณาเลือกวันที่คุ้มครองประกันหรือวันที่คุ้มครอง พ.ร.บ.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ));
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                              _model.ibsApplicationEditOutput =
                                                                  await IbsApplicationsEditCall
                                                                      .call(
                                                                insuranceUrl:
                                                                    FFAppState()
                                                                        .apiUrlInsuranceAppState,
                                                                token: FFAppState()
                                                                    .accessToken,
                                                                quotationId:
                                                                    FFAppState()
                                                                        .insuranceInfoQuotationId,
                                                                effectiveDateInsure:
                                                                    FFAppState()
                                                                        .insuranceInfoEffectiveDateInsure,
                                                                effectiveDateAct:
                                                                    FFAppState().insuranceInfoActFlag ==
                                                                            '1'
                                                                        ? FFAppState()
                                                                            .insuranceInfoEffectiveDateAct
                                                                        : '',
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model.ibsApplicationEditOutput
                                                                          ?.statusCode ??
                                                                      200) !=
                                                                  200) {
                                                                Navigator.pop(
                                                                    context);
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                      content: Text(
                                                                          'พบข้อผิดพลาดConnection (${(_model.ibsApplicationEditOutput?.statusCode ?? 200).toString()})'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ));
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                              if (IbsApplicationsEditCall
                                                                      .statuslayer1(
                                                                    (_model.ibsApplicationEditOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  200) {
                                                                Navigator.pop(
                                                                    context);
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                      content: Text(
                                                                          'พบข้อผิดพลาด (${IbsApplicationsEditCall.statuslayer1(
                                                                        (_model.ibsApplicationEditOutput?.jsonBody ??
                                                                            ''),
                                                                      ).toString()})'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ));
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                            }
                                                            _model.postPolicyAPIOutPut =
                                                                await PostInsurancePolicyApiCall
                                                                    .call(
                                                              apiUrl: FFAppState()
                                                                  .apiUrlInsuranceAppState,
                                                              token: FFAppState()
                                                                  .accessToken,
                                                              quotationId: (widget.quotationId !=
                                                                              null &&
                                                                          widget.quotationId !=
                                                                              '') &&
                                                                      (widget.quotationId !=
                                                                          '')
                                                                  ? widget
                                                                      .quotationId
                                                                  : FFAppState()
                                                                      .insuranceInfoQuotationId,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.postPolicyAPIOutPut
                                                                        ?.statusCode ??
                                                                    200) !=
                                                                200) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                    content: Text(
                                                                        'พบข้อผิดพลาด (${(_model.postPolicyAPIOutPut?.statusCode ?? 200).toString()})'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ));
                                                                },
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            if (PostInsurancePolicyApiCall
                                                                    .statuslayer1(
                                                                  (_model.postPolicyAPIOutPut
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                200) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                    content: Text(
                                                                        'พบข้อผิดพลาด (${PostInsurancePolicyApiCall.statuslayer1(
                                                                      (_model.postPolicyAPIOutPut
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()})'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ));
                                                                },
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }

                                                            context.pushNamed(
                                                              'insuranceInfoPage5',
                                                              queryParameters: {
                                                                'quotationId':
                                                                    serializeParam(
                                                                  (widget.quotationId !=
                                                                                  null &&
                                                                              widget.quotationId !=
                                                                                  '') &&
                                                                          (widget.quotationId !=
                                                                              '')
                                                                      ? widget
                                                                          .quotationId
                                                                      : FFAppState()
                                                                          .insuranceInfoQuotationId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'leadDtlId':
                                                                    serializeParam(
                                                                  widget.leadDetailId !=
                                                                          null
                                                                      ? widget
                                                                          .leadDetailId
                                                                      : functions
                                                                          .parseStrToInt(
                                                                              FFAppState().insuranceInfoLeadDetailId),
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                  content: Text((widget.quotationId !=
                                                                                  null &&
                                                                              widget.quotationId !=
                                                                                  '') &&
                                                                          (widget.quotationId !=
                                                                              '')
                                                                      ? widget
                                                                          .quotationId!
                                                                      : FFAppState()
                                                                          .insuranceInfoQuotationId),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ));
                                                              },
                                                            );
                                                            Navigator.pop(
                                                                context);
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                          },
                                                          text: FFAppState()
                                                                      .insuranceInfoApplicationType ==
                                                                  'auto'
                                                              ? 'ยืนยันทำประกัน'
                                                              : 'ส่งเรื่องให้บริษัทประกัน',
                                                          options:
                                                              FFButtonOptions(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.42,
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
                                                            color: Color(
                                                                0xFFD9761A),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
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
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 50.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
