import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/effective_date_picker_component_widget.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_fire_insurance_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_info_page42_model.dart';
export 'insurance_info_page42_model.dart';

class InsuranceInfoPage42Widget extends StatefulWidget {
  const InsuranceInfoPage42Widget({
    super.key,
    this.quotationId,
    this.leadDetailId,
  });

  final String? quotationId;
  final int? leadDetailId;

  static String routeName = 'insuranceInfoPage4_2';
  static String routePath = 'insuranceInfoPage4_2';

  @override
  State<InsuranceInfoPage42Widget> createState() =>
      _InsuranceInfoPage42WidgetState();
}

class _InsuranceInfoPage42WidgetState extends State<InsuranceInfoPage42Widget> {
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
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      FFAppState().insuranceInfoPage4SelectTenor = '';
      FFAppState().insuranceInfoPage4SelectInstallMentFirstDue = '';
      FFAppState().insuranceInfoPage4SelectInstallMentLastDue = '';
      FFAppState().isProcessing = false;
      safeSetState(() {});
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
              ),
            );
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
      FFAppState().insuranceInfoImgUrlInsurerList =
          InsuranceRequestGetInsurerAPICall.insurerLogo(
        (_model.getInsurer?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().insuranceInfoCompanyIdList =
          InsuranceRequestGetInsurerAPICall.companyShortName(
        (_model.getInsurer?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      safeSetState(() {});
      _model.ibsDetailAPIOutput = await IbsApplicationsDetailCall.call(
        quotationId:
            (widget!.quotationId != null && widget!.quotationId != '') &&
                    (widget!.quotationId != '')
                ? widget!.quotationId
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
              ),
            );
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
                content: Text(IbsApplicationsDetailCall.messageLayer1(
                  (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
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
      FFAppState().insuranceInfoGrossTotal =
          '${IbsApplicationsDetailCall.grosstotalnet(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoActAmount =
          '${IbsApplicationsDetailCall.acttotal(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoVehicleCode =
          '${IbsApplicationsDetailCall.vehiclecode(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoQuotationId =
          '${(widget!.quotationId != null && widget!.quotationId != '') && (widget!.quotationId != '') ? widget!.quotationId : FFAppState().insuranceInfoQuotationId}';
      FFAppState().insuranceInfoLeadDetailId =
          '${(IbsApplicationsDetailCall.leaddtlid(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )?.elementAtOrNull(functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                r'''$.results.data.leads_detail[:].lead_dtl_id''',
                true,
              )).toList(), widget!.leadDetailId)))?.toString()}';
      FFAppState().insuranceInfoFirstName =
          IbsApplicationsDetailCall.firstnameth(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!;
      FFAppState().insuranceInfoLastName = IbsApplicationsDetailCall.lastnameth(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!;
      FFAppState().insuranceInfoPhonenumber =
          IbsApplicationsDetailCall.phonenumber(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!;
      FFAppState().nonePackageWorkType = IbsApplicationsDetailCall.workType(
                (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
              ) ==
              ''
          ? ''
          : IbsApplicationsDetailCall.workType(
              (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
            )!;
      FFAppState().insuranceInfocoverType =
          (IbsApplicationsDetailCall.covertypename(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!
              .elementAtOrNull(functions.getIndexOfIntList(
                  functions
                      .convertDynamicListToIntList(getJsonField(
                        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                        r'''$.results.data.leads_detail[:].lead_dtl_id''',
                        true,
                      ))
                      .toList(),
                  widget!.leadDetailId)))!;
      FFAppState().insuranceInfoGarageType =
          (IbsApplicationsDetailCall.garagetypename(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!
              .elementAtOrNull(functions.getIndexOfIntList(
                  functions
                      .convertDynamicListToIntList(getJsonField(
                        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                        r'''$.results.data.leads_detail[:].lead_dtl_id''',
                        true,
                      ))
                      .toList(),
                  widget!.leadDetailId)))!;
      FFAppState().insuranceInfoApplicationType =
          IbsApplicationsDetailCall.quotationtypebak(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!;
      FFAppState().insuranceInfoCompayId =
          (IbsApplicationsDetailCall.insurershortname(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!
              .elementAtOrNull(functions.getIndexOfIntList(
                  functions
                      .convertDynamicListToIntList(getJsonField(
                        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                        r'''$.results.data.leads_detail[:].lead_dtl_id''',
                        true,
                      ))
                      .toList(),
                  widget!.leadDetailId)))!;
      FFAppState().insuranceInfoActFlag = IbsApplicationsDetailCall.actflg(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!;
      FFAppState().insuranceInfoInsuranceLogo =
          (IbsApplicationsDetailCall.insurerlogo(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!
              .elementAtOrNull(functions.getIndexOfIntList(
                  functions
                      .convertDynamicListToIntList(getJsonField(
                        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                        r'''$.results.data.leads_detail[:].lead_dtl_id''',
                        true,
                      ))
                      .toList(),
                  widget!.leadDetailId)))!;
      FFAppState().insuranceInfoEffectiveDateAct =
          IbsApplicationsDetailCall.effectiveDateAct(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!;
      FFAppState().insuranceInfoEffectiveDateInsure =
          IbsApplicationsDetailCall.effectiveDateInsure(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!;
      FFAppState().insuranceInfoVehicleType =
          IbsApplicationsDetailCall.quotationtypebak(
                    (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                  ) ==
                  'auto'
              ? IbsApplicationsDetailCall.cartype(
                  (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                )!
              : IbsApplicationsDetailCall.manualCarType(
                  (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                )!;
      FFAppState().insuranceInfoVehicleUsage =
          '${IbsApplicationsDetailCall.vehiclecode(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )} ${IbsApplicationsDetailCall.vehiclename(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoQuotationTypeName =
          '${IbsApplicationsDetailCall.quotationtypename(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoQuotationTypeBakName =
          '${IbsApplicationsDetailCall.quotationtypebakname(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoSubProductName =
          '${IbsApplicationsDetailCall.subproductname(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceinfoActType =
          '${IbsApplicationsDetailCall.subProduct(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )}';
      FFAppState().insuranceInfoCoverTypeCode =
          (IbsApplicationsDetailCall.covertypecode(
        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
      )!
              .elementAtOrNull(functions.getIndexOfIntList(
                  functions
                      .convertDynamicListToIntList(getJsonField(
                        (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
                        r'''$.results.data.leads_detail[:].lead_dtl_id''',
                        true,
                      ))
                      .toList(),
                  widget!.leadDetailId)))!;
      safeSetState(() {});
      if (FFAppState().insuranceinfoActType == 'House') {
        FFAppState().leadsHouse = IbsApplicationsDetailCall.apphouse(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<LeadsHouseStruct>();
        FFAppState().leadsDetailHouse =
            IbsApplicationsDetailCall.appdetailhouse(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<LeadsDetailHouseStruct>();
        safeSetState(() {});
        FFAppState().insuranceInfoEffectiveDateInsure =
            FFAppState().leadsDetailHouse.firstOrNull!.effectiveDateInsure;
        safeSetState(() {});
      }
      if (IbsApplicationsDetailCall.quotationstatus(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ) ==
          'เตรียมข้อมูล') {
        FFAppState().insuranceInfo4pageStatus =
            '${IbsApplicationsDetailCall.quotationstatus(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        safeSetState(() {});
        Navigator.pop(context);
        return;
      }
      if (FFAppState().insuranceinfoActType == 'House') {
        FFAppState().insuranceInfoPage4PaymentType =
            '${IbsApplicationsDetailCall.paymenttype(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4PaymentChannel =
            '${IbsApplicationsDetailCall.paymentchannel(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfo4pagePaymentStatus =
            '${IbsApplicationsDetailCall.paymentstatus(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoGrossTotal = '${'${getJsonField(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          r'''$.results.data.app_detail_house[:].gross_total''',
        ).toString().toString()}'}';
        FFAppState().insuranceInfoActAmount =
            '${IbsApplicationsDetailCall.acttotal(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoVehicleCode =
            '${IbsApplicationsDetailCall.vehiclecode(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoQuotationId =
            '${IbsApplicationsDetailCall.quotationId(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4SelectTenor =
            '${IbsApplicationsDetailCall.tenor(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfo4pageStatus =
            '${IbsApplicationsDetailCall.quotationstatus(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4SelectInstallMentFirstDue =
            '${FFAppState().leadsDetailHouse.firstOrNull?.installmentFirstDue}';
        FFAppState().insuranceInfoPage4SelectInstallMentLastDue =
            '${FFAppState().leadsDetailHouse.firstOrNull?.installmentLastDue}';
        FFAppState().insuranceInfoPage4FirstPay =
            '${IbsApplicationsDetailCall.firstPayAmount(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoFirstName =
            '${IbsApplicationsDetailCall.firstnameth(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoLastName =
            '${IbsApplicationsDetailCall.lastnameth(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4NetPremiumTotal = '${getJsonField(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          r'''$.results.data.app_detail_house[0].net_premium_total''',
        ).toString().toString()}';
        FFAppState().insuranceinfoActType =
            '${IbsApplicationsDetailCall.subProduct(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoEffectiveDateInsure =
            FFAppState().leadsDetailHouse.firstOrNull!.effectiveDateInsure;
        FFAppState().insuranceInfoPage4TenorOverSelect =
            '${IbsApplicationsDetailCall.tenorfirstdue(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        safeSetState(() {});
      } else {
        FFAppState().insuranceInfoPage4PaymentType =
            '${IbsApplicationsDetailCall.paymenttype(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4PaymentChannel =
            '${IbsApplicationsDetailCall.paymentchannel(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfo4pagePaymentStatus =
            '${IbsApplicationsDetailCall.paymentstatus(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoGrossTotal =
            '${IbsApplicationsDetailCall.grosstotalnet(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoActAmount =
            '${IbsApplicationsDetailCall.acttotal(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoVehicleCode =
            '${IbsApplicationsDetailCall.vehiclecode(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoQuotationId =
            '${IbsApplicationsDetailCall.quotationId(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4SelectTenor =
            '${IbsApplicationsDetailCall.tenor(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfo4pageStatus =
            '${IbsApplicationsDetailCall.quotationstatus(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4SelectInstallMentFirstDue =
            '${IbsApplicationsDetailCall.installmentfirstdue(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4SelectInstallMentLastDue =
            '${IbsApplicationsDetailCall.installmentlastdue(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4FirstPay =
            '${IbsApplicationsDetailCall.firstPayAmount(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoFirstName =
            '${IbsApplicationsDetailCall.firstnameth(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoLastName =
            '${IbsApplicationsDetailCall.lastnameth(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4NetPremiumTotal =
            '${IbsApplicationsDetailCall.netpremiumtotalAppdetail(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceinfoActType =
            '${IbsApplicationsDetailCall.subProduct(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4TenorOverSelect =
            '${IbsApplicationsDetailCall.tenorfirstdue(
          (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
        )}';
        safeSetState(() {});
      }

      if (FFAppState().insuranceInfoPage4PaymentType == 'จ่ายเต็ม') {
        safeSetState(() {
          _model.paymentTypeTextController?.text =
              FFAppState().insuranceInfoPage4PaymentType;
        });
        safeSetState(() {
          _model.paymentChannelTextController?.text =
              FFAppState().insuranceInfoPage4PaymentChannel;
        });
        safeSetState(() {
          _model.actTotalTextController?.text =
              functions.showNumberWithComma(IbsApplicationsDetailCall.acttotal(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ))!;
        });
        safeSetState(() {
          _model.grossNetTotalTextController?.text = functions
              .showNumberWithComma(IbsApplicationsDetailCall.grosstotalnet(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ))!;
        });
        safeSetState(() {
          _model.netPremiumTotalTextController?.text =
              functions.showNumberWithComma(
                  '${IbsApplicationsDetailCall.netpremiumtotalAppdetail(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          )}')!;
        });
        Navigator.pop(context);
      } else {
        _model.calInstallmentAPIOutput = await IbsCalculateInstallmentCall.call(
          grossTotalNet: FFAppState().insuranceinfoActType == 'House'
              ? FFAppState().leadsDetailHouse.firstOrNull?.grossTotalNet
              : FFAppState().insuranceInfoGrossTotal,
          vehicleCode: FFAppState().insuranceInfoVehicleCode,
          actTotal: FFAppState().insuranceInfoActAmount,
          insuranceUrl: FFAppState().apiUrlInsuranceAppState,
          token: FFAppState().accessToken,
          subProduct: FFAppState().insuranceinfoActType,
          actFlg: FFAppState().insuranceInfoActFlag,
          insurerCode2: FFAppState().insuranceInfoCompayId,
          coverTypeCode: FFAppState().insuranceInfoCoverTypeCode,
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
                ),
              );
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
                  )?.toString()})'),
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
        FFAppState().InsuranceInfoPage4PaymentFirst =
            IbsCalculateInstallmentCall.paymentfirst(
          (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().InsuranceInfoPage4InstallmentFirstDue =
            IbsCalculateInstallmentCall.installmentfirstdue(
          (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().InsuranceInfoPage4InstallmentLastDue =
            IbsCalculateInstallmentCall.installmentlastdue(
          (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().InsuranceInfoPage4Tenor =
            IbsCalculateInstallmentCall.tenor(
          (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().installmentDataTypeAppState =
            IbsCalculateInstallmentCall.installmentDataType(
          (_model.calInstallmentAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<InstallmentDataTypeStruct>();
        safeSetState(() {});
        if ((FFAppState().insuranceInfoPage4SelectTenor != null &&
                FFAppState().insuranceInfoPage4SelectTenor != '') &&
            (FFAppState().insuranceInfoPage4SelectTenor != '') &&
            (FFAppState().insuranceInfoPage4SelectTenor != '')) {
          FFAppState().insuranceInfoPage4TenorOverList = FFAppState()
              .installmentDataTypeAppState
              .elementAtOrNull(functions.getIndexOfSomethingList(
                  FFAppState().InsuranceInfoPage4Tenor.toList(),
                  FFAppState().insuranceInfoPage4SelectTenor))!
              .tenorFirstDue
              .toList()
              .cast<String>();
          safeSetState(() {});
        }
        safeSetState(() {
          _model.paymentTypeTextController?.text =
              FFAppState().insuranceInfoPage4PaymentType;
        });
        safeSetState(() {
          _model.paymentChannelTextController?.text =
              FFAppState().insuranceInfoPage4PaymentChannel;
        });
        safeSetState(() {
          _model.netPremiumTotalTextController?.text =
              functions.showNumberWithComma(
                  '${IbsApplicationsDetailCall.netpremiumtotalAppdetail(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          )}')!;
        });
        safeSetState(() {
          _model.actTotalTextController?.text =
              functions.showNumberWithComma(IbsApplicationsDetailCall.acttotal(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ))!;
        });
        safeSetState(() {
          _model.grossNetTotalTextController?.text = functions
              .showNumberWithComma(IbsApplicationsDetailCall.grosstotalnet(
            (_model.ibsDetailAPIOutput?.jsonBody ?? ''),
          ))!;
        });
        Navigator.pop(context);
      }
    });

    _model.paymentTypeTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoPage4PaymentType);
    _model.paymentTypeFocusNode ??= FocusNode();

    _model.paymentChannelTextController ??= TextEditingController(
        text: FFAppState().insuranceInfoPage4PaymentChannel);
    _model.paymentChannelFocusNode ??= FocusNode();

    _model.netPremiumTotalTextController ??= TextEditingController(
        text: functions.showNumberWithComma(
            FFAppState().insuranceInfoPage4NetPremiumTotal));
    _model.netPremiumTotalFocusNode ??= FocusNode();

    _model.actTotalTextController ??= TextEditingController(
        text: functions
            .showNumberWithComma(FFAppState().insuranceInfoPage4ActTotal));
    _model.actTotalFocusNode ??= FocusNode();

    _model.grossNetTotalTextController ??= TextEditingController(
        text: functions
            .showNumberWithComma(FFAppState().insuranceInfoPage4GrossTotalNet));
    _model.grossNetTotalFocusNode ??= FocusNode();

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
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: LoadingSceneWidget(),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));

                  if (FFAppState().insuranceInfo4pageStatus == 'เตรียมข้อมูล') {
                    return;
                  }
                  _model.ibsDetailAPIOutputCopy =
                      await IbsApplicationsDetailCall.call(
                    quotationId: (widget!.quotationId != null &&
                                widget!.quotationId != '') &&
                            (widget!.quotationId != '')
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
                          ),
                        );
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
                            )?.toString()})'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
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
                  FFAppState().insuranceInfoPage4PaymentType =
                      IbsApplicationsDetailCall.paymenttype(
                    (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                  )!;
                  FFAppState().insuranceInfoPage4PaymentChannel =
                      IbsApplicationsDetailCall.paymentchannel(
                    (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                  )!;
                  FFAppState().insuranceInfo4pagePaymentStatus =
                      IbsApplicationsDetailCall.paymentstatus(
                    (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                  )!;
                  FFAppState().insuranceInfoGrossTotal =
                      IbsApplicationsDetailCall.grosstotalnet(
                    (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                  )!;
                  FFAppState().insuranceInfoActAmount =
                      IbsApplicationsDetailCall.acttotal(
                    (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                  )!;
                  FFAppState().insuranceInfoVehicleCode =
                      IbsApplicationsDetailCall.vehiclecode(
                    (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                  )!;
                  FFAppState().insuranceInfo4pageStatus =
                      IbsApplicationsDetailCall.quotationstatus(
                    (_model.ibsDetailAPIOutputCopy?.jsonBody ?? ''),
                  )!;
                  safeSetState(() {});
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
                            if ((FFAppState().insuranceinfoActType != 'CMI') &&
                                (FFAppState().insuranceinfoActType != 'House'))
                              wrapWithModel(
                                model: _model.infomationCustomerModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InfomationCustomerWidget(),
                              ),
                            if (FFAppState().insuranceinfoActType == 'House')
                              wrapWithModel(
                                model:
                                    _model.infomationCustomerFireInsuranceModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InfomationCustomerFireInsuranceWidget(),
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
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFFAFAFA),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
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
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFAFAFA),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
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
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFAFAFA),
                                                  letterSpacing: 0.0,
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
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFAFAFA),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
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
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '5',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFB3B3B3),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
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
                                                  letterSpacing: 0.0,
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
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
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
                                            'สถานะการชำระเงิน',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
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
                                                          letterSpacing: 0.0,
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
                                                                  LoadingSceneWidget(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    _model.ibsDetailAPIOutputCopyRefresh =
                                                        await IbsApplicationsDetailCall
                                                            .call(
                                                      quotationId: (widget!
                                                                          .quotationId !=
                                                                      null &&
                                                                  widget!.quotationId !=
                                                                      '') &&
                                                              (widget!.quotationId !=
                                                                  '')
                                                          ? widget!.quotationId
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
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'พบข้อผิดพลาด (${(_model.ibsDetailAPIOutputCopyRefresh?.statusCode ?? 200).toString()})'),
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
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'พบข้อผิดพลาด (${IbsApplicationsDetailCall.statuslayer1(
                                                                (_model.ibsDetailAPIOutputCopyRefresh
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
                                                      Navigator.pop(context);
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                    FFAppState()
                                                            .insuranceInfoPage4PaymentType =
                                                        '${IbsApplicationsDetailCall.paymenttype(
                                                      (_model.ibsDetailAPIOutputCopyRefresh
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}';
                                                    FFAppState()
                                                            .insuranceInfoPage4PaymentChannel =
                                                        '${IbsApplicationsDetailCall.paymentchannel(
                                                      (_model.ibsDetailAPIOutputCopyRefresh
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}';
                                                    FFAppState()
                                                            .insuranceInfo4pagePaymentStatus =
                                                        '${IbsApplicationsDetailCall.paymentstatus(
                                                      (_model.ibsDetailAPIOutputCopyRefresh
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}';
                                                    FFAppState()
                                                            .insuranceInfoGrossTotal =
                                                        '${IbsApplicationsDetailCall.grosstotalnet(
                                                      (_model.ibsDetailAPIOutputCopyRefresh
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}';
                                                    FFAppState()
                                                            .insuranceInfoActAmount =
                                                        '${IbsApplicationsDetailCall.acttotal(
                                                      (_model.ibsDetailAPIOutputCopyRefresh
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}';
                                                    FFAppState()
                                                            .insuranceInfoVehicleCode =
                                                        '${IbsApplicationsDetailCall.vehiclecode(
                                                      (_model.ibsDetailAPIOutputCopyRefresh
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}';
                                                    FFAppState()
                                                            .insuranceInfo4pageStatus =
                                                        '${IbsApplicationsDetailCall.quotationstatus(
                                                      (_model.ibsDetailAPIOutputCopyRefresh
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}';
                                                    safeSetState(() {});
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
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    Navigator.pop(context);
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
                                                  letterSpacing: 0.0,
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
                                                      .paymentTypeTextController,
                                                  focusNode: _model
                                                      .paymentTypeFocusNode,
                                                  autofocus: false,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
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
                                                          letterSpacing: 0.0,
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
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .paymentTypeTextControllerValidator
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
                                                  letterSpacing: 0.0,
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
                                                      .paymentChannelTextController,
                                                  focusNode: _model
                                                      .paymentChannelFocusNode,
                                                  autofocus: false,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
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
                                                          letterSpacing: 0.0,
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
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .paymentChannelTextControllerValidator
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
                            if (FFAppState().insuranceinfoActType != 'CMI')
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
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
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
                                          constraints: BoxConstraints(
                                            minHeight: 60.0,
                                          ),
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
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .netPremiumTotalTextController,
                                                focusNode: _model
                                                    .netPremiumTotalFocusNode,
                                                autofocus: false,
                                                readOnly: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: FFAppState()
                                                      .insuranceInfoPage4NetPremiumTotal,
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                validator: _model
                                                    .netPremiumTotalTextControllerValidator
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
                            if ((FFAppState().insuranceinfoActType != 'CMI') &&
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
                                              'ราคา พ.ร.บ (ถ้ามี)',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
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
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .actTotalTextController,
                                                      focusNode: _model
                                                          .actTotalFocusNode,
                                                      autofocus: false,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
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
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model
                                                          .actTotalTextControllerValidator
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
                                                        letterSpacing: 0.0,
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
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .grossNetTotalTextController,
                                                      focusNode: _model
                                                          .grossNetTotalFocusNode,
                                                      autofocus: false,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
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
                                                                  letterSpacing:
                                                                      0.0,
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model
                                                          .grossNetTotalTextControllerValidator
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
                                                                    LoadingSceneWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      _model.regenQRCodeOutput =
                                                          await IbsPaymentRegenerateCodeCall
                                                              .call(
                                                        insuranceUrl: FFAppState()
                                                            .apiUrlInsuranceAppState,
                                                        quotationId: (widget!.quotationId !=
                                                                        null &&
                                                                    widget!.quotationId !=
                                                                        '') &&
                                                                (widget!.quotationId !=
                                                                    '')
                                                            ? widget!
                                                                .quotationId
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
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        Navigator.pop(context);
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
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
                                                        Navigator.pop(context);
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                      FFAppState()
                                                              .insuranceInfoQrcodeRef2 =
                                                          '${IbsPaymentRegenerateCodeCall.ref2(
                                                        (_model.regenQRCodeOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}';
                                                      FFAppState()
                                                              .insuranceInfoQrcodeRef1 =
                                                          '${IbsPaymentRegenerateCodeCall.ref1(
                                                        (_model.regenQRCodeOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}';
                                                      FFAppState()
                                                              .insuranceInfoQrcodeSuffix =
                                                          '${IbsPaymentRegenerateCodeCall.suffix(
                                                        (_model.regenQRCodeOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}';
                                                      FFAppState()
                                                              .insuranceInfoQrcodeTaxId =
                                                          '${IbsPaymentRegenerateCodeCall.taxid(
                                                        (_model.regenQRCodeOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}';
                                                      FFAppState()
                                                              .insuranceInfoQrcodeAmount =
                                                          '${IbsPaymentRegenerateCodeCall.amount(
                                                        (_model.regenQRCodeOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}';
                                                      safeSetState(() {});

                                                      context.pushNamed(
                                                        PaywithQRcodeWidget
                                                            .routeName,
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
                                                        safeSetState(() {});
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
                                                        letterSpacing: 0.0,
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
                                                          letterSpacing: 0.0,
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
                                              SearchableListPageWidget
                                                  .routeName,
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
                                                  isList: true,
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

                                            await actions.hideKeyboardAction(
                                              context,
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
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
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
                            if ((FFAppState().insuranceInfoPage4PaymentType ==
                                    'ผ่อนชำระ') &&
                                ((FFAppState()
                                                .insuranceInfoPage4SelectTenor !=
                                            null &&
                                        FFAppState()
                                                .insuranceInfoPage4SelectTenor !=
                                            '') &&
                                    (FFAppState()
                                            .insuranceInfoPage4SelectTenor !=
                                        '') &&
                                    (FFAppState()
                                            .insuranceInfoPage4SelectTenor !=
                                        '')))
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
                                              'ระบุงวดที่ต้องการจ่ายล่วงหน้า',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
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
                                                          letterSpacing: 0.0,
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
                                              SearchableListPageWidget
                                                  .routeName,
                                              queryParameters: {
                                                'titleText': serializeParam(
                                                  'จำนวนงวดชำระล่วงหน้า',
                                                  ParamType.String,
                                                ),
                                                'searchLabel': serializeParam(
                                                  'เลือกงวดชำระล่วงหน้า',
                                                  ParamType.String,
                                                ),
                                                'dataList': serializeParam(
                                                  FFAppState()
                                                      .insuranceInfoPage4TenorOverList,
                                                  ParamType.String,
                                                  isList: true,
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

                                            await actions.hideKeyboardAction(
                                              context,
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
                                                    (FFAppState().insuranceInfoPage4TenorOverSelect !=
                                                                    null &&
                                                                FFAppState().insuranceInfoPage4TenorOverSelect !=
                                                                    '') &&
                                                            (FFAppState()
                                                                    .insuranceInfoPage4TenorOverSelect !=
                                                                '') &&
                                                            (FFAppState()
                                                                    .insuranceInfoPage4TenorOverSelect !=
                                                                '')
                                                        ? FFAppState()
                                                            .insuranceInfoPage4TenorOverSelect
                                                        : 'เลือกงวดที่ต้องการจ่ายล่วงหน้า',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                        ),
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
                                                        letterSpacing: 0.0,
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
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        letterSpacing: 0.0,
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
                                                        letterSpacing: 0.0,
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
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        letterSpacing: 0.0,
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
                                                        letterSpacing: 0.0,
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
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
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
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));

                                                        _model.regenQRCodeOutput2 =
                                                            await IbsPaymentRegenerateCodeCall
                                                                .call(
                                                          insuranceUrl: FFAppState()
                                                              .apiUrlInsuranceAppState,
                                                          quotationId: (widget!
                                                                              .quotationId !=
                                                                          null &&
                                                                      widget!.quotationId !=
                                                                          '') &&
                                                                  (widget!.quotationId !=
                                                                      '')
                                                              ? widget!
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
                                                          Navigator.pop(
                                                              context);
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
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
                                                                  )?.toString()})'),
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
                                                          Navigator.pop(
                                                              context);
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                        FFAppState()
                                                                .insuranceInfoQrcodeRef2 =
                                                            '${IbsPaymentRegenerateCodeCall.ref2(
                                                          (_model.regenQRCodeOutput2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}';
                                                        FFAppState()
                                                                .insuranceInfoQrcodeRef1 =
                                                            '${IbsPaymentRegenerateCodeCall.ref1(
                                                          (_model.regenQRCodeOutput2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}';
                                                        FFAppState()
                                                                .insuranceInfoQrcodeSuffix =
                                                            '${IbsPaymentRegenerateCodeCall.suffix(
                                                          (_model.regenQRCodeOutput2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}';
                                                        FFAppState()
                                                                .insuranceInfoQrcodeTaxId =
                                                            '${IbsPaymentRegenerateCodeCall.taxid(
                                                          (_model.regenQRCodeOutput2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}';
                                                        FFAppState()
                                                                .insuranceInfoQrcodeAmount =
                                                            '${IbsPaymentRegenerateCodeCall.amount(
                                                          (_model.regenQRCodeOutput2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                          PaywithQRcodeWidget
                                                              .routeName,
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
                                                            'actCMI':
                                                                serializeParam(
                                                              FFAppState().insuranceinfoActType ==
                                                                      'CMI'
                                                                  ? true
                                                                  : false,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        Navigator.pop(context);
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
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
                                alignment: AlignmentDirectional(0.0, 1.0),
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
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                                      letterSpacing:
                                                                          0.0,
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
                              alignment: AlignmentDirectional(0.0, 1.0),
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
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
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
                                                                        content:
                                                                            Text('บังคับเลือกงวด'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                              if (!(FFAppState()
                                                                          .insuranceInfoPage4TenorOverSelect !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .insuranceInfoPage4TenorOverSelect !=
                                                                      '')) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text('บังคับเลือกงวดที่ต้องการจ่ายล่'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
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
                                                                          ),
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (!confirmDialogResponse) {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            if (FFAppState()
                                                                .isProcessing) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'กรุณารอ 10 วินาที'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              FFAppState()
                                                                      .isProcessing =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
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
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          LoadingSceneWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            _model.paymentAPIOutpu =
                                                                await IbsApplicationsPaymentSaveCall
                                                                    .call(
                                                              quotationId: (widget!.quotationId !=
                                                                              null &&
                                                                          widget!.quotationId !=
                                                                              '') &&
                                                                      (widget!.quotationId !=
                                                                          '')
                                                                  ? widget!
                                                                      .quotationId
                                                                  : FFAppState()
                                                                      .insuranceInfoQuotationId,
                                                              leadDtlId: widget!
                                                                          .leadDetailId !=
                                                                      null
                                                                  ? widget!
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
                                                              tenorFirstDue:
                                                                  FFAppState()
                                                                      .insuranceInfoPage4TenorOverSelect,
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
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              FFAppState()
                                                                      .isProcessing =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
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
                                                                          'พบข้อผิดพลาด (${IbsApplicationsPaymentSaveCall.messageLayer1(
                                                                        (_model.paymentAPIOutpu?.jsonBody ??
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
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              FFAppState()
                                                                      .isProcessing =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            FFAppState()
                                                                    .insuranceInfo4pageStatus =
                                                                '${IbsApplicationsPaymentSaveCall.quotationstatus(
                                                              (_model.paymentAPIOutpu
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )}';
                                                            safeSetState(() {});
                                                            _model.ibsDetailAPIOutputSavebtn =
                                                                await IbsApplicationsDetailCall
                                                                    .call(
                                                              quotationId: (widget!.quotationId !=
                                                                              null &&
                                                                          widget!.quotationId !=
                                                                              '') &&
                                                                      (widget!.quotationId !=
                                                                          '')
                                                                  ? widget!
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
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              FFAppState()
                                                                      .isProcessing =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
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
                                                                          IbsApplicationsDetailCall
                                                                              .messageLayer1(
                                                                        (_model.ibsDetailAPIOutputSavebtn?.jsonBody ??
                                                                            ''),
                                                                      )!),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              FFAppState()
                                                                      .isProcessing =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            FFAppState()
                                                                    .insuranceInfoPage4FirstPay =
                                                                '${IbsApplicationsDetailCall.firstPayAmount(
                                                              (_model.ibsDetailAPIOutputSavebtn
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )}';
                                                            FFAppState()
                                                                    .insuranceInfo4pagePaymentStatus =
                                                                '${IbsApplicationsDetailCall.paymentstatus(
                                                              (_model.ibsDetailAPIOutputSavebtn
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )}';
                                                            safeSetState(() {});
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
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            Navigator.pop(
                                                                context);
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        10000));
                                                            FFAppState()
                                                                    .isProcessing =
                                                                false;
                                                            safeSetState(() {});
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                  if ((FFAppState()
                                                              .insuranceInfo4pagePaymentStatus ==
                                                          'ชำระแล้ว') &&
                                                      !FFAppState()
                                                          .isProcessing)
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
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          LoadingSceneWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            if (FFAppState()
                                                                .isProcessing) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'กรุณารอ 10 วินาที'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              FFAppState()
                                                                      .isProcessing =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            }

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
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
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
                                                                          GetDateTimeAPICall
                                                                              .messageLayer1(
                                                                        (_model.getServerTime?.jsonBody ??
                                                                            ''),
                                                                      )!),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                            if (!(functions.checkCurrentDateIsBeforeInputDate(
                                                                    GetDateTimeAPICall.currentDateYMD(
                                                                      (_model.getServerTime
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    FFAppState().insuranceinfoActType != 'CMI'
                                                                        ? FFAppState().insuranceInfoEffectiveDateInsure
                                                                        : GetDateTimeAPICall.currentDateYMD(
                                                                            (_model.getServerTime?.jsonBody ??
                                                                                ''),
                                                                          ))! &&
                                                                (FFAppState().insuranceInfoActFlag == '1'
                                                                    ? functions.checkCurrentDateIsBeforeInputDate(
                                                                        GetDateTimeAPICall.currentDateYMD(
                                                                          (_model.getServerTime?.jsonBody ??
                                                                              ''),
                                                                        ),
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
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              250.0,
                                                                          child:
                                                                              EffectiveDatePickerComponentWidget(
                                                                            effectiveDateInsurerFlag: functions.checkCurrentDateIsBeforeInputDate(
                                                                                GetDateTimeAPICall.currentDateYMD(
                                                                                  (_model.getServerTime?.jsonBody ?? ''),
                                                                                ),
                                                                                FFAppState().insuranceinfoActType == 'CMI'
                                                                                    ? GetDateTimeAPICall.currentDateYMD(
                                                                                        (_model.getServerTime?.jsonBody ?? ''),
                                                                                      )
                                                                                    : FFAppState().insuranceInfoEffectiveDateInsure)!,
                                                                            effectiveDateActFlag: FFAppState().insuranceInfoActFlag == '1'
                                                                                ? functions.checkCurrentDateIsBeforeInputDate(
                                                                                    GetDateTimeAPICall.currentDateYMD(
                                                                                      (_model.getServerTime?.jsonBody ?? ''),
                                                                                    ),
                                                                                    FFAppState().insuranceInfoEffectiveDateAct)!
                                                                                : true,
                                                                            effectiveDateInsurer:
                                                                                FFAppState().insuranceInfoEffectiveDateInsure,
                                                                            effectiveFateAct:
                                                                                FFAppState().insuranceInfoEffectiveDateAct,
                                                                            currentDate:
                                                                                GetDateTimeAPICall.currentDateYMD(
                                                                              (_model.getServerTime?.jsonBody ?? ''),
                                                                            )!,
                                                                            actFlag: FFAppState().insuranceInfoActFlag == '1'
                                                                                ? true
                                                                                : false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));

                                                              if (!(functions.checkCurrentDateIsBeforeInputDate(
                                                                      GetDateTimeAPICall.currentDateYMD(
                                                                        (_model.getServerTime?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      FFAppState().insuranceinfoActType != 'CMI'
                                                                          ? FFAppState().insuranceInfoEffectiveDateInsure
                                                                          : GetDateTimeAPICall.currentDateYMD(
                                                                              (_model.getServerTime?.jsonBody ?? ''),
                                                                            ))! &&
                                                                  (FFAppState().insuranceInfoActFlag == '1'
                                                                      ? functions.checkCurrentDateIsBeforeInputDate(
                                                                          GetDateTimeAPICall.currentDateYMD(
                                                                            (_model.getServerTime?.jsonBody ??
                                                                                ''),
                                                                          ),
                                                                          FFAppState().insuranceInfoEffectiveDateAct)!
                                                                      : true))) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text('กรุณาเลือกวันที่คุ้มครองประกันหรือวันที่คุ้มครอง พ.ร.บ.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                FFAppState()
                                                                        .isProcessing =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                Navigator.pop(
                                                                    context);
                                                                if (_shouldSetState)
                                                                  safeSetState(
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
                                                                subProduct:
                                                                    FFAppState()
                                                                        .insuranceinfoActType,
                                                              );

                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model.ibsApplicationEditOutput
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
                                                                        content:
                                                                            Text('พบข้อผิดพลาดConnection (${(_model.ibsApplicationEditOutput?.statusCode ?? 200).toString()})'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                FFAppState()
                                                                        .isProcessing =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                Navigator.pop(
                                                                    context);
                                                                if (_shouldSetState)
                                                                  safeSetState(
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
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text(IbsApplicationsEditCall.messageLayer1(
                                                                          (_model.ibsApplicationEditOutput?.jsonBody ??
                                                                              ''),
                                                                        )!),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                FFAppState()
                                                                        .isProcessing =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                Navigator.pop(
                                                                    context);
                                                                if (_shouldSetState)
                                                                  safeSetState(
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
                                                              quotationId: (widget!.quotationId !=
                                                                              null &&
                                                                          widget!.quotationId !=
                                                                              '') &&
                                                                      (widget!.quotationId !=
                                                                          '')
                                                                  ? widget!
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
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              FFAppState()
                                                                      .isProcessing =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
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
                                                                          PostInsurancePolicyApiCall
                                                                              .messageLayer1(
                                                                        (_model.postPolicyAPIOutPut?.jsonBody ??
                                                                            ''),
                                                                      )!),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              FFAppState()
                                                                      .isProcessing =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              Navigator.pop(
                                                                  context);
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }

                                                            context.pushNamed(
                                                              InsuranceInfoPage5Widget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'quotationId':
                                                                    serializeParam(
                                                                  (widget!.quotationId != null &&
                                                                              widget!.quotationId !=
                                                                                  '') &&
                                                                          (widget!.quotationId !=
                                                                              '')
                                                                      ? widget!
                                                                          .quotationId
                                                                      : FFAppState()
                                                                          .insuranceInfoQuotationId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'leadDtlId':
                                                                    serializeParam(
                                                                  widget!.leadDetailId != null
                                                                      ? widget!
                                                                          .leadDetailId
                                                                      : functions
                                                                          .parseStrToInt(
                                                                              FFAppState().insuranceInfoLeadDetailId),
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            Navigator.pop(
                                                                context);
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        30000));
                                                            FFAppState()
                                                                    .isProcessing =
                                                                false;
                                                            safeSetState(() {});
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
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
                                                                      letterSpacing:
                                                                          0.0,
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
