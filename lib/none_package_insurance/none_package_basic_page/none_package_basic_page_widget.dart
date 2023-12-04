import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'none_package_basic_page_model.dart';
export 'none_package_basic_page_model.dart';

class NonePackageBasicPageWidget extends StatefulWidget {
  const NonePackageBasicPageWidget({
    Key? key,
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
  }) : super(key: key);

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

  @override
  _NonePackageBasicPageWidgetState createState() =>
      _NonePackageBasicPageWidgetState();
}

class _NonePackageBasicPageWidgetState
    extends State<NonePackageBasicPageWidget> {
  late NonePackageBasicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              ));
            },
          );
          return;
        }
        if (TeleGetProvinceAPICall.statusLevel1(
              (_model.getProvince?.jsonBody ?? ''),
            ) ==
            200) {
          setState(() {
            FFAppState().insuranceBasicProvinceIdList =
                (TeleGetProvinceAPICall.provinceID(
              (_model.getProvince?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicProvinceNameList =
                (TeleGetProvinceAPICall.provinceNameTH(
              (_model.getProvince?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
          });
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content:
                    Text('พบข้อผิดพลาด (${TeleGetProvinceAPICall.statusLevel1(
                  (_model.getProvince?.jsonBody ?? ''),
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

        _model.getVehicleUsedTypeAPI =
            await InsuranceRequestGetVehicleAPICall.call(
          apiUrl: FFAppState().apiUrlInsuranceAppState,
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
              ));
            },
          );
          return;
        }
        if (InsuranceRequestGetVehicleAPICall.statusLayer1(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().update(() {
            FFAppState().nonePackageUsedTypeIdList =
                (InsuranceRequestGetVehicleAPICall.vehicleId(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().nonePackageUsedTypeCodeList =
                (InsuranceRequestGetVehicleAPICall.vehicleCode(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().nonePackageUsedTypeNameList =
                (InsuranceRequestGetVehicleAPICall.vehicleName(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().nonePackageUsedTypeTypeList =
                (InsuranceRequestGetVehicleAPICall.vehicletype(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
          });
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${InsuranceRequestGetVehicleAPICall.statusLayer1(
                  (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
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
          FFAppState().nonePackageIsLoadedData = true;
        });
      }
      Navigator.pop(context);
    });

    _model.carryPurposeTextFieldController ??=
        TextEditingController(text: widget.carrierPurpose);
    _model.carryPurposeTextFieldFocusNode ??= FocusNode();

    _model.currentPriceTextFieldController ??=
        TextEditingController(text: widget.truckCurrentPrice);
    _model.currentPriceTextFieldFocusNode ??= FocusNode();

    _model.carrierPriceTextFieldController ??=
        TextEditingController(text: widget.carrierPrice);
    _model.carrierPriceTextFieldFocusNode ??= FocusNode();

    _model.brandNameTextFieldController ??= TextEditingController(
        text: functions.containWordinStringUrl(
                    'กรุณา', FFAppState().nonePackageBrandName)! ||
                functions.containWordinStringUrl(
                    'เลือก', FFAppState().nonePackageBrandName)!
            ? ''
            : FFAppState().nonePackageBrandName);

    _model.modelNameController ??= TextEditingController(
        text: functions.containWordinStringUrl(
                    'กรุณา', FFAppState().nonePackageModelName)! ||
                functions.containWordinStringUrl(
                    'เลือก', FFAppState().nonePackageModelName)!
            ? ''
            : FFAppState().nonePackageModelName);

    _model.oldVmiTextFieldController ??=
        TextEditingController(text: widget.oldVmi);
    _model.oldVmiTextFieldFocusNode ??= FocusNode();

    _model.cusNameTextFieldController ??=
        TextEditingController(text: widget.cusName);
    _model.cusNameTextFieldFocusNode ??= FocusNode();

    _model.cusPhoneTextFieldController ??=
        TextEditingController(text: widget.cusPhone);
    _model.cusPhoneTextFieldFocusNode ??= FocusNode();

    _model.plateTextFieldController ??=
        TextEditingController(text: widget.plate);
    _model.plateTextFieldFocusNode ??= FocusNode();

    _model.plateAdditionalTextFieldController ??=
        TextEditingController(text: widget.plateAdditional);
    _model.plateAdditionalTextFieldFocusNode ??= FocusNode();

    _model.sumInsuredTextFieldController ??=
        TextEditingController(text: widget.sumInsured);
    _model.sumInsuredTextFieldFocusNode ??= FocusNode();

    _model.trailerSumInsuredTextFieldController ??=
        TextEditingController(text: widget.trailerSumInsured);
    _model.trailerSumInsuredTextFieldFocusNode ??= FocusNode();

    _model.remarkTextFieldController ??=
        TextEditingController(text: widget.remark);
    _model.remarkTextFieldFocusNode ??= FocusNode();

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
                context.pop();
              },
            ),
            title: Text(
              FFAppState().nonePackageFlagRenew ? 'งานต่ออายุ' : 'งานนอกเรท',
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
                                          fontFamily: 'Noto Sans Thai',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
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
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFFFB0606),
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
                                    'SearchBranchPage',
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
                                    alignment: AlignmentDirectional(0.00, 0.00),
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
                                              fontFamily: 'Noto Sans Thai',
                                              color: (FFAppState()
                                                              .nonePackageBranchCode !=
                                                          '') &&
                                                      (FFAppState()
                                                              .nonePackageBranchName !=
                                                          '')
                                                  ? Colors.black
                                                  : Color(0xFF9F9F9F),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                  'SearchableListPage',
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
                                      true,
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
                                              fontFamily: 'Noto Sans Thai',
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
                                              fontWeight: FontWeight.w600,
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
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
                                    'SearchableListPage',
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
                                        true,
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
                                                fontFamily: 'Noto Sans Thai',
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
                                                fontWeight: FontWeight.w600,
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
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
                                    'SearchableListPage',
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
                                        true,
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
                                                fontFamily: 'Noto Sans Thai',
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
                                                fontWeight: FontWeight.w600,
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
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
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: _model
                                          .carryPurposeTextFieldController,
                                      focusNode:
                                          _model.carryPurposeTextFieldFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                            ),
                                        hintText: 'กรุณากรอกรถใช้บรรทุกอะไร',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFB3B3B3),
                                              fontSize: 15.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                      validator: _model
                                          .carryPurposeTextFieldControllerValidator
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
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
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .currentPriceTextFieldController,
                                          focusNode: _model
                                              .currentPriceTextFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.currentPriceTextFieldController',
                                            Duration(milliseconds: 100),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      fontSize: 15.0,
                                                    ),
                                            hintText:
                                                'กรุณากรอกราคาซื้อขายปัจจุบัน',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: Color(0xFFB3B3B3),
                                                      fontSize: 15.0,
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
                                                fontFamily: 'Noto Sans Thai',
                                                color: Colors.transparent,
                                                fontSize: 15.0,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .currentPriceTextFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.currentPriceTextFieldController
                                                            .text !=
                                                        null &&
                                                    _model.currentPriceTextFieldController
                                                            .text !=
                                                        ''
                                                ? functions
                                                    .showNumberWithCommaWithoutDot(
                                                        _model
                                                            .currentPriceTextFieldController
                                                            .text)
                                                : '',
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: _model.currentPriceTextFieldController
                                                                .text !=
                                                            null &&
                                                        _model.currentPriceTextFieldController
                                                                .text !=
                                                            ''
                                                    ? Colors.black
                                                    : Color(0x00B3B3B3),
                                                fontSize: 15.0,
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
                                    setState(() {
                                      FFAppState().nonePackageFlagCarrier =
                                          false;
                                    });
                                  } else {
                                    setState(() {
                                      FFAppState().nonePackageFlagCarrier =
                                          true;
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
                                          'ติดตู้เหล็กหรือไม่',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: !FFAppState()
                                                        .nonePackageFlagCarrier
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
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
                                                  0.00, 0.00),
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
                                    setState(() {
                                      FFAppState().nonePackageFlagCoop = false;
                                    });
                                  } else {
                                    setState(() {
                                      FFAppState().nonePackageFlagCoop = true;
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
                                          'ใช้วิ่งร่วมกับบริษัทขนส่งเอกชนหรือไม่',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: !FFAppState()
                                                        .nonePackageFlagCoop
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
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
                                                  0.00, 0.00),
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
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
                                    'SearchableListPage',
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
                                                fontFamily: 'Noto Sans Thai',
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
                                                fontWeight: FontWeight.w600,
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
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
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .carrierPriceTextFieldController,
                                          focusNode: _model
                                              .carrierPriceTextFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.carrierPriceTextFieldController',
                                            Duration(milliseconds: 100),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      fontSize: 15.0,
                                                    ),
                                            hintText: 'กรุณากรอกราคา',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: Color(0xFFB3B3B3),
                                                      fontSize: 15.0,
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
                                                fontFamily: 'Noto Sans Thai',
                                                color: Colors.transparent,
                                                fontSize: 15.0,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .carrierPriceTextFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.carrierPriceTextFieldController
                                                            .text !=
                                                        null &&
                                                    _model.carrierPriceTextFieldController
                                                            .text !=
                                                        ''
                                                ? functions
                                                    .showNumberWithCommaWithoutDot(
                                                        _model
                                                            .carrierPriceTextFieldController
                                                            .text)
                                                : '',
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: _model.carrierPriceTextFieldController
                                                                .text !=
                                                            null &&
                                                        _model.carrierPriceTextFieldController
                                                                .text !=
                                                            ''
                                                    ? Colors.black
                                                    : Color(0x00B3B3B3),
                                                fontSize: 15.0,
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
                                'ยี่ห้อรถ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                          AlignmentDirectional(0.00, 0.00),
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
                                                  .brandNameTextFieldController!,
                                              options: options.toList(),
                                              onSelected: onSelected,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
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
                                            setState(() => _model
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

                                            _model.brandNameTextFieldController =
                                                textEditingController;
                                            return TextFormField(
                                              key: _model.brandNameTextFieldKey,
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.brandNameTextFieldController',
                                                Duration(milliseconds: 1000),
                                                () async {
                                                  setState(() {
                                                    FFAppState().nonePackageSearchModelList = functions
                                                        .returnMappedListFrom2List(
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
                                                                        .brandNameTextFieldController
                                                                        .text)))
                                                        .toList()
                                                        .cast<String>();
                                                    FFAppState().nonePackageSearchModelIdList = functions
                                                        .returnMappedListFrom2List(
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
                                                                        .brandNameTextFieldController
                                                                        .text)))
                                                        .toList()
                                                        .cast<String>();
                                                  });
                                                },
                                              ),
                                              onFieldSubmitted: (_) async {
                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                        ),
                                                hintText: 'กรุณากรอกรุ่นรถ',
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
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                      ),
                                              validator: _model
                                                  .brandNameTextFieldControllerValidator
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                alignment: AlignmentDirectional(0.00, 0.00),
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
                                            _model.modelNameController!,
                                        options: options.toList(),
                                        onSelected: onSelected,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
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
                                      setState(() => _model
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

                                      _model.modelNameController =
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
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    fontSize: 15.0,
                                                  ),
                                          hintText: 'กรุณากรอกรุ่นรถ',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFB3B3B3),
                                                    fontSize: 15.0,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                            ),
                                        validator: _model
                                            .modelNameControllerValidator
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                          .ganerateYearList(2500, 2566)
                                          ?.toList()),
                                      ParamType.String,
                                      true,
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
                                              fontFamily: 'Noto Sans Thai',
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
                                              fontWeight: FontWeight.w600,
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'เดิม',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w800,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
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
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.oldVmiTextFieldController,
                                      focusNode:
                                          _model.oldVmiTextFieldFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                            ),
                                        hintText: 'กรุณากรอกเลขกรมธรรม์เดิม',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFB3B3B3),
                                              fontSize: 15.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                      validator: _model
                                          .oldVmiTextFieldControllerValidator
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
                                  'วันที่หมดอายุประกัน',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'เดิม',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w800,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
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
                                  if (kIsWeb) {
                                    final _datePickedDate =
                                        await showDatePicker(
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
                                    }
                                  } else {
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
                                            _model.datePicked != null
                                                ? functions.showDateBE(_model
                                                    .datePicked
                                                    ?.toString())
                                                : (widget.oldVmiExpireDate !=
                                                            null &&
                                                        widget.oldVmiExpireDate !=
                                                            ''
                                                    ? functions.showDateBE(
                                                        widget.oldVmiExpireDate)
                                                    : 'กรุณาเลือกวันที่หมดอายุประกันเดิม'),
                                            'กรุณาเลือกวันที่หมดอายุประกันเดิม',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: _model.datePicked != null
                                                    ? Colors.black
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                      true,
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
                                              : (functions.generateInsuranceVehicleTypeDropdown(
                                                  FFAppState()
                                                      .nonePackageUsedTypeCodeList
                                                      .toList(),
                                                  FFAppState()
                                                      .nonePackageUsedTypeTypeList
                                                      .toList(),
                                                  FFAppState()
                                                      .nonePackageUsedTypeNameList
                                                      .toList())?[functions
                                                  .getIndexOfSomethingList(
                                                      FFAppState()
                                                          .nonePackageUsedTypeCodeList
                                                          .toList(),
                                                      FFAppState()
                                                          .nonePackageUsedTypeCode)]),
                                          'เลือกการใช้งาน',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
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
                                              fontWeight: FontWeight.w600,
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              if (FFAppState().nonePackageFlagRenew)
                                Text(
                                  'เดิม',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w800,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                              fontFamily: 'Noto Sans Thai',
                                              color: functions
                                                      .containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageCoverTypeName)!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              if (FFAppState().nonePackageFlagRenew)
                                Text(
                                  'เดิม',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w800,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                              fontFamily: 'Noto Sans Thai',
                                              color: functions
                                                      .containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageGarageTypeName)!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.cusNameTextFieldController,
                                          focusNode:
                                              _model.cusNameTextFieldFocusNode,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      fontSize: 15.0,
                                                    ),
                                            hintText: 'กรุณากรอกชื่อ',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: Color(0xFFB3B3B3),
                                                      fontSize: 15.0,
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
                                                fontFamily: 'Noto Sans Thai',
                                                color: Colors.black,
                                                fontSize: 15.0,
                                              ),
                                          validator: _model
                                              .cusNameTextFieldControllerValidator
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
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
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .cusPhoneTextFieldController,
                                          focusNode:
                                              _model.cusPhoneTextFieldFocusNode,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      fontSize: 15.0,
                                                    ),
                                            hintText: 'กรุณากรอกเบอร์โทรศัพท์',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: Color(0xFFB3B3B3),
                                                      fontSize: 15.0,
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
                                                fontFamily: 'Noto Sans Thai',
                                                color: Colors.black,
                                                fontSize: 15.0,
                                              ),
                                          keyboardType: TextInputType.phone,
                                          validator: _model
                                              .cusPhoneTextFieldControllerValidator
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.plateTextFieldController,
                                          focusNode:
                                              _model.plateTextFieldFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      fontSize: 15.0,
                                                    ),
                                            hintText: 'กรุณากรอกทะเบียนรถ',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans Thai',
                                                      color: Color(0xFFB3B3B3),
                                                      fontSize: 15.0,
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
                                                fontFamily: 'Noto Sans Thai',
                                                color: Colors.black,
                                                fontSize: 15.0,
                                              ),
                                          validator: _model
                                              .plateTextFieldControllerValidator
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFFB0606),
                                          fontSize: 12.0,
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
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .plateAdditionalTextFieldController,
                                            focusNode: _model
                                                .plateAdditionalTextFieldFocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                      ),
                                              hintText: 'กรุณากรอกทะเบียนรถ',
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                ),
                                            validator: _model
                                                .plateAdditionalTextFieldControllerValidator
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
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
                                  'SearchableListPage',
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
                                      true,
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
                                              fontFamily: 'Noto Sans Thai',
                                              color: functions
                                                      .containWordinStringUrl(
                                                          'กรุณา',
                                                          FFAppState()
                                                              .nonePackageProvince)!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 12.0,
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
                                      controller:
                                          _model.sumInsuredTextFieldController,
                                      focusNode:
                                          _model.sumInsuredTextFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.sumInsuredTextFieldController',
                                        Duration(milliseconds: 100),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFB3B3B3),
                                              fontSize: 15.0,
                                            ),
                                        hintText: 'กรุณากรอกทุนประกัน',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFB3B3B3),
                                              fontSize: 15.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Colors.transparent,
                                            fontSize: 15.0,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .sumInsuredTextFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.sumInsuredTextFieldController
                                                          .text !=
                                                      null &&
                                                  _model.sumInsuredTextFieldController
                                                          .text !=
                                                      ''
                                              ? functions
                                                  .showNumberWithCommaWithoutDot(
                                                      _model
                                                          .sumInsuredTextFieldController
                                                          .text)
                                              : '',
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: _model.sumInsuredTextFieldController
                                                              .text !=
                                                          null &&
                                                      _model.sumInsuredTextFieldController
                                                              .text !=
                                                          ''
                                                  ? Colors.black
                                                  : Color(0x00B3B3B3),
                                              fontSize: 15.0,
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
                                        fontFamily: 'Noto Sans Thai',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
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
                                          fontFamily: 'Noto Sans Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 12.0,
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
                                            .trailerSumInsuredTextFieldController,
                                        focusNode: _model
                                            .trailerSumInsuredTextFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.trailerSumInsuredTextFieldController',
                                          Duration(milliseconds: 100),
                                          () => setState(() {}),
                                        ),
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFB3B3B3),
                                                    fontSize: 15.0,
                                                  ),
                                          hintText: 'กรุณากรอกทุนประกันหางพ่วง',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFB3B3B3),
                                                    fontSize: 15.0,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Colors.transparent,
                                              fontSize: 15.0,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .trailerSumInsuredTextFieldControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'))
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.trailerSumInsuredTextFieldController
                                                            .text !=
                                                        null &&
                                                    _model.trailerSumInsuredTextFieldController
                                                            .text !=
                                                        ''
                                                ? functions
                                                    .showNumberWithCommaWithoutDot(
                                                        valueOrDefault<String>(
                                                    _model
                                                        .trailerSumInsuredTextFieldController
                                                        .text,
                                                    '0',
                                                  ))
                                                : '',
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: _model.trailerSumInsuredTextFieldController
                                                                .text !=
                                                            null &&
                                                        _model.trailerSumInsuredTextFieldController
                                                                .text !=
                                                            ''
                                                    ? Colors.black
                                                    : Color(0x00B3B3B3),
                                                fontSize: 15.0,
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
                                      fontFamily: 'Noto Sans Thai',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
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
                                  controller: _model.remarkTextFieldController,
                                  focusNode: _model.remarkTextFieldFocusNode,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFB3B3B3),
                                          fontSize: 15.0,
                                        ),
                                    hintText: 'กรุณากรอกหมายเหตุ',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFFB3B3B3),
                                          fontSize: 15.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                  validator: _model
                                      .remarkTextFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!FFAppState().nonePackageFlagRenew)
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
                                    setState(() {
                                      FFAppState().nonePackageFlagAct = false;
                                    });
                                  } else {
                                    setState(() {
                                      FFAppState().nonePackageFlagAct = true;
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
                                          'ขอเบี้ย พ.ร.บ. หรือไม่',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: !FFAppState()
                                                        .nonePackageFlagAct
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      if (!FFAppState().nonePackageFlagAct)
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
                                      if (FFAppState().nonePackageFlagAct)
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
                                                  0.00, 0.00),
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
                  if (FFAppState().nonePackageFlagRenew)
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
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF003063),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
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
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFFB0606),
                                              fontSize: 12.0,
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
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
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
                                                  0.00, 0.00),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.74,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
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
                                                          setState(() => _model
                                                                  .isDataUploading1 =
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
                                                            _model.isDataUploading1 =
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
                                                            setState(() {
                                                              _model.uploadedLocalFile1 =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                              _model.uploadedFileUrl1 =
                                                                  downloadUrls
                                                                      .first;
                                                            });
                                                          } else {
                                                            setState(() {});
                                                            return;
                                                          }
                                                        }

                                                        await actions
                                                            .hideKeyboardAction(
                                                          context,
                                                        );
                                                        if (!(_model.uploadedFileUrl1 !=
                                                                null &&
                                                            _model.uploadedFileUrl1 !=
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
                                                            Color(0xFFFCEFE4),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFD9761A),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 14.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      _model.uploadedFileUrl1 !=
                                                                  null &&
                                                              _model.uploadedFileUrl1 !=
                                                                  ''
                                                          ? 'อัพโหลดแล้ว'
                                                          : 'ยังไม่อัพโหลด',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14.0,
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
                                            if (_model.uploadedFileUrl1 !=
                                                    null &&
                                                _model.uploadedFileUrl1 != '')
                                              Icon(
                                                Icons.check,
                                                color: Color(0xFF2EDD78),
                                                size: 24.0,
                                              ),
                                            if (_model.uploadedFileUrl1 ==
                                                    null ||
                                                _model.uploadedFileUrl1 == '')
                                              Container(
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible: _model
                                                              .uploadedFileUrl1 ==
                                                          null ||
                                                      _model.uploadedFileUrl1 ==
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
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
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
                                              context.pushNamed('SampleIDcard');
                                            },
                                            child: Text(
                                              'ดูตัวอย่าง',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w500,
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
                                                  0.00, 0.00),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.74,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
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
                                                          setState(() => _model
                                                                  .isDataUploading2 =
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
                                                            _model.isDataUploading2 =
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
                                                            setState(() {
                                                              _model.uploadedLocalFile2 =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                              _model.uploadedFileUrl2 =
                                                                  downloadUrls
                                                                      .first;
                                                            });
                                                          } else {
                                                            setState(() {});
                                                            return;
                                                          }
                                                        }

                                                        await actions
                                                            .hideKeyboardAction(
                                                          context,
                                                        );
                                                        if (!(_model.uploadedFileUrl2 !=
                                                                null &&
                                                            _model.uploadedFileUrl2 !=
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
                                                            Color(0xFFFCEFE4),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFD9761A),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 14.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      _model.uploadedFileUrl2 !=
                                                                  null &&
                                                              _model.uploadedFileUrl2 !=
                                                                  ''
                                                          ? 'อัพโหลดแล้ว'
                                                          : 'ยังไม่อัพโหลด',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14.0,
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
                                            if (_model.uploadedFileUrl2 !=
                                                    null &&
                                                _model.uploadedFileUrl2 != '')
                                              Icon(
                                                Icons.check,
                                                color: Color(0xFF2EDD78),
                                                size: 24.0,
                                              ),
                                            if (_model.uploadedFileUrl2 ==
                                                    null ||
                                                _model.uploadedFileUrl2 == '')
                                              Flexible(
                                                child: Container(
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model
                                                                .uploadedFileUrl2 ==
                                                            null ||
                                                        _model.uploadedFileUrl2 ==
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
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
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
                                                    0.00, 0.00),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.74,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
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
                                                            setState(() => _model
                                                                    .isDataUploading3 =
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
                                                              _model.isDataUploading3 =
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
                                                              setState(() {
                                                                _model.uploadedLocalFile3 =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl3 =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                            } else {
                                                              setState(() {});
                                                              return;
                                                            }
                                                          }

                                                          await actions
                                                              .hideKeyboardAction(
                                                            context,
                                                          );
                                                          if (!(_model.uploadedFileUrl3 !=
                                                                  null &&
                                                              _model.uploadedFileUrl3 !=
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
                                                          setState(() {
                                                            FFAppState()
                                                                    .nonePackageCompanyBookImageUrl =
                                                                _model
                                                                    .uploadedFileUrl3;
                                                          });
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
                                                              Color(0xFFFCEFE4),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: Color(
                                                                        0xFFD9761A),
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
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        _model.uploadedFileUrl3 !=
                                                                    null &&
                                                                _model.uploadedFileUrl3 !=
                                                                    ''
                                                            ? 'อัพโหลดแล้ว'
                                                            : 'ยังไม่อัพโหลด',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 14.0,
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
                                              if (_model.uploadedFileUrl3 !=
                                                      null &&
                                                  _model.uploadedFileUrl3 != '')
                                                Icon(
                                                  Icons.check,
                                                  color: Color(0xFF2EDD78),
                                                  size: 24.0,
                                                ),
                                              if (_model.uploadedFileUrl3 ==
                                                      null ||
                                                  _model.uploadedFileUrl3 == '')
                                                Container(
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: _model
                                                                .uploadedFileUrl3 ==
                                                            null ||
                                                        _model.uploadedFileUrl3 ==
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
                                  if (_model.brandNameTextFieldController
                                              .text ==
                                          null ||
                                      _model.brandNameTextFieldController
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
                                  if (_model.modelNameController.text == null ||
                                      _model.modelNameController.text == '') {
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
                                  if (_model.plateTextFieldController.text ==
                                          null ||
                                      _model.plateTextFieldController.text ==
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
                                        _model.plateTextFieldController.text,
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
                                  if (_model.cusNameTextFieldController.text ==
                                          null ||
                                      _model.cusNameTextFieldController.text ==
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
                                    if (_model.cusPhoneTextFieldController
                                                .text ==
                                            null ||
                                        _model.cusPhoneTextFieldController
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
                                          functions.removeCommaFromNumText(
                                              _model.cusPhoneTextFieldController
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

                                    if (_model.oldVmiTextFieldController.text ==
                                            null ||
                                        _model.oldVmiTextFieldController.text ==
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
                                        (widget.oldVmiExpireDate == null ||
                                            widget.oldVmiExpireDate == '')) {
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
                                        if (_model.carrierPriceTextFieldController
                                                    .text ==
                                                null ||
                                            _model.carrierPriceTextFieldController
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
                                          if (!functions.checkIsIntValue(_model
                                              .carrierPriceTextFieldController
                                              .text)!) {
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
                                    if (_model.carryPurposeTextFieldController
                                                .text ==
                                            null ||
                                        _model.carryPurposeTextFieldController
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
                                      if (_model.plateAdditionalTextFieldController
                                                  .text ==
                                              null ||
                                          _model.plateAdditionalTextFieldController
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

                                  setState(() {
                                    FFAppState().nonePackageModelName =
                                        functions.toUpperCase(
                                            _model.modelNameController.text)!;
                                    FFAppState()
                                        .nonePackageModelCode = FFAppState()
                                            .nonePackageSearchModelList
                                            .contains(functions.toUpperCase(_model
                                                .modelNameController.text))
                                        ? FFAppState()
                                                .nonePackageSearchModelIdList[
                                            functions.getIndexOfSomethingList(
                                                FFAppState()
                                                    .nonePackageSearchModelList
                                                    .toList(),
                                                _model
                                                    .modelNameController.text)]
                                        : '';
                                    FFAppState().nonePackageCusFullname =
                                        _model.cusNameTextFieldController.text;
                                    FFAppState().nonePackageCusPhone =
                                        functions.removeCommaFromNumText(_model
                                            .cusPhoneTextFieldController.text);
                                    FFAppState().nonePackagePlate = functions
                                        .removeSpacialLetterFromText(_model
                                            .plateTextFieldController.text);
                                    FFAppState().nonePackageSumInsured = _model
                                        .sumInsuredTextFieldController.text;
                                    FFAppState().nonePackageBrandName =
                                        functions.toUpperCase(_model
                                            .brandNameTextFieldController
                                            .text)!;
                                    FFAppState()
                                        .nonePackageBrandId = FFAppState()
                                            .insuranceBasicBrandNameList
                                            .contains(functions.toUpperCase(
                                                _model
                                                    .brandNameTextFieldController
                                                    .text))
                                        ? functions.getValueWithMappedList(
                                            FFAppState()
                                                .insuranceBasicBrandIdList
                                                .toList(),
                                            FFAppState()
                                                .insuranceBasicBrandNameList
                                                .toList(),
                                            functions.toUpperCase(_model
                                                .brandNameTextFieldController
                                                .text))!
                                        : '';
                                  });
                                  setState(() {
                                    FFAppState().nonePackageCarrierPrice =
                                        _model.carrierPriceTextFieldController
                                            .text;
                                  });
                                  setState(() {
                                    FFAppState().nonePackageTruckPart =
                                        FFAppState().nonePackageTruckPart;
                                    FFAppState().nonePackageCusMembership =
                                        FFAppState().nonePackageCusMembership;
                                    FFAppState().nonePackageTruckCurrentPrice =
                                        _model.currentPriceTextFieldController
                                            .text;
                                    FFAppState().nonePackagePlateAdditional =
                                        functions.removeSpacialLetterFromText(
                                            _model
                                                .plateAdditionalTextFieldController
                                                .text);
                                    FFAppState().nonePackageTruckCarryPurpose =
                                        _model.carryPurposeTextFieldController
                                            .text;
                                    FFAppState().nonePackageTrailerSumInsured =
                                        _model
                                            .trailerSumInsuredTextFieldController
                                            .text;
                                    FFAppState().nonePackageRemark =
                                        _model.remarkTextFieldController.text;
                                  });
                                  if (FFAppState().nonePackageFlagRenew) {
                                    setState(() {
                                      FFAppState().nonePackageOldVmiExpDate =
                                          _model.datePicked != null
                                              ? functions.getDateFormat(
                                                  _model.datePicked)!
                                              : widget.oldVmiExpireDate!;
                                      FFAppState().nonePackageOldVmi =
                                          _model.oldVmiTextFieldController.text;
                                    });
                                    setState(() {
                                      FFAppState().nonePackageOldVmiImageUrl =
                                          _model.uploadedFileUrl1;
                                      FFAppState().nonePackageIdCardImageUrl =
                                          _model.uploadedFileUrl2;
                                      FFAppState()
                                              .nonePackageCompanyBookImageUrl =
                                          _model.uploadedFileUrl3;
                                    });
                                  }
                                  if (FFAppState().nonePackageFlagRenew ||
                                      (FFAppState().nonePackageUsedTypeCode ==
                                          '110') ||
                                      (FFAppState().nonePackageCoverTypeName ==
                                          'ชั้น 3')) {
                                    context.pushNamed(
                                        'NonePackageBasicImage2Page');
                                  } else {
                                    context.pushNamed(
                                        'NonePackageBasicImage1Page');
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
                                        fontFamily: 'Noto Sans Thai',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontWeight: FontWeight.w600,
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
