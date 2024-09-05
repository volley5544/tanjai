import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_insurance_page_model.dart';
export 'search_insurance_page_model.dart';

class SearchInsurancePageWidget extends StatefulWidget {
  const SearchInsurancePageWidget({
    super.key,
    required this.fromIcon,
  });

  final String? fromIcon;

  @override
  State<SearchInsurancePageWidget> createState() =>
      _SearchInsurancePageWidgetState();
}

class _SearchInsurancePageWidgetState extends State<SearchInsurancePageWidget>
    with TickerProviderStateMixin {
  late SearchInsurancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchInsurancePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchInsurancePage'});
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
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.getBuildVersion = await actions.getBuildVersion1();
      _model.deviceBuildNumber = await actions.getBuildNumber();
      _model.buildVersionQuery = await queryBuildVersionRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().searchPackageEvFlag = 'N';
      safeSetState(() {});
      FFAppState().sliderMinGrossTotal = '1000';
      FFAppState().sliderMaxGrossTotal = '50000';
      FFAppState().sliderMinSumInsured = '0';
      FFAppState().sliderMaxSumInsured = '1000000';
      safeSetState(() {});
      _model.adminVersionQuery = await queryAuthorizationRecordOnce(
        queryBuilder: (authorizationRecord) => authorizationRecord.where(
          'content_name',
          isEqualTo: 'skip_build_version',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (isAndroid) {
        if (!((_model.buildVersionQuery!.buildNumberAndroid <=
                _model.deviceBuildNumber!) ||
            _model.adminVersionQuery!.employeeIdList
                .contains(FFAppState().employeeID))) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'มีประกันทันใจเวอร์ชั่นใหม่แล้ว! กรุณาอัพเดท ประกันทันใจใน Play Store ให้เป็นเวอร์ชั่นล่าสุด'),
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
          await actions.terminateAppAction();
          return;
        }
      } else {
        if (!((_model.buildVersionQuery!.buildNumberIos <=
                _model.deviceBuildNumber!) ||
            _model.adminVersionQuery!.employeeIdList
                .contains(FFAppState().employeeID))) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'มีประกันทันใจเวอร์ชั่นใหม่แล้ว! กรุณาอัพเดท ประกันทันใจใน TestFlight ให้เป็นเวอร์ชั่นล่าสุด'),
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
          await actions.terminateAppAction();
          return;
        }
      }

      FFAppState().AddCustomerPageFirstname = '';
      FFAppState().AddCustomerPageLastname = '';
      FFAppState().AddCustomerPagePhone = '';
      FFAppState().AddCustomerPageCarRegistration = '';
      FFAppState().addCustomerQuotationSaveSuccess = false;
      FFAppState().insurarerQuotationPdf = [];
      FFAppState().filterInsurerList = [];
      FFAppState().filterCoverTypeList = [];
      FFAppState().filterGarageTypeList = [];
      safeSetState(() {});
      FFAppState().insuranceInfoRegistrationCodeSelect = '';
      FFAppState().insuranceInfoRegistrationProvinceSelect = '';
      safeSetState(() {});
      if (widget!.fromIcon == 'MC') {
        if (!false) {
          FFAppState().insuranceCarTypeDetailSelected = '';
          FFAppState().insuranceBasicVehicleGroup = '';
          FFAppState().insuranceBasicCarTypeContain = '';
          FFAppState().insuranceBasicCarTypeDoors = '';
          safeSetState(() {});
          _model.getBrandMCAPI = await TeleGetBrandMCAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
          );

          if ((_model.getBrandMCAPI?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getBrandMCAPI?.statusCode ?? 200).toString()})'),
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
          if (TeleGetBrandMCAPICall.statusLevel1(
                (_model.getBrandMCAPI?.jsonBody ?? ''),
              ) ==
              200) {
            FFAppState().insuranceBasicBrandNameList =
                TeleGetBrandMCAPICall.brandName(
              (_model.getBrandMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicBrandIdList =
                TeleGetBrandMCAPICall.brandID(
              (_model.getBrandMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicBrandNameListOriginal =
                TeleGetBrandMCAPICall.brandName(
              (_model.getBrandMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicBrandIdListOriginal =
                TeleGetBrandMCAPICall.brandID(
              (_model.getBrandMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleGroupBrandList =
                TeleGetBrandMCAPICall.carGroup(
              (_model.getBrandMCAPI?.jsonBody ?? ''),
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
                    content: Text(TeleGetBrandMCAPICall.messageLayer1(
                      (_model.getBrandMCAPI?.jsonBody ?? ''),
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

          _model.getModelMCAPI = await TeleGetModelMCAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
          );

          if ((_model.getModelMCAPI?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getModelMCAPI?.statusCode ?? 200).toString()})'),
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
          if (TeleGetModelMCAPICall.statusLevel1(
                (_model.getModelMCAPI?.jsonBody ?? ''),
              ) ==
              200) {
            FFAppState().insuranceBasicModelIdListOriginal =
                TeleGetModelMCAPICall.modelCode(
              (_model.getModelMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicModelNameListOriginal =
                TeleGetModelMCAPICall.modelName(
              (_model.getModelMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicModelBrandIdListOriginal =
                TeleGetModelMCAPICall.brandID(
              (_model.getModelMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleGroupList =
                TeleGetModelMCAPICall.carGroup(
              (_model.getModelMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCarGroupDetail =
                TeleGetModelMCAPICall.carGroupDetail(
              (_model.getModelMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCarDoorList =
                TeleGetModelMCAPICall.carDoors(
              (_model.getModelMCAPI?.jsonBody ?? ''),
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
                    content: Text(TeleGetModelMCAPICall.messageLayer1(
                      (_model.getModelMCAPI?.jsonBody ?? ''),
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

          _model.getCoverTypeMCAPI = await TeleGetCoverTypeAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
            carType: 'MC',
          );

          if ((_model.getCoverTypeMCAPI?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getCoverTypeMCAPI?.statusCode ?? 200).toString()})'),
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
                (_model.getCoverTypeMCAPI?.jsonBody ?? ''),
              ) ==
              200) {
            FFAppState().insuranceBasicCoverTypeNameList =
                TeleGetCoverTypeAPICall.coverTypeName(
              (_model.getCoverTypeMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCoverTypeCodeList =
                TeleGetCoverTypeAPICall.coverTypeCode(
              (_model.getCoverTypeMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCoverTypeIdList =
                TeleGetCoverTypeAPICall.coverTypeId(
              (_model.getCoverTypeMCAPI?.jsonBody ?? ''),
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
                      (_model.getCoverTypeMCAPI?.jsonBody ?? ''),
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

          _model.getVehicleUsedTypeMCAPI =
              await InsuranceRequestGetVehicleAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
            vehicleCategory: 'auto',
            carType: 'MC',
          );

          if ((_model.getVehicleUsedTypeMCAPI?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getVehicleUsedTypeMCAPI?.statusCode ?? 200).toString()})'),
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
                (_model.getVehicleUsedTypeMCAPI?.jsonBody ?? ''),
              ) ==
              200) {
            FFAppState().insuranceBasicVehicleUsedTypeCodeList =
                InsuranceRequestGetVehicleAPICall.vehicleCode(
              (_model.getVehicleUsedTypeMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeNameList =
                InsuranceRequestGetVehicleAPICall.vehicleName(
              (_model.getVehicleUsedTypeMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeTypeList =
                InsuranceRequestGetVehicleAPICall.vehicletype(
              (_model.getVehicleUsedTypeMCAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeIdList =
                InsuranceRequestGetVehicleAPICall.vehicleId(
              (_model.getVehicleUsedTypeMCAPI?.jsonBody ?? ''),
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
                    content:
                        Text(InsuranceRequestGetVehicleAPICall.messageLayer1(
                      (_model.getVehicleUsedTypeMCAPI?.jsonBody ?? ''),
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

          FFAppState().insuranceRequestIsLoadDataMc = true;
          safeSetState(() {});
          _model.getProvinceMC = await TeleGetProvinceAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
          );

          if ((_model.getProvinceMC?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getProvinceMC?.statusCode ?? 200).toString()})'),
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
          if (TeleGetProvinceAPICall.statusLevel1(
                (_model.getProvinceMC?.jsonBody ?? ''),
              ) !=
              200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text('${TeleGetProvinceAPICall.messageLayer1(
                      (_model.getProvinceMC?.jsonBody ?? ''),
                    )}'),
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
          FFAppState().insuranceInfoRegistrationCodeList =
              TeleGetProvinceAPICall.provinceID(
            (_model.getProvinceMC?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceInfoRegistrationprovinceList =
              TeleGetProvinceAPICall.provinceNameTH(
            (_model.getProvinceMC?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          safeSetState(() {});
        }
        Navigator.pop(context);
        FFAppState().searchPackageSubProduct = 'MC';
        FFAppState().insuranceVehicleTypeDropDown = 'มอเตอร์ไซค์';
        safeSetState(() {});
      } else if (widget!.fromIcon == 'motor') {
        if (!false) {
          FFAppState().insuranceCarTypeDetailSelected = '';
          FFAppState().insuranceBasicVehicleGroup = '';
          FFAppState().insuranceBasicCarTypeContain = '';
          FFAppState().insuranceBasicCarTypeDoors = '';
          safeSetState(() {});
          _model.getBrandAPI = await TeleGetBrandAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
          );

          if ((_model.getBrandAPI?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getBrandAPI?.statusCode ?? 200).toString()})'),
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
            FFAppState().insuranceBasicBrandIdList =
                TeleGetBrandAPICall.brandID(
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
                        'พบข้อผิดพลาด (${(_model.getModelAPI?.statusCode ?? 200).toString()})'),
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
            FFAppState().insuranceBasicCarDoorList =
                TeleGetModelAPICall.carDoors(
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
                        'พบข้อผิดพลาด (${(_model.getCoverTypeAPI?.statusCode ?? 200).toString()})'),
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

          _model.getVehicleUsedTypeAPI =
              await InsuranceRequestGetVehicleAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
            vehicleCategory: 'auto',
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
            FFAppState().insuranceBasicVehicleUsedTypeCodeList =
                InsuranceRequestGetVehicleAPICall.vehicleCode(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeNameList =
                InsuranceRequestGetVehicleAPICall.vehicleName(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeTypeList =
                InsuranceRequestGetVehicleAPICall.vehicletype(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeIdList =
                InsuranceRequestGetVehicleAPICall.vehicleId(
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
                    content:
                        Text(InsuranceRequestGetVehicleAPICall.messageLayer1(
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

          FFAppState().insuranceRequestIsLoadedData = true;
          safeSetState(() {});
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
                        'พบข้อผิดพลาด (${(_model.getProvince?.statusCode ?? 200).toString()})'),
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
          if (TeleGetProvinceAPICall.statusLevel1(
                (_model.getProvince?.jsonBody ?? ''),
              ) !=
              200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text('${TeleGetProvinceAPICall.messageLayer1(
                      (_model.getProvince?.jsonBody ?? ''),
                    )}'),
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
          FFAppState().insuranceInfoRegistrationCodeList =
              TeleGetProvinceAPICall.provinceID(
            (_model.getProvince?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceInfoRegistrationprovinceList =
              TeleGetProvinceAPICall.provinceNameTH(
            (_model.getProvince?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          safeSetState(() {});
        }
        Navigator.pop(context);
        FFAppState().searchPackageSubProduct = 'Motor';
        safeSetState(() {});
      } else {
        if (!false) {
          FFAppState().insuranceCarTypeDetailSelected = '';
          FFAppState().insuranceBasicVehicleGroup = '';
          FFAppState().insuranceBasicCarTypeContain = '';
          FFAppState().insuranceBasicCarTypeDoors = '';
          safeSetState(() {});
          _model.getBrandEVAPI = await TeleGetBrandAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
            vehicleGroup: 'EV',
          );

          if ((_model.getBrandEVAPI?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getBrandEVAPI?.statusCode ?? 200).toString()})'),
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
                (_model.getBrandEVAPI?.jsonBody ?? ''),
              ) ==
              200) {
            FFAppState().insuranceBasicBrandNameList =
                TeleGetBrandAPICall.brandName(
              (_model.getBrandEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicBrandIdList =
                TeleGetBrandAPICall.brandID(
              (_model.getBrandEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicBrandNameListOriginal =
                TeleGetBrandAPICall.brandName(
              (_model.getBrandEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicBrandIdListOriginal =
                TeleGetBrandAPICall.brandID(
              (_model.getBrandEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleGroupBrandList =
                TeleGetBrandAPICall.carGroup(
              (_model.getBrandEVAPI?.jsonBody ?? ''),
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
                      (_model.getBrandEVAPI?.jsonBody ?? ''),
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

          _model.getModelEVAPI = await TeleGetModelAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
            vehicleGroup: 'EV',
          );

          if ((_model.getModelEVAPI?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getModelEVAPI?.statusCode ?? 200).toString()})'),
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
                (_model.getModelEVAPI?.jsonBody ?? ''),
              ) ==
              200) {
            FFAppState().insuranceBasicModelIdListOriginal =
                TeleGetModelAPICall.modelCode(
              (_model.getModelEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicModelNameListOriginal =
                TeleGetModelAPICall.modelName(
              (_model.getModelEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicModelBrandIdListOriginal =
                TeleGetModelAPICall.brandID(
              (_model.getModelEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleGroupList =
                TeleGetModelAPICall.carGroup(
              (_model.getModelEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCarGroupDetail =
                TeleGetModelAPICall.carGroupDetail(
              (_model.getModelEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCarDoorList =
                TeleGetModelAPICall.carDoors(
              (_model.getModelEVAPI?.jsonBody ?? ''),
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
                      (_model.getModelEVAPI?.jsonBody ?? ''),
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

          _model.getCoverTypeEVAPI = await TeleGetCoverTypeAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
          );

          if ((_model.getCoverTypeEVAPI?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getCoverTypeEVAPI?.statusCode ?? 200).toString()})'),
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
                (_model.getCoverTypeEVAPI?.jsonBody ?? ''),
              ) ==
              200) {
            FFAppState().insuranceBasicCoverTypeNameList =
                TeleGetCoverTypeAPICall.coverTypeName(
              (_model.getCoverTypeEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCoverTypeCodeList =
                TeleGetCoverTypeAPICall.coverTypeCode(
              (_model.getCoverTypeEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCoverTypeIdList =
                TeleGetCoverTypeAPICall.coverTypeId(
              (_model.getCoverTypeEVAPI?.jsonBody ?? ''),
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
                    content: Text(TeleGetCoverTypeAPICall.statusLevel1(
                      (_model.getCoverTypeEVAPI?.jsonBody ?? ''),
                    )!
                        .toString()),
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

          _model.getVehicleUsedTypeEVAPI =
              await InsuranceRequestGetVehicleAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
            vehicleCategory: 'auto',
          );

          if ((_model.getVehicleUsedTypeEVAPI?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getVehicleUsedTypeEVAPI?.statusCode ?? 200).toString()})'),
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
                (_model.getVehicleUsedTypeEVAPI?.jsonBody ?? ''),
              ) ==
              200) {
            FFAppState().insuranceBasicVehicleUsedTypeCodeList =
                InsuranceRequestGetVehicleAPICall.vehicleCode(
              (_model.getVehicleUsedTypeEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeNameList =
                InsuranceRequestGetVehicleAPICall.vehicleName(
              (_model.getVehicleUsedTypeEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeTypeList =
                InsuranceRequestGetVehicleAPICall.vehicletype(
              (_model.getVehicleUsedTypeEVAPI?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeIdList =
                InsuranceRequestGetVehicleAPICall.vehicleId(
              (_model.getVehicleUsedTypeEVAPI?.jsonBody ?? ''),
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
                    content:
                        Text(InsuranceRequestGetVehicleAPICall.messageLayer1(
                      (_model.getVehicleUsedTypeEVAPI?.jsonBody ?? ''),
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

          FFAppState().insuranceRequestisLoadDataEV = true;
          safeSetState(() {});
          _model.getProvince2 = await TeleGetProvinceAPICall.call(
            apiUrl: FFAppState().apiUrlInsuranceAppState,
          );

          if ((_model.getProvince2?.statusCode ?? 200) != 200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาด (${(_model.getProvince2?.statusCode ?? 200).toString()})'),
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
          if (TeleGetProvinceAPICall.statusLevel1(
                (_model.getProvince2?.jsonBody ?? ''),
              ) !=
              200) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text('${TeleGetProvinceAPICall.statusLevel1(
                      (_model.getProvince2?.jsonBody ?? ''),
                    )?.toString()}'),
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
          FFAppState().insuranceInfoRegistrationCodeList =
              TeleGetProvinceAPICall.provinceID(
            (_model.getProvince2?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceInfoRegistrationprovinceList =
              TeleGetProvinceAPICall.provinceNameTH(
            (_model.getProvince2?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          safeSetState(() {});
        }
        Navigator.pop(context);
        FFAppState().searchPackageSubProduct = 'Motor';
        FFAppState().searchPackageEvFlag = 'Y';
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().insuranceVehicleTypeDropDown = 'เลือกประเภทรถ';
                FFAppState().insuranceBasicBrandName = 'เลือกยี่ห้อรถ';
                FFAppState().insuranceBasicBrandId = '';
                FFAppState().isSelectBrandInPackage = false;
                FFAppState().insuranceBasicModelName = 'เลือกรุ่นรถ';
                FFAppState().insuranceBasicModelId = '';
                FFAppState().insuranceBasicYear = 'เลือกปีจดทะเบียน พ.ศ.';
                FFAppState().insuranceBasicVehicleUsedTypeName =
                    'เลือกการใช้งาน';
                FFAppState().insuranceBasicCoverTypeNameOutputList = [];
                FFAppState().insuranceBasicGarageTypeInPackage = [];
                FFAppState().insuranceCarTypeDetailSelected = '';
                safeSetState(() {});

                context.goNamed('SuperAppPage');
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB7619),
                size: 30,
              ),
            ),
            title: Text(
              widget!.fromIcon == 'MC'
                  ? 'ค้นหาประกันมอเตอร์ไซค์'
                  : (widget!.fromIcon == 'EV'
                      ? 'EV ค้นหาประกันรถ'
                      : 'ค้นหาประกันรถ'),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF123063),
                    fontSize: 18,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ประเภทรถ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF404040),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '(บังคับเลือก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (widget!.fromIcon != 'MC') {
                                        context.pushNamed(
                                          'SearchableCarListPage',
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
                                                  .insuranceBasicVehicleTypeDropdownList,
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
                                              'searchPackage',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: ListTile(
                                            title: Text(
                                              FFAppState()
                                                  .insuranceVehicleTypeDropDown,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: functions
                                                                .containWordinStringUrl(
                                                                    'เลือก',
                                                                    FFAppState()
                                                                        .insuranceVehicleTypeDropDown)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFF474747),
                                              size: 20,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ยี่ห้อรถ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF404040),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '(บังคับเลือก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
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
                                            'เลือกยี่ห้อรถ',
                                            ParamType.String,
                                          ),
                                          'searchLabel': serializeParam(
                                            'ระบุยี่ห้อรถ',
                                            ParamType.String,
                                          ),
                                          'dataList': serializeParam(
                                            FFAppState()
                                                .insuranceBasicBrandNameList,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'multiSelect': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: ListTile(
                                            title: Text(
                                              FFAppState()
                                                  .insuranceBasicBrandName,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: functions
                                                                .containWordinStringUrl(
                                                                    'เลือก',
                                                                    FFAppState()
                                                                        .insuranceBasicBrandName)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFF474747),
                                              size: 20,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                          if (FFAppState().isSelectBrandInPackage)
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'รุ่นรถ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFF404040),
                                                fontSize: 15,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            '(บังคับเลือก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFF40606),
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
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
                                              'เลือกรุ่นรถ',
                                              ParamType.String,
                                            ),
                                            'searchLabel': serializeParam(
                                              'ระบุรุ่นรถ',
                                              ParamType.String,
                                            ),
                                            'dataList': serializeParam(
                                              FFAppState()
                                                  .insuranceBasicModelNameList,
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
                                              'SearchPackage',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: ListTile(
                                              title: Text(
                                                FFAppState()
                                                    .insuranceBasicModelName,
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
                                                                      .insuranceBasicModelName)!
                                                          ? Color(0xFF9F9F9F)
                                                          : Colors.black,
                                                      fontSize: 15,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF474747),
                                                size: 20,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ปีจดทะเบียน พ.ศ.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF404040),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '(บังคับเลือก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
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
                                            'เลือกปีจดทะเบียน',
                                            ParamType.String,
                                          ),
                                          'searchLabel': serializeParam(
                                            'ระบุปีจดทะเบียน',
                                            ParamType.String,
                                          ),
                                          'dataList': serializeParam(
                                            functions.reverseList(functions
                                                .ganerateYearList(2500, 2567)
                                                ?.toList()),
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'multiSelect': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: ListTile(
                                            title: Text(
                                              FFAppState().insuranceBasicYear,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: functions
                                                                .containWordinStringUrl(
                                                                    'เลือก',
                                                                    FFAppState()
                                                                        .insuranceBasicYear)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFF474747),
                                              size: 20,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child:
                                FutureBuilder<List<VehicleTypeDropdownRecord>>(
                              future: queryVehicleTypeDropdownRecordOnce(
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<VehicleTypeDropdownRecord>
                                    columnVehicleTypeDropdownRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final columnVehicleTypeDropdownRecord =
                                    columnVehicleTypeDropdownRecordList
                                            .isNotEmpty
                                        ? columnVehicleTypeDropdownRecordList
                                            .first
                                        : null;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 24, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'ลักษณะการใช้รถ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFF404040),
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Text(
                                              '(บังคับเลือก)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFF40606),
                                                    fontSize: 12,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
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
                                                'เลือกลักษณะการใช้รถ',
                                                ParamType.String,
                                              ),
                                              'searchLabel': serializeParam(
                                                'ระบุลักษณะการใช้รถ',
                                                ParamType.String,
                                              ),
                                              'dataList': serializeParam(
                                                FFAppState().insuranceBasicCarTypeDoors !=
                                                        '2 Doors'
                                                    ? functions.generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    : functions.generateInsuranceVehicleTypeDropdown(
                                                        columnVehicleTypeDropdownRecord
                                                            ?.pickUp2Doors
                                                            ?.vehicleCode
                                                            ?.toList(),
                                                        columnVehicleTypeDropdownRecord
                                                            ?.pickUp2Doors
                                                            ?.vehicleType
                                                            ?.toList(),
                                                        columnVehicleTypeDropdownRecord
                                                            ?.pickUp2Doors
                                                            ?.vehicleName
                                                            ?.toList()),
                                                ParamType.String,
                                                isList: true,
                                              ),
                                              'multiSelect': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 0, 0),
                                              child: ListTile(
                                                title: Text(
                                                  FFAppState().insuranceBasicVehicleUsedTypeName ==
                                                          'เลือกการใช้งาน'
                                                      ? 'เลือกการใช้งาน'
                                                      : (functions.generateInsuranceVehicleTypeDropdown(
                                                          FFAppState()
                                                              .insuranceBasicVehicleUsedTypeCodeList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleUsedTypeTypeList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleUsedTypeNameList
                                                              .toList())![functions
                                                          .getIndexOfSomethingList(
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeCodeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeCode)]),
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
                                                                        .insuranceBasicVehicleUsedTypeName)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF474747),
                                                  size: 20,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                dense: false,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ประเภทชั้นประกัน',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF404040),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '(บังคับเลือก สามารถเลือกได้มากกว่า 1)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
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
                                            true,
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
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: ListTile(
                                            title: Text(
                                              FFAppState()
                                                          .insuranceBasicCoverTypeNameOutputList
                                                          .length >
                                                      0
                                                  ? functions.combineStringFromList(
                                                      FFAppState()
                                                          .insuranceBasicCoverTypeNameOutputList
                                                          .toList())!
                                                  : 'กรุณาเลือกประเภทชั้นประกัน',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: FFAppState()
                                                                    .insuranceBasicCoverTypeNameOutputList
                                                                    .length >
                                                                0
                                                            ? Colors.black
                                                            : Color(0xFF9F9F9F),
                                                        fontSize: 15,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFF474747),
                                              size: 20,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ประเภทการซ่อม',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF424242),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '(บังคับเลือก สามารถเลือกได้มากกว่า 1)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
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
                                            true,
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
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: ListTile(
                                            title: Text(
                                              FFAppState()
                                                          .insuranceBasicGarageTypeInPackage
                                                          .length >
                                                      0
                                                  ? functions.combineStringFromList(
                                                      FFAppState()
                                                          .insuranceBasicGarageTypeInPackage
                                                          .toList())!
                                                  : 'กรุณาเลือกประเภทการซ่อม',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: FFAppState()
                                                                    .insuranceBasicGarageTypeInPackage
                                                                    .length >
                                                                0
                                                            ? Colors.black
                                                            : Color(0xFF9F9F9F),
                                                        fontSize: 15,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFF474747),
                                              size: 20,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'จังหวัดที่จดทะเบียน',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            '(บังคับกรอก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFB0606),
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 5, 16, 0),
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
                                              'เลือกจังหวัดที่จดทะเบียน',
                                              ParamType.String,
                                            ),
                                            'searchLabel': serializeParam(
                                              'เลือกจังหวัดที่จดทะเบียน',
                                              ParamType.String,
                                            ),
                                            'dataList': serializeParam(
                                              FFAppState()
                                                  .insuranceInfoRegistrationprovinceList,
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
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Color(0xFFB3B3B3),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: ListTile(
                                              title: Text(
                                                FFAppState().insuranceInfoRegistrationProvinceSelect !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoRegistrationProvinceSelect !=
                                                            ''
                                                    ? FFAppState()
                                                        .insuranceInfoRegistrationProvinceSelect
                                                    : 'กรุณาเลือกจังหวัดที่จดทะเบียน',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: FFAppState()
                                                                      .insuranceInfoRegistrationProvinceSelect ==
                                                                  null ||
                                                              FFAppState()
                                                                      .insuranceInfoRegistrationProvinceSelect ==
                                                                  ''
                                                          ? Color(0xFF9F9F9F)
                                                          : Colors.black,
                                                      fontSize: 15,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF474747),
                                                size: 20,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'วันที่หมดอายุของประกันเดิม',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF424242),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 5, 16, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await DatePicker.showDatePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          safeSetState(() {
                                            _model.datePicked = date;
                                          });
                                        },
                                        currentTime: getCurrentTimestamp,
                                        minTime: DateTime(0, 0, 0),
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: () => LocaleType.en,
                                        ),
                                      );

                                      if (!(_model.datePicked != null)) {
                                        await actions.hideKeyboardAction(
                                          context,
                                        );
                                        return;
                                      }
                                      FFAppState().insuranceBasicOldVmiExpDate =
                                          functions.getDateFormat(
                                              _model.datePicked)!;
                                      safeSetState(() {});
                                      await actions.hideKeyboardAction(
                                        context,
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 0.5,
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
                                                    10, 0, 0, 0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.datePicked != null
                                                    ? functions.showDateBE(
                                                        _model.datePicked
                                                            ?.toString())
                                                    : 'กรุณาเลือกวันที่หมดอายุประกันเดิม',
                                                'กรุณาเลือกวันที่หมดอายุประกันเดิม',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: _model.datePicked !=
                                                            null
                                                        ? Colors.black
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    fontSize: 15,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: Icon(
                                              Icons.edit_calendar_outlined,
                                              color: Color(0xFF474747),
                                              size: 24,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'เลือกราคาเบี้ยประกันต่ำสุด - สูงสุด',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF424242),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 120,
                                  child: custom_widgets.RangeSliderWidget(
                                    width: double.infinity,
                                    height: 120,
                                    minRange: '0',
                                    maxRange: '300000',
                                    activeColor: Color(0xFFDB771B),
                                    inactiveColors: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    overlayColor: Color(0xFFFFBB7C),
                                    startValue:
                                        FFAppState().sliderMinGrossTotal,
                                    endValue: FFAppState().sliderMaxGrossTotal,
                                    step: '1000',
                                    typeName: 'ราคาเบี้ย',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'เลือกราคาทุนประกันต่ำสุด - สูงสุด',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF424242),
                                              fontSize: 15,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 120,
                                  child: custom_widgets.RangeSliderWidget(
                                    width: double.infinity,
                                    height: 120,
                                    minRange: '0',
                                    maxRange: '20000000',
                                    activeColor: Color(0xFFDB771B),
                                    inactiveColors: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    overlayColor: Color(0xFFFFBB7C),
                                    startValue:
                                        FFAppState().sliderMinSumInsured,
                                    endValue: FFAppState().sliderMaxSumInsured,
                                    step: '200000',
                                    typeName: 'ทุนประกัน',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 8))
                            .addToStart(SizedBox(height: 20))
                            .addToEnd(SizedBox(height: 36)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (!((FFAppState()
                                              .insuranceVehicleTypeDropDown !=
                                          null &&
                                      FFAppState()
                                              .insuranceVehicleTypeDropDown !=
                                          '') &&
                                  (FFAppState().insuranceVehicleTypeDropDown !=
                                      '') &&
                                  (FFAppState().insuranceVehicleTypeDropDown !=
                                      'เลือกประเภทรถ'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('กรุณาเลือกประเภทรถ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              if (!((FFAppState().insuranceBasicBrandName !=
                                          null &&
                                      FFAppState().insuranceBasicBrandName !=
                                          '') &&
                                  (FFAppState().insuranceBasicBrandName !=
                                      '') &&
                                  (FFAppState().insuranceBasicBrandName !=
                                      'เลือกยี่ห้อรถ'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('กรุณาเลือกยี่ห้อรถ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              if (!((FFAppState().insuranceBasicModelName !=
                                          null &&
                                      FFAppState().insuranceBasicModelName !=
                                          '') &&
                                  (FFAppState().insuranceBasicModelName !=
                                      '') &&
                                  (FFAppState().insuranceBasicModelName !=
                                      'เลือกรุ่นรถ'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('กรุณาเลือกรุ่นรถ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              if (!((FFAppState().insuranceBasicYear != null &&
                                      FFAppState().insuranceBasicYear != '') &&
                                  (FFAppState().insuranceBasicYear != '') &&
                                  (FFAppState().insuranceBasicYear !=
                                      'เลือกปีจดทะเบียน พ.ศ.'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('กรุณาเลือกปีจดทะเบียน'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              if (!((FFAppState().insuranceBasicVehicleUsedTypeName !=
                                          null &&
                                      FFAppState()
                                              .insuranceBasicVehicleUsedTypeName !=
                                          '') &&
                                  (FFAppState()
                                          .insuranceBasicVehicleUsedTypeName !=
                                      '') &&
                                  (FFAppState()
                                          .insuranceBasicVehicleUsedTypeName !=
                                      'เลือกการใช้งาน'))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content:
                                            Text('กรุณาเลือกลักษณะการใช้รถ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              if (FFAppState()
                                      .insuranceBasicCoverTypeNameOutputList
                                      .length <=
                                  0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content:
                                            Text('กรุณาเลือกประเภทชั้นประกัน'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              if (FFAppState()
                                      .insuranceBasicGarageTypeInPackage
                                      .length <=
                                  0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content:
                                            Text('กรุณาเลือกประเภทการซ่อม'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              if (!FFAppState()
                                  .insuranceBasicModelNameList
                                  .contains(
                                      FFAppState().insuranceBasicModelName)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'ไม่พบรุ่นย่อยรถนี้ในแพ็กเกจประกัน'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );

                                context.pushNamed('InsuranceWorkSelectPage');

                                return;
                              }
                              if (!(FFAppState()
                                          .insuranceInfoRegistrationProvinceSelect !=
                                      null &&
                                  FFAppState()
                                          .insuranceInfoRegistrationProvinceSelect !=
                                      '')) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาเลือกจังหวัดที่จดทะเบียน'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              FFAppState().filterInsurerList = [];
                              FFAppState().filterGarageTypeList = [];
                              FFAppState().filterCoverTypeList = [];
                              safeSetState(() {});
                              if (FFAppState().searchPackageSubProduct !=
                                  'MC') {
                                context.pushNamed(
                                  'insurerListOverallPage',
                                  queryParameters: {
                                    'brandCode': serializeParam(
                                      FFAppState().insuranceBasicBrandId,
                                      ParamType.String,
                                    ),
                                    'modelCode': serializeParam(
                                      FFAppState().insuranceBasicModelId,
                                      ParamType.String,
                                    ),
                                    'year': serializeParam(
                                      (int.parse(FFAppState()
                                                  .insuranceBasicYear) -
                                              543)
                                          .toString(),
                                      ParamType.String,
                                    ),
                                    'province': serializeParam(
                                      FFAppState()
                                          .insuranceInfoRegistrationProvinceSelect,
                                      ParamType.String,
                                    ),
                                    'vehicleUsage': serializeParam(
                                      FFAppState()
                                          .insuranceBasicVehicleUsedTypeCode,
                                      ParamType.String,
                                    ),
                                    'coverType': serializeParam(
                                      FFAppState()
                                          .insuranceBasicCoverTypeCodeOutputList,
                                      ParamType.String,
                                      isList: true,
                                    ),
                                    'garageType': serializeParam(
                                      functions.createGarageTypeCodeList(
                                          FFAppState()
                                              .insuranceBasicGarageTypeInPackage
                                              .toList()),
                                      ParamType.String,
                                      isList: true,
                                    ),
                                    'brandName': serializeParam(
                                      FFAppState().insuranceBasicBrandName,
                                      ParamType.String,
                                    ),
                                    'modelName': serializeParam(
                                      FFAppState().insuranceBasicModelName,
                                      ParamType.String,
                                    ),
                                    'carTypeDetail': serializeParam(
                                      '',
                                      ParamType.String,
                                    ),
                                    'oldVmiExpDate': serializeParam(
                                      _model.datePicked != null
                                          ? functions
                                              .getDateFormat(_model.datePicked)
                                          : '',
                                      ParamType.String,
                                    ),
                                    'provinceCode': serializeParam(
                                      FFAppState()
                                          .insuranceInfoRegistrationCodeSelect,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                return;
                              }

                              context.pushNamed(
                                'insurerListPage',
                                queryParameters: {
                                  'brandCode': serializeParam(
                                    FFAppState().insuranceBasicBrandId,
                                    ParamType.String,
                                  ),
                                  'modelCode': serializeParam(
                                    FFAppState().insuranceBasicModelId,
                                    ParamType.String,
                                  ),
                                  'year': serializeParam(
                                    (int.parse(FFAppState()
                                                .insuranceBasicYear) -
                                            543)
                                        .toString(),
                                    ParamType.String,
                                  ),
                                  'province': serializeParam(
                                    FFAppState()
                                        .insuranceInfoRegistrationProvinceSelect,
                                    ParamType.String,
                                  ),
                                  'vehicleUsage': serializeParam(
                                    FFAppState()
                                        .insuranceBasicVehicleUsedTypeCode,
                                    ParamType.String,
                                  ),
                                  'coverType': serializeParam(
                                    FFAppState()
                                        .insuranceBasicCoverTypeCodeOutputList,
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'garageType': serializeParam(
                                    functions.createGarageTypeCodeList(
                                        FFAppState()
                                            .insuranceBasicGarageTypeInPackage
                                            .toList()),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'brandName': serializeParam(
                                    FFAppState().insuranceBasicBrandName,
                                    ParamType.String,
                                  ),
                                  'modelName': serializeParam(
                                    FFAppState().insuranceBasicModelName,
                                    ParamType.String,
                                  ),
                                  'carTypeDetail': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                  'oldVmiExpDate': serializeParam(
                                    _model.datePicked != null
                                        ? functions
                                            .getDateFormat(_model.datePicked)
                                        : '',
                                    ParamType.String,
                                  ),
                                  'provinceCode': serializeParam(
                                    FFAppState()
                                        .insuranceInfoRegistrationCodeSelect,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'ค้นหา',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: Color(0xFFDB771B),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ].addToStart(SizedBox(height: 16)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
