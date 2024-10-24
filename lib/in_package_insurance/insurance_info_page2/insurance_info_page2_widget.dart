import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_info_page2_model.dart';
export 'insurance_info_page2_model.dart';

class InsuranceInfoPage2Widget extends StatefulWidget {
  const InsuranceInfoPage2Widget({
    super.key,
    required this.masterDataFirebase,
  });

  final DataListRecord? masterDataFirebase;

  @override
  State<InsuranceInfoPage2Widget> createState() =>
      _InsuranceInfoPage2WidgetState();
}

class _InsuranceInfoPage2WidgetState extends State<InsuranceInfoPage2Widget> {
  late InsuranceInfoPage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceInfoPage2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insuranceInfoPage2'});
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
      if (FFAppState().flagRenew == '1') {
        _model.getVehicleUsedTypeAPI =
            await InsuranceRequestGetVehicleAPICall.call(
          apiUrl: FFAppState().apiUrlInsuranceAppState,
          vehicleCategory: 'manual',
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
          FFAppState().insuranceRequestIsLoadedData = false;
          FFAppState().insuranceRequestIsLoadDataMc = false;
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
      }
      Navigator.pop(context);
    });

    _model.oldVmiTextFieldTextController ??=
        TextEditingController(text: FFAppState().nonePackageOldVmi);
    _model.oldVmiTextFieldFocusNode ??= FocusNode();

    _model.vehicleregistrationTextController1 ??=
        TextEditingController(text: FFAppState().insuranceInfoCarRegis);
    _model.vehicleregistrationFocusNode1 ??= FocusNode();

    _model.vehicleregistrationTextController2 ??=
        TextEditingController(text: FFAppState().nonePackagePlateAdditional);
    _model.vehicleregistrationFocusNode2 ??= FocusNode();

    _model.carBodyNoTextFieldTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoBodyNumber);
    _model.carBodyNoTextFieldFocusNode ??= FocusNode();

    _model.enginNoTextFieldTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoEngineNumber);
    _model.enginNoTextFieldFocusNode ??= FocusNode();

    _model.seatAmountTextFieldTextController ??=
        TextEditingController(text: FFAppState().insuranceInfoCarSeat);
    _model.seatAmountTextFieldFocusNode ??= FocusNode();

    _model.sizeTextFieldTextController ??= TextEditingController(
        text: FFAppState().insuranceInfoEvFlag == 'Y'
            ? ((FFAppState().insuranceInfoHorsePower != null &&
                        FFAppState().insuranceInfoHorsePower != '') &&
                    (FFAppState().insuranceInfoHorsePower != '') &&
                    (FFAppState().insuranceInfoHorsePower != '')
                ? functions
                    .removeDotInString(FFAppState().insuranceInfoHorsePower)
                : FFAppState().insuranceInfoHorsePower)
            : ((FFAppState().insuranceInfoSizeCar != null &&
                        FFAppState().insuranceInfoSizeCar != '') &&
                    (FFAppState().insuranceInfoSizeCar != '') &&
                    (FFAppState().insuranceInfoSizeCar != '')
                ? functions.removeDotInString(FFAppState().insuranceInfoSizeCar)
                : FFAppState().insuranceInfoSizeCar));
    _model.sizeTextFieldFocusNode ??= FocusNode();

    _model.weightTextFieldTextController ??= TextEditingController(
        text: (FFAppState().insuranceInfoWeightCar != null &&
                    FFAppState().insuranceInfoWeightCar != '') &&
                (FFAppState().insuranceInfoWeightCar != '') &&
                (FFAppState().insuranceInfoWeightCar != '')
            ? functions.removeDotInString(FFAppState().insuranceInfoWeightCar)
            : FFAppState().insuranceInfoWeightCar);
    _model.weightTextFieldFocusNode ??= FocusNode();

    _model.batteryNumberTextFieldTextController ??= TextEditingController(
        text: (FFAppState().insuranceInfoBatteryNumber1 != null &&
                    FFAppState().insuranceInfoBatteryNumber1 != '') &&
                (FFAppState().insuranceInfoBatteryNumber1 != '') &&
                (FFAppState().insuranceInfoBatteryNumber1 != '')
            ? FFAppState().insuranceInfoBatteryNumber1
            : '');
    _model.batteryNumberTextFieldFocusNode ??= FocusNode();

    _model.batteryNumber2TextFieldTextController ??= TextEditingController(
        text: (FFAppState().insuranceInfoBatteryNumber2 != null &&
                    FFAppState().insuranceInfoBatteryNumber2 != '') &&
                (FFAppState().insuranceInfoBatteryNumber2 != '') &&
                (FFAppState().insuranceInfoBatteryNumber2 != '')
            ? FFAppState().insuranceInfoBatteryNumber2
            : '');
    _model.batteryNumber2TextFieldFocusNode ??= FocusNode();

    _model.wallChargeTextFieldTextController ??= TextEditingController(
        text: (FFAppState().insuranceInfoWallChargerNumber != null &&
                    FFAppState().insuranceInfoWallChargerNumber != '') &&
                (FFAppState().insuranceInfoWallChargerNumber != '') &&
                (FFAppState().insuranceInfoWallChargerNumber != '')
            ? FFAppState().insuranceInfoWallChargerNumber
            : '');
    _model.wallChargeTextFieldFocusNode ??= FocusNode();
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
                await Future.delayed(const Duration(milliseconds: 500));
                context.safePop();
              },
            ),
            title: Text(
              FFAppState().insuranceinfoActType == 'MC'
                  ? '2. ข้อมูลมอเตอร์ไซค์'
                  : '2. ข้อมูลรถยนต์',
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<List<EffectiveDayConfigRecord>>(
                          future: queryEffectiveDayConfigRecordOnce(
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
                            List<EffectiveDayConfigRecord>
                                columnEffectiveDayConfigRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnEffectiveDayConfigRecord =
                                columnEffectiveDayConfigRecordList.isNotEmpty
                                    ? columnEffectiveDayConfigRecordList.first
                                    : null;

                            return SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().insuranceinfoActType !=
                                      'CMI')
                                    wrapWithModel(
                                      model: _model.infomationCustomerModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InfomationCustomerWidget(),
                                    ),
                                  if (FFAppState().insuranceinfoActType ==
                                      'CMI')
                                    wrapWithModel(
                                      model: _model.infomationCustomerActModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InfomationCustomerActWidget(),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
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
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.1,
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
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.11,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.11,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFD9761A),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFFAFAFA),
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '1',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 32.0,
                                                        child: Divider(
                                                          thickness: 1.0,
                                                          color:
                                                              Color(0xFFD9761A),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9761A),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '2',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 32.0,
                                                        child: Divider(
                                                          thickness: 1.0,
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '3',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 32.0,
                                                        child: Divider(
                                                          thickness: 1.0,
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '4',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 32.0,
                                                        child: Divider(
                                                          thickness: 1.0,
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '5',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (!functions
                                          .checkIsStringLengthInLength(
                                              FFAppState().branchCode, 2)!)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'เลือกสาขาที่จะลงผลงาน',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '(บังคับเลือก)',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFFFB0606),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
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
                                                      context.pushNamed(
                                                        'SearchBranchPage',
                                                        queryParameters: {
                                                          'fromPage':
                                                              serializeParam(
                                                            'Step2',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      await actions
                                                          .hideKeyboardAction(
                                                        context,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFB3B3B3),
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
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: ListTile(
                                                              title: Text(
                                                                (FFAppState().insuranceInfoBranchCode !=
                                                                            '') &&
                                                                        (FFAppState().insuranceInfoBranchNameOutput !=
                                                                            '')
                                                                    ? '(${FFAppState().insuranceInfoBranchCode}) ${FFAppState().insuranceInfoBranchNameOutput}'
                                                                    : 'กรุณาเลือกสาขาที่จะลงผลงาน',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: (FFAppState().insuranceInfoBranchCode != '') &&
                                                                              (FFAppState().insuranceInfoBranchNameOutput !=
                                                                                  '')
                                                                          ? Colors
                                                                              .black
                                                                          : Color(
                                                                              0xFF9F9F9F),
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: Color(
                                                                    0xFF474747),
                                                                size: 20.0,
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: false,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'ประเภทรถ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(บังคับเลือก)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
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
                                                    if (FFAppState()
                                                            .flagRenew !=
                                                        '1') {
                                                      return;
                                                    }

                                                    context.pushNamed(
                                                      'SearchableCarListPage',
                                                      queryParameters: {
                                                        'titleText':
                                                            serializeParam(
                                                          'เลือกประเภทรถ',
                                                          ParamType.String,
                                                        ),
                                                        'searchLabel':
                                                            serializeParam(
                                                          'ระบุประเภทรถ',
                                                          ParamType.String,
                                                        ),
                                                        'dataList':
                                                            serializeParam(
                                                          FFAppState()
                                                              .insuranceBasicVehicleTypeDropdownList,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                        'multiSelect':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                        'maxSelected':
                                                            serializeParam(
                                                          0,
                                                          ParamType.int,
                                                        ),
                                                        'fromPage':
                                                            serializeParam(
                                                          'RenewStep2',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFB3B3B3),
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
                                                                .insuranceInfoVehicleType,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              () {
                                                                if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถเก๋ง') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=68ef0a76-99d9-4c43-ae86-b48970b7fb09';
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถตู้') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B8%95%E0%B8%B9%E0%B9%89.png?alt=media&token=8969fa4a-52e0-4b0c-9c44-f349976bc624';
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 2 ประตู') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%20%E0%B8%95%E0%B8%AD%E0%B8%99%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B8%A2%E0%B8%A7%20(%E0%B8%A3%E0%B8%A7%E0%B8%A1).png?alt=media&token=bd62e47d-dd92-41ca-8f51-3632edfd54a6';
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 4 ประตู') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%204%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9.png?alt=media&token=45bc2e60-3a29-47dc-aa4d-e9c82a113bbc';
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถบรรทุก หัวลาก หางพ่วง') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%81%20%E0%B8%AB%E0%B8%B2%E0%B8%87%E0%B8%9E%E0%B9%88%E0%B8%A7%E0%B8%87.png?alt=media&token=1d749f04-0765-422a-b0b7-34a3d5d60519';
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถแต่ง ต่อคอก') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%81%E0%B8%95%E0%B9%88%E0%B8%87%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B8%84%E0%B8%AD%E0%B8%81.png?alt=media&token=80501c24-fec4-4c34-ac0f-361db3b698b3';
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะไม่ต่อเติม') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%202%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1.png?alt=media&token=ca1d014f-d1aa-4f27-bd54-3d97d5efba3f';
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                  return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F2_%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B8%97%E0%B8%B6%E0%B8%9A_%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B9%81%E0%B8%AB%E0%B9%89%E0%B8%87.png?alt=media&token=71715c79-6196-4a63-9a9e-c179033218ea';
                                                                } else {
                                                                  return '-';
                                                                }
                                                              }(),
                                                              width: () {
                                                                if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถเก๋ง') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถตู้') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 2 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 4 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถบรรทุก หัวลาก หางพ่วง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถแต่ง ต่อคอก') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะไม่ต่อเติม') {
                                                                  return 100;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมไม่เกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                  return 100;
                                                                } else {
                                                                  return 0;
                                                                }
                                                              }()
                                                                  .toDouble(),
                                                              fit: BoxFit.cover,
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
                                      if ((FFAppState()
                                                  .insuranceInfoApplicationType !=
                                              'auto') &&
                                          (FFAppState()
                                                  .insuranceInfoVehicleType ==
                                              'รถบรรทุก หัวลาก หางพ่วง'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'ส่วนของรถบรรทุก',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {},
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFB3B3B3),
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
                                                                  .nonePackageTruckPart,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
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
                                      if ((FFAppState()
                                                  .insuranceInfoApplicationType !=
                                              'auto') &&
                                          (FFAppState()
                                                  .insuranceInfoVehicleType ==
                                              'รถบรรทุก หัวลาก หางพ่วง'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'ประเภทลูกค้า',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {},
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFB3B3B3),
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
                                                                  .nonePackageCusMembership,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
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
                                      if ((FFAppState()
                                                  .insuranceInfoApplicationType !=
                                              'auto') &&
                                          (FFAppState()
                                                  .insuranceInfoVehicleType ==
                                              'รถบรรทุก หัวลาก หางพ่วง'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'รถใช้บรรทุกอะไร',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {},
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFB3B3B3),
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
                                                                  .nonePackageTruckCarryPurpose,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
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
                                      if ((FFAppState()
                                                  .insuranceInfoApplicationType !=
                                              'auto') &&
                                          (FFAppState()
                                                  .insuranceInfoVehicleType ==
                                              'รถบรรทุก หัวลาก หางพ่วง'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'ราคาซื้อขายปัจจุบัน',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {},
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFB3B3B3),
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
                                                              FFAppState().nonePackageTruckCurrentPrice ==
                                                                      ''
                                                                  ? ''
                                                                  : valueOrDefault<
                                                                      String>(
                                                                      functions.returnNumberWithComma2Decimal(
                                                                          FFAppState()
                                                                              .nonePackageTruckCurrentPrice),
                                                                      '0',
                                                                    ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
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
                                      if ((FFAppState()
                                                  .insuranceInfoApplicationType !=
                                              'auto') &&
                                          (FFAppState()
                                                  .insuranceInfoVehicleType ==
                                              'รถกระบะ'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFFB3B3B3),
                                              ),
                                            ),
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
                                                    'ติดตู้เหล็ก',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                if (!FFAppState()
                                                    .nonePackageFlagCarrier)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF9F9F9F),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                    .nonePackageFlagCarrier)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
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
                                      if ((FFAppState()
                                                  .insuranceInfoApplicationType !=
                                              'auto') &&
                                          (FFAppState()
                                                  .insuranceInfoVehicleType ==
                                              'รถกระบะ') &&
                                          FFAppState().nonePackageFlagCarrier)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFFB3B3B3),
                                              ),
                                            ),
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
                                                    'ใช้ร่วมกับขนส่งสาธารณะ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                if (!FFAppState()
                                                    .nonePackageFlagCoop)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF9F9F9F),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                    .nonePackageFlagCoop)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
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
                                    ],
                                  ),
                                  if ((FFAppState()
                                              .insuranceInfoApplicationType !=
                                          'auto') &&
                                      (FFAppState().insuranceInfoVehicleType ==
                                          'รถกระบะ') &&
                                      FFAppState().nonePackageFlagCarrier)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'ประเภทตู้เหล็ก',
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
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {},
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
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
                                                          FFAppState()
                                                              .nonePackageCarrierType,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black600,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                  if ((FFAppState()
                                              .insuranceInfoApplicationType !=
                                          'auto') &&
                                      (FFAppState().insuranceInfoVehicleType ==
                                          'รถกระบะ') &&
                                      FFAppState().nonePackageFlagCarrier &&
                                      (FFAppState().nonePackageCarrierType ==
                                          'ตู้เย็น'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'ราคาตู้ + เครื่องทำความเย็น',
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
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {},
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
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
                                                          FFAppState().nonePackageCarrierPrice ==
                                                                  ''
                                                              ? ''
                                                              : valueOrDefault<
                                                                  String>(
                                                                  functions.returnNumberWithComma2Decimal(
                                                                      FFAppState()
                                                                          .nonePackageCarrierPrice),
                                                                  '0',
                                                                ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black600,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
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
                                                  'ยี่ห้อรถ ',
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
                                              onTap: () async {},
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                        FFAppState()
                                                            .insuranceInfoBrandName,
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
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
                                                  'รุ่นรถ',
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
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFAppState()
                                                          .insuranceInfoModelName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .black600,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                  if (FFAppState().nonePackageFlagRenew)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'เลขกรมธรรม์',
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
                                                  Text(
                                                    'เดิม',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '(บังคับกรอก)',
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                          .oldVmiTextFieldTextController,
                                                      focusNode: _model
                                                          .oldVmiTextFieldFocusNode,
                                                      autofocus: false,
                                                      readOnly: FFAppState()
                                                              .nonePackageOldVmi !=
                                                          '',
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
                                                            'กรุณากรอกเลขกรมธรรม์เดิม',
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
                                                            color: Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
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
                                  if (FFAppState().insuranceinfoActType !=
                                      'CMI')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'วันที่หมดอายุประกัน',
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
                                                  Text(
                                                    'เดิม',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                  if (FFAppState()
                                                      .nonePackageFlagRenew)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(บังคับเลือก)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await DatePicker
                                                      .showDatePicker(
                                                    context,
                                                    showTitleActions: true,
                                                    onConfirm: (date) {
                                                      safeSetState(() {
                                                        _model.datePicked1 =
                                                            date;
                                                      });
                                                    },
                                                    currentTime:
                                                        getCurrentTimestamp,
                                                    minTime: DateTime(0, 0, 0),
                                                    locale: LocaleType.values
                                                        .firstWhere(
                                                      (l) =>
                                                          l.name ==
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                      orElse: () =>
                                                          LocaleType.en,
                                                    ),
                                                  );

                                                  if (!(_model.datePicked1 !=
                                                      null)) {
                                                    await actions
                                                        .hideKeyboardAction(
                                                      context,
                                                    );
                                                    return;
                                                  }
                                                  FFAppState()
                                                          .nonePackageOldVmiExpDate =
                                                      functions.getDateFormat(
                                                          _model.datePicked1)!;
                                                  safeSetState(() {});
                                                  await actions
                                                      .hideKeyboardAction(
                                                    context,
                                                  );
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
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
                                                          () {
                                                            if ((FFAppState()
                                                                        .nonePackageOldVmiExpDate !=
                                                                    '') &&
                                                                !functions.containWordinStringUrl(
                                                                    'กรุณา',
                                                                    FFAppState()
                                                                        .nonePackageOldVmiExpDate)!) {
                                                              return valueOrDefault<
                                                                  String>(
                                                                functions.showDateBE(
                                                                    FFAppState()
                                                                        .nonePackageOldVmiExpDate),
                                                                '0',
                                                              );
                                                            } else if (_model
                                                                    .datePicked1 !=
                                                                null) {
                                                              return valueOrDefault<
                                                                  String>(
                                                                functions.showDateBE(_model
                                                                    .datePicked1
                                                                    ?.toString()),
                                                                '0',
                                                              );
                                                            } else {
                                                              return 'กรุณาเลือกวันหมดอายุประกันเดิม';
                                                            }
                                                          }(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      if (false)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                  if (FFAppState().insuranceinfoActType !=
                                      'CMI')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'วันที่ต้องการเริ่มคุ้มครองประกัน',
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
                                                      '(บังคับเลือก)',
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await DatePicker
                                                      .showDatePicker(
                                                    context,
                                                    showTitleActions: true,
                                                    onConfirm: (date) {
                                                      safeSetState(() {
                                                        _model.datePicked2 =
                                                            date;
                                                      });
                                                    },
                                                    currentTime: (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานต่ออายุ') ||
                                                            (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานโอนโค้ด')
                                                        ? getCurrentTimestamp
                                                        : getCurrentTimestamp,
                                                    minTime: (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานต่ออายุ') ||
                                                            (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานโอนโค้ด')
                                                        ? getCurrentTimestamp
                                                        : getCurrentTimestamp,
                                                    locale: LocaleType.values
                                                        .firstWhere(
                                                      (l) =>
                                                          l.name ==
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                      orElse: () =>
                                                          LocaleType.en,
                                                    ),
                                                  );

                                                  if (!(_model.datePicked2 !=
                                                      null)) {
                                                    await actions
                                                        .hideKeyboardAction(
                                                      context,
                                                    );
                                                    return;
                                                  }
                                                  if (functions
                                                      .checkDateBeforeAnotherDate(
                                                          columnEffectiveDayConfigRecord
                                                              ?.effectiveDaysInsure,
                                                          _model
                                                              .datePicked2)!) {
                                                    FFAppState()
                                                            .insuranceInfoEffectiveDateInsure =
                                                        functions.getDateFormat(
                                                            _model
                                                                .datePicked2)!;
                                                    safeSetState(() {});
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'ไม่สามารถเลือกวันเกิน  ${columnEffectiveDayConfigRecord?.effectiveDaysInsure?.toString()}  วันได้กรุณาเลือกใหม่'),
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

                                                  await actions
                                                      .hideKeyboardAction(
                                                    context,
                                                  );
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
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
                                                          FFAppState().insuranceInfoEffectiveDateInsure ==
                                                                  ''
                                                              ? 'กรุณาเลือกวันที่ต้องการเริ่มคุ้มครองประกัน'
                                                              : valueOrDefault<
                                                                  String>(
                                                                  functions.showDateBE(
                                                                      FFAppState()
                                                                          .insuranceInfoEffectiveDateInsure),
                                                                  '0',
                                                                ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FFAppState()
                                                                            .insuranceInfoEffectiveDateAct ==
                                                                        ''
                                                                    ? Color(
                                                                        0xFF9F9F9F)
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                  if (FFAppState().insuranceinfoActType ==
                                      'CMI')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'วันที่ต้องการเริ่มคุ้มครอง พ.ร.บ',
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
                                                      '(บังคับเลือก)',
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await DatePicker
                                                      .showDatePicker(
                                                    context,
                                                    showTitleActions: true,
                                                    onConfirm: (date) {
                                                      safeSetState(() {
                                                        _model.datePicked3 =
                                                            date;
                                                      });
                                                    },
                                                    currentTime: (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานต่ออายุ') ||
                                                            (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานโอนโค้ด')
                                                        ? getCurrentTimestamp
                                                        : getCurrentTimestamp,
                                                    minTime: (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานต่ออายุ') ||
                                                            (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานโอนโค้ด')
                                                        ? getCurrentTimestamp
                                                        : getCurrentTimestamp,
                                                    locale: LocaleType.values
                                                        .firstWhere(
                                                      (l) =>
                                                          l.name ==
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                      orElse: () =>
                                                          LocaleType.en,
                                                    ),
                                                  );

                                                  if (!(_model.datePicked3 !=
                                                      null)) {
                                                    await actions
                                                        .hideKeyboardAction(
                                                      context,
                                                    );
                                                    return;
                                                  }
                                                  if (!functions
                                                      .checkDateBeforeAnotherDate(
                                                          columnEffectiveDayConfigRecord
                                                              ?.effectiveDaysAct,
                                                          _model
                                                              .datePicked3)!) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'ไม่สามารถเลือกวันเกิน   ${columnEffectiveDayConfigRecord?.effectiveDaysAct?.toString()}  วันได้กรุณาเลือกใหม่'),
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
                                                  FFAppState()
                                                          .insuranceInfoEffectiveDateAct =
                                                      functions.getDateFormat(
                                                          _model.datePicked3)!;
                                                  safeSetState(() {});
                                                  await actions
                                                      .hideKeyboardAction(
                                                    context,
                                                  );
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
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
                                                          FFAppState().insuranceInfoEffectiveDateAct ==
                                                                  ''
                                                              ? 'กรุณาเลือกวันที่ต้องการเริ่มคุ้มครองประกัน'
                                                              : valueOrDefault<
                                                                  String>(
                                                                  functions.showDateBE(
                                                                      FFAppState()
                                                                          .insuranceInfoEffectiveDateAct),
                                                                  '0',
                                                                ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FFAppState()
                                                                            .insuranceInfoEffectiveDateAct ==
                                                                        ''
                                                                    ? Color(
                                                                        0xFF9F9F9F)
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
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
                                                  'เลขทะเบียนรถ',
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
                                                    '(บังคับกรอก ตัวอย่าง 1ฒต3333)',
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
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .vehicleregistrationTextController1,
                                                    focusNode: _model
                                                        .vehicleregistrationFocusNode1,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText:
                                                          'กรุณากรอกเลขทะเบียนรถ',
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
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black600,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    validator: _model
                                                        .vehicleregistrationTextController1Validator
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
                                  if ((FFAppState()
                                              .insuranceInfoApplicationType !=
                                          'auto') &&
                                      (FFAppState().insuranceInfoVehicleType ==
                                          'รถบรรทุก หัวลาก หางพ่วง') &&
                                      (FFAppState().nonePackageTruckPart ==
                                          'หัวลาก + หางพ่วง'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'เลขทะเบียนหางพ่วง',
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
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                          .vehicleregistrationTextController2,
                                                      focusNode: _model
                                                          .vehicleregistrationFocusNode2,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        hintText:
                                                            'กรุณากรอกเลขทะเบียนรถ',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .black600,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                      validator: _model
                                                          .vehicleregistrationTextController2Validator
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
                                                  'ปีจดทะเบียน พ.ศ.',
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
                                                if (FFAppState().flagRenew !=
                                                    '1') {
                                                  return;
                                                }

                                                context.pushNamed(
                                                  'SearchableListPage',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกปีจดทะเบียน',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'ระบุปีจดทะเบียน',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      functions.reverseList(
                                                          functions
                                                              .ganerateYearList(
                                                                  2500, 2567)
                                                              ?.toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'RenewStep2',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                        FFAppState().insuranceInfoRegisYear !=
                                                                ''
                                                            ? (int.parse(FFAppState()
                                                                        .insuranceInfoRegisYear) +
                                                                    543)
                                                                .toString()
                                                            : 'กรุณาเลือกปีจดทะเบียน',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_ios_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
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
                                  if (FFAppState().insuranceinfoActType !=
                                      'CMI')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'ปีที่ผลิต ค.ศ.',
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
                                                      '(บังคับกรอก)',
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'SearchableListPage',
                                                    queryParameters: {
                                                      'titleText':
                                                          serializeParam(
                                                        'เลือกปีที่ผลิต',
                                                        ParamType.String,
                                                      ),
                                                      'searchLabel':
                                                          serializeParam(
                                                        'เลือกปี',
                                                        ParamType.String,
                                                      ),
                                                      'dataList':
                                                          serializeParam(
                                                        functions.reverseList(
                                                            functions
                                                                .ganerateYearList(
                                                                    1957, 2023)
                                                                ?.toList()),
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                      'multiSelect':
                                                          serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                      'fromPage':
                                                          serializeParam(
                                                        'insuranceInfoPage2',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  await actions
                                                      .hideKeyboardAction(
                                                    context,
                                                  );
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
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
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: ListTile(
                                                          title: Text(
                                                            FFAppState().insuranceInfoProductYear !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .insuranceInfoProductYear !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .insuranceInfoProductYear
                                                                : 'กรุณาเลือกปีที่ผลิต',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: functions.containWordinStringUrl(
                                                                          'เลือก',
                                                                          FFAppState()
                                                                              .insuranceInfoProductYear)!
                                                                      ? Color(
                                                                          0xFF9F9F9F)
                                                                      : Colors
                                                                          .black,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          trailing: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: Color(
                                                                0xFF474747),
                                                            size: 20.0,
                                                          ),
                                                          tileColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          dense: false,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
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
                                                  'จังหวัดที่จดทะเบียน',
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
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SearchableListPage',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกจังหวัดที่จดทะเบียน',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'เลือกจังหวัดที่จดทะเบียน',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      FFAppState()
                                                          .insuranceInfoRegistrationprovinceList,
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'insuranceInfoPage2',
                                                      ParamType.String,
                                                    ),
                                                    'maxSelected':
                                                        serializeParam(
                                                      0,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Material(
                                                      color: Colors.transparent,
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
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: functions.containWordinStringUrl(
                                                                        'เลือก',
                                                                        FFAppState()
                                                                            .insuranceInfoProductYear)!
                                                                    ? Color(
                                                                        0xFF9F9F9F)
                                                                    : Colors
                                                                        .black,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        trailing: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color:
                                                              Color(0xFF474747),
                                                          size: 20.0,
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: false,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
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
                                                  'ลักษณะการใช้รถ',
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
                                          if (false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                        FFAppState()
                                                            .insuranceInfoVehicleUsage,
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
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (FFAppState().flagRenew !=
                                                  '1') {
                                                return;
                                              }

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
                                                    functions.generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList()),
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
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  width: 0.5,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: ListTile(
                                                      title: Text(
                                                        FFAppState().insuranceInfoVehicleUsage ==
                                                                ''
                                                            ? 'เลือกการใช้งาน'
                                                            : FFAppState()
                                                                .insuranceInfoVehicleUsage,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: functions.containWordinStringUrl(
                                                                      'เลือก',
                                                                      FFAppState()
                                                                          .insuranceBasicVehicleUsedTypeName)!
                                                                  ? Color(
                                                                      0xFF9F9F9F)
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                      trailing: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            Color(0xFF474747),
                                                        size: 20.0,
                                                      ),
                                                      tileColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      dense: false,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
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
                                                  'เลขตัวถัง',
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
                                                    '(บังคับกรอก ไม่ต้องใส่ - )',
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
                                              child: Stack(
                                                children: [
                                                  Align(
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
                                                            .carBodyNoTextFieldTextController,
                                                        focusNode: _model
                                                            .carBodyNoTextFieldFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.carBodyNoTextFieldTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  100),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'กรุณากรอกเลขตัวถัง',
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
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
                                                              color: Color(
                                                                  0x00101213),
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                        validator: _model
                                                            .carBodyNoTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
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
                                                      child: Text(
                                                        functions
                                                            .removeDatAndMakeUpperCase(
                                                                _model
                                                                    .carBodyNoTextFieldTextController
                                                                    .text)!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  letterSpacing:
                                                                      0.0,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
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
                                                  'เลขตัวเครื่อง',
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
                                                    '(บังคับกรอก ไม่ต้องใส่ - )',
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
                                              child: Stack(
                                                children: [
                                                  Align(
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
                                                            .enginNoTextFieldTextController,
                                                        focusNode: _model
                                                            .enginNoTextFieldFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.enginNoTextFieldTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  100),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                          hintText:
                                                              'กรุณากรอกเลขเครื่อง',
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
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
                                                              color: Color(
                                                                  0x00101213),
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                        validator: _model
                                                            .enginNoTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
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
                                                      child: Text(
                                                        functions
                                                            .removeDatAndMakeUpperCase(
                                                                _model
                                                                    .enginNoTextFieldTextController
                                                                    .text)!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  letterSpacing:
                                                                      0.0,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
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
                                                  'จำนวนที่นั่ง',
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
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .seatAmountTextFieldTextController,
                                                    focusNode: _model
                                                        .seatAmountTextFieldFocusNode,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText:
                                                          'กรุณากรอกจำนวนที่นั่ง',
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
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: _model
                                                        .seatAmountTextFieldTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      _model
                                                          .seatAmountTextFieldMask
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
                                                  FFAppState().insuranceInfoEvFlag ==
                                                          'Y'
                                                      ? 'แรงม้า'
                                                      : 'cc',
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
                                                if (FFAppState()
                                                        .insuranceInfoVehicleType !=
                                                    'รถบรรทุก หัวลาก หางพ่วง')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '(บังคับกรอก)',
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
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
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .sizeTextFieldTextController,
                                                    focusNode: _model
                                                        .sizeTextFieldFocusNode,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText: FFAppState()
                                                                  .insuranceInfoEvFlag ==
                                                              'Y'
                                                          ? 'กรุณากรอกแรงม้า'
                                                          : 'กรุณากรอกขนาด',
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
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: _model
                                                        .sizeTextFieldTextControllerValidator
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
                                        0.0, 5.0, 0.0, 10.0),
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
                                                  'น้ำหนักรถ',
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
                                                    '(บังคับกรอก กิโลกรัม)',
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
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .weightTextFieldTextController,
                                                    focusNode: _model
                                                        .weightTextFieldFocusNode,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText:
                                                          'กรุณากรอกน้ำหนัก',
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
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(
                                                            decimal: true),
                                                    validator: _model
                                                        .weightTextFieldTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      _model.weightTextFieldMask
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
                                  if (FFAppState().insuranceInfoEvFlag == 'Y')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 10.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'หมายเลขแบตเตอรี่ 1',
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
                                                      '(บังคับกรอก)',
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                          .batteryNumberTextFieldTextController,
                                                      focusNode: _model
                                                          .batteryNumberTextFieldFocusNode,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        hintText:
                                                            'กรุณากรอกหมายเลขแบตเตอรี่',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                      validator: _model
                                                          .batteryNumberTextFieldTextControllerValidator
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
                                  if (FFAppState().insuranceInfoEvFlag == 'Y')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 10.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'หมายเลขแบตเตอรี่ 2',
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
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                          .batteryNumber2TextFieldTextController,
                                                      focusNode: _model
                                                          .batteryNumber2TextFieldFocusNode,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        hintText:
                                                            'กรุณากรอกหมายเลขแบตเตอรี่',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                      validator: _model
                                                          .batteryNumber2TextFieldTextControllerValidator
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
                                  if (FFAppState().insuranceInfoEvFlag == 'Y')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 10.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'เลขที่ Wall Charge',
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
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                          .wallChargeTextFieldTextController,
                                                      focusNode: _model
                                                          .wallChargeTextFieldFocusNode,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        hintText:
                                                            'กรุณากรอกเลขที่ Wall Charge',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                      validator: _model
                                                          .wallChargeTextFieldTextControllerValidator
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
                                  if ((FFAppState().insuranceinfoActType !=
                                          'CMI') &&
                                      (FFAppState().insuranceinfoActType !=
                                          'MC'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState()
                                                  .insuranceInfoEvFlag ==
                                              'Y') {
                                            context.pushNamed(
                                              'ShowDriverPage',
                                              queryParameters: {
                                                'firestoreDataConfigList':
                                                    serializeParam(
                                                  widget!.masterDataFirebase,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'firestoreDataConfigList':
                                                    widget!.masterDataFirebase,
                                              },
                                            );
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
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
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      (FFAppState().DriverList.length ==
                                                                  0
                                                              ? false
                                                              : ((FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .firstNameTh !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .lastNameTh !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .birthDay !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .nationalThaiId !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .licenseNo !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .imageIdcard !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .imageLicenseNo !=
                                                                      '')))
                                                          ? 'ระบุผู้ขับขี่'
                                                          : 'ไม่ระบุผู้ขับขี่',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Colors.black,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  if (FFAppState()
                                                          .insuranceInfoEvFlag ==
                                                      'Y')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(บังคับกรอกอย่างน้อย 1 คน)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              if ((FFAppState().DriverList.length > 0) &&
                                                  ((FFAppState().DriverList.first.firstNameTh != '') &&
                                                      (FFAppState()
                                                              .DriverList
                                                              .first
                                                              .lastNameTh !=
                                                          '') &&
                                                      (FFAppState()
                                                              .DriverList
                                                              .first
                                                              .birthDay !=
                                                          '') &&
                                                      (FFAppState()
                                                              .DriverList
                                                              .first
                                                              .nationalThaiId !=
                                                          '') &&
                                                      (FFAppState()
                                                              .DriverList
                                                              .first
                                                              .licenseNo !=
                                                          '') &&
                                                      (FFAppState()
                                                              .DriverList
                                                              .first
                                                              .imageIdcard !=
                                                          '') &&
                                                      (FFAppState()
                                                              .DriverList
                                                              .first
                                                              .imageLicenseNo !=
                                                          '')))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Icon(
                                                    Icons.gpp_good_outlined,
                                                    color: Color(0xFF00B505),
                                                    size: 24.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((FFAppState().insuranceinfoActType !=
                                          'CMI') &&
                                      (FFAppState().insuranceinfoActType !=
                                          'MC'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'Homepage_Request_2_1',
                                            queryParameters: {
                                              'accessory': serializeParam(
                                                FFAppState()
                                                    .insuranceInfoAccessory,
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
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.6,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .dashboard_customize_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                            .insuranceInfoAccessoryProtect ==
                                                        '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'อุปกรณ์เสริม',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFF003063),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .insuranceInfoAccessoryProtect ==
                                                        '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '(บังคับเลือก)',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFFFB0606),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .insuranceInfoAccessoryProtect !=
                                                        '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFAppState().insuranceInfoAccessoryProtect ==
                                                                  'คุ้มครองอุปกรณ์เสริม'
                                                              ? '${FFAppState().insuranceInfoAccessoryProtect} ${functions.showNumberWithComma(FFAppState().insuranceInfoAccessory)}'
                                                              : FFAppState()
                                                                  .insuranceInfoAccessoryProtect,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFF003063),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.navigate_next,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                  if ((FFAppState().insuranceinfoActType !=
                                          'CMI') &&
                                      (FFAppState().insuranceinfoActType !=
                                          'MC'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              'Homepage_Request_2_2');

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
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.6,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .playlist_add,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                            .insuranceInfoActOflLegislation ==
                                                        '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'พ.ร.บ.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFF003063),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .insuranceInfoActOflLegislation ==
                                                        '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '(บังคับเลือก)',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFFFB0606),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .insuranceInfoActOflLegislation !=
                                                        '')
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
                                                              .insuranceInfoActOflLegislation,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFF003063),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    if ((FFAppState()
                                                                .insuranceInfoActFlag !=
                                                            '') &&
                                                        (FFAppState()
                                                                .insuranceInfoEffectiveDateAct !=
                                                            ''))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFAppState().insuranceInfoActFlag ==
                                                                  '1'
                                                              ? '${functions.showNumberWithComma(FFAppState().insuranceInfoGrosstotalNet)} บาท'
                                                              : '${functions.showNumberWithComma(FFAppState().insuranceInfoPage4NetPremiumTotal)} บาท',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFF003063),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.navigate_next,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                  if (FFAppState().insuranceinfoActType !=
                                      'CMI')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              'Homepage_Request_2_3');

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
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.6,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .person_add_alt_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                            .insuranceInfoBeneficiaryName ==
                                                        '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'ผู้รับผลประโยชน์',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFF003063),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .insuranceInfoBeneficiaryName ==
                                                        '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '(บังคับเลือก)',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Color(
                                                                    0xFFFB0606),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .insuranceInfoBeneficiaryName !=
                                                        '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFAppState()
                                                              .insuranceInfoBeneficiaryName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.navigate_next,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 15.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Row(
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
                                                  if (FFAppState()
                                                          .insuranceinfoActType !=
                                                      'MC') {
                                                    if (!functions
                                                        .checkIsStringLengthInLength(
                                                            FFAppState()
                                                                .branchCode,
                                                            2)!) {
                                                      if (!((FFAppState()
                                                                  .insuranceInfoBranchCode !=
                                                              '') &&
                                                          (FFAppState()
                                                                  .insuranceInfoBranchNameOutput !=
                                                              ''))) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'กรุณาเลือกสาขาที่จะลงผลงาน'),
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
                                                    }
                                                    if (!(FFAppState()
                                                                .insuranceInfoEffectiveDateInsure !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoEffectiveDateInsure !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกวันที่เริ่มคุ้มครองประกัน'),
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
                                                    if (!(_model.vehicleregistrationTextController1
                                                                .text !=
                                                            null &&
                                                        _model.vehicleregistrationTextController1
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกเลขทะเบียนรถ'),
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
                                                    if (!(_model.carBodyNoTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.carBodyNoTextFieldTextController
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกเลขตัวถัง'),
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
                                                    if (!(_model.enginNoTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.enginNoTextFieldTextController
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกเลขเครื่อง'),
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
                                                    if (!(_model.seatAmountTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.seatAmountTextFieldTextController
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกจำนวนที่นั่ง'),
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
                                                    if (FFAppState()
                                                            .insuranceInfoVehicleType !=
                                                        'รถบรรทุก หัวลาก หางพ่วง') {
                                                      if (_model.sizeTextFieldTextController
                                                                  .text !=
                                                              null &&
                                                          _model.sizeTextFieldTextController
                                                                  .text !=
                                                              '') {
                                                        if (functions
                                                            .checkDoubleBool(_model
                                                                .sizeTextFieldTextController
                                                                .text)!) {
                                                          if (FFAppState()
                                                                  .insuranceInfoEvFlag ==
                                                              'Y') {
                                                            if (!((String
                                                                var1) {
                                                              return double.parse(
                                                                      var1) >=
                                                                  0.0;
                                                            }(_model
                                                                .sizeTextFieldTextController
                                                                .text))) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'แรงม้า ไม่ถูกต้องกรุณากรอกใหม่'),
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
                                                          } else {
                                                            if (!((((String
                                                                        var1) {
                                                                      return double.parse(
                                                                              var1) <=
                                                                          1.0;
                                                                    }(_model
                                                                        .sizeTextFieldTextController
                                                                        .text)) &&
                                                                    ((String
                                                                        var1) {
                                                                      return double.parse(
                                                                              var1) >=
                                                                          0.0;
                                                                    }(_model
                                                                        .sizeTextFieldTextController
                                                                        .text))) ||
                                                                (((String
                                                                        var1) {
                                                                      return double.parse(
                                                                              var1) >=
                                                                          1000.0;
                                                                    }(_model
                                                                        .sizeTextFieldTextController
                                                                        .text)) &&
                                                                    ((String
                                                                        var1) {
                                                                      return double.parse(
                                                                              var1) <=
                                                                          99999.0;
                                                                    }(_model
                                                                        .sizeTextFieldTextController
                                                                        .text))))) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'สูบ (cc) ไม่ถูกต้องกรุณากรอกใหม่'),
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
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(FFAppState()
                                                                              .insuranceInfoEvFlag ==
                                                                          'Y'
                                                                      ? 'แรงม้า ไม่ถูกต้องกรุณากรอกใหม่'
                                                                      : 'สูบ (cc) ไม่ถูกต้องกรุณากรอกใหม่'),
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
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(FFAppState()
                                                                            .insuranceInfoEvFlag ==
                                                                        'Y'
                                                                    ? 'บังคับกรอกแรงม้า'
                                                                    : 'บังคับกรอกขนาด'),
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
                                                    }
                                                    if (!(_model.weightTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.weightTextFieldTextController
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกน้ำหนัก'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoAccessoryProtect !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoAccessoryProtect !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับเลือกอุปกรณ์เสริม'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoActOflLegislation !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoActOflLegislation !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับเลือก พ.ร.บ'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoBeneficiaryName !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoBeneficiaryName !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับเลือกผู้รับผลประโยชน์'),
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
                                                    if (functions.countCharInString(
                                                            _model
                                                                .vehicleregistrationTextController1
                                                                .text)! >
                                                        10) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'ทะเบียนรถเกิน 10 ตัว กรุณากรอกใหม่'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoProductYear !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoProductYear !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณาเลือกปีที่ผลิต'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoRegistrationProvinceSelect !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoRegistrationProvinceSelect !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณาเลือกจังหวัดที่จดทะเบียน'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoVehicleUsage !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoVehicleUsage !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณาเลือกลักษณะการใช้รถ'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoRegisYear !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoRegisYear !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณากรอกปีจดทะเบียน'),
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
                                                    if (FFAppState()
                                                            .insuranceInfoEvFlag ==
                                                        'Y') {
                                                      if (!() {
                                                        if (FFAppState()
                                                                .DriverList
                                                                .length ==
                                                            0) {
                                                          return false;
                                                        } else if (FFAppState()
                                                                .DriverList
                                                                .length ==
                                                            1) {
                                                          return ((FFAppState()
                                                                      .DriverList
                                                                      .length ==
                                                                  1) &&
                                                              ((FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .firstNameTh !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .lastNameTh !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .birthDay !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .nationalThaiId !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .licenseNo !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .imageIdcard !=
                                                                      '') &&
                                                                  (FFAppState()
                                                                          .DriverList
                                                                          .first
                                                                          .imageLicenseNo !=
                                                                      '')));
                                                        } else {
                                                          return true;
                                                        }
                                                      }()) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'กรุณาระบุผู้ขับขี่อย่างน้อย 1 คน'),
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
                                                      if (!(_model.batteryNumberTextFieldTextController
                                                                  .text !=
                                                              null &&
                                                          _model.batteryNumberTextFieldTextController
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
                                                                    'กรุณากรอกหมายเลขแบตเตอรี่'),
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
                                                    }
                                                  } else {
                                                    if (!functions
                                                        .checkIsStringLengthInLength(
                                                            FFAppState()
                                                                .branchCode,
                                                            2)!) {
                                                      if (!((FFAppState()
                                                                  .insuranceInfoBranchCode !=
                                                              '') &&
                                                          (FFAppState()
                                                                  .insuranceInfoBranchNameOutput !=
                                                              ''))) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'กรุณาเลือกสาขาที่จะลงผลงาน'),
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
                                                    }
                                                    if (!(FFAppState()
                                                                .insuranceInfoEffectiveDateInsure !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoEffectiveDateInsure !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกวันที่เริ่มคุ้มครองประกัน'),
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
                                                    if (!(_model.vehicleregistrationTextController1
                                                                .text !=
                                                            null &&
                                                        _model.vehicleregistrationTextController1
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกเลขทะเบียนรถ'),
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
                                                    if (!(_model.carBodyNoTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.carBodyNoTextFieldTextController
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกเลขตัวถัง'),
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
                                                    if (!(_model.enginNoTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.enginNoTextFieldTextController
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกเลขเครื่อง'),
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
                                                    if (!(_model.seatAmountTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.seatAmountTextFieldTextController
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกจำนวนที่นั่ง'),
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
                                                    if (!(_model.sizeTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.sizeTextFieldTextController
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกขนาด'),
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
                                                    if (!(_model.weightTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.weightTextFieldTextController
                                                                .text !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกน้ำหนัก'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoBeneficiaryName !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoBeneficiaryName !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับเลือกผู้รับผลประโยชน์'),
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
                                                    if (functions.countCharInString(
                                                            _model
                                                                .vehicleregistrationTextController1
                                                                .text)! >
                                                        10) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'ทะเบียนรถเกิน 10 ตัว กรุณากรอกใหม่'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoRegistrationProvinceSelect !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoRegistrationProvinceSelect !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณาเลือกจังหวัดที่จดทะเบียน'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoVehicleUsage !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoVehicleUsage !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณาเลือกลักษณะการใช้รถ'),
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
                                                    if (!(FFAppState()
                                                                .insuranceInfoRegisYear !=
                                                            null &&
                                                        FFAppState()
                                                                .insuranceInfoRegisYear !=
                                                            '')) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณากรอกปีจดทะเบียน'),
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
                                                  }
                                                } else {
                                                  if (!functions
                                                      .checkIsStringLengthInLength(
                                                          FFAppState()
                                                              .branchCode,
                                                          2)!) {
                                                    if (!((FFAppState()
                                                                .insuranceInfoBranchCode !=
                                                            '') &&
                                                        (FFAppState()
                                                                .insuranceInfoBranchNameOutput !=
                                                            ''))) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'กรุณาเลือกสาขาที่จะลงผลงาน'),
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
                                                  }
                                                  if (!(FFAppState()
                                                              .insuranceInfoEffectiveDateAct !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoEffectiveDateAct !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกวันที่เริ่มคุ้มครองพรบ.'),
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
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  if (!(_model.vehicleregistrationTextController1
                                                              .text !=
                                                          null &&
                                                      _model.vehicleregistrationTextController1
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกเลขทะเบียนรถ'),
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
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  if (!(_model.enginNoTextFieldTextController
                                                              .text !=
                                                          null &&
                                                      _model.enginNoTextFieldTextController
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกเลขเครื่อง'),
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
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  if (!(_model.seatAmountTextFieldTextController
                                                              .text !=
                                                          null &&
                                                      _model.seatAmountTextFieldTextController
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกจำนวนที่นั่ง'),
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
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  if (FFAppState()
                                                          .insuranceInfoVehicleType !=
                                                      'รถบรรทุก หัวลาก หางพ่วง') {
                                                    if (_model.sizeTextFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.sizeTextFieldTextController
                                                                .text !=
                                                            '') {
                                                      if (functions
                                                          .checkDoubleBool(_model
                                                              .sizeTextFieldTextController
                                                              .text)!) {
                                                        if (!((((String var1) {
                                                                  return double
                                                                          .parse(
                                                                              var1) <=
                                                                      1.0;
                                                                }(_model
                                                                    .sizeTextFieldTextController
                                                                    .text)) &&
                                                                ((String var1) {
                                                                  return double
                                                                          .parse(
                                                                              var1) >=
                                                                      0.0;
                                                                }(_model
                                                                    .sizeTextFieldTextController
                                                                    .text))) ||
                                                            (((String var1) {
                                                                  return double
                                                                          .parse(
                                                                              var1) >=
                                                                      1000.0;
                                                                }(_model
                                                                    .sizeTextFieldTextController
                                                                    .text)) &&
                                                                ((String var1) {
                                                                  return double
                                                                          .parse(
                                                                              var1) <=
                                                                      99999.0;
                                                                }(_model
                                                                    .sizeTextFieldTextController
                                                                    .text))))) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'สูบ (cc) ไม่ถูกต้องกรุณากรอกใหม่'),
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
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'สูบ (cc) ไม่ถูกต้องกรุณากรอกใหม่'),
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
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'บังคับกรอกขนาด'),
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
                                                  }
                                                  if (!(_model.weightTextFieldTextController
                                                              .text !=
                                                          null &&
                                                      _model.weightTextFieldTextController
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'บังคับกรอกน้ำหนัก'),
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
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  if (functions.countCharInString(
                                                          _model
                                                              .vehicleregistrationTextController1
                                                              .text)! >
                                                      10) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'ทะเบียนรถเกิน 10 ตัว กรุณากรอกใหม่'),
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
                                                      safeSetState(() {});
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
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณาเลือกจังหวัดที่จดทะเบียน'),
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
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  if (!(FFAppState()
                                                              .insuranceInfoVehicleUsage !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoVehicleUsage !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณาเลือกลักษณะการใช้รถ'),
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
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  if (!(FFAppState()
                                                              .insuranceInfoRegisYear !=
                                                          null &&
                                                      FFAppState()
                                                              .insuranceInfoRegisYear !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอกปีจดทะเบียน'),
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
                                                      safeSetState(() {});
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
                                                        onTap: () =>
                                                            FocusScope.of(
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

                                                FFAppState()
                                                        .insuranceInfoCarRegis =
                                                    functions
                                                        .removeSpacialLetterFromText(
                                                            _model
                                                                .vehicleregistrationTextController1
                                                                .text);
                                                FFAppState()
                                                        .insuranceInfoBodyNumber =
                                                    functions
                                                        .removeDatAndMakeUpperCase(
                                                            _model
                                                                .carBodyNoTextFieldTextController
                                                                .text)!;
                                                FFAppState()
                                                        .insuranceInfoEngineNumber =
                                                    functions
                                                        .removeDatAndMakeUpperCase(
                                                            _model
                                                                .enginNoTextFieldTextController
                                                                .text)!;
                                                FFAppState()
                                                        .insuranceInfoCarSeat =
                                                    _model
                                                        .seatAmountTextFieldTextController
                                                        .text;
                                                FFAppState()
                                                        .insuranceInfoSizeCar =
                                                    _model
                                                        .sizeTextFieldTextController
                                                        .text;
                                                FFAppState()
                                                        .insuranceInfoWeightCar =
                                                    _model
                                                        .weightTextFieldTextController
                                                        .text;
                                                FFAppState().nonePackageOldVmi =
                                                    _model
                                                        .oldVmiTextFieldTextController
                                                        .text;
                                                FFAppState()
                                                        .insuranceInfoBatteryNumber1 =
                                                    FFAppState().insuranceInfoEvFlag ==
                                                            'Y'
                                                        ? _model
                                                            .batteryNumberTextFieldTextController
                                                            .text
                                                        : '';
                                                FFAppState()
                                                    .insuranceInfoBatteryNumber2 = FFAppState()
                                                            .insuranceInfoEvFlag ==
                                                        'Y'
                                                    ? (_model.batteryNumber2TextFieldTextController
                                                                    .text !=
                                                                null &&
                                                            _model.batteryNumber2TextFieldTextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .batteryNumber2TextFieldTextController
                                                            .text
                                                        : '')
                                                    : '';
                                                FFAppState()
                                                        .insuranceInfoWallChargerNumber =
                                                    FFAppState().insuranceInfoEvFlag ==
                                                            'Y'
                                                        ? _model
                                                            .wallChargeTextFieldTextController
                                                            .text
                                                        : '';
                                                FFAppState()
                                                        .insuranceInfoHorsePower =
                                                    _model
                                                        .sizeTextFieldTextController
                                                        .text;
                                                safeSetState(() {});
                                                _model.ibsAppAPIOutput =
                                                    await IbsApplicationsSaveCall
                                                        .call(
                                                  carType: FFAppState()
                                                      .insuranceInfoVehicleType,
                                                  brandId: FFAppState()
                                                      .insuranceInfoBrandId,
                                                  brandName: FFAppState()
                                                      .insuranceInfoBrandName,
                                                  modelId: FFAppState()
                                                      .insuarnceInfoModelId,
                                                  modelName: FFAppState()
                                                      .insuranceInfoModelName,
                                                  carRegistration: FFAppState()
                                                      .insuranceInfoCarRegis,
                                                  registrationYear: FFAppState()
                                                      .insuranceInfoRegisYear,
                                                  makeYear: FFAppState()
                                                      .insuranceInfoProductYear,
                                                  vehicleId: FFAppState()
                                                      .insuranceInfoVehicleId,
                                                  vehicleCode: FFAppState()
                                                      .insuranceInfoVehicleCode,
                                                  vehicleName: FFAppState()
                                                      .insuranceInfoVehicleName,
                                                  bodyNumber: FFAppState()
                                                      .insuranceInfoBodyNumber,
                                                  engineNumber: FFAppState()
                                                      .insuranceInfoEngineNumber,
                                                  seat: FFAppState()
                                                      .insuranceInfoCarSeat,
                                                  cc: FFAppState()
                                                              .insuranceInfoEvFlag ==
                                                          'Y'
                                                      ? '0'
                                                      : (FFAppState()
                                                                  .insuranceInfoSizeCar ==
                                                              ''
                                                          ? '0'
                                                          : FFAppState()
                                                              .insuranceInfoSizeCar),
                                                  weight: FFAppState()
                                                      .insuranceInfoWeightCar,
                                                  driverType: '0',
                                                  accessoryFlg: (FFAppState()
                                                                  .insuranceinfoActType ==
                                                              'CMI') ||
                                                          (FFAppState()
                                                                  .insuranceinfoActType ==
                                                              'MC')
                                                      ? '0'
                                                      : (FFAppState()
                                                                  .insuranceInfoAccessoryProtect ==
                                                              'คุ้มครองอุปกรณ์เสริม'
                                                          ? '1'
                                                          : '0'),
                                                  actFlg: FFAppState()
                                                              .insuranceinfoActType ==
                                                          'CMI'
                                                      ? '1'
                                                      : (FFAppState()
                                                                  .insuranceInfoActOflLegislation ==
                                                              'ราคารวม พ.ร.บ'
                                                          ? '1'
                                                          : '0'),
                                                  beneficiaryName: FFAppState()
                                                      .insuranceInfoBeneficiaryName,
                                                  action: 'save_draft',
                                                  quotationId: FFAppState()
                                                      .insuranceInfoQuotationId,
                                                  leadDtlId: FFAppState()
                                                      .insuranceInfoLeadDetailId,
                                                  insuranceUrl: FFAppState()
                                                      .apiUrlInsuranceAppState,
                                                  step: '2',
                                                  branchCode: functions
                                                          .checkIsStringLengthInLength(
                                                              FFAppState()
                                                                  .branchCode,
                                                              2)!
                                                      ? FFAppState()
                                                          .profileBranch
                                                      : FFAppState()
                                                          .insuranceInfoBranchCode,
                                                  branchName: functions
                                                          .checkIsStringLengthInLength(
                                                              FFAppState()
                                                                  .branchCode,
                                                              2)!
                                                      ? FFAppState()
                                                          .profileUnitCodeName
                                                      : FFAppState()
                                                          .insuranceInfoBranchNameOutput,
                                                  token:
                                                      FFAppState().accessToken,
                                                  carProvinceName: FFAppState()
                                                      .insuranceInfoRegistrationProvinceSelect,
                                                  carProvinceCode: FFAppState()
                                                      .insuranceInfoRegistrationCodeSelect,
                                                  registrationCode: FFAppState()
                                                      .insuranceInfoRegistrationCodeSelect,
                                                  registrationProvince: FFAppState()
                                                      .insuranceInfoRegistrationProvinceSelect,
                                                  flgCarrier: FFAppState()
                                                              .insuranceInfoApplicationType ==
                                                          'auto'
                                                      ? ''
                                                      : (FFAppState()
                                                                  .nonePackageFlagCarrier ==
                                                              true
                                                          ? '1'
                                                          : '0'),
                                                  flgCoOrg: FFAppState()
                                                              .insuranceInfoApplicationType ==
                                                          'auto'
                                                      ? ''
                                                      : (FFAppState()
                                                                  .nonePackageFlagCoop ==
                                                              true
                                                          ? '1'
                                                          : '0'),
                                                  carrierType: FFAppState()
                                                              .insuranceInfoApplicationType ==
                                                          'auto'
                                                      ? ''
                                                      : FFAppState()
                                                          .nonePackageCarrierType,
                                                  carrierPrice: FFAppState()
                                                              .insuranceInfoApplicationType ==
                                                          'auto'
                                                      ? ''
                                                      : FFAppState()
                                                          .nonePackageCarrierPrice,
                                                  truckPart: FFAppState()
                                                              .insuranceInfoApplicationType ==
                                                          'auto'
                                                      ? ''
                                                      : (FFAppState()
                                                                  .nonePackageTruckPart ==
                                                              'หัวลาก + หางพ่วง'
                                                          ? '1'
                                                          : '0'),
                                                  customerMemberchip: FFAppState()
                                                              .insuranceInfoApplicationType ==
                                                          'auto'
                                                      ? ''
                                                      : (FFAppState()
                                                                  .nonePackageCusMembership ==
                                                              'ลูกค้านอก'
                                                          ? '0'
                                                          : '1'),
                                                  carrierPropose: FFAppState()
                                                              .insuranceInfoApplicationType ==
                                                          'auto'
                                                      ? ''
                                                      : FFAppState()
                                                          .nonePackageTruckCarryPurpose,
                                                  truckCurrentPrice: FFAppState()
                                                              .insuranceInfoApplicationType ==
                                                          'auto'
                                                      ? ''
                                                      : FFAppState()
                                                          .nonePackageTruckCurrentPrice,
                                                  trailerCarRegistration: FFAppState()
                                                              .insuranceInfoApplicationType ==
                                                          'auto'
                                                      ? ''
                                                      : FFAppState()
                                                          .nonePackagePlateAdditional,
                                                  accessoryTotal: FFAppState()
                                                              .insuranceInfoAccessoryProtect ==
                                                          'คุ้มครองอุปกรณ์เสริม'
                                                      ? FFAppState()
                                                          .insuranceInfoAccessory
                                                      : '',
                                                  customerType: FFAppState()
                                                      .nonePackageCustomerType,
                                                  flgRenew: FFAppState()
                                                          .nonePackageFlagRenew
                                                      ? '1'
                                                      : '0',
                                                  oldVMIExpriedDate: FFAppState()
                                                      .nonePackageOldVmiExpDate,
                                                  oldVMIPolicyNumber:
                                                      FFAppState()
                                                          .nonePackageOldVmi,
                                                  effectiveDateAct: FFAppState()
                                                      .insuranceInfoEffectiveDateAct,
                                                  effectiveDateInsure: FFAppState()
                                                      .insuranceInfoEffectiveDateInsure,
                                                  subProduct: FFAppState()
                                                      .insuranceinfoActType,
                                                  appDriverJson: FFAppState()
                                                      .DriverList
                                                      .map((e) => e.toMap())
                                                      .toList(),
                                                  batteryNumber: FFAppState()
                                                              .insuranceInfoEvFlag ==
                                                          'Y'
                                                      ? FFAppState()
                                                          .insuranceInfoBatteryNumber1
                                                      : '',
                                                  batteryNumber2: FFAppState()
                                                              .insuranceInfoEvFlag ==
                                                          'Y'
                                                      ? FFAppState()
                                                          .insuranceInfoBatteryNumber2
                                                      : '',
                                                  wallChargerNumber: FFAppState()
                                                              .insuranceInfoEvFlag ==
                                                          'Y'
                                                      ? FFAppState()
                                                          .insuranceInfoWallChargerNumber
                                                      : '',
                                                  horsepower: FFAppState()
                                                              .insuranceInfoEvFlag ==
                                                          'Y'
                                                      ? (FFAppState()
                                                                  .insuranceInfoHorsePower ==
                                                              ''
                                                          ? '0'
                                                          : FFAppState()
                                                              .insuranceInfoHorsePower)
                                                      : '0',
                                                );

                                                _shouldSetState = true;
                                                if ((_model.ibsAppAPIOutput
                                                            ?.statusCode ??
                                                        200) !=
                                                    200) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text((_model
                                                                      .ibsAppAPIOutput
                                                                      ?.statusCode ??
                                                                  200)
                                                              .toString()),
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
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (IbsApplicationsSaveCall
                                                        .statuslayer1(
                                                      (_model.ibsAppAPIOutput
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
                                                            (_model.ibsAppAPIOutput
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
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                _model.detailAPIOutput =
                                                    await IbsApplicationsDetailCall
                                                        .call(
                                                  quotationId: FFAppState()
                                                      .insuranceInfoQuotationId,
                                                  insuranceUrl: FFAppState()
                                                      .apiUrlInsuranceAppState,
                                                  token:
                                                      FFAppState().accessToken,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.detailAPIOutput
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
                                                              'พบข้อผิดพลาด (${(_model.detailAPIOutput?.statusCode ?? 200).toString()})'),
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
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (IbsApplicationsDetailCall
                                                        .statuslayer1(
                                                      (_model.detailAPIOutput
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
                                                              IbsApplicationsDetailCall
                                                                  .messageLayer1(
                                                            (_model.detailAPIOutput
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
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'บันทึกเตรียมข้อมูลขั้นตอนที่ 2 สำเร็จ'),
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
                                                FFAppState()
                                                        .insuranceInfoPage2SaveDataCheckBool =
                                                    true;
                                                FFAppState()
                                                        .insuranceInfoActFlag =
                                                    '${IbsApplicationsDetailCall.actflg(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoGrosstotalNet =
                                                    '${IbsApplicationsDetailCall.grosstotalnet(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoPage4NetPremiumTotal =
                                                    '${IbsApplicationsDetailCall.netpremiumtotalAppdetail(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoActAmount =
                                                    '${IbsApplicationsDetailCall.acttotal(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .nonePackageWorkType =
                                                    '${IbsApplicationsDetailCall.workType(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState().flagRenew =
                                                    '${IbsApplicationsDetailCall.flgrenew(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                safeSetState(() {});
                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: 'บันทึกเตรียมข้อมูล',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.45,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFFCEFE4),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFD9761A),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                .insuranceInfoPage2SaveDataCheckBool)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (FFAppState()
                                                            .insuranceinfoActType !=
                                                        'CMI') {
                                                      if (!(_model.vehicleregistrationTextController1
                                                                  .text !=
                                                              null &&
                                                          _model.vehicleregistrationTextController1
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
                                                                    'บังคับกรอกเลขทะเบียนรถ'),
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
                                                      if (!(_model.carBodyNoTextFieldTextController
                                                                  .text !=
                                                              null &&
                                                          _model.carBodyNoTextFieldTextController
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
                                                                    'บังคับกรอกเลขตัวถัง'),
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
                                                      if (!(_model.enginNoTextFieldTextController
                                                                  .text !=
                                                              null &&
                                                          _model.enginNoTextFieldTextController
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
                                                                    'บังคับกรอกเลขเครื่อง'),
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
                                                      if (!(_model.seatAmountTextFieldTextController
                                                                  .text !=
                                                              null &&
                                                          _model.seatAmountTextFieldTextController
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
                                                                    'บังคับกรอกจำนวนที่นั่ง'),
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
                                                      if (!(_model.sizeTextFieldTextController
                                                                  .text !=
                                                              null &&
                                                          _model.sizeTextFieldTextController
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
                                                                    'บังคับกรอกขนาด'),
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
                                                      if (!(_model.weightTextFieldTextController
                                                                  .text !=
                                                              null &&
                                                          _model.weightTextFieldTextController
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
                                                                    'บังคับกรอกน้ำหนัก'),
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
                                                      if (!(FFAppState()
                                                                  .insuranceInfoBeneficiaryName !=
                                                              null &&
                                                          FFAppState()
                                                                  .insuranceInfoBeneficiaryName !=
                                                              '')) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'บังคับเลือกผู้รับผลประโยชน์'),
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
                                                      FFAppState()
                                                              .insuranceInfoCarRegis =
                                                          _model
                                                              .vehicleregistrationTextController1
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoBodyNumber =
                                                          _model
                                                              .carBodyNoTextFieldTextController
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoEngineNumber =
                                                          _model
                                                              .enginNoTextFieldTextController
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoCarSeat =
                                                          _model
                                                              .seatAmountTextFieldTextController
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoSizeCar =
                                                          _model
                                                              .sizeTextFieldTextController
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoWeightCar =
                                                          _model
                                                              .weightTextFieldTextController
                                                              .text;
                                                      safeSetState(() {});
                                                      if (FFAppState()
                                                              .insuranceInfoApplicationType !=
                                                          'auto') {
                                                        context.pushNamed(
                                                            'insuranceInfoPage3_1');

                                                        return;
                                                      }

                                                      context.pushNamed(
                                                          'insuranceInfoPage3');
                                                    } else {
                                                      FFAppState()
                                                              .insuranceInfoCarRegis =
                                                          _model
                                                              .vehicleregistrationTextController1
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoBodyNumber =
                                                          _model
                                                              .carBodyNoTextFieldTextController
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoEngineNumber =
                                                          _model
                                                              .enginNoTextFieldTextController
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoCarSeat =
                                                          _model
                                                              .seatAmountTextFieldTextController
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoSizeCar =
                                                          _model
                                                              .sizeTextFieldTextController
                                                              .text;
                                                      FFAppState()
                                                              .insuranceInfoWeightCar =
                                                          _model
                                                              .weightTextFieldTextController
                                                              .text;
                                                      safeSetState(() {});
                                                      if (FFAppState()
                                                              .insuranceInfoApplicationType !=
                                                          'auto') {
                                                        context.pushNamed(
                                                            'insuranceInfoPage3_1');

                                                        return;
                                                      }

                                                      context.pushNamed(
                                                          'insuranceInfoPage3');
                                                    }
                                                  },
                                                  text: 'ถัดไป',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.45,
                                                    height: 60.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
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
