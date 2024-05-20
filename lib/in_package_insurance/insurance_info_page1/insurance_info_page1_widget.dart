import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_info_page1_model.dart';
export 'insurance_info_page1_model.dart';

class InsuranceInfoPage1Widget extends StatefulWidget {
  const InsuranceInfoPage1Widget({
    super.key,
    this.quotationId,
    this.leadDtailId,
  });

  final String? quotationId;
  final int? leadDtailId;

  @override
  State<InsuranceInfoPage1Widget> createState() =>
      _InsuranceInfoPage1WidgetState();
}

class _InsuranceInfoPage1WidgetState extends State<InsuranceInfoPage1Widget>
    with TickerProviderStateMixin {
  late InsuranceInfoPage1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceInfoPage1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insuranceInfoPage1'});
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
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      setState(() {
        FFAppState().insuranceInfoEffectiveDateAct = '';
        FFAppState().insuranceInfoHaveLicenseBool = false;
      });
      setState(() {
        FFAppState().insuranceInfoPage1SaveDataCheckBool = false;
        FFAppState().insuranceInfoPage2SaveDataCheckBool = false;
        FFAppState().insuranceInfoPage3SaveDataCheckBool = false;
      });
      if (!true) {
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
        setState(() {
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
        });
      }
      _model.getLicenseAPIOutoutCopy = await GetLicenseListCall.call(
        insuranceUrl: FFAppState().apiUrlInsuranceAppState,
        flagGet: '1',
      );
      if ((_model.getLicenseAPIOutoutCopy?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.getLicenseAPIOutoutCopy?.statusCode ?? 200).toString()})'),
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
      if (GetLicenseListCall.statusLayer1(
            (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(GetLicenseListCall.messageLayer1(
                  (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
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
      setState(() {
        FFAppState().addAddressLicenseEmployeeId =
            GetLicenseListCall.employeeid(
          (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().addAddressLicenseTitle = GetLicenseListCall.title(
          (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().addAddressLicenseFirstName = GetLicenseListCall.firstname(
          (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().addAddressLicenseLastName = GetLicenseListCall.lastName(
          (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().addAddressLicenseLicenseId = GetLicenseListCall.licenseid(
          (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().addAddressLicenseExpiredDate =
            GetLicenseListCall.expireddate(
          (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().addAddressLicenseMobilePhone =
            GetLicenseListCall.mobilephone(
          (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().addaddresslicensenBranch = GetLicenseListCall.branchcode(
          (_model.getLicenseAPIOutoutCopy?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
      });
      _model.getOccuAPIOutput = await GetOccupationCall.call(
        insuranceUrl: FFAppState().apiUrlInsuranceAppState,
      );
      if ((_model.getOccuAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (Get Occupation ${(_model.getOccuAPIOutput?.statusCode ?? 200).toString()})'),
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
      if (GetOccupationCall.statuslayer1(
            (_model.getOccuAPIOutput?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(GetOccupationCall.messageLayer1(
                  (_model.getOccuAPIOutput?.jsonBody ?? ''),
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
      setState(() {
        FFAppState().insuranceInfoOccupationCode =
            GetOccupationCall.occupationcode(
          (_model.getOccuAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().insuranceInfoOccupationName =
            GetOccupationCall.occupationname(
          (_model.getOccuAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().insuranceInfoOccupationSubCode =
            GetOccupationCall.occupationsubcode(
          (_model.getOccuAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().insuranceInfoOccupationSubName =
            GetOccupationCall.occupationsubname(
          (_model.getOccuAPIOutput?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
      });
      _model.detailAPIOutput = await IbsApplicationsDetailCall.call(
        quotationId: widget.quotationId,
        insuranceUrl: FFAppState().apiUrlInsuranceAppState,
        token: FFAppState().accessToken,
      );
      if ((_model.detailAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.detailAPIOutput?.statusCode ?? 200).toString()})'),
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
            (_model.detailAPIOutput?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(IbsApplicationsDetailCall.messageLayer1(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
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
      setState(() {
        FFAppState().insuranceInfoCardType =
            '${IbsApplicationsDetailCall.idtypeid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoGender = '${IbsApplicationsDetailCall.gender(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoTitle = '${IbsApplicationsDetailCall.titleth(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoOccupationGroup =
            '${IbsApplicationsDetailCall.occupationname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoIdCard =
            '${IbsApplicationsDetailCall.nationalthaiid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoFirstName =
            '${IbsApplicationsDetailCall.quotationtype(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == 'auto' ? (IbsApplicationsDetailCall.firstnameth(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != '' ? IbsApplicationsDetailCall.firstnameth(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.firstname(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )) : () {
                if (IbsApplicationsDetailCall.firstnameth(
                      (_model.detailAPIOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
                  return IbsApplicationsDetailCall.firstnameth(
                    (_model.detailAPIOutput?.jsonBody ?? ''),
                  );
                } else if (IbsApplicationsDetailCall.firstname(
                      (_model.detailAPIOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
                  return IbsApplicationsDetailCall.firstname(
                    (_model.detailAPIOutput?.jsonBody ?? ''),
                  );
                } else {
                  return IbsApplicationsDetailCall.manualFirstName(
                    (_model.detailAPIOutput?.jsonBody ?? ''),
                  );
                }
              }()}';
        FFAppState().insuranceInfoLastName =
            '${IbsApplicationsDetailCall.quotationtype(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == 'auto' ? (IbsApplicationsDetailCall.lastnameth(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != '' ? IbsApplicationsDetailCall.lastnameth(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.lastname(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )) : () {
                if (IbsApplicationsDetailCall.lastnameth(
                      (_model.detailAPIOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
                  return IbsApplicationsDetailCall.lastnameth(
                    (_model.detailAPIOutput?.jsonBody ?? ''),
                  );
                } else if (IbsApplicationsDetailCall.lastname(
                      (_model.detailAPIOutput?.jsonBody ?? ''),
                    ) !=
                    '') {
                  return IbsApplicationsDetailCall.lastname(
                    (_model.detailAPIOutput?.jsonBody ?? ''),
                  );
                } else {
                  return (IbsApplicationsDetailCall.manualLastName(
                            (_model.detailAPIOutput?.jsonBody ?? ''),
                          ) ==
                          ''
                      ? ''
                      : IbsApplicationsDetailCall.manualLastName(
                          (_model.detailAPIOutput?.jsonBody ?? ''),
                        ));
                }
              }()}';
        FFAppState().insuranceInfoBirthDate =
            '${IbsApplicationsDetailCall.birthday(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoOccupation =
            '${IbsApplicationsDetailCall.occupationname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPhonenumber =
            '${IbsApplicationsDetailCall.quotationtype(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == 'auto' ? (IbsApplicationsDetailCall.mobile1(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != '' ? IbsApplicationsDetailCall.mobile1(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.phonenumber(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )) : (IbsApplicationsDetailCall.mobile1(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != '' ? IbsApplicationsDetailCall.mobile1(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : (IbsApplicationsDetailCall.manualPhoneNumber(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.manualPhoneNumber(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )))}';
        FFAppState().insuranceInfoOtherPhone =
            '${IbsApplicationsDetailCall.mobile2(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoEmail = '${IbsApplicationsDetailCall.email1(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoAge = '${IbsApplicationsDetailCall.age(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoGarageType =
            '${IbsApplicationsDetailCall.garagetypename(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?[functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data.leads_detail[:].lead_dtl_id''',
                  true,
                )).toList(), widget.leadDtailId)]}';
        FFAppState().insuranceInfocoverType =
            '${IbsApplicationsDetailCall.covertypename(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?[functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data.leads_detail[:].lead_dtl_id''',
                  true,
                )).toList(), widget.leadDtailId)]}';
        FFAppState().insuranceInfoGrossTotal =
            '${IbsApplicationsDetailCall.grosstotalnetList(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?[functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data.leads_detail[:].lead_dtl_id''',
                  true,
                )).toList(), widget.leadDtailId)]}';
        FFAppState().insuranceInfoVehicleType =
            '${IbsApplicationsDetailCall.quotationtype(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == 'auto' ? IbsApplicationsDetailCall.cartype(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.manualCarType(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().insuranceInfoBrandName =
            '${IbsApplicationsDetailCall.carbrandname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoModelName =
            '${IbsApplicationsDetailCall.carmodelname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoRegisYear =
            '${IbsApplicationsDetailCall.carregistrationyear(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoProductYear =
            '${IbsApplicationsDetailCall.makeYear(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoVehicleUsage =
            '${IbsApplicationsDetailCall.vehiclecode(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )} ${IbsApplicationsDetailCall.vehiclename(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoCarRegis =
            '${IbsApplicationsDetailCall.carregistrationData(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != null && IbsApplicationsDetailCall.carregistrationData(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != '' ? IbsApplicationsDetailCall.carregistrationData(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.carregistration(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().insuranceInfoBodyNumber =
            '${IbsApplicationsDetailCall.bodynumber(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoEngineNumber =
            '${IbsApplicationsDetailCall.enginenumber(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoCarSeat = '${IbsApplicationsDetailCall.seat(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoSizeCar = '${IbsApplicationsDetailCall.cc(
              (_model.detailAPIOutput?.jsonBody ?? ''),
            ) != '' ? IbsApplicationsDetailCall.cc(
            (_model.detailAPIOutput?.jsonBody ?? ''),
          ) : (IbsApplicationsDetailCall.leaddetailcc(
            (_model.detailAPIOutput?.jsonBody ?? ''),
          )?[functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
              (_model.detailAPIOutput?.jsonBody ?? ''),
              r'''$.results.data.leads_detail[:].lead_dtl_id''',
              true,
            )).toList(), widget.leadDtailId)])}';
        FFAppState().insuranceInfoWeightCar =
            '${IbsApplicationsDetailCall.weight(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoActAmount =
            '${IbsApplicationsDetailCall.acttotal(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoAccessoryProtect = '${() {
          if (IbsApplicationsDetailCall.accessoryflg(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) ==
              '1') {
            return 'คุ้มครองอุปกรณ์เสริม';
          } else if (IbsApplicationsDetailCall.accessoryflg(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) ==
              '0') {
            return 'ไม่คุ้มครองอุปกรณ์เสริม';
          } else {
            return '';
          }
        }()}';
        FFAppState().addAddressAtIdCard = '${IbsApplicationsDetailCall.keyword(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressAtIdCard2 =
            '${IbsApplicationsDetailCall.addressline1(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressAtIdCard3 =
            '${IbsApplicationsDetailCall.addressline2(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressForDoc = '${IbsApplicationsDetailCall.keyword(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAddressForDoc2 =
            '${IbsApplicationsDetailCall.addressline1(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAddressForDoc3 =
            '${IbsApplicationsDetailCall.addressline2(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAddressSelectProvinceId =
            '${IbsApplicationsDetailCall.provinceid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressSelectProvinceName =
            '${IbsApplicationsDetailCall.provincename(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressSelectDistrictId =
            '${IbsApplicationsDetailCall.districtid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressSelectDistrictName =
            '${IbsApplicationsDetailCall.districtname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressSelectSubdistrictId =
            '${IbsApplicationsDetailCall.subdistrictid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressSelectSubdistrictName =
            '${IbsApplicationsDetailCall.subdistrictname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressSelectZipCode =
            '${IbsApplicationsDetailCall.zipcode(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().addAddressSelectKeyWord =
            '${IbsApplicationsDetailCall.keyword(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.last}';
        FFAppState().insuranceInfoActOflLegislation = '${() {
          if (IbsApplicationsDetailCall.actflg(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) ==
              '1') {
            return 'ราคารวม พ.ร.บ';
          } else if (IbsApplicationsDetailCall.actflg(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) ==
              '0') {
            return 'ราคาไม่รวม พ.ร.บ';
          } else {
            return '';
          }
        }()}';
        FFAppState().addAdressSelectDocProvinceId =
            '${IbsApplicationsDetailCall.provinceid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAdressSelectDocProvinceName =
            '${IbsApplicationsDetailCall.provincename(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAdressSelectDocDistrictName =
            '${IbsApplicationsDetailCall.districtname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAddressSelectDocDistrictId =
            '${IbsApplicationsDetailCall.districtid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAddressSelectDocSubdistrictId =
            '${IbsApplicationsDetailCall.subdistrictid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAddressSelectDocSubdistrictName =
            '${IbsApplicationsDetailCall.subdistrictname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAddressSelectDocZipCode =
            '${IbsApplicationsDetailCall.zipcode(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().addAddressSelectDocKeyWord =
            '${IbsApplicationsDetailCall.keyword(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?.first}';
        FFAppState().insuranceInfoBeneficiaryName =
            '${IbsApplicationsDetailCall.beneficiaryname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoSelectOccupationName =
            '${IbsApplicationsDetailCall.occupationname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoCompayId =
            '${IbsApplicationsDetailCall.insurershortname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?[functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data.leads_detail[:].lead_dtl_id''',
                  true,
                )).toList(), widget.leadDtailId)]}';
        FFAppState().insuranceInfoLeadDetailId =
            '${(IbsApplicationsDetailCall.leaddtlid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?[functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data.leads_detail[:].lead_dtl_id''',
                  true,
                )).toList(), widget.leadDtailId)])?.toString()}';
        FFAppState().insuranceInfoSelectOccupationSubNameChoose =
            '${IbsApplicationsDetailCall.occupationsubname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoLicenseFirstName =
            '${IbsApplicationsDetailCall.employeefirstnamelicense(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoLicenseLastName =
            '${IbsApplicationsDetailCall.employeelastnamelicense(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoLicenseMobilePhone =
            '${IbsApplicationsDetailCall.employeephonenumberlicense(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoQuotationId = '${widget.quotationId}';
        FFAppState().insuranceInfoLicenseEmployeeId =
            '${IbsApplicationsDetailCall.employeecodelicense(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoRegistrationCodeSelect =
            '${IbsApplicationsDetailCall.registrationcode(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != null && IbsApplicationsDetailCall.registrationcode(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != '' ? IbsApplicationsDetailCall.registrationcode(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.carprovincecode(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().insuranceInfoRegistrationProvinceSelect =
            '${IbsApplicationsDetailCall.registrationprovince(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != null && IbsApplicationsDetailCall.registrationprovince(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != '' ? IbsApplicationsDetailCall.registrationprovince(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.carprovincename(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().insuranceInfoLicenseImg =
            '${IbsApplicationsDetailCall.employeelicenseimglicense(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoLicenseExpiredDate =
            '${IbsApplicationsDetailCall.employeelicenseexplicense(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoLicenseLicenseId =
            '${IbsApplicationsDetailCall.employeelicenseidlicense(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoAccessory =
            '${IbsApplicationsDetailCall.accessorytotal(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?[functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data.leads_detail[:].lead_dtl_id''',
                  true,
                )).toList(), widget.leadDtailId)]}';
        FFAppState().insuranceInfoApplicationType =
            '${IbsApplicationsDetailCall.quotationtypebak(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoVehicleId =
            '${IbsApplicationsDetailCall.vehicleid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoVehicleCode =
            '${IbsApplicationsDetailCall.vehiclecode(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoVehicleName =
            '${IbsApplicationsDetailCall.vehiclename(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoBrandId =
            '${IbsApplicationsDetailCall.carbrandid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuarnceInfoModelId =
            '${IbsApplicationsDetailCall.carmodelid(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoSelectOccupationCode =
            '${IbsApplicationsDetailCall.occupationCode(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4NetPremiumTotal =
            '${(IbsApplicationsDetailCall.netpremiumtotalAppdetail(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != '0') && (IbsApplicationsDetailCall.netpremiumtotalAppdetail(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) != '') ? IbsApplicationsDetailCall.netpremiumtotalAppdetail(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : '${IbsApplicationsDetailCall.netpremium(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )?[functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data.leads_detail[:].lead_dtl_id''',
                  true,
                )).toList(), widget.leadDtailId)]}'}';
        FFAppState().insuranceInfoActFlag = '${IbsApplicationsDetailCall.actflg(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoGrosstotalNet =
            '${IbsApplicationsDetailCall.grosstotalnet(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoEffectiveDateAct =
            '${IbsApplicationsDetailCall.effectiveDateAct(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.effectiveDateAct(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().insuranceInfoEffectiveDateInsure =
            '${IbsApplicationsDetailCall.effectiveDateInsure(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.effectiveDateInsure(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().insuranceInfoInsuranceLogo =
            '${IbsApplicationsDetailCall.insurerlogo(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )?[functions.getIndexOfIntList(functions.convertDynamicListToIntList(getJsonField(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                  r'''$.results.data.leads_detail[:].lead_dtl_id''',
                  true,
                )).toList(), widget.leadDtailId)]}';
        FFAppState().insuranceInfoCarTypeDetail =
            '${IbsApplicationsDetailCall.cartypedetail(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().flagRenew = '${IbsApplicationsDetailCall.flgrenew(
              (_model.detailAPIOutput?.jsonBody ?? ''),
            ) != null && IbsApplicationsDetailCall.flgrenew(
              (_model.detailAPIOutput?.jsonBody ?? ''),
            ) != '' ? IbsApplicationsDetailCall.flgrenew(
            (_model.detailAPIOutput?.jsonBody ?? ''),
          ) : IbsApplicationsDetailCall.flgrenewlead(
            (_model.detailAPIOutput?.jsonBody ?? ''),
          )}';
        FFAppState().insuranceinfoActType =
            '${IbsApplicationsDetailCall.subProduct(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceinfoQuotationTypeName =
            '${IbsApplicationsDetailCall.quotationtypename(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceinfoQuotationTypeBakName =
            '${IbsApplicationsDetailCall.quotationtypebakname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceinfoSubProductName =
            '${IbsApplicationsDetailCall.subproductname(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().InsuranceInfoVedioCallFile = '${''}';
      });
      setState(() {
        FFAppState().insuranceInfoPage4FileLoanApplicationRegister =
            '${IbsApplicationsDetailCall.imgfileloanapplicationregister(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage4ImageApplication =
            '${IbsApplicationsDetailCall.imageapplication(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageIdCard =
            '${IbsApplicationsDetailCall.imageidcard(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageBluebook =
            '${IbsApplicationsDetailCall.imagebluebook(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageExamination =
            '${IbsApplicationsDetailCall.imageexamination(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageFront =
            '${IbsApplicationsDetailCall.imagefront(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPageImageRear =
            '${IbsApplicationsDetailCall.imagerear(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageLeft =
            '${IbsApplicationsDetailCall.imageleft(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageRight =
            '${IbsApplicationsDetailCall.imageright(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageRightFront =
            '${IbsApplicationsDetailCall.imagerightfront(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageRightRear =
            '${IbsApplicationsDetailCall.imagerightrear(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageLeftFront =
            '${IbsApplicationsDetailCall.imageleftfront(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageLeftRear =
            '${IbsApplicationsDetailCall.imageleftrear(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageRoof =
            '${IbsApplicationsDetailCall.imageroof(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
        FFAppState().insuranceInfoPage3ImageOther =
            '${IbsApplicationsDetailCall.imageother(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
      });
      setState(() {
        FFAppState().insuranceInfoPage3ImageWound = functions
            .addImgUrlToList(
                IbsApplicationsDetailCall.imagewound1(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imagewound2(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imagewound3(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imagewound4(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imagewound5(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imagewound6(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ))!
            .toList()
            .cast<String>();
        FFAppState().insuranceInfoPage3ImageAccessories = functions
            .addImgUrlToList(
                IbsApplicationsDetailCall.imageaccessories1(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imageaccessories2(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imageaccessories3(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imageaccessories4(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imageaccessories5(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ),
                IbsApplicationsDetailCall.imageaccessories6(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ))!
            .toList()
            .cast<String>();
      });
      setState(() {
        FFAppState().nonePackageImageFrontUploaded =
            '${IbsApplicationsDetailCall.imagefront(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageFront(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imagefront(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageRightFrontUploaded =
            '${IbsApplicationsDetailCall.imagerightfront(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageRightFront(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imagerightfront(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageRightUploaded =
            '${IbsApplicationsDetailCall.imageright(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageRight(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageright(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageRightRearUploaded =
            '${IbsApplicationsDetailCall.imagerightrear(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageRightRear(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imagerightrear(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageRearUploaded =
            '${IbsApplicationsDetailCall.imagerear(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageRear(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imagerear(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageLeftRearUploaded =
            '${IbsApplicationsDetailCall.imageleftrear(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageLeftRear(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageleftrear(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageLeftUploaded =
            '${IbsApplicationsDetailCall.imageleft(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageLeft(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageleft(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageLeftFrontUploaded =
            '${IbsApplicationsDetailCall.imageleftfront(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageLeftFront(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageleftfront(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageRoofUploaded =
            '${IbsApplicationsDetailCall.imageroof(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageRoof(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageroof(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
      });
      setState(() {
        FFAppState().nonePackageTrailerImageFrontUploaded =
            '${IbsApplicationsDetailCall.imageFrontTrailer(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageTrailerImageFront(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageFrontTrailer(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageTrailerImageRightFrontUploaded =
            '${IbsApplicationsDetailCall.imageRightFrontTrailer(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageTrailerImageRightFront(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageRightFrontTrailer(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageTrailerImageRightUploaded =
            '${IbsApplicationsDetailCall.imageRightTrailer(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageTrailerImageRight(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageRightTrailer(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageTrailerImageRightRearUploaded =
            '${IbsApplicationsDetailCall.imageRightRearTrailer(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageTrailerImageRightRear(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageRightRearTrailer(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageTrailerImageRearUploaded =
            '${IbsApplicationsDetailCall.imageRearTrailer(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageTrailerImageRear(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageRearTrailer(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageTrailerImageLeftRearUploaded =
            '${IbsApplicationsDetailCall.imageLeftRearTrailer(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageTrailerImageLeftRear(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageLeftRearTrailer(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageTrailerImageLeftUploaded =
            '${IbsApplicationsDetailCall.imageLeftTrailer(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageTrailerImageLeft(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageLeftTrailer(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageTrailerImageLeftFrontUploaded =
            '${IbsApplicationsDetailCall.imageLeftFrontTrailer(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageTrailerImageLeftFront(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageLeftFrontTrailer(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
      });
      setState(() {
        FFAppState().nonePackageIdCardImageUrl =
            '${IbsApplicationsDetailCall.imageidcard(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageIdCard(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageidcard(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageBlueBookUploaded =
            '${IbsApplicationsDetailCall.imagebluebook(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageBlueBook(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imagebluebook(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageOldVmiImageUrl =
            '${IbsApplicationsDetailCall.imageOldVmi(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageOldVmi(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageOldVmi(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageCompanyBookImageUrl =
            '${IbsApplicationsDetailCall.imageCompanyBook(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? IbsApplicationsDetailCall.nonePackageImageCompanyBook(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              ) : IbsApplicationsDetailCall.imageCompanyBook(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageImageQuotationPdfUploaded =
            '${IbsApplicationsDetailCall.imageQuotationInsurer(
          (_model.detailAPIOutput?.jsonBody ?? ''),
        )}';
      });
      setState(() {
        FFAppState().nonePackageFlagCarrier =
            IbsApplicationsDetailCall.flagCarrier(
                      (_model.detailAPIOutput?.jsonBody ?? ''),
                    ) ==
                    '1'
                ? true
                : false;
        FFAppState().nonePackageFlagCoop = IbsApplicationsDetailCall.flagCoop(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) ==
                '1'
            ? true
            : false;
        FFAppState().nonePackageCarrierType =
            '${IbsApplicationsDetailCall.carrierType(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.carrierType(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageCarrierPrice =
            '${IbsApplicationsDetailCall.carrierPrice(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.carrierPrice(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageTruckPart =
            '${IbsApplicationsDetailCall.truckPart(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : (IbsApplicationsDetailCall.truckPart(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '1' ? 'หัวลาก + หางพ่วง' : 'เฉพาะหัวลาก')}';
        FFAppState().nonePackageCusMembership =
            '${IbsApplicationsDetailCall.customerMemberchip(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : (IbsApplicationsDetailCall.customerMemberchip(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '1' ? 'ลูกค้าสินเชื่อ' : 'ลูกค้านอก')}';
        FFAppState().nonePackageTruckCarryPurpose =
            '${IbsApplicationsDetailCall.truckCarryPurpose(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.truckCarryPurpose(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageTruckCurrentPrice =
            '${IbsApplicationsDetailCall.truckCurrentPrice(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.truckCurrentPrice(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackagePlateAdditional =
            '${IbsApplicationsDetailCall.plateAdditional(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.plateAdditional(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageOldVmi =
            '${IbsApplicationsDetailCall.nonePackageOldVmi(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.nonePackageOldVmi(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageOldVmiExpDate =
            '${IbsApplicationsDetailCall.nonePackageVmiExpDate(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.nonePackageVmiExpDate(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageFlagRenew =
            IbsApplicationsDetailCall.nonePackageFlagRenew(
                      (_model.detailAPIOutput?.jsonBody ?? ''),
                    ) ==
                    '1'
                ? true
                : false;
        FFAppState().nonePackageCustomerType =
            '${IbsApplicationsDetailCall.nonePackageCustomerType(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.nonePackageCustomerType(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageFlagOldVmi =
            '${IbsApplicationsDetailCall.nonePackageFlagOldVmi(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.nonePackageFlagOldVmi(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().nonePackageWorkType =
            '${IbsApplicationsDetailCall.workType(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.workType(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
      });
      setState(() {
        FFAppState().insuranceInfoBranchCode =
            '${IbsApplicationsDetailCall.incentiveBranchCode(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.incentiveBranchCode(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
        FFAppState().insuranceInfoBranchNameOutput =
            '${IbsApplicationsDetailCall.incentiveBranchName(
                  (_model.detailAPIOutput?.jsonBody ?? ''),
                ) == '' ? '' : IbsApplicationsDetailCall.incentiveBranchName(
                (_model.detailAPIOutput?.jsonBody ?? ''),
              )}';
      });
      setState(() {
        _model.idCardTextFieldTextController1?.text =
            FFAppState().insuranceInfoIdCard;
      });
      setState(() {
        _model.cusNameTextFieldTextController?.text =
            FFAppState().insuranceInfoFirstName;
      });
      setState(() {
        _model.cusLastnameTextFieldTextController?.text =
            FFAppState().insuranceInfoLastName;
      });
      setState(() {
        _model.cusOcputationTextFieldTextController?.text =
            FFAppState().insuranceInfoSelectOccupationSubNameChoose;
      });
      setState(() {
        _model.cusPhoneTextFieldTextController?.text =
            FFAppState().insuranceInfoPhonenumber;
      });
      setState(() {
        _model.cusPhoneOtherTextFieldTextController?.text =
            FFAppState().insuranceInfoOtherPhone;
      });
      setState(() {
        _model.emailTextFieldTextController?.text =
            FFAppState().insuranceInfoEmail;
      });
      setState(() {
        _model.ageTextFieldTextController?.text = FFAppState().insuranceInfoAge;
      });
      setState(() {
        _model.licenseCodeTextController?.text =
            FFAppState().insuranceInfoLicenseEmployeeId;
      });
      if (FFAppState().insuranceInfoSelectOccupationName != null &&
          FFAppState().insuranceInfoSelectOccupationName != '') {
        setState(() {
          FFAppState().insuranceInfoSelectOccupationSubName = functions
              .returnMappedListFrom2List(
                  FFAppState().insuranceInfoOccupationSubName.toList(),
                  FFAppState().insuranceInfoOccupationName.toList(),
                  FFAppState().insuranceInfoSelectOccupationName)
              .toList()
              .cast<String>();
        });
      }
      if (FFAppState().insuranceInfoLicenseEmployeeId != '') {
        setState(() {
          FFAppState().insuranceInfoHaveLicenseBool = true;
        });
      }
      Navigator.pop(context);
      if (FFAppState().insuranceInfoApplicationType != 'auto') {
        if (!((functions.checkNullValueAndReturn(
                    FFAppState().insuranceInfoPage4NetPremiumTotal) !=
                '-') &&
            (functions.checkNullValueAndReturn(
                    FFAppState().insuranceInfoPage4NetPremiumTotal) !=
                ''))) {
          if ((functions.checkNullValueAndReturn(
                      FFAppState().insuranceInfoPage4NetPremiumTotal) !=
                  '-') &&
              (functions.checkNullValueAndReturn(
                      FFAppState().insuranceInfoPage4NetPremiumTotal) !=
                  '')) {
            if (functions.stringToDouble(
                    FFAppState().insuranceInfoPage4NetPremiumTotal) <=
                0.0) {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                    child: AlertDialog(
                      content: Text('กรุณากรอกราคาเบี้ยรวม'),
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
              context.safePop();
            }
          }
        }
      }
      if (FFAppState()
          .addAddressLicenseEmployeeId
          .contains(FFAppState().employeeID)) {
        setState(() {
          FFAppState().insuranceInfoHaveLicenseBool = true;
        });
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
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        _model.profileImgOutputPage = await GetProfileImageCall.call(
          employeeCode: FFAppState().employeeID,
          insuranceUrl: FFAppState().apiUrlInsuranceAppState,
        );
        if ((_model.profileImgOutputPage?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาด (${(_model.profileImgOutputPage?.statusCode ?? 200).toString()})'),
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
        if (GetProfileImageCall.statusLayer1(
              (_model.profileImgOutputPage?.jsonBody ?? ''),
            ) !=
            200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(GetProfileImageCall.messageLayer1(
                    (_model.profileImgOutputPage?.jsonBody ?? ''),
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
        setState(() {
          FFAppState().insuranceInfoLicenseEmployeeId =
              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().employeeID)}';
          FFAppState().insuranceInfoLicenseTitle =
              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseTitle.toList(), FFAppState().employeeID)}';
          FFAppState().insuranceInfoLicenseFirstName =
              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseFirstName.toList(), FFAppState().employeeID)}';
          FFAppState().insuranceInfoLicenseLastName =
              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseLastName.toList(), FFAppState().employeeID)}';
          FFAppState().insuranceInfoLicenseLicenseId =
              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseLicenseId.toList(), FFAppState().employeeID)}';
          FFAppState().insuranceInfoLicenseExpiredDate =
              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseExpiredDate.toList(), FFAppState().employeeID)}';
          FFAppState().insuranceInfoLicenseMobilePhone =
              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseMobilePhone.toList(), FFAppState().employeeID)}';
          FFAppState().insuranceInfoLicenseImg =
              '${GetProfileImageCall.imgProfile(
            (_model.profileImgOutputPage?.jsonBody ?? ''),
          )}';
          FFAppState().insuranceInfoLicenseBranch =
              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addaddresslicensenBranch.toList(), FFAppState().employeeID)}';
        });
        setState(() {
          _model.licenseCodeTextController?.text =
              FFAppState().insuranceInfoLicenseEmployeeId;
        });
        Navigator.pop(context);
      }
    });

    _model.idCardTextFieldTextController1 ??=
        TextEditingController(text: FFAppState().insuranceInfoIdCard);
    _model.idCardTextFieldFocusNode1 ??= FocusNode();

    _model.idCardTextFieldTextController2 ??= TextEditingController();
    _model.idCardTextFieldFocusNode2 ??= FocusNode();

    _model.cusNameTextFieldTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoFirstName);
    _model.cusNameTextFieldFocusNode ??= FocusNode();

    _model.cusLastnameTextFieldTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoLastName);
    _model.cusLastnameTextFieldFocusNode ??= FocusNode();

    _model.ageTextFieldTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoAge);
    _model.ageTextFieldFocusNode ??= FocusNode();

    _model.cusOcputationTextFieldTextController ??= TextEditingController(
        text: FFAppState().insuranceInfoSelectOccupationSubNameChoose != null &&
                FFAppState().insuranceInfoSelectOccupationSubNameChoose != ''
            ? FFAppState().insuranceInfoSelectOccupationSubNameChoose
            : '');
    _model.cusOcputationTextFieldFocusNode ??= FocusNode();

    _model.cusPhoneTextFieldTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoPhonenumber);
    _model.cusPhoneTextFieldFocusNode ??= FocusNode();

    _model.cusPhoneOtherTextFieldTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoOtherPhone);
    _model.cusPhoneOtherTextFieldFocusNode ??= FocusNode();

    _model.emailTextFieldTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoEmail);
    _model.emailTextFieldFocusNode ??= FocusNode();

    _model.licenseCodeTextController ??= TextEditingController(
        text: FFAppState().insuranceInfoLicenseEmployeeId);
    _model.licenseCodeFocusNode ??= FocusNode();

    _model.vedioCallLinkTextController ??=
        TextEditingController(text: FFAppState().InsuranceInfoVedioCallFile);
    _model.vedioCallLinkFocusNode ??= FocusNode();
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
                await Future.delayed(const Duration(milliseconds: 500));

                context.goNamed('LeadFollowUpPage');
              },
            ),
            title: Text(
              '1. ข้อมูลส่วนตัวบุคคล (ลูกค้า)',
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
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 0.0),
              child: FutureBuilder<List<DataListRecord>>(
                future: queryDataListRecordOnce(
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
                  List<DataListRecord> columnDataListRecordList =
                      snapshot.data!;
                  final columnDataListRecord =
                      columnDataListRecordList.isNotEmpty
                          ? columnDataListRecordList.first
                          : null;
                  return SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (FFAppState().insuranceinfoActType != 'CMI')
                              wrapWithModel(
                                model: _model.infomationCustomerModel,
                                updateCallback: () => setState(() {}),
                                child: InfomationCustomerWidget(),
                              ),
                            if (FFAppState().insuranceinfoActType == 'CMI')
                              wrapWithModel(
                                model: _model.infomationCustomerActModel,
                                updateCallback: () => setState(() {}),
                                child: InfomationCustomerActWidget(),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.06,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFB3B3B3),
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '2',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.06,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFB3B3B3),
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '3',
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
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.06,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFB3B3B3),
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '4',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.06,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.11,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFB3B3B3),
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '5',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFB3B3B3),
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
                            ),
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
                                            'ประเภทบัตร',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
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
                                            'SearchableListPage',
                                            queryParameters: {
                                              'titleText': serializeParam(
                                                'ประเภทบัตร',
                                                ParamType.String,
                                              ),
                                              'searchLabel': serializeParam(
                                                'ระบุประเภทบัตร',
                                                ParamType.String,
                                              ),
                                              'dataList': serializeParam(
                                                columnDataListRecord?.cardType,
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
                                              'fromPage': serializeParam(
                                                'insuranceInfoPage1',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          await actions.hideKeyboardAction(
                                            context,
                                          );
                                        },
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
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: ListTile(
                                                title: Text(
                                                  () {
                                                    if ((FFAppState()
                                                                .insuranceInfoCardType ==
                                                            '1') ||
                                                        (FFAppState()
                                                                .insuranceInfoCardType ==
                                                            'บัตรประชาชน')) {
                                                      return 'บัตรประชาชน';
                                                    } else if ((FFAppState()
                                                                .insuranceInfoCardType ==
                                                            '2') ||
                                                        (FFAppState()
                                                                .insuranceInfoCardType ==
                                                            'Passport')) {
                                                      return 'Passport';
                                                    } else {
                                                      return 'กรุณาเลือกประเภทบัตร';
                                                    }
                                                  }(),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: functions
                                                                .containWordinStringUrl(
                                                                    'เลือก',
                                                                    FFAppState()
                                                                        .insuranceInfoCardType)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF474747),
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.55,
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
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.addressCard,
                                                  color: Color(0xFF57636C),
                                                  size: 24.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'เครื่องอ่านบัตรประชาชน',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFF003063),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.37,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFCEFE4),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .file_download_outlined,
                                                          color:
                                                              Color(0xFFD9761A),
                                                          size: 24.0,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'ดึงข้อมูล',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFD9761A),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if ((FFAppState().insuranceInfoCardType ==
                                        'บัตรประชาชน') ||
                                    (FFAppState().insuranceInfoCardType == '1')
                                ? true
                                : false)
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
                                              'กรอกเลขบัตรลูกค้า',
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
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '(บังคับกรอก)',
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
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.55,
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
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .idCardTextFieldTextController1,
                                                          focusNode: _model
                                                              .idCardTextFieldFocusNode1,
                                                          autofocus: false,
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
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'กรุณากรอกเลขบัตร',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedErrorBorder:
                                                                InputBorder
                                                                    .none,
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
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .idCardTextFieldTextController1Validator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            _model
                                                                .idCardTextFieldMask1
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (((_model.checkBlackListOutput
                                                                  ?.statusCode ??
                                                              200) !=
                                                          200) &&
                                                      (CheckBlackListCall
                                                              .statuslayer1(
                                                            (_model.checkBlackListOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          200) &&
                                                      (CheckBlackListCall
                                                              .blacklistflag(
                                                            (_model.checkBlackListOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          'N'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.error_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  if (((_model.checkBlackListOutput
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (CheckBlackListCall
                                                              .statuslayer1(
                                                            (_model.checkBlackListOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200) &&
                                                      (CheckBlackListCall
                                                              .blacklistflag(
                                                            (_model.checkBlackListOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          'N'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.check,
                                                        color:
                                                            Color(0xFF00B505),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  var _shouldSetState = false;
                                                  if (!functions
                                                      .checkIdCardInput(functions
                                                          .removeCommaFromNumText(
                                                              _model
                                                                  .idCardTextFieldTextController1
                                                                  .text))) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอกเลขบัตร 13 หลัก'),
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
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                  if (!functions.checkIdCard(functions
                                                      .removeCommaFromNumText(_model
                                                          .idCardTextFieldTextController1
                                                          .text))!) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอกเลขบัตรให้ถูกต้อง'),
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
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                  await actions
                                                      .hideKeyboardAction(
                                                    context,
                                                  );
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
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  _model.checkBlackListOutput =
                                                      await CheckBlackListCall
                                                          .call(
                                                    nationalThaiId: functions
                                                        .removeCommaFromNumText(
                                                            _model
                                                                .idCardTextFieldTextController1
                                                                .text),
                                                    insuranceUrl: FFAppState()
                                                        .apiUrlInsuranceAppState,
                                                    idTypeId: FFAppState()
                                                                .insuranceInfoCardType ==
                                                            'บัตรประชาชน'
                                                        ? '1'
                                                        : '2',
                                                    quotationId: FFAppState()
                                                        .insuranceInfoQuotationId,
                                                    token: FFAppState()
                                                        .accessToken,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.checkBlackListOutput
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
                                                                'พบข้อผิดพลาด (${(_model.checkBlackListOutput?.statusCode ?? 200).toString()})'),
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
                                                      setState(() {});
                                                    return;
                                                  }
                                                  if (CheckBlackListCall
                                                          .statuslayer1(
                                                        (_model.checkBlackListOutput
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
                                                                CheckBlackListCall
                                                                    .messageLayer1(
                                                              (_model.checkBlackListOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!),
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
                                                      setState(() {});
                                                    return;
                                                  }
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.37,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFCEFE4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.list,
                                                            color: Color(
                                                                0xFFD9761A),
                                                            size: 20.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'ตรวจสอบรายชื่อ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: Color(
                                                                        0xFFD9761A),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
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
                                    ],
                                  ),
                                ),
                              ),
                            if ((FFAppState().insuranceInfoCardType ==
                                        'Passport') ||
                                    (FFAppState().insuranceInfoCardType == '2')
                                ? true
                                : false)
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
                                              'กรอกเลขบัตรลูกค้า',
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
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '(บังคับกรอก)',
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
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.55,
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
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .idCardTextFieldTextController2,
                                                          focusNode: _model
                                                              .idCardTextFieldFocusNode2,
                                                          autofocus: false,
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
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'กรุณากรอกเลขบัตร',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedErrorBorder:
                                                                InputBorder
                                                                    .none,
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
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          validator: _model
                                                              .idCardTextFieldTextController2Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (((_model.checkBlackListOutput2
                                                                  ?.statusCode ??
                                                              200) !=
                                                          200) &&
                                                      (CheckBlackListCall
                                                              .statuslayer1(
                                                            (_model.checkBlackListOutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          200) &&
                                                      (CheckBlackListCall
                                                              .blacklistflag(
                                                            (_model.checkBlackListOutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          'N'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.error_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  if (((_model.checkBlackListOutput2
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (CheckBlackListCall
                                                              .statuslayer1(
                                                            (_model.checkBlackListOutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200) &&
                                                      (CheckBlackListCall
                                                              .blacklistflag(
                                                            (_model.checkBlackListOutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          'N'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.check,
                                                        color:
                                                            Color(0xFF00B505),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  var _shouldSetState = false;
                                                  await actions
                                                      .hideKeyboardAction(
                                                    context,
                                                  );
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
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  _model.checkBlackListOutput2 =
                                                      await CheckBlackListCall
                                                          .call(
                                                    nationalThaiId: functions
                                                        .removeCommaFromNumText(
                                                            _model
                                                                .idCardTextFieldTextController2
                                                                .text),
                                                    insuranceUrl: FFAppState()
                                                        .apiUrlInsuranceAppState,
                                                    idTypeId: FFAppState()
                                                                .insuranceInfoCardType ==
                                                            'บัตรประชาชน'
                                                        ? '1'
                                                        : '2',
                                                    quotationId: FFAppState()
                                                        .insuranceInfoQuotationId,
                                                    token: FFAppState()
                                                        .accessToken,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.checkBlackListOutput2
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
                                                                'พบข้อผิดพลาด (${(_model.checkBlackListOutput2?.statusCode ?? 200).toString()})'),
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
                                                      setState(() {});
                                                    return;
                                                  }
                                                  if (CheckBlackListCall
                                                          .statuslayer1(
                                                        (_model.checkBlackListOutput2
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
                                                                CheckBlackListCall
                                                                    .messageLayer1(
                                                              (_model.checkBlackListOutput2
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!),
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
                                                      setState(() {});
                                                    return;
                                                  }
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.37,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFCEFE4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.list,
                                                            color: Color(
                                                                0xFFD9761A),
                                                            size: 20.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'ตรวจสอบรายชื่อ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: Color(
                                                                        0xFFD9761A),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
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
                                    ],
                                  ),
                                ),
                              ),
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
                                            'เพศ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
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
                                            'SearchableListPage',
                                            queryParameters: {
                                              'titleText': serializeParam(
                                                'เพศ',
                                                ParamType.String,
                                              ),
                                              'searchLabel': serializeParam(
                                                'ระบุเพศ',
                                                ParamType.String,
                                              ),
                                              'dataList': serializeParam(
                                                FFAppState().gender,
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
                                              'fromPage': serializeParam(
                                                'insuranceInfoPage1',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          await actions.hideKeyboardAction(
                                            context,
                                          );
                                        },
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
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: ListTile(
                                                title: Text(
                                                  () {
                                                    if ((FFAppState()
                                                                .insuranceInfoGender ==
                                                            'MALE') ||
                                                        (FFAppState()
                                                                .insuranceInfoGender ==
                                                            'ชาย')) {
                                                      return 'ชาย';
                                                    } else if ((FFAppState()
                                                                .insuranceInfoGender ==
                                                            'FEMALE') ||
                                                        (FFAppState()
                                                                .insuranceInfoGender ==
                                                            'หญิง')) {
                                                      return 'หญิง';
                                                    } else {
                                                      return 'กรุณาเลือกเพศ';
                                                    }
                                                  }(),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: functions
                                                                .containWordinStringUrl(
                                                                    'เลือก',
                                                                    FFAppState()
                                                                        .insuranceInfoGender)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF474747),
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
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
                            if (FFAppState().insuranceInfoGender != null &&
                                FFAppState().insuranceInfoGender != '')
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
                                              'คำนำหน้า',
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
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
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
                                              'SearchableListPage',
                                              queryParameters: {
                                                'titleText': serializeParam(
                                                  'คำนำหน้า',
                                                  ParamType.String,
                                                ),
                                                'searchLabel': serializeParam(
                                                  'ระบุคำนำหน้า',
                                                  ParamType.String,
                                                ),
                                                'dataList': serializeParam(
                                                  (FFAppState().insuranceInfoGender ==
                                                              'MALE') ||
                                                          (FFAppState()
                                                                  .insuranceInfoGender ==
                                                              'ชาย')
                                                      ? columnDataListRecord
                                                          ?.title
                                                      : columnDataListRecord
                                                          ?.title2,
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
                                                'fromPage': serializeParam(
                                                  'insuranceInfoPage1',
                                                  ParamType.String,
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
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: ListTile(
                                                  title: Text(
                                                    FFAppState().insuranceInfoTitle !=
                                                                null &&
                                                            FFAppState()
                                                                    .insuranceInfoTitle !=
                                                                ''
                                                        ? FFAppState()
                                                            .insuranceInfoTitle
                                                        : 'กรุณาเลือกคำนำหน้า',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: functions
                                                                  .containWordinStringUrl(
                                                                      'เลือก',
                                                                      FFAppState()
                                                                          .insuranceInfoTitle)!
                                                              ? Color(
                                                                  0xFF9F9F9F)
                                                              : Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  trailing: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF474747),
                                                    size: 20.0,
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  dense: false,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
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
                                            'ชื่อลูกค้า (ไม่ต้องระบุคำนำหน้า)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '(บังคับกรอก)',
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
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .cusNameTextFieldTextController,
                                              focusNode: _model
                                                  .cusNameTextFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.cusNameTextFieldTextController',
                                                Duration(milliseconds: 500),
                                                () => setState(() {}),
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'กรุณากรอกชื่อ',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black600,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              validator: _model
                                                  .cusNameTextFieldTextControllerValidator
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
                                            'นามสกุลลูกค้า',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '(บังคับกรอก)',
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
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .cusLastnameTextFieldTextController,
                                              focusNode: _model
                                                  .cusLastnameTextFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.cusLastnameTextFieldTextController',
                                                Duration(milliseconds: 500),
                                                () => setState(() {}),
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'กรุณากรอกนามสกุล',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black600,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              validator: _model
                                                  .cusLastnameTextFieldTextControllerValidator
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
                            if (FFAppState().insuranceinfoActType != 'CMI')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'วัน/เดือน/ปี เกิด',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(บังคับเลือก)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await DatePicker.showDatePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onConfirm: (date) {
                                                    safeSetState(() {
                                                      _model.datePicked = date;
                                                    });
                                                  },
                                                  currentTime: functions
                                                      .currentDate18YearsAgo(
                                                          getCurrentTimestamp)!,
                                                  minTime: DateTime(0, 0, 0),
                                                  maxTime: functions
                                                      .currentDate18YearsAgo(
                                                          getCurrentTimestamp)!,
                                                  locale: LocaleType.values
                                                      .firstWhere(
                                                    (l) =>
                                                        l.name ==
                                                        FFLocalizations.of(
                                                                context)
                                                            .languageCode,
                                                    orElse: () => LocaleType.en,
                                                  ),
                                                );

                                                setState(() {
                                                  _model.ageTextFieldTextController
                                                          ?.text =
                                                      functions
                                                          .calculateAgeFromDatetime(
                                                              _model
                                                                  .datePicked)!
                                                          .toString();
                                                });
                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.55,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
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
                                                        valueOrDefault<String>(
                                                          () {
                                                            if (_model
                                                                    .datePicked !=
                                                                null) {
                                                              return functions
                                                                  .showDateBE(_model
                                                                      .datePicked
                                                                      ?.toString());
                                                            } else if ((FFAppState().insuranceInfoBirthDate !=
                                                                        null &&
                                                                    FFAppState().insuranceInfoBirthDate !=
                                                                        '') &&
                                                                (FFAppState()
                                                                        .insuranceInfoBirthDate !=
                                                                    '') &&
                                                                (FFAppState()
                                                                        .insuranceInfoBirthDate !=
                                                                    '')) {
                                                              return functions
                                                                  .showDateBE(
                                                                      FFAppState()
                                                                          .insuranceInfoBirthDate);
                                                            } else {
                                                              return 'กรุณาเลือก วัน/เดือน/ปี เกิด';
                                                            }
                                                          }(),
                                                          'กรุณาเลือก วัน/เดือน/ปี เกิด',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: _model
                                                                              .datePicked !=
                                                                          null
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText
                                                                      : Color(
                                                                          0xFF9F9F9F),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons
                                                            .edit_calendar_outlined,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'อายุ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '(อายุมากกว่า 18 ปี)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Color(
                                                                0xFFFB0606),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.37,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF6F6F6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .ageTextFieldTextController,
                                                        focusNode: _model
                                                            .ageTextFieldFocusNode,
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
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText:
                                                              'กรุณากรอกอายุ',
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black600,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .ageTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
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
                                            'กลุ่มอาชีพ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
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
                                            'SearchableListPage',
                                            queryParameters: {
                                              'titleText': serializeParam(
                                                'กลุ่มอาชีพ',
                                                ParamType.String,
                                              ),
                                              'searchLabel': serializeParam(
                                                'ระบุกลุ่มอาชีพ',
                                                ParamType.String,
                                              ),
                                              'dataList': serializeParam(
                                                functions.removeDupeInList(
                                                    FFAppState()
                                                        .insuranceInfoOccupationName
                                                        .toList()),
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
                                              'fromPage': serializeParam(
                                                'InPackage',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          await actions.hideKeyboardAction(
                                            context,
                                          );
                                        },
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
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: ListTile(
                                                title: Text(
                                                  FFAppState().insuranceInfoSelectOccupationName !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoSelectOccupationName !=
                                                              ''
                                                      ? FFAppState()
                                                          .insuranceInfoSelectOccupationName
                                                      : 'กรุณาเลือกกลุ่มอาชีพ',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: functions
                                                                .containWordinStringUrl(
                                                                    'เลือก',
                                                                    FFAppState()
                                                                        .insuranceInfoOccupationGroup)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF474747),
                                                  size: 20.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
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
                            if ((FFAppState()
                                            .insuranceInfoSelectOccupationName !=
                                        null &&
                                    FFAppState()
                                            .insuranceInfoSelectOccupationName !=
                                        '') &&
                                (FFAppState()
                                        .insuranceInfoSelectOccupationCode !=
                                    'JB999'))
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
                                              'อาชีพ',
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
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
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
                                              'SearchableListPage',
                                              queryParameters: {
                                                'titleText': serializeParam(
                                                  'อาชีพ',
                                                  ParamType.String,
                                                ),
                                                'searchLabel': serializeParam(
                                                  'ระบุอาชีพ',
                                                  ParamType.String,
                                                ),
                                                'dataList': serializeParam(
                                                  FFAppState()
                                                      .insuranceInfoSelectOccupationSubName,
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
                                                'fromPage': serializeParam(
                                                  'InPackage',
                                                  ParamType.String,
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
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: ListTile(
                                                  title: Text(
                                                    FFAppState().insuranceInfoSelectOccupationSubNameChoose !=
                                                                null &&
                                                            FFAppState()
                                                                    .insuranceInfoSelectOccupationSubNameChoose !=
                                                                ''
                                                        ? FFAppState()
                                                            .insuranceInfoSelectOccupationSubNameChoose
                                                        : 'กรุณาเลือกอาชีพ',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: functions
                                                                  .containWordinStringUrl(
                                                                      'เลือก',
                                                                      FFAppState()
                                                                          .insuranceInfoOccupationGroup)!
                                                              ? Color(
                                                                  0xFF9F9F9F)
                                                              : Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  trailing: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF474747),
                                                    size: 20.0,
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  dense: false,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
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
                            if ((FFAppState()
                                            .insuranceInfoSelectOccupationName !=
                                        null &&
                                    FFAppState()
                                            .insuranceInfoSelectOccupationName !=
                                        '') &&
                                (FFAppState()
                                        .insuranceInfoSelectOccupationCode ==
                                    'JB999'))
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
                                              'อาชีพ',
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
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '(บังคับกรอก)',
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
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .cusOcputationTextFieldTextController,
                                                focusNode: _model
                                                    .cusOcputationTextFieldFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'กรุณากรอกอาชีพ',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black600,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                validator: _model
                                                    .cusOcputationTextFieldTextControllerValidator
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
                                            'เบอร์โทรศัพท์มือถือ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '(บังคับกรอก)',
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
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .cusPhoneTextFieldTextController,
                                              focusNode: _model
                                                  .cusPhoneTextFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.cusPhoneTextFieldTextController',
                                                Duration(milliseconds: 500),
                                                () => setState(() {}),
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    'กรุณากรอกเบอร์โทรศัพท์มือถือ',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black600,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .cusPhoneTextFieldTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                _model.cusPhoneTextFieldMask
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
                                            'เบอร์โทรศัพท์อื่น ๆ',
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
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .cusPhoneOtherTextFieldTextController,
                                              focusNode: _model
                                                  .cusPhoneOtherTextFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    'กรุณากรอกเบอร์โทรศัพท์อื่นๆ',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black600,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              keyboardType: TextInputType.phone,
                                              validator: _model
                                                  .cusPhoneOtherTextFieldTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                _model
                                                    .cusPhoneOtherTextFieldMask
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
                                            'อีเมล',
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
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .emailTextFieldTextController,
                                              focusNode: _model
                                                  .emailTextFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'กรุณากรอกอีเมลล์',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black600,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              validator: _model
                                                  .emailTextFieldTextControllerValidator
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
                                  0.0, 20.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('AddAddress');

                                  await actions.hideKeyboardAction(
                                    context,
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.6,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.home_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (FFAppState()
                                                      .addAddressForDoc ==
                                                  'กรุณากรอกที่อยู่')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'เพิ่มที่อยู่',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF003063),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              if (FFAppState()
                                                      .addAddressForDoc ==
                                                  'กรุณากรอกที่อยู่')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'กรุณาเพิ่มที่อยู่',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                              if (FFAppState()
                                                      .addAddressForDoc !=
                                                  'กรุณากรอกที่อยู่')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFAppState().addAddressForDoc !=
                                                                null &&
                                                            FFAppState()
                                                                    .addAddressForDoc !=
                                                                ''
                                                        ? FFAppState()
                                                            .addAddressForDoc
                                                        : 'กรุณาเพิ่มที่อยู่',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF003063),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.navigate_next,
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
                              ),
                            ),
                            if (FFAppState().insuranceinfoActType != 'CMI')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'กรอกรหัสพนักงานผู้มีบัตรนายหน้า ฯ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(บังคับกรอก)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.55,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .licenseCodeTextController,
                                                              focusNode: _model
                                                                  .licenseCodeFocusNode,
                                                              autofocus: false,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    'กรุณากรอกรหัสพนักงาน',
                                                                hintStyle: FlutterFlowTheme.of(
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
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedErrorBorder:
                                                                    InputBorder
                                                                        .none,
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              validator: _model
                                                                  .licenseCodeTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (!FFAppState()
                                                    .addAddressLicenseEmployeeId
                                                    .contains(FFAppState()
                                                        .employeeID))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
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
                                                        await actions
                                                            .hideKeyboardAction(
                                                          context,
                                                        );
                                                        setState(() {
                                                          FFAppState()
                                                                  .insuranceInfoHaveLicenseBool =
                                                              false;
                                                        });
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
                                                                        .requestFocus(_model
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
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));

                                                        if (!(_model.licenseCodeTextController
                                                                    .text !=
                                                                null &&
                                                            _model.licenseCodeTextController
                                                                    .text !=
                                                                '')) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'กรุณากรอกรหัสพนักงาน'),
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
                                                            setState(() {});
                                                          return;
                                                        }
                                                        if (FFAppState()
                                                            .addAddressLicenseEmployeeId
                                                            .contains(_model
                                                                .licenseCodeTextController
                                                                .text)) {
                                                          setState(() {
                                                            FFAppState()
                                                                    .insuranceInfoHaveLicenseBool =
                                                                true;
                                                          });
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'เลขพนักงานนี้ไม่มีบัตรนายหน้าประกัน'),
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
                                                          setState(() {
                                                            FFAppState()
                                                                    .insuranceInfoHaveLicenseBool =
                                                                false;
                                                          });
                                                          setState(() {
                                                            FFAppState()
                                                                .insuranceInfoLicenseEmployeeId = '';
                                                            FFAppState()
                                                                .insuranceInfoLicenseTitle = '';
                                                            FFAppState()
                                                                .insuranceInfoLicenseFirstName = '';
                                                            FFAppState()
                                                                .insuranceInfoLicenseLastName = '';
                                                            FFAppState()
                                                                .insuranceInfoLicenseLicenseId = '';
                                                            FFAppState()
                                                                .insuranceInfoLicenseExpiredDate = '';
                                                            FFAppState()
                                                                .insuranceInfoLicenseMobilePhone = '';
                                                            FFAppState()
                                                                .insuranceInfoLicenseImg = '';
                                                            FFAppState()
                                                                .insuranceInfoLicenseBranch = '';
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        _model.profileImgOutput =
                                                            await GetProfileImageCall
                                                                .call(
                                                          employeeCode: _model
                                                              .licenseCodeTextController
                                                              .text,
                                                          insuranceUrl: FFAppState()
                                                              .apiUrlInsuranceAppState,
                                                        );
                                                        _shouldSetState = true;
                                                        if ((_model.profileImgOutput
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
                                                                      'พบข้อผิดพลาด (${(_model.profileImgOutput?.statusCode ?? 200).toString()})'),
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
                                                            setState(() {});
                                                          return;
                                                        }
                                                        if (GetProfileImageCall
                                                                .statusLayer1(
                                                              (_model.profileImgOutput
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
                                                                      GetProfileImageCall
                                                                          .messageLayer1(
                                                                    (_model.profileImgOutput
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
                                                          Navigator.pop(
                                                              context);
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                        setState(() {
                                                          FFAppState()
                                                                  .insuranceInfoLicenseEmployeeId =
                                                              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseEmployeeId.toList(), _model.licenseCodeTextController.text)}';
                                                          FFAppState()
                                                                  .insuranceInfoLicenseTitle =
                                                              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseTitle.toList(), _model.licenseCodeTextController.text)}';
                                                          FFAppState()
                                                                  .insuranceInfoLicenseFirstName =
                                                              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseFirstName.toList(), _model.licenseCodeTextController.text)}';
                                                          FFAppState()
                                                                  .insuranceInfoLicenseLastName =
                                                              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseLastName.toList(), _model.licenseCodeTextController.text)}';
                                                          FFAppState()
                                                                  .insuranceInfoLicenseLicenseId =
                                                              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseLicenseId.toList(), _model.licenseCodeTextController.text)}';
                                                          FFAppState()
                                                                  .insuranceInfoLicenseExpiredDate =
                                                              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseExpiredDate.toList(), _model.licenseCodeTextController.text)}';
                                                          FFAppState()
                                                                  .insuranceInfoLicenseMobilePhone =
                                                              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addAddressLicenseMobilePhone.toList(), _model.licenseCodeTextController.text)}';
                                                          FFAppState()
                                                                  .insuranceInfoLicenseImg =
                                                              '${GetProfileImageCall.imgProfile(
                                                            (_model.profileImgOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )}';
                                                          FFAppState()
                                                                  .insuranceInfoLicenseBranch =
                                                              '${functions.findIndexOfList(FFAppState().addAddressLicenseEmployeeId.toList(), FFAppState().addaddresslicensenBranch.toList(), _model.licenseCodeTextController.text)}';
                                                        });
                                                        Navigator.pop(context);
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.37,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFCEFE4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons.search,
                                                                  color: Color(
                                                                      0xFFD9761A),
                                                                  size: 20.0,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'ค้นหา',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFD9761A),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (FFAppState()
                                          .insuranceInfoHaveLicenseBool ||
                                      ((FFAppState().insuranceInfoLicenseEmployeeId !=
                                                  null &&
                                              FFAppState()
                                                      .insuranceInfoLicenseEmployeeId !=
                                                  '') &&
                                          (FFAppState()
                                                  .insuranceInfoLicenseEmployeeId !=
                                              '')))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 15.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFE6E6E6),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 10.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.064,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Align(
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
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.6,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'ชื่อผู้ถือบัตร',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: Color(
                                                                        0xFF1D4774),
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Text(
                                                              '${FFAppState().insuranceInfoLicenseTitle}${FFAppState().insuranceInfoLicenseFirstName} ${FFAppState().insuranceInfoLicenseLastName}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: Color(
                                                                        0xFF1D4774),
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'หมายเลขบัตรประกันวินาศภัย',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: Color(
                                                                        0xFF1D4774),
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Text(
                                                              FFAppState()
                                                                  .insuranceInfoLicenseLicenseId,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: Color(
                                                                        0xFF1D4774),
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
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
                                                                      0.25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Text(
                                                                    'วันหมดอายุ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFF1D4774),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                                                        .insuranceInfoLicenseExpiredDate,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFF1D4774),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w800,
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
                                                                      0.25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Text(
                                                                    'เบอร์โทร',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFF1D4774),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                                                        .insuranceInfoLicenseMobilePhone,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFF1D4774),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w800,
                                                                        ),
                                                                  ),
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
                                                                  0.0, -1.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 120.0,
                                                                  height: 120.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74&_gl=1*ualx7r*_ga*OTc3MzI3NDY5LjE2NzU2NzMwNDE.*_ga_CW55HF8NVT*MTY5NjMyNzI4MS4yMzguMS4xNjk2MzI3MzEyLjI5LjAuMA..',
                                                                    fit: BoxFit
                                                                        .cover,
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
                                      ),
                                    ),
                                ],
                              ),
                            if (FFAppState().InsuranceInfoVedioCallFile !=
                                    null &&
                                FFAppState().InsuranceInfoVedioCallFile != '')
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
                                            12.0, 15.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'ลิ้งวิดีโอ',
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
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '(บังคับกรอก)',
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
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .vedioCallLinkTextController,
                                                focusNode: _model
                                                    .vedioCallLinkFocusNode,
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
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText:
                                                      'กรุณากรอกลิ้งวีดีโอ',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black600,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: _model
                                                    .vedioCallLinkTextControllerValidator
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
                                  0.0, 15.0, 0.0, 0.0),
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              var _shouldSetState = false;
                                              if (FFAppState()
                                                      .insuranceinfoActType !=
                                                  'CMI') {
                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                                if (FFAppState()
                                                        .insuranceInfoSelectOccupationCode ==
                                                    'JB999') {
                                                  setState(() {
                                                    FFAppState()
                                                            .insuranceInfoSelectOccupationSubNameChoose =
                                                        _model
                                                            .cusOcputationTextFieldTextController
                                                            .text;
                                                  });
                                                }
                                                if (!((FFAppState()
                                                                .insuranceInfoLicenseLicenseId !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoLicenseLicenseId !=
                                                            '') &&
                                                    (FFAppState()
                                                            .insuranceInfoLicenseLicenseId !=
                                                        '') &&
                                                    (FFAppState()
                                                            .insuranceInfoLicenseLicenseId !=
                                                        '') &&
                                                    (_model.licenseCodeTextController
                                                                .text !=
                                                            null &&
                                                        _model.licenseCodeTextController
                                                                .text !=
                                                            ''))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกเลขผู้มีบัตรนายหน้าประกัน'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((FFAppState()
                                                                .insuranceInfoCardType !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoCardType !=
                                                            '') &&
                                                    (FFAppState()
                                                            .insuranceInfoCardType !=
                                                        '') &&
                                                    (FFAppState()
                                                            .insuranceInfoCardType !=
                                                        'เลือกประเภทบัตร'))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกประเภทบัตร'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((_model.idCardTextFieldTextController1
                                                                .text !=
                                                            null &&
                                                        _model.idCardTextFieldTextController1
                                                                .text !=
                                                            '') ||
                                                    (_model.idCardTextFieldTextController2
                                                                .text !=
                                                            null &&
                                                        _model.idCardTextFieldTextController2
                                                                .text !=
                                                            ''))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกเลขบัตร'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((FFAppState()
                                                                .insuranceInfoGender !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoGender !=
                                                            '') &&
                                                    (FFAppState()
                                                            .insuranceInfoGender !=
                                                        '') &&
                                                    (FFAppState()
                                                            .insuranceInfoGender !=
                                                        'เลือกเพศ'))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกเพศ'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((FFAppState()
                                                                .insuranceInfoTitle !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoTitle !=
                                                            '') &&
                                                    (FFAppState()
                                                            .insuranceInfoTitle !=
                                                        '') &&
                                                    !functions
                                                        .containWordinStringUrl(
                                                            'เลือก',
                                                            FFAppState()
                                                                .insuranceInfoTitle)!)) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกคำนำหน้า'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((FFAppState()
                                                                .insuranceInfoOccupationGroup !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoOccupationGroup !=
                                                            '') &&
                                                    (FFAppState()
                                                            .insuranceInfoOccupationGroup !=
                                                        '') &&
                                                    (FFAppState()
                                                            .insuranceInfoOccupationGroup !=
                                                        'เลือกกลุ่มอาชีพ'))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกกลุ่มอาชีพ'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(_model.cusNameTextFieldTextController
                                                            .text !=
                                                        null &&
                                                    _model.cusNameTextFieldTextController
                                                            .text !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกชื่อ'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(_model.cusLastnameTextFieldTextController
                                                            .text !=
                                                        null &&
                                                    _model.cusLastnameTextFieldTextController
                                                            .text !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกนามสกุล'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(FFAppState()
                                                            .insuranceInfoSelectOccupationSubNameChoose !=
                                                        null &&
                                                    FFAppState()
                                                            .insuranceInfoSelectOccupationSubNameChoose !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกอาชีพ'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(_model.cusPhoneTextFieldTextController
                                                            .text !=
                                                        null &&
                                                    _model.cusPhoneTextFieldTextController
                                                            .text !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกเบอร์โทรศัพท์'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(_model.ageTextFieldTextController
                                                            .text !=
                                                        null &&
                                                    _model.ageTextFieldTextController
                                                            .text !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอก วัน/เดือน/ปี เกิด'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(FFAppState()
                                                            .addAddressAtIdCard !=
                                                        null &&
                                                    FFAppState()
                                                            .addAddressAtIdCard !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกที่อยู่'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(FFAppState()
                                                            .addAddressForDoc !=
                                                        null &&
                                                    FFAppState()
                                                            .addAddressForDoc !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกที่อยู่'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(functions.checkIdCardInput(
                                                        functions
                                                            .removeCommaFromNumText(
                                                                _model
                                                                    .idCardTextFieldTextController1
                                                                    .text)) ||
                                                    ((FFAppState()
                                                                .insuranceInfoCardType !=
                                                            'บัตรประชาชน') ||
                                                        (FFAppState()
                                                                .insuranceInfoCardType !=
                                                            '1')))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณากรอกเลขบัตร 13 หลัก'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((CheckBlackListCall
                                                            .blacklistflag(
                                                          (_model.checkBlackListOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        'N') ||
                                                    (CheckBlackListCall
                                                            .blacklistflag(
                                                          (_model.checkBlackListOutput2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        'N'))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณากดตรวจสอบเลขบัตร'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (_model.emailTextFieldTextController
                                                            .text !=
                                                        null &&
                                                    _model.emailTextFieldTextController
                                                            .text !=
                                                        '') {
                                                  if (!functions.validateEmail(
                                                      _model
                                                          .emailTextFieldTextController
                                                          .text)!) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอกอีเมลให้ถูกต้อง'),
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
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                }
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
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
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
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                setState(() {
                                                  FFAppState()
                                                      .insuranceInfoIdCard = (FFAppState()
                                                                  .insuranceInfoCardType ==
                                                              'บัตรประชาชน') ||
                                                          (FFAppState().insuranceInfoCardType ==
                                                              '1')
                                                      ? _model
                                                          .idCardTextFieldTextController1
                                                          .text
                                                      : _model
                                                          .idCardTextFieldTextController2
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoFirstName =
                                                      _model
                                                          .cusNameTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoLastName =
                                                      _model
                                                          .cusLastnameTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoBirthDate =
                                                      valueOrDefault<String>(
                                                    () {
                                                      if (_model.datePicked !=
                                                          null) {
                                                        return dateTimeFormat(
                                                          'y-MM-dd',
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                      } else if (FFAppState()
                                                                  .insuranceInfoBirthDate !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoBirthDate !=
                                                              '') {
                                                        return FFAppState()
                                                            .insuranceInfoBirthDate;
                                                      } else {
                                                        return '';
                                                      }
                                                    }(),
                                                    'กรุณาเลือก วัน/เดือน/ปี เกิด',
                                                  );
                                                  FFAppState()
                                                          .insuranceInfoPhonenumber =
                                                      _model
                                                          .cusPhoneTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoOtherPhone =
                                                      _model
                                                          .cusPhoneOtherTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoEmail =
                                                      _model
                                                          .emailTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoAge =
                                                      _model
                                                          .ageTextFieldTextController
                                                          .text;
                                                });
                                                _model.ibsAppSaveAPIoutput =
                                                    await IbsApplicationsSaveCall
                                                        .call(
                                                  action: 'save_draft',
                                                  quotationId: FFAppState()
                                                      .insuranceInfoQuotationId,
                                                  leadDtlId: FFAppState()
                                                      .insuranceInfoLeadDetailId,
                                                  idTypeId: (FFAppState()
                                                                  .insuranceInfoCardType ==
                                                              'บัตรประชาชน') ||
                                                          (FFAppState()
                                                                  .insuranceInfoCardType ==
                                                              '1')
                                                      ? '1'
                                                      : '2',
                                                  nationalThaiId: functions
                                                      .removeCommaFromNumText(
                                                          FFAppState()
                                                              .insuranceInfoIdCard),
                                                  gender: FFAppState()
                                                              .insuranceInfoGender ==
                                                          'ชาย'
                                                      ? 'MALE'
                                                      : 'FEMALE',
                                                  titleThId: '',
                                                  titleTh: FFAppState()
                                                      .insuranceInfoTitle,
                                                  firstNameTh: FFAppState()
                                                      .insuranceInfoFirstName,
                                                  lastNameTh: FFAppState()
                                                      .insuranceInfoLastName,
                                                  birthDay: FFAppState()
                                                      .insuranceInfoBirthDate,
                                                  occupationId: '',
                                                  occupationCode: FFAppState()
                                                      .insuranceInfoSelectOccupationCode,
                                                  occupationName: FFAppState()
                                                      .insuranceInfoOccupationGroup,
                                                  occupationSubcode: '',
                                                  occupationSubname: FFAppState()
                                                      .insuranceInfoSelectOccupationSubNameChoose,
                                                  mobile1: functions
                                                      .removeCommaFromNumText(
                                                          FFAppState()
                                                              .insuranceInfoPhonenumber),
                                                  mobile2: functions
                                                      .removeCommaFromNumText(
                                                          FFAppState()
                                                              .insuranceInfoOtherPhone),
                                                  email1: FFAppState()
                                                      .insuranceInfoEmail,
                                                  addressJson: getJsonField(
                                                    FFAppState()
                                                            .addAddressAtIdCardBool
                                                        ? getJsonField(
                                                            functions.sendJsonDataAddress(
                                                                FFAppState()
                                                                    .insuranceInfoAddressType
                                                                    .toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressAtIdCard2,
                                                                        FFAppState()
                                                                            .addAddressAtIdCard2)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictId,
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictName,
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictId,
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictName,
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceId,
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceName,
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectZipCode,
                                                                        FFAppState()
                                                                            .addAddressSelectZipCode)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressAtIdCard,
                                                                        FFAppState()
                                                                            .addAddressAtIdCard)
                                                                    ?.toList()),
                                                            r'''$''',
                                                          )
                                                        : getJsonField(
                                                            functions.sendJsonDataAddress(
                                                                FFAppState()
                                                                    .insuranceInfoAddressType
                                                                    .toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressAtIdCard2,
                                                                        FFAppState()
                                                                            .addAddressForDoc2)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictId,
                                                                        FFAppState()
                                                                            .addAddressSelectDocSubdistrictId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictName,
                                                                        FFAppState()
                                                                            .addAddressSelectDocSubdistrictName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictId,
                                                                        FFAppState()
                                                                            .addAddressSelectDocDistrictId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictName,
                                                                        FFAppState()
                                                                            .addAdressSelectDocDistrictName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceId,
                                                                        FFAppState()
                                                                            .addAdressSelectDocProvinceId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceName,
                                                                        FFAppState()
                                                                            .addAdressSelectDocProvinceName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectZipCode,
                                                                        FFAppState()
                                                                            .addAddressSelectDocZipCode)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressAtIdCard,
                                                                        FFAppState()
                                                                            .addAddressForDoc)
                                                                    ?.toList()),
                                                            r'''$''',
                                                          ),
                                                    r'''$''',
                                                  ),
                                                  insuranceUrl: FFAppState()
                                                      .apiUrlInsuranceAppState,
                                                  step: '1',
                                                  employeeCodeLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseEmployeeId),
                                                  employeeFirstnameLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseFirstName),
                                                  employeeLastnameLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseLastName),
                                                  employeeBranchLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseBranch),
                                                  employeeLicenseIDLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseLicenseId),
                                                  employeeLicenseImgLicense:
                                                      functions
                                                          .replaceAllTabAndSpace(
                                                              FFAppState()
                                                                  .insuranceInfoLicenseImg),
                                                  employeeLicenseExpLicense:
                                                      functions
                                                          .replaceAllTabAndSpace(
                                                              FFAppState()
                                                                  .insuranceInfoLicenseExpiredDate),
                                                  employeePhoneNumberLicense:
                                                      functions
                                                          .replaceAllTabAndSpace(
                                                              FFAppState()
                                                                  .insuranceInfoLicenseMobilePhone),
                                                  token:
                                                      FFAppState().accessToken,
                                                  quotationType: FFAppState()
                                                      .insuranceInfoApplicationType,
                                                  subProduct: FFAppState()
                                                      .insuranceinfoActType,
                                                );
                                                _shouldSetState = true;
                                                if ((_model.ibsAppSaveAPIoutput
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
                                                              'พบข้อผิดพลาด (${(_model.ibsAppSaveAPIoutput?.statusCode ?? 200).toString()})'),
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
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                                if (IbsApplicationsSaveCall
                                                        .statuslayer1(
                                                      (_model.ibsAppSaveAPIoutput
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
                                                              IbsApplicationsSaveCall
                                                                  .messageLayer1(
                                                            (_model.ibsAppSaveAPIoutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!),
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
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'บันทึกเตรียมข้อมูลขั้นตอนที่ 1 สำเร็จ'),
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
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceInfoPage1SaveDataCheckBool =
                                                      true;
                                                });
                                                Navigator.pop(context);
                                              } else {
                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                                if (FFAppState()
                                                        .insuranceInfoSelectOccupationCode ==
                                                    'JB999') {
                                                  setState(() {
                                                    FFAppState()
                                                            .insuranceInfoSelectOccupationSubNameChoose =
                                                        _model
                                                            .cusOcputationTextFieldTextController
                                                            .text;
                                                  });
                                                }
                                                if (!((FFAppState()
                                                                .insuranceInfoCardType !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoCardType !=
                                                            '') &&
                                                    (FFAppState()
                                                            .insuranceInfoCardType !=
                                                        '') &&
                                                    (FFAppState()
                                                            .insuranceInfoCardType !=
                                                        'เลือกประเภทบัตร'))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกประเภทบัตร'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((_model.idCardTextFieldTextController1
                                                                .text !=
                                                            null &&
                                                        _model.idCardTextFieldTextController1
                                                                .text !=
                                                            '') ||
                                                    (_model.idCardTextFieldTextController2
                                                                .text !=
                                                            null &&
                                                        _model.idCardTextFieldTextController2
                                                                .text !=
                                                            ''))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกเลขบัตร'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((FFAppState()
                                                                .insuranceInfoGender !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoGender !=
                                                            '') &&
                                                    (FFAppState()
                                                            .insuranceInfoGender !=
                                                        '') &&
                                                    (FFAppState()
                                                            .insuranceInfoGender !=
                                                        'เลือกเพศ'))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกเพศ'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((FFAppState()
                                                                .insuranceInfoTitle !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoTitle !=
                                                            '') &&
                                                    (FFAppState()
                                                            .insuranceInfoTitle !=
                                                        '') &&
                                                    !functions
                                                        .containWordinStringUrl(
                                                            'เลือก',
                                                            FFAppState()
                                                                .insuranceInfoTitle)!)) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกคำนำหน้า'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((FFAppState()
                                                                .insuranceInfoOccupationGroup !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoOccupationGroup !=
                                                            '') &&
                                                    (FFAppState()
                                                            .insuranceInfoOccupationGroup !=
                                                        '') &&
                                                    (FFAppState()
                                                            .insuranceInfoOccupationGroup !=
                                                        'เลือกกลุ่มอาชีพ'))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกกลุ่มอาชีพ'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(_model.cusNameTextFieldTextController
                                                            .text !=
                                                        null &&
                                                    _model.cusNameTextFieldTextController
                                                            .text !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกชื่อ'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(_model.cusLastnameTextFieldTextController
                                                            .text !=
                                                        null &&
                                                    _model.cusLastnameTextFieldTextController
                                                            .text !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกนามสกุล'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(FFAppState()
                                                            .insuranceInfoSelectOccupationSubNameChoose !=
                                                        null &&
                                                    FFAppState()
                                                            .insuranceInfoSelectOccupationSubNameChoose !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกอาชีพ'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(_model.cusPhoneTextFieldTextController
                                                            .text !=
                                                        null &&
                                                    _model.cusPhoneTextFieldTextController
                                                            .text !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับกรอกเบอร์โทรศัพท์'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(FFAppState()
                                                            .addAddressAtIdCard !=
                                                        null &&
                                                    FFAppState()
                                                            .addAddressAtIdCard !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกที่อยู่'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(FFAppState()
                                                            .addAddressForDoc !=
                                                        null &&
                                                    FFAppState()
                                                            .addAddressForDoc !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'บังคับเลือกที่อยู่'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!(functions.checkIdCardInput(
                                                        functions
                                                            .removeCommaFromNumText(
                                                                _model
                                                                    .idCardTextFieldTextController1
                                                                    .text)) ||
                                                    ((FFAppState()
                                                                .insuranceInfoCardType !=
                                                            'บัตรประชาชน') ||
                                                        (FFAppState()
                                                                .insuranceInfoCardType !=
                                                            '1')))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณากรอกเลขบัตร 13 หลัก'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (!((CheckBlackListCall
                                                            .blacklistflag(
                                                          (_model.checkBlackListOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        'N') ||
                                                    (CheckBlackListCall
                                                            .blacklistflag(
                                                          (_model.checkBlackListOutput2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        'N'))) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณากดตรวจสอบเลขบัตร'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                if (_model.emailTextFieldTextController
                                                            .text !=
                                                        null &&
                                                    _model.emailTextFieldTextController
                                                            .text !=
                                                        '') {
                                                  if (!functions.validateEmail(
                                                      _model
                                                          .emailTextFieldTextController
                                                          .text)!) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอกอีเมลให้ถูกต้อง'),
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
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                }
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
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
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
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                setState(() {
                                                  FFAppState()
                                                      .insuranceInfoIdCard = (FFAppState()
                                                                  .insuranceInfoCardType ==
                                                              'บัตรประชาชน') ||
                                                          (FFAppState().insuranceInfoCardType ==
                                                              '1')
                                                      ? _model
                                                          .idCardTextFieldTextController1
                                                          .text
                                                      : _model
                                                          .idCardTextFieldTextController2
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoFirstName =
                                                      _model
                                                          .cusNameTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoLastName =
                                                      _model
                                                          .cusLastnameTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoBirthDate =
                                                      valueOrDefault<String>(
                                                    () {
                                                      if (_model.datePicked !=
                                                          null) {
                                                        return dateTimeFormat(
                                                          'y-MM-dd',
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                      } else if (FFAppState()
                                                                  .insuranceInfoBirthDate !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoBirthDate !=
                                                              '') {
                                                        return FFAppState()
                                                            .insuranceInfoBirthDate;
                                                      } else {
                                                        return '';
                                                      }
                                                    }(),
                                                    'กรุณาเลือก วัน/เดือน/ปี เกิด',
                                                  );
                                                  FFAppState()
                                                          .insuranceInfoPhonenumber =
                                                      _model
                                                          .cusPhoneTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoOtherPhone =
                                                      _model
                                                          .cusPhoneOtherTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoEmail =
                                                      _model
                                                          .emailTextFieldTextController
                                                          .text;
                                                  FFAppState()
                                                          .insuranceInfoAge =
                                                      _model
                                                          .ageTextFieldTextController
                                                          .text;
                                                });
                                                _model.ibsAppSaveAPIoutputCMI =
                                                    await IbsApplicationsSaveCall
                                                        .call(
                                                  action: 'save_draft',
                                                  quotationId: FFAppState()
                                                      .insuranceInfoQuotationId,
                                                  leadDtlId: FFAppState()
                                                      .insuranceInfoLeadDetailId,
                                                  idTypeId: (FFAppState()
                                                                  .insuranceInfoCardType ==
                                                              'บัตรประชาชน') ||
                                                          (FFAppState()
                                                                  .insuranceInfoCardType ==
                                                              '1')
                                                      ? '1'
                                                      : '2',
                                                  nationalThaiId: functions
                                                      .removeCommaFromNumText(
                                                          FFAppState()
                                                              .insuranceInfoIdCard),
                                                  gender: FFAppState()
                                                              .insuranceInfoGender ==
                                                          'ชาย'
                                                      ? 'MALE'
                                                      : 'FEMALE',
                                                  titleThId: '',
                                                  titleTh: FFAppState()
                                                      .insuranceInfoTitle,
                                                  firstNameTh: FFAppState()
                                                      .insuranceInfoFirstName,
                                                  lastNameTh: FFAppState()
                                                      .insuranceInfoLastName,
                                                  birthDay: '',
                                                  occupationId: '',
                                                  occupationCode: FFAppState()
                                                      .insuranceInfoSelectOccupationCode,
                                                  occupationName: FFAppState()
                                                      .insuranceInfoOccupationGroup,
                                                  occupationSubcode: '',
                                                  occupationSubname: FFAppState()
                                                      .insuranceInfoSelectOccupationSubNameChoose,
                                                  mobile1: functions
                                                      .removeCommaFromNumText(
                                                          FFAppState()
                                                              .insuranceInfoPhonenumber),
                                                  mobile2: functions
                                                      .removeCommaFromNumText(
                                                          FFAppState()
                                                              .insuranceInfoOtherPhone),
                                                  email1: FFAppState()
                                                      .insuranceInfoEmail,
                                                  addressJson: getJsonField(
                                                    FFAppState()
                                                            .addAddressAtIdCardBool
                                                        ? getJsonField(
                                                            functions.sendJsonDataAddress(
                                                                FFAppState()
                                                                    .insuranceInfoAddressType
                                                                    .toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressAtIdCard2,
                                                                        FFAppState()
                                                                            .addAddressAtIdCard2)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictId,
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictName,
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictId,
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictName,
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceId,
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceName,
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectZipCode,
                                                                        FFAppState()
                                                                            .addAddressSelectZipCode)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressAtIdCard,
                                                                        FFAppState()
                                                                            .addAddressAtIdCard)
                                                                    ?.toList()),
                                                            r'''$''',
                                                          )
                                                        : getJsonField(
                                                            functions.sendJsonDataAddress(
                                                                FFAppState()
                                                                    .insuranceInfoAddressType
                                                                    .toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressAtIdCard2,
                                                                        FFAppState()
                                                                            .addAddressForDoc2)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictId,
                                                                        FFAppState()
                                                                            .addAddressSelectDocSubdistrictId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectSubdistrictName,
                                                                        FFAppState()
                                                                            .addAddressSelectDocSubdistrictName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictId,
                                                                        FFAppState()
                                                                            .addAddressSelectDocDistrictId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectDistrictName,
                                                                        FFAppState()
                                                                            .addAdressSelectDocDistrictName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceId,
                                                                        FFAppState()
                                                                            .addAdressSelectDocProvinceId)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectProvinceName,
                                                                        FFAppState()
                                                                            .addAdressSelectDocProvinceName)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressSelectZipCode,
                                                                        FFAppState()
                                                                            .addAddressSelectDocZipCode)
                                                                    ?.toList(),
                                                                functions
                                                                    .addStringToList2Index(
                                                                        FFAppState()
                                                                            .addAddressAtIdCard,
                                                                        FFAppState()
                                                                            .addAddressForDoc)
                                                                    ?.toList()),
                                                            r'''$''',
                                                          ),
                                                    r'''$''',
                                                  ),
                                                  insuranceUrl: FFAppState()
                                                      .apiUrlInsuranceAppState,
                                                  step: '1',
                                                  employeeCodeLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseEmployeeId),
                                                  employeeFirstnameLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseFirstName),
                                                  employeeLastnameLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseLastName),
                                                  employeeBranchLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseBranch),
                                                  employeeLicenseIDLicense: functions
                                                      .replaceAllTabAndSpace(
                                                          FFAppState()
                                                              .insuranceInfoLicenseLicenseId),
                                                  employeeLicenseImgLicense:
                                                      functions
                                                          .replaceAllTabAndSpace(
                                                              FFAppState()
                                                                  .insuranceInfoLicenseImg),
                                                  employeeLicenseExpLicense:
                                                      functions
                                                          .replaceAllTabAndSpace(
                                                              FFAppState()
                                                                  .insuranceInfoLicenseExpiredDate),
                                                  employeePhoneNumberLicense:
                                                      functions
                                                          .replaceAllTabAndSpace(
                                                              FFAppState()
                                                                  .insuranceInfoLicenseMobilePhone),
                                                  token:
                                                      FFAppState().accessToken,
                                                  quotationType: FFAppState()
                                                      .insuranceInfoApplicationType,
                                                  subProduct: FFAppState()
                                                      .insuranceinfoActType,
                                                );
                                                _shouldSetState = true;
                                                if ((_model.ibsAppSaveAPIoutputCMI
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
                                                              'พบข้อผิดพลาด (${(_model.ibsAppSaveAPIoutputCMI?.statusCode ?? 200).toString()})'),
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
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                                if (IbsApplicationsSaveCall
                                                        .statuslayer1(
                                                      (_model.ibsAppSaveAPIoutputCMI
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
                                                              IbsApplicationsSaveCall
                                                                  .messageLayer1(
                                                            (_model.ibsAppSaveAPIoutputCMI
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!),
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
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'บันทึกเตรียมข้อมูลขั้นตอนที่ 1 สำเร็จ'),
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
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceInfoPage1SaveDataCheckBool =
                                                      true;
                                                });
                                                Navigator.pop(context);
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                            text: 'บันทึกเตรียมข้อมูล',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.45,
                                              height: 60.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFCEFE4),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFD9761A),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
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
                                          if (FFAppState()
                                              .insuranceInfoPage1SaveDataCheckBool)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await actions
                                                      .hideKeyboardAction(
                                                    context,
                                                  );
                                                  if (!((FFAppState()
                                                                  .insuranceInfoCardType !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoCardType !=
                                                              '') &&
                                                      (FFAppState()
                                                              .insuranceInfoCardType !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoCardType !=
                                                          'เลือกประเภทบัตร'))) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับเลือกประเภทบัตร'),
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
                                                    return;
                                                  }
                                                  if (!((_model.idCardTextFieldTextController1
                                                                  .text !=
                                                              null &&
                                                          _model.idCardTextFieldTextController1
                                                                  .text !=
                                                              '') ||
                                                      (_model.idCardTextFieldTextController2
                                                                  .text !=
                                                              null &&
                                                          _model.idCardTextFieldTextController2
                                                                  .text !=
                                                              ''))) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกเลขบัตร'),
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
                                                    return;
                                                  }
                                                  if (!((FFAppState()
                                                                  .insuranceInfoGender !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoGender !=
                                                              '') &&
                                                      (FFAppState()
                                                              .insuranceInfoGender !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoGender !=
                                                          'เลือกเพศ'))) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับเลือกเพศ'),
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
                                                    return;
                                                  }
                                                  if (!((FFAppState()
                                                                  .insuranceInfoTitle !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoTitle !=
                                                              '') &&
                                                      (FFAppState()
                                                              .insuranceInfoTitle !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoTitle !=
                                                          'เลือกคำนำหน้า'))) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับเลือกคำนำหน้า'),
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
                                                    return;
                                                  }
                                                  if (!((FFAppState()
                                                                  .insuranceInfoOccupationGroup !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoOccupationGroup !=
                                                              '') &&
                                                      (FFAppState()
                                                              .insuranceInfoOccupationGroup !=
                                                          '') &&
                                                      (FFAppState()
                                                              .insuranceInfoOccupationGroup !=
                                                          'เลือกกลุ่มอาชีพ'))) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับเลือกกลุ่มอาชีพ'),
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
                                                    return;
                                                  }
                                                  if (!(_model.cusNameTextFieldTextController
                                                              .text !=
                                                          null &&
                                                      _model.cusNameTextFieldTextController
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกชื่อ'),
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
                                                    return;
                                                  }
                                                  if (!(_model.cusLastnameTextFieldTextController
                                                              .text !=
                                                          null &&
                                                      _model.cusLastnameTextFieldTextController
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกนามสกุล'),
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
                                                    return;
                                                  }
                                                  if (!(FFAppState()
                                                              .insuranceInfoSelectOccupationSubNameChoose !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoSelectOccupationSubNameChoose !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกอาชีพ'),
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
                                                    return;
                                                  }
                                                  if (!(_model.cusPhoneTextFieldTextController
                                                              .text !=
                                                          null &&
                                                      _model.cusPhoneTextFieldTextController
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกเบอร์โทรศัพท์'),
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
                                                    return;
                                                  }

                                                  context.pushNamed(
                                                      'insuranceInfoPage2');
                                                },
                                                text: 'ถัดไป',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.45,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFD9761A),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
      ),
    );
  }
}
