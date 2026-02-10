import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'none_package_basic_page_model.dart';
export 'none_package_basic_page_model.dart';

class NonePackageBasicPageWidget extends StatefulWidget {
  const NonePackageBasicPageWidget({
    super.key,
    this.branchCode,
    this.carType,
    this.truckPart,
    this.cusMembership,
    this.carrierPurpose,
    this.truckCurrentPrice,
    this.carrierFlag,
    this.coopFlag,
    this.carrierType,
    this.carrierPrice,
    this.brandName,
    this.brandId,
    this.modelName,
    this.modelId,
    this.year,
    this.vehicleUsedName,
    this.vehicleUsedId,
    this.vehicleUsedCode,
    this.coverTypeName,
    this.coverTypeCode,
    this.coverTypeId,
    this.garageTypeName,
    this.garageTypeCode,
    this.garageTypeId,
    this.cusName,
    this.cusPhone,
    this.plate,
    this.plateAdditional,
    this.provinceName,
    this.provinceCode,
    this.sumInsured,
    this.trailerSumInsured,
    this.remark,
    this.actFlag,
    this.oldVmi,
    this.oldVmiExpireDate,
    required this.workType,
    this.yearChrist,
  });

  final String? branchCode;
  final String? carType;
  final String? truckPart;
  final String? cusMembership;
  final String? carrierPurpose;
  final String? truckCurrentPrice;
  final bool? carrierFlag;
  final bool? coopFlag;
  final String? carrierType;
  final String? carrierPrice;
  final String? brandName;
  final String? brandId;
  final String? modelName;
  final String? modelId;
  final String? year;
  final String? vehicleUsedName;
  final String? vehicleUsedId;
  final String? vehicleUsedCode;
  final String? coverTypeName;
  final String? coverTypeCode;
  final String? coverTypeId;
  final String? garageTypeName;
  final String? garageTypeCode;
  final String? garageTypeId;
  final String? cusName;
  final String? cusPhone;
  final String? plate;
  final String? plateAdditional;
  final String? provinceName;
  final String? provinceCode;
  final String? sumInsured;
  final String? trailerSumInsured;
  final String? remark;
  final bool? actFlag;
  final String? oldVmi;
  final String? oldVmiExpireDate;
  final String? workType;
  final String? yearChrist;

  static String routeName = 'NonePackageBasicPage';
  static String routePath = 'NonePackageBasicPage';

  @override
  State<NonePackageBasicPageWidget> createState() =>
      _NonePackageBasicPageWidgetState();
}

class _NonePackageBasicPageWidgetState
    extends State<NonePackageBasicPageWidget> {
  late NonePackageBasicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool brandNameTextFieldFocusListenerRegistered = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NonePackageBasicPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NonePackageBasicPage'});
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

      if (!FFAppState().nonePackageIsLoadedData) {
        _model.getProvince = await TeleGetProvinceAPICall.call(
          apiUrl: FFAppState().apiUrlInsuranceAppState,
        );

        if ((_model.getProvince?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดConnection (${(_model.getProvince?.statusCode ?? 200).toString()})'),
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
        if (TeleGetProvinceAPICall.statusLevel1(
              (_model.getProvince?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().insuranceBasicProvinceIdList =
              TeleGetProvinceAPICall.provinceID(
            (_model.getProvince?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicProvinceNameList =
              TeleGetProvinceAPICall.provinceNameTH(
            (_model.getProvince?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          safeSetState(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(TeleGetProvinceAPICall.messageLayer1(
                    (_model.getProvince?.jsonBody ?? ''),
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

        _model.getVehicleUsedTypeAPI =
            await InsuranceRequestGetVehicleAPICall.call(
          apiUrl: FFAppState().apiUrlInsuranceAppState,
          vehicleCategory: 'manual',
          carType: FFAppState().fromMenuAppState,
        );

        if ((_model.getVehicleUsedTypeAPI?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาด (${(_model.getVehicleUsedTypeAPI?.statusCode ?? 200).toString()})'),
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
        if (InsuranceRequestGetVehicleAPICall.statusLayer1(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().nonePackageUsedTypeIdList =
              InsuranceRequestGetVehicleAPICall.vehicleId(
            (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().nonePackageUsedTypeCodeList =
              InsuranceRequestGetVehicleAPICall.vehicleCode(
            (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().nonePackageUsedTypeNameList =
              InsuranceRequestGetVehicleAPICall.vehicleName(
            (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().nonePackageUsedTypeTypeList =
              InsuranceRequestGetVehicleAPICall.vehicletype(
            (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().update(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(InsuranceRequestGetVehicleAPICall.messageLayer1(
                    (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
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

        FFAppState().nonePackageIsLoadedData = true;
        safeSetState(() {});
      }
      if (FFAppState().insuranceRequestIsLoadedData &&
          (FFAppState().insuranceBasicBrandNameListOriginal.length > 0)) {
      } else {
        _model.getBrandAPI = await TeleGetBrandAPICall.call(
          apiUrl: FFAppState().apiUrlInsuranceAppState,
          vehicleGroup: FFAppState().fromMenuAppState,
        );

        if ((_model.getBrandAPI?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดConnection (${(_model.getBrandAPI?.statusCode ?? 200).toString()})'),
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
        if (TeleGetBrandAPICall.statusLevel1(
              (_model.getBrandAPI?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().insuranceBasicBrandNameList =
              TeleGetBrandAPICall.brandName(
            (_model.getBrandAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicBrandIdList = TeleGetBrandAPICall.brandID(
            (_model.getBrandAPI?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().insuranceBasicBrandNameListOriginal =
              TeleGetBrandAPICall.brandName(
            (_model.getBrandAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicBrandIdListOriginal =
              TeleGetBrandAPICall.brandID(
            (_model.getBrandAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicVehicleGroupBrandList =
              TeleGetBrandAPICall.carGroup(
            (_model.getBrandAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          safeSetState(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(TeleGetBrandAPICall.messageLayer1(
                    (_model.getBrandAPI?.jsonBody ?? ''),
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

        _model.getModelAPI = await TeleGetModelAPICall.call(
          apiUrl: FFAppState().apiUrlInsuranceAppState,
        );

        if ((_model.getModelAPI?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดConnection (${(_model.getModelAPI?.statusCode ?? 200).toString()})'),
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
        if (TeleGetModelAPICall.statusLevel1(
              (_model.getModelAPI?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().insuranceBasicModelIdListOriginal =
              TeleGetModelAPICall.modelCode(
            (_model.getModelAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicModelNameListOriginal =
              TeleGetModelAPICall.modelName(
            (_model.getModelAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicModelBrandIdListOriginal =
              TeleGetModelAPICall.brandID(
            (_model.getModelAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicVehicleGroupList =
              TeleGetModelAPICall.carGroup(
            (_model.getModelAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicCarGroupDetail =
              TeleGetModelAPICall.carGroupDetail(
            (_model.getModelAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicCarDoorList = TeleGetModelAPICall.carDoors(
            (_model.getModelAPI?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().update(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(TeleGetModelAPICall.messageLayer1(
                    (_model.getModelAPI?.jsonBody ?? ''),
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

        _model.getCoverTypeAPI = await TeleGetCoverTypeAPICall.call(
          apiUrl: FFAppState().apiUrlInsuranceAppState,
        );

        if ((_model.getCoverTypeAPI?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดConnection (${(_model.getCoverTypeAPI?.statusCode ?? 200).toString()})'),
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
        if (TeleGetCoverTypeAPICall.statusLevel1(
              (_model.getCoverTypeAPI?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().insuranceBasicCoverTypeNameList =
              TeleGetCoverTypeAPICall.coverTypeName(
            (_model.getCoverTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicCoverTypeCodeList =
              TeleGetCoverTypeAPICall.coverTypeCode(
            (_model.getCoverTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicCoverTypeIdList =
              TeleGetCoverTypeAPICall.coverTypeId(
            (_model.getCoverTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().update(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(TeleGetCoverTypeAPICall.messageLayer1(
                    (_model.getCoverTypeAPI?.jsonBody ?? ''),
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

        FFAppState().insuranceRequestIsLoadedData = true;
        safeSetState(() {});
      }

      if (!(_model.masterDataDoc != null)) {
        _model.masterDataQueryAction = await DataListRecord.getDocumentOnce(
            FFAppState().dataListCollectionDocRef!);
        _model.masterDataDoc = _model.masterDataQueryAction;
        safeSetState(() {});
        FFAppState().driverBehaviorData = FFAppState().isProduction
            ? DriverBehaviorDataModelStruct(
                driverBehavior: _model.masterDataDoc?.driverBehavior,
                driverBehaviorName: _model.masterDataDoc?.driverBehaviorName,
                driverBehaviorFlag: _model.masterDataDoc?.driverBehaviorFlag,
              )
            : DriverBehaviorDataModelStruct(
                driverBehavior: _model.masterDataDoc?.driverBehaviorUat,
                driverBehaviorName: _model.masterDataDoc?.driverBehaviorNameUat,
                driverBehaviorFlag: _model.masterDataDoc?.driverBehaviorFlagUat,
              );
        safeSetState(() {});
      }
      Navigator.pop(context);
    });

    _model.carryPurposeTextFieldTextController ??=
        TextEditingController(text: widget!.carrierPurpose);
    _model.carryPurposeTextFieldFocusNode ??= FocusNode();

    _model.currentPriceTextFieldTextController ??=
        TextEditingController(text: widget!.truckCurrentPrice);
    _model.currentPriceTextFieldFocusNode ??= FocusNode();
    _model.currentPriceTextFieldFocusNode!.addListener(
      () async {
        if ((_model.currentPriceTextFieldFocusNode?.hasFocus ?? false)) {
          if (_model.carrierPriceTextFieldTextController.text == '') {
            return;
          }
          safeSetState(() {
            _model.currentPriceTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.currentPriceTextFieldTextController.text);
          });
        } else {
          if (_model.currentPriceTextFieldTextController.text == '') {
            return;
          }
          safeSetState(() {
            _model.currentPriceTextFieldTextController?.text =
                functions.showNumberWithCommaWithoutDot(
                    _model.currentPriceTextFieldTextController.text)!;
          });
        }
      },
    );
    _model.carrierPriceTextFieldTextController ??=
        TextEditingController(text: widget!.carrierPrice);
    _model.carrierPriceTextFieldFocusNode ??= FocusNode();
    _model.carrierPriceTextFieldFocusNode!.addListener(
      () async {
        if ((_model.carrierPriceTextFieldFocusNode?.hasFocus ?? false)) {
          if (_model.carrierPriceTextFieldTextController.text == '') {
            return;
          }
          safeSetState(() {
            _model.carrierPriceTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.carrierPriceTextFieldTextController.text);
          });
        } else {
          if (_model.carrierPriceTextFieldTextController.text == '') {
            return;
          }
          safeSetState(() {
            _model.carrierPriceTextFieldTextController?.text =
                functions.showNumberWithCommaWithoutDot(
                    _model.carrierPriceTextFieldTextController.text)!;
          });
        }
      },
    );
    _model.brandNameTextFieldTextController ??= TextEditingController(
        text: functions.containWordinStringUrl(
                    'กรุณา', FFAppState().nonePackageBrandName)! ||
                functions.containWordinStringUrl(
                    'เลือก', FFAppState().nonePackageBrandName)!
            ? ''
            : FFAppState().nonePackageBrandName);

    _model.modelNameTextController ??= TextEditingController(
        text: functions.containWordinStringUrl(
                    'กรุณา', FFAppState().nonePackageModelName)! ||
                functions.containWordinStringUrl(
                    'เลือก', FFAppState().nonePackageModelName)!
            ? ''
            : FFAppState().nonePackageModelName);

    _model.oldVmiTextFieldTextController ??=
        TextEditingController(text: widget!.oldVmi);
    _model.oldVmiTextFieldFocusNode ??= FocusNode();

    _model.cusNameTextFieldTextController ??=
        TextEditingController(text: widget!.cusName);
    _model.cusNameTextFieldFocusNode ??= FocusNode();

    _model.cusPhoneTextFieldTextController ??=
        TextEditingController(text: widget!.cusPhone);
    _model.cusPhoneTextFieldFocusNode ??= FocusNode();

    _model.cusPhoneTextFieldMask = MaskTextInputFormatter(mask: '###-###-####');
    _model.plateTextFieldTextController ??=
        TextEditingController(text: widget!.plate);
    _model.plateTextFieldFocusNode ??= FocusNode();

    _model.plateAdditionalTextFieldTextController ??=
        TextEditingController(text: widget!.plateAdditional);
    _model.plateAdditionalTextFieldFocusNode ??= FocusNode();

    _model.plateAdditionalTextFieldMask =
        MaskTextInputFormatter(mask: '######');
    _model.sumInsuredTextFieldTextController ??=
        TextEditingController(text: widget!.sumInsured);
    _model.sumInsuredTextFieldFocusNode ??= FocusNode();
    _model.sumInsuredTextFieldFocusNode!.addListener(
      () async {
        if ((_model.sumInsuredTextFieldFocusNode?.hasFocus ?? false)) {
          if (_model.sumInsuredTextFieldTextController.text == '') {
            return;
          }
          safeSetState(() {
            _model.sumInsuredTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.sumInsuredTextFieldTextController.text);
          });
        } else {
          if (_model.sumInsuredTextFieldTextController.text == '') {
            return;
          }
          safeSetState(() {
            _model.sumInsuredTextFieldTextController?.text =
                functions.showNumberWithCommaWithoutDot(
                    _model.sumInsuredTextFieldTextController.text)!;
          });
        }
      },
    );
    _model.trailerSumInsuredTextFieldTextController ??=
        TextEditingController(text: widget!.trailerSumInsured);
    _model.trailerSumInsuredTextFieldFocusNode ??= FocusNode();
    _model.trailerSumInsuredTextFieldFocusNode!.addListener(
      () async {
        if ((_model.trailerSumInsuredTextFieldFocusNode?.hasFocus ?? false)) {
          if (_model.trailerSumInsuredTextFieldTextController.text == '') {
            return;
          }
          safeSetState(() {
            _model.trailerSumInsuredTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.trailerSumInsuredTextFieldTextController.text);
          });
        } else {
          if (_model.trailerSumInsuredTextFieldTextController.text == '') {
            return;
          }
          safeSetState(() {
            _model.trailerSumInsuredTextFieldTextController?.text =
                functions.showNumberWithCommaWithoutDot(
                    _model.trailerSumInsuredTextFieldTextController.text)!;
          });
        }
      },
    );
    _model.remarkTextFieldTextController ??=
        TextEditingController(text: widget!.remark);
    _model.remarkTextFieldFocusNode ??= FocusNode();

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
                context.pop();
              },
            ),
            title: Text(
              () {
                if (widget!.workType == 'transfer') {
                  return 'งานโอนโค้ด';
                } else if (FFAppState().nonePackageFlagRenew) {
                  return 'งานต่ออายุ';
                } else {
                  return 'งานนอกเรท';
                }
              }(),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.notoSansThai(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Color(0xFF003063),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!functions.checkIsStringLengthInLength(
                      FFAppState().branchCode, 2)!)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'เลือกสาขาที่จะลงผลงาน',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '(บังคับเลือก)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFB0606),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
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
                                    SearchBranchPageWidget.routeName,
                                    queryParameters: {
                                      'fromPage': serializeParam(
                                        'NonePackage',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  await actions.hideKeyboardAction(
                                    context,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Color(0xFFB3B3B3),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        title: Text(
                                          (FFAppState().nonePackageBranchCode !=
                                                      '') &&
                                                  (FFAppState()
                                                          .nonePackageBranchName !=
                                                      '')
                                              ? '(${FFAppState().nonePackageBranchCode}) ${FFAppState().nonePackageBranchName}'
                                              : 'กรุณาเลือกสาขาที่จะลงผลงาน',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                color: (FFAppState()
                                                                .nonePackageBranchCode !=
                                                            '') &&
                                                        (FFAppState()
                                                                .nonePackageBranchName !=
                                                            '')
                                                    ? Colors.black
                                                    : Color(0xFF9F9F9F),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF474747),
                                          size: 20.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ประเภทรถ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับเลือก)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                                  SearchableCarListPageWidget.routeName,
                                  queryParameters: {
                                    'titleText': serializeParam(
                                      'เลือกประเภทรถ',
                                      ParamType.String,
                                    ),
                                    'searchLabel': serializeParam(
                                      'ระบุประเภทรถ',
                                      ParamType.String,
                                    ),
                                    'dataList': serializeParam(
                                      FFAppState()
                                          .insuranceBasicVehicleTypeDropdownList
                                          .take(4)
                                          .toList(),
                                      ParamType.String,
                                      isList: true,
                                    ),
                                    'multiSelect': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'fromPage': serializeParam(
                                      'NonePackage',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                await actions.hideKeyboardAction(
                                  context,
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState().nonePackageVehicleType,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: functions.containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageVehicleType)! ||
                                                      functions
                                                          .containWordinStringUrl(
                                                              'เลือก',
                                                              FFAppState()
                                                                  .nonePackageVehicleType)!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.navigate_next,
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
                  if (FFAppState().nonePackageVehicleType ==
                      'รถบรรทุก หัวลาก หางพ่วง')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'ส่วนของรถบรรทุก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(บังคับเลือก)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
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
                                    SearchableListPageWidget.routeName,
                                    queryParameters: {
                                      'titleText': serializeParam(
                                        'เลือกส่วนของรถบรรทุก',
                                        ParamType.String,
                                      ),
                                      'searchLabel': serializeParam(
                                        'ระบุส่วนของรถบรรทุก',
                                        ParamType.String,
                                      ),
                                      'dataList': serializeParam(
                                        FFAppState().nonePackageTruckPartList,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'multiSelect': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                      'fromPage': serializeParam(
                                        'NonePackage',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  await actions.hideKeyboardAction(
                                    context,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFAppState().nonePackageTruckPart,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: functions
                                                        .containWordinStringUrl(
                                                            'กรุณา',
                                                            FFAppState()
                                                                .nonePackageTruckPart)!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Icon(
                                          Icons.navigate_next,
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
                  if (FFAppState().nonePackageVehicleType ==
                      'รถบรรทุก หัวลาก หางพ่วง')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'ประเภทลูกค้า',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(บังคับเลือก)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
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
                                    SearchableListPageWidget.routeName,
                                    queryParameters: {
                                      'titleText': serializeParam(
                                        'เลือกประเภทลูกค้า',
                                        ParamType.String,
                                      ),
                                      'searchLabel': serializeParam(
                                        'ระบุประเภทลูกค้า',
                                        ParamType.String,
                                      ),
                                      'dataList': serializeParam(
                                        FFAppState()
                                            .nonePackageCusMembershipList,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'multiSelect': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                      'fromPage': serializeParam(
                                        'NonePackage',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  await actions.hideKeyboardAction(
                                    context,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFAppState().nonePackageCusMembership,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: functions
                                                        .containWordinStringUrl(
                                                            'กรุณา',
                                                            FFAppState()
                                                                .nonePackageCusMembership)!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Icon(
                                          Icons.navigate_next,
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
                  if (FFAppState().nonePackageVehicleType ==
                      'รถบรรทุก หัวลาก หางพ่วง')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'รถใช้บรรทุกอะไร',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(บังคับกรอก)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: _model
                                          .carryPurposeTextFieldTextController,
                                      focusNode:
                                          _model.carryPurposeTextFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintText: 'กรุณากรอกรถใช้บรรทุกอะไร',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFB3B3B3),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      validator: _model
                                          .carryPurposeTextFieldTextControllerValidator
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
                  if (FFAppState().nonePackageVehicleType ==
                      'รถบรรทุก หัวลาก หางพ่วง')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'ราคาซื้อขายปัจจุบัน',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: _model
                                          .currentPriceTextFieldTextController,
                                      focusNode:
                                          _model.currentPriceTextFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.currentPriceTextFieldTextController',
                                        Duration(milliseconds: 100),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintText:
                                            'กรุณากรอกราคาซื้อขายปัจจุบัน',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .currentPriceTextFieldTextControllerValidator
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
                  if (FFAppState().nonePackageVehicleType == 'รถกระบะ')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().nonePackageFlagCarrier) {
                                    FFAppState().nonePackageFlagCarrier = false;
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().nonePackageFlagCarrier = true;
                                    safeSetState(() {});
                                  }

                                  await actions.hideKeyboardAction(
                                    context,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'ติดตู้เหล็กหรือไม่',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: !FFAppState()
                                                        .nonePackageFlagCarrier
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      if (!FFAppState().nonePackageFlagCarrier)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 25.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFF9F9F9F),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().nonePackageFlagCarrier)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 25.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 18.0,
                                              ),
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
                  if ((FFAppState().nonePackageVehicleType == 'รถกระบะ') &&
                      FFAppState().nonePackageFlagCarrier)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().nonePackageFlagCoop) {
                                    FFAppState().nonePackageFlagCoop = false;
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().nonePackageFlagCoop = true;
                                    safeSetState(() {});
                                  }

                                  await actions.hideKeyboardAction(
                                    context,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'ใช้วิ่งร่วมกับบริษัทขนส่งเอกชนหรือไม่',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: !FFAppState()
                                                        .nonePackageFlagCoop
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      if (!FFAppState().nonePackageFlagCoop)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 25.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFF9F9F9F),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().nonePackageFlagCoop)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 25.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 18.0,
                                              ),
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
                  if ((FFAppState().nonePackageVehicleType == 'รถกระบะ') &&
                      FFAppState().nonePackageFlagCarrier)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'ประเภทตู้เหล็ก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(บังคับเลือก)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
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
                                    SearchableListPageWidget.routeName,
                                    queryParameters: {
                                      'titleText': serializeParam(
                                        'เลือกประเภทตู้เหล็ก',
                                        ParamType.String,
                                      ),
                                      'searchLabel': serializeParam(
                                        'ระบุประเภทตู้เหล็ก',
                                        ParamType.String,
                                      ),
                                      'dataList': serializeParam(
                                        FFAppState().nonePackageCarrierTypeList,
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
                                      'fromPage': serializeParam(
                                        'NonePackage',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  await actions.hideKeyboardAction(
                                    context,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFAppState().nonePackageCarrierType,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: functions
                                                        .containWordinStringUrl(
                                                            'กรุณา',
                                                            FFAppState()
                                                                .nonePackageCarrierType)!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Icon(
                                          Icons.navigate_next,
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
                  if ((FFAppState().nonePackageVehicleType == 'รถกระบะ') &&
                      FFAppState().nonePackageFlagCarrier &&
                      (FFAppState().nonePackageCarrierType == 'ตู้เย็น'))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'ราคาตู้ + เครื่องทำความเย็น',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(บังคับกรอก เป็นตัวเลขเท่านั้น)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .carrierPriceTextFieldTextController,
                                          focusNode: _model
                                              .carrierPriceTextFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.carrierPriceTextFieldTextController',
                                            Duration(milliseconds: 100),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            hintText: 'กรุณากรอกราคา',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFB3B3B3),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .carrierPriceTextFieldTextControllerValidator
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ยี่ห้อรถ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับเลือก)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
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
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Autocomplete<String>(
                                          initialValue: TextEditingValue(
                                              text: functions.containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageBrandName)! ||
                                                      functions
                                                          .containWordinStringUrl(
                                                              'เลือก',
                                                              FFAppState()
                                                                  .nonePackageBrandName)!
                                                  ? ''
                                                  : FFAppState()
                                                      .nonePackageBrandName),
                                          optionsBuilder: (textEditingValue) {
                                            if (textEditingValue.text == '') {
                                              return const Iterable<
                                                  String>.empty();
                                            }
                                            return FFAppState()
                                                .insuranceBasicBrandNameList
                                                .where((option) {
                                              final lowercaseOption =
                                                  option.toLowerCase();
                                              return lowercaseOption.contains(
                                                  textEditingValue.text
                                                      .toLowerCase());
                                            });
                                          },
                                          optionsViewBuilder:
                                              (context, onSelected, options) {
                                            return AutocompleteOptionsList(
                                              textFieldKey:
                                                  _model.brandNameTextFieldKey,
                                              textController: _model
                                                  .brandNameTextFieldTextController!,
                                              options: options.toList(),
                                              onSelected: onSelected,
                                              textStyle:
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
                                              textHighlightStyle: TextStyle(),
                                              elevation: 4.0,
                                              optionBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              optionHighlightColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              maxHeight: 200.0,
                                            );
                                          },
                                          onSelected: (String selection) {
                                            safeSetState(() => _model
                                                    .brandNameTextFieldSelectedOption =
                                                selection);
                                            FocusScope.of(context).unfocus();
                                          },
                                          fieldViewBuilder: (
                                            context,
                                            textEditingController,
                                            focusNode,
                                            onEditingComplete,
                                          ) {
                                            _model.brandNameTextFieldFocusNode =
                                                focusNode;
                                            if (!brandNameTextFieldFocusListenerRegistered) {
                                              brandNameTextFieldFocusListenerRegistered =
                                                  true;
                                              _model
                                                  .brandNameTextFieldFocusNode!
                                                  .addListener(
                                                () async {
                                                  if (FFAppState()
                                                          .insuranceBasicVehicleGroup ==
                                                      'PICKUP') {
                                                    FFAppState().nonePackageSearchModelList = functions
                                                        .returnMappedListFrom3List(
                                                            FFAppState()
                                                                .insuranceBasicModelNameListOriginal
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicModelBrandIdListOriginal
                                                                .toList(),
                                                            functions.getValueWithMappedList(
                                                                FFAppState()
                                                                    .insuranceBasicBrandIdList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicBrandNameList
                                                                    .toList(),
                                                                functions.toUpperCase(
                                                                    _model
                                                                        .brandNameTextFieldTextController
                                                                        .text)),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroupList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroup,
                                                            FFAppState()
                                                                .insuranceBasicCarGroupDetail
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicCarTypeContain,
                                                            FFAppState()
                                                                .insuranceBasicCarDoorList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicCarTypeDoors)
                                                        .toList()
                                                        .cast<String>();
                                                    FFAppState().nonePackageSearchModelIdList = functions
                                                        .returnMappedListFrom3List(
                                                            FFAppState()
                                                                .insuranceBasicModelIdListOriginal
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicModelBrandIdListOriginal
                                                                .toList(),
                                                            functions.getValueWithMappedList(
                                                                FFAppState()
                                                                    .insuranceBasicBrandIdList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicBrandNameList
                                                                    .toList(),
                                                                functions.toUpperCase(
                                                                    _model
                                                                        .brandNameTextFieldTextController
                                                                        .text)),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroupList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroup,
                                                            FFAppState()
                                                                .insuranceBasicCarGroupDetail
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicCarTypeContain,
                                                            FFAppState()
                                                                .insuranceBasicCarDoorList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicCarTypeDoors)
                                                        .toList()
                                                        .cast<String>();
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState().nonePackageSearchModelList = functions
                                                        .returnMappedListFrom3ListOther(
                                                            FFAppState()
                                                                .insuranceBasicModelNameListOriginal
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicModelBrandIdListOriginal
                                                                .toList(),
                                                            functions.getValueWithMappedList(
                                                                FFAppState()
                                                                    .insuranceBasicBrandIdList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicBrandNameList
                                                                    .toList(),
                                                                functions.toUpperCase(
                                                                    _model
                                                                        .brandNameTextFieldTextController
                                                                        .text)),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroupList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroup)
                                                        .toList()
                                                        .cast<String>();
                                                    FFAppState().nonePackageSearchModelIdList = functions
                                                        .returnMappedListFrom3ListOther(
                                                            FFAppState()
                                                                .insuranceBasicModelIdListOriginal
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicModelBrandIdListOriginal
                                                                .toList(),
                                                            functions.getValueWithMappedList(
                                                                FFAppState()
                                                                    .insuranceBasicBrandIdList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicBrandNameList
                                                                    .toList(),
                                                                functions.toUpperCase(
                                                                    _model
                                                                        .brandNameTextFieldTextController
                                                                        .text)),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroupList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroup)
                                                        .toList()
                                                        .cast<String>();
                                                    safeSetState(() {});
                                                  }
                                                },
                                              );
                                            }
                                            _model.brandNameTextFieldTextController =
                                                textEditingController;
                                            return TextFormField(
                                              key: _model.brandNameTextFieldKey,
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.brandNameTextFieldTextController',
                                                Duration(milliseconds: 1000),
                                                () async {},
                                              ),
                                              onFieldSubmitted: (_) async {
                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                                if (FFAppState()
                                                        .insuranceBasicVehicleGroup ==
                                                    'PICKUP') {
                                                  FFAppState().nonePackageSearchModelList = functions
                                                      .returnMappedListFrom3List(
                                                          FFAppState()
                                                              .insuranceBasicModelNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          functions.getValueWithMappedList(
                                                              FFAppState()
                                                                  .insuranceBasicBrandIdList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicBrandNameList
                                                                  .toList(),
                                                              functions.toUpperCase(
                                                                  _model
                                                                      .brandNameTextFieldTextController
                                                                      .text)),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup,
                                                          FFAppState()
                                                              .insuranceBasicCarGroupDetail
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicCarTypeContain,
                                                          FFAppState()
                                                              .insuranceBasicCarDoorList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicCarTypeDoors)
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState().nonePackageSearchModelIdList = functions
                                                      .returnMappedListFrom3List(
                                                          FFAppState()
                                                              .insuranceBasicModelIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          functions.getValueWithMappedList(
                                                              FFAppState()
                                                                  .insuranceBasicBrandIdList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicBrandNameList
                                                                  .toList(),
                                                              functions.toUpperCase(
                                                                  _model
                                                                      .brandNameTextFieldTextController
                                                                      .text)),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup,
                                                          FFAppState()
                                                              .insuranceBasicCarGroupDetail
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicCarTypeContain,
                                                          FFAppState()
                                                              .insuranceBasicCarDoorList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicCarTypeDoors)
                                                      .toList()
                                                      .cast<String>();
                                                  safeSetState(() {});
                                                } else {
                                                  FFAppState().nonePackageSearchModelList = functions
                                                      .returnMappedListFrom3ListOther(
                                                          FFAppState()
                                                              .insuranceBasicModelNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          functions.getValueWithMappedList(
                                                              FFAppState()
                                                                  .insuranceBasicBrandIdList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicBrandNameList
                                                                  .toList(),
                                                              functions.toUpperCase(
                                                                  _model
                                                                      .brandNameTextFieldTextController
                                                                      .text)),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState().nonePackageSearchModelIdList = functions
                                                      .returnMappedListFrom3ListOther(
                                                          FFAppState()
                                                              .insuranceBasicModelIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          functions.getValueWithMappedList(
                                                              FFAppState()
                                                                  .insuranceBasicBrandIdList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicBrandNameList
                                                                  .toList(),
                                                              functions.toUpperCase(
                                                                  _model
                                                                      .brandNameTextFieldTextController
                                                                      .text)),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  safeSetState(() {});
                                                }
                                              },
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansThai(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                hintText: 'กรุณากรอกรุ่นรถ',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansThai(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
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
                                                        color: Colors.black,
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
                                              validator: _model
                                                  .brandNameTextFieldTextControllerValidator
                                                  .asValidator(context),
                                            );
                                          },
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'รุ่นรถ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับกรอก)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFB3B3B3),
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Autocomplete<String>(
                                    initialValue: TextEditingValue(
                                        text: functions.containWordinStringUrl(
                                                    'กรุณา',
                                                    FFAppState()
                                                        .nonePackageModelName)! ||
                                                functions.containWordinStringUrl(
                                                    'เลือก',
                                                    FFAppState()
                                                        .nonePackageModelName)!
                                            ? ''
                                            : FFAppState()
                                                .nonePackageModelName),
                                    optionsBuilder: (textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      return FFAppState()
                                          .nonePackageSearchModelList
                                          .where((option) {
                                        final lowercaseOption =
                                            option.toLowerCase();
                                        return lowercaseOption.contains(
                                            textEditingValue.text
                                                .toLowerCase());
                                      });
                                    },
                                    optionsViewBuilder:
                                        (context, onSelected, options) {
                                      return AutocompleteOptionsList(
                                        textFieldKey: _model.modelNameKey,
                                        textController:
                                            _model.modelNameTextController!,
                                        options: options.toList(),
                                        onSelected: onSelected,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        textHighlightStyle: TextStyle(),
                                        elevation: 4.0,
                                        optionBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        optionHighlightColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        maxHeight: 200.0,
                                      );
                                    },
                                    onSelected: (String selection) {
                                      safeSetState(() => _model
                                          .modelNameSelectedOption = selection);
                                      FocusScope.of(context).unfocus();
                                    },
                                    fieldViewBuilder: (
                                      context,
                                      textEditingController,
                                      focusNode,
                                      onEditingComplete,
                                    ) {
                                      _model.modelNameFocusNode = focusNode;

                                      _model.modelNameTextController =
                                          textEditingController;
                                      return TextFormField(
                                        key: _model.modelNameKey,
                                        controller: textEditingController,
                                        focusNode: focusNode,
                                        onEditingComplete: onEditingComplete,
                                        onFieldSubmitted: (_) async {
                                          await actions.hideKeyboardAction(
                                            context,
                                          );
                                        },
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'กรุณากรอกรุ่นรถ',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFB3B3B3),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        validator: _model
                                            .modelNameTextControllerValidator
                                            .asValidator(context),
                                      );
                                    },
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ปีจดทะเบียนรถ พ.ศ.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับเลือก)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                                  SearchableListPageWidget.routeName,
                                  queryParameters: {
                                    'titleText': serializeParam(
                                      'เลือกปีจดทะเบียน',
                                      ParamType.String,
                                    ),
                                    'searchLabel': serializeParam(
                                      'ระบุปีจดทะเบียน',
                                      ParamType.String,
                                    ),
                                    'dataList': serializeParam(
                                      functions.reverseList(functions
                                          .ganerateYearList(
                                              2500, FFAppState().currentYearBE)
                                          ?.toList()),
                                      ParamType.String,
                                      isList: true,
                                    ),
                                    'multiSelect': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'fromPage': serializeParam(
                                      'NonePackage',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                await actions.hideKeyboardAction(
                                  context,
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState().nonePackageYear,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: functions.containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageYear)! ||
                                                      functions
                                                          .containWordinStringUrl(
                                                              'เลือก',
                                                              FFAppState()
                                                                  .nonePackageYear)!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.navigate_next,
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
                  if (FFAppState().nonePackageFlagRenew)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'เลขกรมธรรม์',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  'เดิม',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w800,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(บังคับกรอก)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.oldVmiTextFieldTextController,
                                      focusNode:
                                          _model.oldVmiTextFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintText: 'กรุณากรอกเลขกรมธรรม์เดิม',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFB3B3B3),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      validator: _model
                                          .oldVmiTextFieldTextControllerValidator
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'วันที่หมดอายุประกัน',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                'เดิม',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              if (FFAppState().nonePackageFlagRenew)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(บังคับเลือก)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                            ],
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
                                final _datePickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                );

                                if (_datePickedDate != null) {
                                  safeSetState(() {
                                    _model.datePicked = DateTime(
                                      _datePickedDate.year,
                                      _datePickedDate.month,
                                      _datePickedDate.day,
                                    );
                                  });
                                } else if (_model.datePicked != null) {
                                  safeSetState(() {
                                    _model.datePicked = getCurrentTimestamp;
                                  });
                                }
                                await actions.hideKeyboardAction(
                                  context,
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          () {
                                            if (_model.datePicked != null) {
                                              return functions.showDateBE(_model
                                                  .datePicked
                                                  ?.toString());
                                            } else if ((FFAppState()
                                                        .nonePackageOldVmiExpDate !=
                                                    '') &&
                                                !functions.containWordinStringUrl(
                                                    'กรุณา',
                                                    FFAppState()
                                                        .nonePackageOldVmiExpDate)!) {
                                              return functions.showDateBE(
                                                  FFAppState()
                                                      .nonePackageOldVmiExpDate);
                                            } else {
                                              return (widget!.oldVmiExpireDate !=
                                                          null &&
                                                      widget!.oldVmiExpireDate !=
                                                          ''
                                                  ? functions.showDateBE(
                                                      widget!.oldVmiExpireDate)
                                                  : 'กรุณาเลือกวันที่หมดอายุประกันเดิม');
                                            }
                                          }(),
                                          'กรุณาเลือกวันที่หมดอายุประกันเดิม',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: () {
                                                if (_model.datePicked != null) {
                                                  return Colors.black;
                                                } else if ((FFAppState()
                                                            .nonePackageOldVmiExpDate !=
                                                        '') &&
                                                    !functions
                                                        .containWordinStringUrl(
                                                            'กรุณา',
                                                            FFAppState()
                                                                .nonePackageOldVmiExpDate)!) {
                                                  return Colors.black;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText;
                                                }
                                              }(),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.edit_calendar_outlined,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ลักษณะการใช้รถ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับเลือก)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                                  SearchableListPageWidget.routeName,
                                  queryParameters: {
                                    'titleText': serializeParam(
                                      'เลือกลักษณะการใช้รถ',
                                      ParamType.String,
                                    ),
                                    'searchLabel': serializeParam(
                                      'ระบุลักษณะการใช้รถ',
                                      ParamType.String,
                                    ),
                                    'dataList': serializeParam(
                                      functions
                                          .generateInsuranceVehicleTypeDropdown(
                                              FFAppState()
                                                  .nonePackageUsedTypeCodeList
                                                  .toList(),
                                              FFAppState()
                                                  .nonePackageUsedTypeTypeList
                                                  .toList(),
                                              FFAppState()
                                                  .nonePackageUsedTypeNameList
                                                  .toList()),
                                      ParamType.String,
                                      isList: true,
                                    ),
                                    'multiSelect': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'fromPage': serializeParam(
                                      'NonePackage',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                await actions.hideKeyboardAction(
                                  context,
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          functions.containWordinStringUrl(
                                                  'เลือก',
                                                  FFAppState()
                                                      .nonePackageUsedTypeName)!
                                              ? 'กรุณาเลือกลักษณะการใช้รถ'
                                              : (functions
                                                  .generateInsuranceVehicleTypeDropdown(
                                                      FFAppState()
                                                          .nonePackageUsedTypeCodeList
                                                          .toList(),
                                                      FFAppState()
                                                          .nonePackageUsedTypeTypeList
                                                          .toList(),
                                                      FFAppState()
                                                          .nonePackageUsedTypeNameList
                                                          .toList())
                                                  ?.elementAtOrNull(functions
                                                      .getIndexOfSomethingList(
                                                          FFAppState()
                                                              .nonePackageUsedTypeCodeList
                                                              .toList(),
                                                          FFAppState()
                                                              .nonePackageUsedTypeCode))),
                                          'เลือกการใช้งาน',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: functions.containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageUsedTypeName)! ||
                                                      functions
                                                          .containWordinStringUrl(
                                                              'เลือก',
                                                              FFAppState()
                                                                  .nonePackageUsedTypeName)!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.navigate_next,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ประเภทชั้นประกัน',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              if (FFAppState().nonePackageFlagRenew)
                                Text(
                                  'เดิม',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w800,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับเลือก)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                                  SearchableListPageWidget.routeName,
                                  queryParameters: {
                                    'titleText': serializeParam(
                                      'เลือกประเภทชั้นประกัน',
                                      ParamType.String,
                                    ),
                                    'searchLabel': serializeParam(
                                      'ระบุประเภทชั้นประกัน',
                                      ParamType.String,
                                    ),
                                    'dataList': serializeParam(
                                      FFAppState()
                                          .insuranceBasicCoverTypeNameList,
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
                                    'fromPage': serializeParam(
                                      'NonePackage',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                await actions.hideKeyboardAction(
                                  context,
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState().nonePackageCoverTypeName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: functions
                                                      .containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageCoverTypeName)!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.navigate_next,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ประเภทการซ่อม',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              if (FFAppState().nonePackageFlagRenew)
                                Text(
                                  'เดิม',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w800,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับเลือก)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                                  SearchableListPageWidget.routeName,
                                  queryParameters: {
                                    'titleText': serializeParam(
                                      'เลือกประเภทการซ่อม',
                                      ParamType.String,
                                    ),
                                    'searchLabel': serializeParam(
                                      'ระบุประเภทการซ่อม',
                                      ParamType.String,
                                    ),
                                    'dataList': serializeParam(
                                      FFAppState()
                                          .insuranceBasicGarageTypeNameList,
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
                                    'fromPage': serializeParam(
                                      'NonePackage',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                await actions.hideKeyboardAction(
                                  context,
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState().nonePackageGarageTypeName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: functions
                                                      .containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageGarageTypeName)!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.navigate_next,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFAppState().buttonOrdinary
                                    ? 'ชื่อลูกค้า'
                                    : 'ชื่อบริษัทลูกค้า',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับกรอก)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
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
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .cusNameTextFieldTextController,
                                          focusNode:
                                              _model.cusNameTextFieldFocusNode,
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            hintText: 'กรุณากรอกชื่อ',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFB3B3B3),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
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
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          validator: _model
                                              .cusNameTextFieldTextControllerValidator
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'เบอร์โทรศัพท์ลูกค้า',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              if (FFAppState().nonePackageFlagRenew)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(บังคับกรอก)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
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
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .cusPhoneTextFieldTextController,
                                          focusNode:
                                              _model.cusPhoneTextFieldFocusNode,
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            hintText: 'กรุณากรอกเบอร์โทรศัพท์',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFB3B3B3),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
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
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          keyboardType: TextInputType.phone,
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ทะเบียนรถ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับกรอก ไม่ต้องมีขีด - )',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
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
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .plateTextFieldTextController,
                                          focusNode:
                                              _model.plateTextFieldFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            hintText: 'กรุณากรอกทะเบียนรถ',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFB3B3B3),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
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
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          validator: _model
                                              .plateTextFieldTextControllerValidator
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
                  if ((FFAppState().nonePackageVehicleType ==
                          'รถบรรทุก หัวลาก หางพ่วง') &&
                      (FFAppState().nonePackageTruckPart == 'หัวลาก + หางพ่วง'))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'เลขทะเบียนหางพ่วง',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(กรุณาระบุเป็นตัวเลขเช่น 123456)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .plateAdditionalTextFieldTextController,
                                            focusNode: _model
                                                .plateAdditionalTextFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              hintText: 'กรุณากรอกทะเบียนรถ',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
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
                                                  color: Colors.black,
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
                                            validator: _model
                                                .plateAdditionalTextFieldTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              _model
                                                  .plateAdditionalTextFieldMask
                                            ],
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'จังหวัดจดทะเบียน',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(บังคับเลือก)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                                  SearchableListPageWidget.routeName,
                                  queryParameters: {
                                    'titleText': serializeParam(
                                      'เลือกจังหวัดจดทะเบียน',
                                      ParamType.String,
                                    ),
                                    'searchLabel': serializeParam(
                                      'ระบุจังหวัดจดทะเบียน',
                                      ParamType.String,
                                    ),
                                    'dataList': serializeParam(
                                      FFAppState()
                                          .insuranceBasicProvinceNameList,
                                      ParamType.String,
                                      isList: true,
                                    ),
                                    'multiSelect': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'fromPage': serializeParam(
                                      'NonePackage',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                await actions.hideKeyboardAction(
                                  context,
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState().nonePackageProvince,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: functions
                                                      .containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageProvince)!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.navigate_next,
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
                  if (false)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.driverFlag = !_model.driverFlag;
                          safeSetState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFFB3B3B3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ระบุผู้ขับขี่หรือไม่?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (_model.driverFlag) {
                                        return Icon(
                                          Icons.check_circle,
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          size: 24.0,
                                        );
                                      } else {
                                        return Icon(
                                          Icons.radio_button_off_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (_model.driverFlag)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'พฤติกรรมผู้ขับขี่',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '(บังคับเลือก)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFB0606),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 5.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SearchableDriverBehaviorListPageWidget
                                        .routeName,
                                    queryParameters: {
                                      'titleText': serializeParam(
                                        'เลือกพฤติกรรมผู้ขับขี่',
                                        ParamType.String,
                                      ),
                                      'searchLabel': serializeParam(
                                        'เลือกพฤติกรรมผู้ขับขี่',
                                        ParamType.String,
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
                                        'NonePackage',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  await actions.hideKeyboardAction(
                                    context,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Color(0xFFB3B3B3),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: ListTile(
                                          title: Text(
                                            FFAppState().nonePackageDriverBehaviorName !=
                                                    ''
                                                ? FFAppState()
                                                    .nonePackageDriverBehaviorName
                                                : 'กรุณาเลือกพฤติกรรมผู้ขับขี่',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FFAppState()
                                                              .nonePackageDriverBehaviorName ==
                                                          ''
                                                      ? Color(0xFF9F9F9F)
                                                      : Colors.black,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
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
                                                BorderRadius.circular(10.0),
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
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ทุนประกันที่ลูกค้าต้องการ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '(กรอกตัวเลขเท่านั้น)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFB3B3B3),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: _model
                                          .sumInsuredTextFieldTextController,
                                      focusNode:
                                          _model.sumInsuredTextFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.sumInsuredTextFieldTextController',
                                        Duration(milliseconds: 100),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintText: 'กรุณากรอกทุนประกัน',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .sumInsuredTextFieldTextControllerValidator
                                          .asValidator(context),
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
                  if ((FFAppState().nonePackageVehicleType ==
                          'รถบรรทุก หัวลาก หางพ่วง') &&
                      (FFAppState().nonePackageTruckPart == 'หัวลาก + หางพ่วง'))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'ทุนประกันหางพ่วงที่ลูกค้าต้องการ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '(กรอกตัวเลขเท่านั้น)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: TextFormField(
                                        controller: _model
                                            .trailerSumInsuredTextFieldTextController,
                                        focusNode: _model
                                            .trailerSumInsuredTextFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.trailerSumInsuredTextFieldTextController',
                                          Duration(milliseconds: 100),
                                          () => safeSetState(() {}),
                                        ),
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'กรุณากรอกทุนประกันหางพ่วง',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .trailerSumInsuredTextFieldTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          if (!isAndroid && !isiOS)
                                            TextInputFormatter.withFunction(
                                                (oldValue, newValue) {
                                              return TextEditingValue(
                                                selection: newValue.selection,
                                                text: newValue.text
                                                    .toCapitalization(
                                                        TextCapitalization
                                                            .none),
                                              );
                                            }),
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'))
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
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'หมายเหตุ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansThai(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFB3B3B3),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.remarkTextFieldTextController,
                                  focusNode: _model.remarkTextFieldFocusNode,
                                  autofocus: false,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFB3B3B3),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'กรุณากรอกหมายเหตุ',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.notoSansThai(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFB3B3B3),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  validator: _model
                                      .remarkTextFieldTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    if (!isAndroid && !isiOS)
                                      TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                        return TextEditingValue(
                                          selection: newValue.selection,
                                          text: newValue.text.toCapitalization(
                                              TextCapitalization.none),
                                        );
                                      }),
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
                        EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (FFAppState().nonePackageFlagAct) {
                                  FFAppState().nonePackageFlagAct = false;
                                  safeSetState(() {});
                                } else {
                                  FFAppState().nonePackageFlagAct = true;
                                  safeSetState(() {});
                                }

                                await actions.hideKeyboardAction(
                                  context,
                                );
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'ขอเบี้ย พ.ร.บ. หรือไม่',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: !FFAppState()
                                                      .nonePackageFlagAct
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    if (!FFAppState().nonePackageFlagAct)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFF9F9F9F),
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().nonePackageFlagAct)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 18.0,
                                            ),
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
                  if (widget!.workType == 'transfer')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 33.0,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'เอกสารเพิ่มเติม',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF003063),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '(งานโอนโค้ด)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFFB0606),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '1. ตารางกรมธรรม์เดิม',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับอัพโหลดรูป)',
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
                                                  color: Color(0xFFFB0606),
                                                  fontSize: 12.0,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.74,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        final selectedMedia =
                                                            await selectMediaWithSourceBottomSheet(
                                                          context: context,
                                                          imageQuality: 30,
                                                          allowPhoto: true,
                                                        );
                                                        if (selectedMedia !=
                                                                null &&
                                                            selectedMedia.every((m) =>
                                                                validateFileFormat(
                                                                    m.storagePath,
                                                                    context))) {
                                                          safeSetState(() =>
                                                              _model.isDataUploading_oldVmiUploadedAction =
                                                                  true);
                                                          var selectedUploadedFiles =
                                                              <FFUploadedFile>[];

                                                          var downloadUrls =
                                                              <String>[];
                                                          try {
                                                            selectedUploadedFiles =
                                                                selectedMedia
                                                                    .map((m) =>
                                                                        FFUploadedFile(
                                                                          name: m
                                                                              .storagePath
                                                                              .split('/')
                                                                              .last,
                                                                          bytes:
                                                                              m.bytes,
                                                                          height: m
                                                                              .dimensions
                                                                              ?.height,
                                                                          width: m
                                                                              .dimensions
                                                                              ?.width,
                                                                          blurHash:
                                                                              m.blurHash,
                                                                          originalFilename:
                                                                              m.originalFilename,
                                                                        ))
                                                                    .toList();

                                                            downloadUrls =
                                                                (await Future
                                                                        .wait(
                                                              selectedMedia.map(
                                                                (m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes),
                                                              ),
                                                            ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                          } finally {
                                                            _model.isDataUploading_oldVmiUploadedAction =
                                                                false;
                                                          }
                                                          if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length &&
                                                              downloadUrls
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                            safeSetState(() {
                                                              _model.uploadedLocalFile_oldVmiUploadedAction =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                              _model.uploadedFileUrl_oldVmiUploadedAction =
                                                                  downloadUrls
                                                                      .first;
                                                            });
                                                          } else {
                                                            safeSetState(() {});
                                                            return;
                                                          }
                                                        }

                                                        await actions
                                                            .hideKeyboardAction(
                                                          context,
                                                        );
                                                        if (!(_model.uploadedFileUrl_oldVmiUploadedAction !=
                                                                null &&
                                                            _model.uploadedFileUrl_oldVmiUploadedAction !=
                                                                '')) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      3000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xB2000000),
                                                            ),
                                                          );
                                                          return;
                                                        }
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'อัพโหลดรูปภาพสำเร็จ',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    3000),
                                                            backgroundColor:
                                                                Color(
                                                                    0xB2000000),
                                                          ),
                                                        );
                                                      },
                                                      text: 'แนบไฟล์',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.35,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsets.all(0.0),
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
                                                                  color: Color(
                                                                      0xFFD9761A),
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
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Text(
                                                        'สถานะ :',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                      14.0,
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
                                                    Text(
                                                      _model.uploadedFileUrl_oldVmiUploadedAction !=
                                                                  null &&
                                                              _model.uploadedFileUrl_oldVmiUploadedAction !=
                                                                  ''
                                                          ? 'อัพโหลดแล้ว'
                                                          : 'ยังไม่อัพโหลด',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                fontSize: 14.0,
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 100.0,
                                              decoration: BoxDecoration(),
                                            ),
                                            if (_model.uploadedFileUrl_oldVmiUploadedAction !=
                                                    null &&
                                                _model.uploadedFileUrl_oldVmiUploadedAction !=
                                                    '')
                                              Icon(
                                                Icons.check,
                                                color: Color(0xFF2EDD78),
                                                size: 24.0,
                                              ),
                                            if (_model.uploadedFileUrl_oldVmiUploadedAction ==
                                                    null ||
                                                _model.uploadedFileUrl_oldVmiUploadedAction ==
                                                    '')
                                              Container(
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible: _model
                                                              .uploadedFileUrl_oldVmiUploadedAction ==
                                                          null ||
                                                      _model.uploadedFileUrl_oldVmiUploadedAction ==
                                                          '',
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Color(0xFFFC0A0A),
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
                                  20.0, 10.0, 20.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '2. สำเนาบัตรประชาชน',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.notoSansThai(
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับอัพโหลดรูป)',
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
                                                  color: Color(0xFFFB0606),
                                                  fontSize: 12.0,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.content_paste_search_rounded,
                                            color: Color(0xFF354052),
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                  SampleIDcardWidget.routeName);
                                            },
                                            child: Text(
                                              'ดูตัวอย่าง',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.74,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        final selectedMedia =
                                                            await selectMediaWithSourceBottomSheet(
                                                          context: context,
                                                          imageQuality: 30,
                                                          allowPhoto: true,
                                                        );
                                                        if (selectedMedia !=
                                                                null &&
                                                            selectedMedia.every((m) =>
                                                                validateFileFormat(
                                                                    m.storagePath,
                                                                    context))) {
                                                          safeSetState(() =>
                                                              _model.isDataUploading_idCardUploadedAction =
                                                                  true);
                                                          var selectedUploadedFiles =
                                                              <FFUploadedFile>[];

                                                          var downloadUrls =
                                                              <String>[];
                                                          try {
                                                            selectedUploadedFiles =
                                                                selectedMedia
                                                                    .map((m) =>
                                                                        FFUploadedFile(
                                                                          name: m
                                                                              .storagePath
                                                                              .split('/')
                                                                              .last,
                                                                          bytes:
                                                                              m.bytes,
                                                                          height: m
                                                                              .dimensions
                                                                              ?.height,
                                                                          width: m
                                                                              .dimensions
                                                                              ?.width,
                                                                          blurHash:
                                                                              m.blurHash,
                                                                          originalFilename:
                                                                              m.originalFilename,
                                                                        ))
                                                                    .toList();

                                                            downloadUrls =
                                                                (await Future
                                                                        .wait(
                                                              selectedMedia.map(
                                                                (m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes),
                                                              ),
                                                            ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                          } finally {
                                                            _model.isDataUploading_idCardUploadedAction =
                                                                false;
                                                          }
                                                          if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length &&
                                                              downloadUrls
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                            safeSetState(() {
                                                              _model.uploadedLocalFile_idCardUploadedAction =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                              _model.uploadedFileUrl_idCardUploadedAction =
                                                                  downloadUrls
                                                                      .first;
                                                            });
                                                          } else {
                                                            safeSetState(() {});
                                                            return;
                                                          }
                                                        }

                                                        await actions
                                                            .hideKeyboardAction(
                                                          context,
                                                        );
                                                        if (!(_model.uploadedFileUrl_idCardUploadedAction !=
                                                                null &&
                                                            _model.uploadedFileUrl_idCardUploadedAction !=
                                                                '')) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      3000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xB2000000),
                                                            ),
                                                          );
                                                          return;
                                                        }
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'อัพโหลดรูปภาพสำเร็จ',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    3000),
                                                            backgroundColor:
                                                                Color(
                                                                    0xB2000000),
                                                          ),
                                                        );
                                                      },
                                                      text: 'แนบไฟล์',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.35,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsets.all(0.0),
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
                                                                  color: Color(
                                                                      0xFFD9761A),
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
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Text(
                                                        'สถานะ :',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                      14.0,
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
                                                    Text(
                                                      _model.uploadedFileUrl_idCardUploadedAction !=
                                                                  null &&
                                                              _model.uploadedFileUrl_idCardUploadedAction !=
                                                                  ''
                                                          ? 'อัพโหลดแล้ว'
                                                          : 'ยังไม่อัพโหลด',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                fontSize: 14.0,
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 100.0,
                                              decoration: BoxDecoration(),
                                            ),
                                            if (_model.uploadedFileUrl_idCardUploadedAction !=
                                                    null &&
                                                _model.uploadedFileUrl_idCardUploadedAction !=
                                                    '')
                                              Icon(
                                                Icons.check,
                                                color: Color(0xFF2EDD78),
                                                size: 24.0,
                                              ),
                                            if (_model.uploadedFileUrl_idCardUploadedAction ==
                                                    null ||
                                                _model.uploadedFileUrl_idCardUploadedAction ==
                                                    '')
                                              Flexible(
                                                child: Container(
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model
                                                                .uploadedFileUrl_idCardUploadedAction ==
                                                            null ||
                                                        _model.uploadedFileUrl_idCardUploadedAction ==
                                                            '',
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
                                                      size: 24.0,
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
                            if (FFAppState().buttonCorporation)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 20.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '3. หนังสือจดทะเบียนบริษัท',
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '(บังคับอัพโหลดรูป)',
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
                                                            Color(0xFFFB0606),
                                                        fontSize: 12.0,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.74,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          final selectedMedia =
                                                              await selectMediaWithSourceBottomSheet(
                                                            context: context,
                                                            imageQuality: 30,
                                                            allowPhoto: true,
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            safeSetState(() =>
                                                                _model.isDataUploading_companyBookUploadedAction =
                                                                    true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                            originalFilename:
                                                                                m.originalFilename,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedMedia
                                                                    .map(
                                                                  (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading_companyBookUploadedAction =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                              safeSetState(() {
                                                                _model.uploadedLocalFile_companyBookUploadedAction =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl_companyBookUploadedAction =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                            } else {
                                                              safeSetState(
                                                                  () {});
                                                              return;
                                                            }
                                                          }

                                                          await actions
                                                              .hideKeyboardAction(
                                                            context,
                                                          );
                                                          if (!(_model.uploadedFileUrl_companyBookUploadedAction !=
                                                                  null &&
                                                              _model.uploadedFileUrl_companyBookUploadedAction !=
                                                                  '')) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'อัพโหลดรูปภาพล้มเหลว กรุณาลองอีกครั้ง',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        3000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0xB2000000),
                                                              ),
                                                            );
                                                            return;
                                                          }
                                                          FFAppState()
                                                                  .nonePackageCompanyBookImageUrl =
                                                              _model
                                                                  .uploadedFileUrl_companyBookUploadedAction;
                                                          safeSetState(() {});
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .clearSnackBars();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'อัพโหลดรูปภาพสำเร็จ',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      3000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xB2000000),
                                                            ),
                                                          );
                                                        },
                                                        text: 'แนบไฟล์',
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.35,
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsets.all(
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
                                                                    color: Color(
                                                                        0xFFD9761A),
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          'สถานะ :',
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
                                                                fontSize: 14.0,
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
                                                      Text(
                                                        _model.uploadedFileUrl_companyBookUploadedAction !=
                                                                    null &&
                                                                _model.uploadedFileUrl_companyBookUploadedAction !=
                                                                    ''
                                                            ? 'อัพโหลดแล้ว'
                                                            : 'ยังไม่อัพโหลด',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                      14.0,
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                              ),
                                              if (_model.uploadedFileUrl_companyBookUploadedAction !=
                                                      null &&
                                                  _model.uploadedFileUrl_companyBookUploadedAction !=
                                                      '')
                                                Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 24.0,
                                                ),
                                              if (_model.uploadedFileUrl_companyBookUploadedAction ==
                                                      null ||
                                                  _model.uploadedFileUrl_companyBookUploadedAction ==
                                                      '')
                                                Container(
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model
                                                                .uploadedFileUrl_companyBookUploadedAction ==
                                                            null ||
                                                        _model.uploadedFileUrl_companyBookUploadedAction ==
                                                            '',
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Color(0xFFFC0A0A),
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
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await actions.hideKeyboardAction(
                                    context,
                                  );
                                  if (!functions.checkIsStringLengthInLength(
                                      FFAppState().branchCode, 2)!) {
                                    if (!((FFAppState().nonePackageBranchCode !=
                                            '') &&
                                        (FFAppState().nonePackageBranchName !=
                                            ''))) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณาเลือกสาขาที่จะลงผลงาน'),
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
                                      return;
                                    }
                                  }
                                  if (functions.containWordinStringUrl('กรุณา',
                                      FFAppState().nonePackageVehicleType)!) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณาเลือกประเภทรถ',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.brandNameTextFieldTextController
                                              .text ==
                                          null ||
                                      _model.brandNameTextFieldTextController
                                              .text ==
                                          '') {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณากรอกยี่ห้อรถ',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.modelNameTextController.text ==
                                          null ||
                                      _model.modelNameTextController.text ==
                                          '') {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณากรอกรุ่นรถ',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (functions.containWordinStringUrl(
                                      'เลือก', FFAppState().nonePackageYear)!) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณาเลือกปีจดทะเบียน',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (functions.containWordinStringUrl(
                                          'กรุณา',
                                          FFAppState()
                                              .nonePackageUsedTypeName)! ||
                                      functions.containWordinStringUrl(
                                          'เลือก',
                                          FFAppState()
                                              .nonePackageUsedTypeName)!) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณาเลือกลักษณะการใช้รถ',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (functions.containWordinStringUrl('กรุณา',
                                      FFAppState().nonePackageCoverTypeName)!) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณาเลือกชั้นประกัน',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (functions.containWordinStringUrl(
                                      'กรุณา',
                                      FFAppState()
                                          .nonePackageGarageTypeName)!) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณาเลือกประเภทการซ่อม',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.plateTextFieldTextController
                                              .text ==
                                          null ||
                                      _model.plateTextFieldTextController
                                              .text ==
                                          '') {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณากรอกทะเบียนรถ',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  } else {
                                    if (!functions.checkIsStringLengthInLength(
                                        _model
                                            .plateTextFieldTextController.text,
                                        10)!) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากรอกทะเบียนรถไม่เกิน 10 หลัก',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                  }

                                  if (functions.containWordinStringUrl('กรุณา',
                                      FFAppState().nonePackageProvince)!) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณาเลือกจังหวัดจดทะเบียน',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (_model.cusNameTextFieldTextController
                                              .text ==
                                          null ||
                                      _model.cusNameTextFieldTextController
                                              .text ==
                                          '') {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFAppState().buttonOrdinary
                                              ? 'กรุณากรอกชื่อลูกค้า'
                                              : 'กรุณากรอกชื่อบริษัท',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    return;
                                  }
                                  if (FFAppState().nonePackageFlagRenew) {
                                    if (_model.cusPhoneTextFieldTextController
                                                .text ==
                                            null ||
                                        _model.cusPhoneTextFieldTextController
                                                .text ==
                                            '') {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากรอกเบอร์โทรศัพท์',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    } else {
                                      if (!functions.checkPhoneNumberInput(
                                          functions.removeCommaFromNumText(_model
                                              .cusPhoneTextFieldTextController
                                              .text))!) {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกเบอร์โทรศัพท์เป็นตัวเลข 10 หลักให้ถูกต้อง',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xB2000000),
                                          ),
                                        );
                                        return;
                                      }
                                    }

                                    if (_model.oldVmiTextFieldTextController
                                                .text ==
                                            null ||
                                        _model.oldVmiTextFieldTextController
                                                .text ==
                                            '') {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากรอกเลขกรมธรรม์เดิม',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if ((_model.datePicked == null) &&
                                        (widget!.oldVmiExpireDate == null ||
                                            widget!.oldVmiExpireDate == '')) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณาเลือกวันที่หมดอายุประกันเดิม',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                  }
                                  if (FFAppState().nonePackageVehicleType ==
                                      'รถกระบะ') {
                                    if (FFAppState().nonePackageFlagCarrier) {
                                      if (functions.containWordinStringUrl(
                                          'กรุณา',
                                          FFAppState()
                                              .nonePackageCarrierType)!) {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกประเภทตู้เหล็ก',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xB2000000),
                                          ),
                                        );
                                        return;
                                      }
                                      if (FFAppState().nonePackageCarrierType ==
                                          'ตู้เย็น') {
                                        if (_model.carrierPriceTextFieldTextController
                                                    .text ==
                                                null ||
                                            _model.carrierPriceTextFieldTextController
                                                    .text ==
                                                '') {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'กรุณากรอกราคาตู้ + เครื่องทำความเย็น',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  Color(0xB2000000),
                                            ),
                                          );
                                          return;
                                        } else {
                                          if (!functions.checkIsIntValue(functions
                                              .removeCommaFromNumText(_model
                                                  .carrierPriceTextFieldTextController
                                                  .text))!) {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'กรุณากรอกราคาตู้ + เครื่องทำความเย็นเป็นตัวเลข',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
                                                backgroundColor:
                                                    Color(0xB2000000),
                                              ),
                                            );
                                            return;
                                          }
                                        }
                                      }
                                    }
                                  } else if (FFAppState()
                                          .nonePackageVehicleType ==
                                      'รถบรรทุก หัวลาก หางพ่วง') {
                                    if (functions.containWordinStringUrl(
                                        'กรุณา',
                                        FFAppState().nonePackageTruckPart)!) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณาเลือกส่วนของรถบรรทุก',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (functions.containWordinStringUrl(
                                        'กรุณา',
                                        FFAppState()
                                            .nonePackageCusMembership)!) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณาเลือกประเภทลูกค้า',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.carryPurposeTextFieldTextController
                                                .text ==
                                            null ||
                                        _model.carryPurposeTextFieldTextController
                                                .text ==
                                            '') {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากรอกรถใช้บรรทุกอะไร',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (FFAppState().nonePackageTruckPart ==
                                        'หัวลาก + หางพ่วง') {
                                      if (_model.plateAdditionalTextFieldTextController
                                                  .text ==
                                              null ||
                                          _model.plateAdditionalTextFieldTextController
                                                  .text ==
                                              '') {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณากรอกเลขทะเบียนหางพ่วง',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xB2000000),
                                          ),
                                        );
                                        return;
                                      }
                                    }
                                  }

                                  if (widget!.workType == 'transfer') {
                                    if (!(_model.uploadedFileUrl_oldVmiUploadedAction !=
                                            null &&
                                        _model.uploadedFileUrl_oldVmiUploadedAction !=
                                            '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณาอัพโหลดรูปตารางกรมธรรม์เดิม'),
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
                                      return;
                                    }
                                    if (!(_model.uploadedFileUrl_idCardUploadedAction !=
                                            null &&
                                        _model.uploadedFileUrl_idCardUploadedAction !=
                                            '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณาอัพโหลดรูปสำเนาบัตรประชาชนลูกค้า'),
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
                                      return;
                                    }
                                    if (!FFAppState().buttonOrdinary) {
                                      if (!(_model.uploadedFileUrl_companyBookUploadedAction !=
                                              null &&
                                          _model.uploadedFileUrl_companyBookUploadedAction !=
                                              '')) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'กรุณาอัพโหลดรูปหนังสือจดทะเบียนบริษัท'),
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
                                        return;
                                      }
                                    }
                                  }
                                  if (_model.driverFlag) {
                                    if (!((FFAppState()
                                                .nonePackageDriverBehaviorName !=
                                            '') &&
                                        (FFAppState()
                                                .nonePackageDriverBehaviorCode !=
                                            ''))) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'บังคับเลือกพฤติกรรมผู้ขับขี่'),
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
                                      return;
                                    }
                                  }
                                  FFAppState().nonePackageModelName =
                                      functions.toUpperCase(
                                          _model.modelNameTextController.text)!;
                                  FFAppState()
                                      .nonePackageModelCode = FFAppState()
                                          .nonePackageSearchModelList
                                          .contains(functions.toUpperCase(_model
                                              .modelNameTextController.text))
                                      ? FFAppState()
                                          .nonePackageSearchModelIdList
                                          .elementAtOrNull(
                                              functions.getIndexOfSomethingList(
                                                  FFAppState()
                                                      .nonePackageSearchModelList
                                                      .toList(),
                                                  _model.modelNameTextController
                                                      .text))!
                                      : '';
                                  FFAppState().nonePackageCusFullname = _model
                                      .cusNameTextFieldTextController.text;
                                  FFAppState().nonePackageCusPhone =
                                      functions.removeCommaFromNumText(_model
                                          .cusPhoneTextFieldTextController
                                          .text);
                                  FFAppState().nonePackagePlate = functions
                                      .removeSpacialLetterFromText(_model
                                          .plateTextFieldTextController.text);
                                  FFAppState().nonePackageSumInsured =
                                      functions.removeCommaFromNumText(_model
                                          .sumInsuredTextFieldTextController
                                          .text);
                                  FFAppState().nonePackageBrandName =
                                      functions.toUpperCase(_model
                                          .brandNameTextFieldTextController
                                          .text)!;
                                  FFAppState().nonePackageBrandId = FFAppState()
                                          .insuranceBasicBrandNameList
                                          .contains(functions.toUpperCase(_model
                                              .brandNameTextFieldTextController
                                              .text))
                                      ? functions.getValueWithMappedList(
                                          FFAppState()
                                              .insuranceBasicBrandIdList
                                              .toList(),
                                          FFAppState()
                                              .insuranceBasicBrandNameList
                                              .toList(),
                                          functions.toUpperCase(_model
                                              .brandNameTextFieldTextController
                                              .text))!
                                      : '';
                                  safeSetState(() {});
                                  FFAppState().nonePackageCarrierPrice =
                                      functions.removeCommaFromNumText(_model
                                          .carrierPriceTextFieldTextController
                                          .text);
                                  safeSetState(() {});
                                  FFAppState().nonePackageTruckPart =
                                      FFAppState().nonePackageTruckPart;
                                  FFAppState().nonePackageCusMembership =
                                      FFAppState().nonePackageCusMembership;
                                  FFAppState().nonePackageTruckCurrentPrice =
                                      functions.removeCommaFromNumText(_model
                                          .currentPriceTextFieldTextController
                                          .text);
                                  FFAppState().nonePackagePlateAdditional =
                                      functions.removeSpacialLetterFromText(_model
                                          .plateAdditionalTextFieldTextController
                                          .text);
                                  FFAppState().nonePackageTruckCarryPurpose =
                                      _model.carryPurposeTextFieldTextController
                                          .text;
                                  FFAppState().nonePackageTrailerSumInsured =
                                      functions.removeCommaFromNumText(_model
                                          .trailerSumInsuredTextFieldTextController
                                          .text);
                                  FFAppState().nonePackageRemark =
                                      _model.remarkTextFieldTextController.text;
                                  safeSetState(() {});
                                  if (FFAppState().nonePackageFlagRenew) {
                                    FFAppState().nonePackageOldVmiExpDate =
                                        _model.datePicked != null
                                            ? functions.getDateFormat(
                                                _model.datePicked)!
                                            : widget!.oldVmiExpireDate!;
                                    FFAppState().nonePackageOldVmi = _model
                                        .oldVmiTextFieldTextController.text;
                                    safeSetState(() {});
                                    FFAppState().nonePackageOldVmiImageUrl =
                                        _model
                                            .uploadedFileUrl_oldVmiUploadedAction;
                                    FFAppState().nonePackageIdCardImageUrl =
                                        _model
                                            .uploadedFileUrl_idCardUploadedAction;
                                    FFAppState()
                                            .nonePackageCompanyBookImageUrl =
                                        _model
                                            .uploadedFileUrl_companyBookUploadedAction;
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().nonePackageOldVmiExpDate =
                                        _model.datePicked != null
                                            ? functions.getDateFormat(
                                                _model.datePicked)!
                                            : '';
                                    safeSetState(() {});
                                  }

                                  if (FFAppState().nonePackageFlagRenew ||
                                      (FFAppState().nonePackageUsedTypeCode ==
                                          '110') ||
                                      (FFAppState().nonePackageCoverTypeName ==
                                          'ชั้น 3')) {
                                    context.pushNamed(
                                      NonePackageBasicImage2PageWidget
                                          .routeName,
                                      queryParameters: {
                                        'workType': serializeParam(
                                          widget!.workType,
                                          ParamType.String,
                                        ),
                                        'driverFlag': serializeParam(
                                          _model.driverFlag,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.pushNamed(
                                      NonePackageBasicImage1PageWidget
                                          .routeName,
                                      queryParameters: {
                                        'workType': serializeParam(
                                          widget!.workType,
                                          ParamType.String,
                                        ),
                                        'driverFlag': serializeParam(
                                          _model.driverFlag,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                text: 'ถัดไป',
                                options: FFButtonOptions(
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFD9761A),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 12.0))
                    .addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
