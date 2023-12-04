import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'none_package_insurer_page_model.dart';
export 'none_package_insurer_page_model.dart';

class NonePackageInsurerPageWidget extends StatefulWidget {
  const NonePackageInsurerPageWidget({Key? key}) : super(key: key);

  @override
  _NonePackageInsurerPageWidgetState createState() =>
      _NonePackageInsurerPageWidgetState();
}

class _NonePackageInsurerPageWidgetState
    extends State<NonePackageInsurerPageWidget> {
  late NonePackageInsurerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NonePackageInsurerPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NonePackageInsurerPage'});
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
                  'พบข้อผิดพลาดConnection (${(_model.getInsurer?.statusCode ?? 200).toString()})'),
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
      if (InsuranceRequestGetInsurerAPICall.statusLayer1(
            (_model.getInsurer?.jsonBody ?? ''),
          ) ==
          200) {
        setState(() {
          FFAppState().nonePackageInsurerIdList =
              (InsuranceRequestGetInsurerAPICall.companyId(
            (_model.getInsurer?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().nonePackageInsurerCodeList =
              (InsuranceRequestGetInsurerAPICall.companyCode(
            (_model.getInsurer?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().nonePackageInsurerShortNameList =
              (InsuranceRequestGetInsurerAPICall.companyShortName(
            (_model.getInsurer?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().nonePackageInsurerNameList =
              (InsuranceRequestGetInsurerAPICall.companyFullName(
            (_model.getInsurer?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().nonePackageInsurerDisplayName =
              (InsuranceRequestGetInsurerAPICall.companyListName(
            (_model.getInsurer?.jsonBody ?? ''),
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
                  'พบข้อผิดพลาด (${InsuranceRequestGetInsurerAPICall.statusLayer1(
                (_model.getInsurer?.jsonBody ?? ''),
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
        FFAppState().nonePackageInsurerSelectedList = functions
            .createFalseListByItemNumber(
                false, FFAppState().nonePackageInsurerNameList.length)!
            .toList()
            .cast<bool>();
      });
      if (FFAppState().nonePackageInsurerShortNameDupList.length > 0) {
        setState(() {
          FFAppState().nonePackageInsurerSelectedList = functions
              .setInsurerDupList(
                  FFAppState().nonePackageInsurerSelectedList.toList(),
                  FFAppState().nonePackageInsurerShortNameList.toList(),
                  FFAppState().nonePackageInsurerShortNameDupList.toList())!
              .toList()
              .cast<bool>();
        });
      }
      Navigator.pop(context);
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          backgroundColor: Color(0xFFFAFAFA),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB7619),
                size: 30.0,
              ),
            ),
            title: Text(
              FFAppState().nonePackageFlagRenew ? 'งานต่ออายุ' : 'งานนอกเรท',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF123063),
                    fontSize: 16.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFAppState().nonePackageFlagRenew
                              ? 'บริษัทประกันที่ต้องการต่ออายุ'
                              : 'บริษัทประกันที่ต้องการใบเสนอราคา',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto Sans Thai',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      if (!FFAppState().nonePackageFlagRenew)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '(${functions.countTrueInBoolList(FFAppState().nonePackageInsurerSelectedList.toList())?.toString()}/3)',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: !FFAppState().nonePackageFlagRenew,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 0.0, 0.0),
                        child: Text(
                          'กรุณาถามลูกค้าให้เลือกบริษัทประกันสูงสุดเพียง 3 บริษัทเท่านั้น',
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (false)
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 100),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.search_outlined,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible:
                                  ((_model.getInsurer?.statusCode ?? 200) ==
                                          200) &&
                                      (InsuranceRequestGetInsurerAPICall
                                              .statusLayer1(
                                            (_model.getInsurer?.jsonBody ?? ''),
                                          ) ==
                                          200),
                              child: Builder(
                                builder: (context) {
                                  final dataList = FFAppState()
                                      .nonePackageInsurerNameList
                                      .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: dataList.length,
                                    itemBuilder: (context, dataListIndex) {
                                      final dataListItem =
                                          dataList[dataListIndex];
                                      return Padding(
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
                                                        .nonePackageFlagRenew) {
                                                      setState(() {
                                                        FFAppState().nonePackageInsurerSelectedList = functions
                                                            .setBoolValueListAtIndex(
                                                                functions
                                                                    .createFalseListByItemNumber(
                                                                        false,
                                                                        FFAppState()
                                                                            .nonePackageInsurerNameList
                                                                            .length)
                                                                    ?.toList(),
                                                                dataListIndex)!
                                                            .toList()
                                                            .cast<bool>();
                                                      });
                                                    } else {
                                                      if (functions.countTrueInBoolList(
                                                              FFAppState()
                                                                  .nonePackageInsurerSelectedList
                                                                  .toList())! >=
                                                          3) {
                                                        setState(() {
                                                          FFAppState()
                                                              .updateNonePackageInsurerSelectedListAtIndex(
                                                            dataListIndex,
                                                            (_) => false,
                                                          );
                                                        });
                                                      } else {
                                                        setState(() {
                                                          FFAppState()
                                                              .updateNonePackageInsurerSelectedListAtIndex(
                                                            dataListIndex,
                                                            (_) => FFAppState()
                                                                            .nonePackageInsurerSelectedList[
                                                                        dataListIndex] ==
                                                                    true
                                                                ? false
                                                                : true,
                                                          );
                                                        });
                                                      }
                                                    }
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
                                                                    .nonePackageInsurerDisplayName[
                                                                dataListIndex],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Color(
                                                                      0xFFB3B3B3),
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        if (!FFAppState()
                                                                .nonePackageInsurerSelectedList[
                                                            dataListIndex])
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF9F9F9F),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (FFAppState()
                                                                .nonePackageInsurerSelectedList[
                                                            dataListIndex])
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Icon(
                                                                  Icons.check,
                                                                  color: Colors
                                                                      .white,
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
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 24.0)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (functions.countTrueInBoolList(FFAppState()
                                        .nonePackageInsurerSelectedList
                                        .toList())! <=
                                    0) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        content: Text(
                                            'กรุณาเลือกบริษัทประกันอย่างน้อย 1 บริษัท'),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                setState(() {
                                  FFAppState().nonePackageInsurerIdOutputList =
                                      functions
                                          .returnMappedListFromBoolList(
                                              FFAppState()
                                                  .nonePackageInsurerIdList
                                                  .toList(),
                                              FFAppState()
                                                  .nonePackageInsurerSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                  FFAppState()
                                          .nonePackageInsurerCodeOutputList =
                                      functions
                                          .returnMappedListFromBoolList(
                                              FFAppState()
                                                  .nonePackageInsurerCodeList
                                                  .toList(),
                                              FFAppState()
                                                  .nonePackageInsurerSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                  FFAppState()
                                          .nonePackageInsurerShortNameOutputList =
                                      functions
                                          .returnMappedListFromBoolList(
                                              FFAppState()
                                                  .nonePackageInsurerShortNameList
                                                  .toList(),
                                              FFAppState()
                                                  .nonePackageInsurerSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                  FFAppState()
                                          .nonePackageInsurerNameOutputList =
                                      functions
                                          .returnMappedListFromBoolList(
                                              FFAppState()
                                                  .nonePackageInsurerNameList
                                                  .toList(),
                                              FFAppState()
                                                  .nonePackageInsurerSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                });
                                if (FFAppState().nonePackageFlagRenew) {
                                  _model.sendRenewApi =
                                      await InsuranceRequestSendEmailAPICall
                                          .call(
                                    carBrandId: FFAppState().nonePackageBrandId,
                                    carBrandName:
                                        FFAppState().nonePackageBrandName,
                                    carModelId:
                                        FFAppState().nonePackageModelCode,
                                    carModelName:
                                        FFAppState().nonePackageModelName,
                                    firstName: functions.containWordinStringUrl(
                                            'กรุณา',
                                            FFAppState()
                                                .nonePackageCusFullname)!
                                        ? ''
                                        : FFAppState().nonePackageCusFullname,
                                    lastName: '',
                                    phoneNumber:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageCusPhone)!
                                            ? ''
                                            : FFAppState().nonePackageCusPhone,
                                    driverType: '',
                                    carProvinceCode:
                                        FFAppState().nonePackageProvinceId,
                                    carProvinceName:
                                        FFAppState().nonePackageProvince,
                                    idNumber: '',
                                    carRegistration:
                                        FFAppState().nonePackagePlate,
                                    carRegistrationYear: (int.parse(
                                                FFAppState().nonePackageYear) -
                                            543)
                                        .toString(),
                                    vehicleId:
                                        FFAppState().nonePackageUsedTypeId,
                                    vehicleCode:
                                        FFAppState().nonePackageUsedTypeCode,
                                    vehicleName:
                                        FFAppState().nonePackageUsedTypeName,
                                    idType: '',
                                    branchCode: functions
                                            .checkIsStringLengthInLength(
                                                FFAppState().branchCode, 2)!
                                        ? FFAppState().branchCode
                                        : FFAppState().nonePackageBranchCode,
                                    apiUrl:
                                        FFAppState().apiUrlInsuranceAppState,
                                    insurerCodeList: FFAppState()
                                        .nonePackageInsurerCodeOutputList,
                                    insurerIdList: FFAppState()
                                        .nonePackageInsurerIdOutputList,
                                    insurerNameList: FFAppState()
                                        .nonePackageInsurerNameOutputList,
                                    insurerShortNameList: FFAppState()
                                        .nonePackageInsurerShortNameOutputList,
                                    coverTypeIdList:
                                        functions.createListByItemNumber(
                                            FFAppState().nonePackageCoverTypeId,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    coverTypeCodeList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageCoverTypeCode,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    coverTypeNameList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageCoverTypeName,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    garageTypeIdList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageGarageTypeId,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    garageTypeNameList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageGarageTypeName,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    companyName: '',
                                    flgRenew: '1',
                                    oldVMIPolicyNumber:
                                        FFAppState().nonePackageOldVmi,
                                    flgDecoration: '',
                                    decorationDetail: '',
                                    flgCarrier:
                                        FFAppState().nonePackageFlagCarrier
                                            ? '1'
                                            : '0',
                                    flgCoOrg: FFAppState().nonePackageFlagCoop
                                        ? '1'
                                        : '0',
                                    carrierType: functions
                                            .containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageCarrierType)!
                                        ? ''
                                        : FFAppState().nonePackageCarrierType,
                                    carrierPrice: functions
                                            .containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageCarrierPrice)!
                                        ? ''
                                        : FFAppState().nonePackageCarrierPrice,
                                    customerType:
                                        FFAppState().buttonOrdinary == true
                                            ? 'บุคคลธรรมดา'
                                            : 'นิติบุคคล',
                                    trailerCarRegistration:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackagePlateAdditional)!
                                            ? ''
                                            : FFAppState()
                                                .nonePackagePlateAdditional,
                                    carrierPropose:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageTruckCarryPurpose)!
                                            ? ''
                                            : FFAppState()
                                                .nonePackageTruckCarryPurpose,
                                    remark: FFAppState().nonePackageRemark,
                                    carType:
                                        FFAppState().nonePackageVehicleType,
                                    customerMemberchip: functions
                                            .containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageCusMembership)!
                                        ? ''
                                        : (FFAppState()
                                                    .nonePackageCusMembership ==
                                                'ลูกค้านอก'
                                            ? '0'
                                            : '1'),
                                    truckPart: functions.containWordinStringUrl(
                                            'กรุณา',
                                            FFAppState().nonePackageTruckPart)!
                                        ? ''
                                        : (FFAppState().nonePackageTruckPart ==
                                                'หัวลาก + หางพ่วง'
                                            ? '1'
                                            : '0'),
                                    flgAct: FFAppState().nonePackageFlagAct
                                        ? '1'
                                        : '0',
                                    sumInsured: functions
                                            .containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageSumInsured)!
                                        ? ''
                                        : FFAppState().nonePackageSumInsured,
                                    trailerSumInsured:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageTrailerSumInsured)!
                                            ? ''
                                            : FFAppState()
                                                .nonePackageTrailerSumInsured,
                                    truckCurrentPrice:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageTruckCurrentPrice)!
                                            ? ''
                                            : FFAppState()
                                                .nonePackageTruckCurrentPrice,
                                    token: FFAppState().accessToken,
                                    garageTypeCodeList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageGarageTypeCode,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    oldVMIExpriedDate:
                                        FFAppState().nonePackageOldVmiExpDate,
                                    reason: '',
                                    imageIdcard:
                                        FFAppState().nonePackageIdCardImageUrl,
                                    oldVMIImage:
                                        FFAppState().nonePackageOldVmiImageUrl,
                                    imageCompanyBook: FFAppState()
                                        .nonePackageCompanyBookImageUrl,
                                    branchName: functions
                                            .checkIsStringLengthInLength(
                                                FFAppState().branchCode, 2)!
                                        ? FFAppState().profileUnitCodeName
                                        : FFAppState().nonePackageBranchName,
                                    ownerId: FFAppState().employeeID,
                                    ownerName: FFAppState().profileFullName,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.sendRenewApi?.statusCode ??
                                          200) !=
                                      200) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                            child: AlertDialog(
                                          content: Text(
                                              'พบข้อผิดพลาดConnection (${(_model.sendRenewApi?.statusCode ?? 200).toString()})'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  if (InsuranceRequestSendEmailAPICall
                                          .statusLayer2(
                                        (_model.sendRenewApi?.jsonBody ?? ''),
                                      ) !=
                                      201) {
                                    if (InsuranceRequestSendEmailAPICall
                                            .statusLayer2(
                                          (_model.sendRenewApi?.jsonBody ?? ''),
                                        ) !=
                                        500) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${InsuranceRequestSendEmailAPICall.statusLayer2(
                                              (_model.sendRenewApi?.jsonBody ??
                                                  ''),
                                            ).toString()})'),
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
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    setState(() {
                                      FFAppState().nonePackageFlagCarrier =
                                          false;
                                      FFAppState().nonePackageVehicleType =
                                          'กรุณาเลือกประเภทรถ';
                                      FFAppState().nonePackageBrandName =
                                          'กรุณาเลือกยี่ห้อรถ';
                                      FFAppState().nonePackageBrandId = '';
                                      FFAppState().nonePackageModelName =
                                          'กรุณากรอกรุ่นรถ';
                                      FFAppState().nonePackageModelCode = '';
                                      FFAppState().nonePackageYear =
                                          'กรุณาเลือกปีจดทะเบียน';
                                      FFAppState().nonePackageUsedTypeId = '';
                                      FFAppState().nonePackageSearchModelList =
                                          [];
                                      FFAppState().nonePackageUsedTypeCode = '';
                                      FFAppState().nonePackageUsedTypeName =
                                          'กรุณาเลือกลักษณะการใช้รถ';
                                      FFAppState().nonePackageCusFullname =
                                          'กรุณากรอกชื่อ';
                                      FFAppState().nonePackageCusPhone =
                                          'กรุณากรอกเบอร์โทรศัพท์';
                                      FFAppState().nonePackagePlate = '';
                                      FFAppState().nonePackageProvince =
                                          'กรุณาเลือกจังหวัดจดทะเบียน';
                                      FFAppState().nonePackageProvinceId = '';
                                      FFAppState().nonePackageSumInsured =
                                          'กรุณากรอกทุนประกัน';
                                      FFAppState().nonePackageFlagAct = true;
                                      FFAppState().nonePackageIsBrandSelect =
                                          false;
                                      FFAppState()
                                          .nonePackageSearchModelIdList = [];
                                      FFAppState().nonePackageCarrierType =
                                          'กรุณาเลือกประเภทตู้เหล็ก';
                                      FFAppState().nonePackageFlagCoop = false;
                                      FFAppState().nonePackageTruckPart =
                                          'กรุณาเลือกส่วนของรถบรรทุก';
                                      FFAppState().nonePackageCusMembership =
                                          'กรุณาเลือกประเภทลูกค้า';
                                      FFAppState()
                                              .nonePackageTruckCurrentPrice =
                                          'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                      FFAppState().nonePackagePlateAdditional =
                                          'กรุณากรอกเลขทะเบียนหางพ่วง';
                                      FFAppState()
                                              .nonePackageTruckCarryPurpose =
                                          'กรุณากรอกรถใช้บรรทุกอะไร';
                                      FFAppState()
                                              .nonePackageTrailerSumInsured =
                                          'กรุณากรอกทุนประกันหางพ่วง';
                                      FFAppState().nonePackageCarrierPrice = '';
                                      FFAppState().nonePackageInsurerIdList =
                                          [];
                                      FFAppState().nonePackageInsurerCodeList =
                                          [];
                                      FFAppState()
                                          .nonePackageInsurerShortNameList = [];
                                      FFAppState().nonePackageInsurerNameList =
                                          [];
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
                                      FFAppState().nonePackageReason = [];
                                      FFAppState()
                                          .nonePackageInsurerSelectedList = [];
                                      FFAppState().nonePackageCoverTypeId = '';
                                      FFAppState().nonePackageCoverTypeCode =
                                          '';
                                      FFAppState().nonePackageCoverTypeName =
                                          'กรุณาเลือกประเภทชั้นประกัน';
                                      FFAppState().nonePackageGarageTypeId = '';
                                      FFAppState().nonePackageGarageTypeName =
                                          'กรุณาเลือกประเภทการซ่อม';
                                      FFAppState().nonePackageGarageTypeCode =
                                          '';
                                      FFAppState().nonePackageFlagRenew = false;
                                      FFAppState().nonePackageOldVmiExpDate =
                                          'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                      FFAppState().nonePackageOldVmi = '';
                                      FFAppState().nonePackageOldVmiImageUrl =
                                          '';
                                      FFAppState().nonePackageIdCardImageUrl =
                                          '';
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
                                      FFAppState().buttonOrdinary = false;
                                      FFAppState().buttonCorporation = false;
                                      FFAppState().nonePackageCustomerType = '';
                                      FFAppState()
                                          .nonePackageInsurerDisplayNameOutput = '';
                                      FFAppState().nonePackageImageOther = [];
                                      FFAppState().nonePackageImageFront = [];
                                      FFAppState().nonePackageImageRightFront =
                                          [];
                                      FFAppState().nonePackageImageRight = [];
                                      FFAppState().nonePackageImageRightRear =
                                          [];
                                      FFAppState().nonePackageImageRear = [];
                                      FFAppState().nonePackageImageLeftRear =
                                          [];
                                      FFAppState().nonePackageImageLeft = [];
                                      FFAppState().nonePackageImageLeftFront =
                                          [];
                                      FFAppState().nonePackageImageRoof = [];
                                      FFAppState()
                                          .nonePackageTrailerImageFront = [];
                                      FFAppState()
                                          .nonePackageTrailerImageRightFront = [];
                                      FFAppState()
                                          .nonePackageTrailerImageRight = [];
                                      FFAppState()
                                          .nonePackageTrailerImageRightRear = [];
                                      FFAppState().nonePackageTrailerImageRear =
                                          [];
                                      FFAppState()
                                          .nonePackageTrailerImageLeftRear = [];
                                      FFAppState().nonePackageTrailerImageLeft =
                                          [];
                                      FFAppState()
                                          .nonePackageTrailerImageLeftFront = [];
                                      FFAppState()
                                          .nonePackageInsurerOutputIndex = 0;
                                      FFAppState().nonePackageLeadId = '';
                                      FFAppState().nonePackageLeadNo = '';
                                      FFAppState()
                                          .nonePackageCarImageUploadedList = [];
                                      FFAppState().nonePackageImageOldVmi = [];
                                      FFAppState().nonePackageImageCompanyBook =
                                          [];
                                      FFAppState().nonePackageImageIdCard = [];
                                      FFAppState().nonePackageImageBlueBook =
                                          [];
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
                                      FFAppState().nonePackageImageOther1 = '';
                                      FFAppState().nonePackageImageOther2 = '';
                                      FFAppState().nonePackageImageOther3 = '';
                                      FFAppState().nonePackageImageOther4 = '';
                                      FFAppState().nonePackageImageOther5 = '';
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
                                      FFAppState().nonePackageFlagOldVmi = '';
                                      FFAppState().nonePackageWorkType = '';
                                      FFAppState().nonePackageRemark = '';
                                      FFAppState().nonePackageBranchCode = '';
                                      FFAppState().nonePackageBranchName = '';
                                      FFAppState()
                                          .nonePackageInsurerShortNameDupList = [];
                                    });
                                    setState(() {
                                      FFAppState()
                                              .insuranceVehicleTypeDropDown =
                                          'เลือกประเภทรถ';
                                      FFAppState().insuranceBasicBrandName =
                                          'เลือกยี่ห้อรถ';
                                      FFAppState().insuranceBasicBrandId = '';
                                      FFAppState().isSelectBrandInPackage =
                                          false;
                                      FFAppState().insuranceBasicModelName =
                                          'เลือกรุ่นรถ';
                                      FFAppState().insuranceBasicModelId = '';
                                      FFAppState().insuranceBasicYear =
                                          'เลือกปีจดทะเบียน พ.ศ.';
                                      FFAppState()
                                              .insuranceBasicVehicleUsedTypeName =
                                          'เลือกการใช้งาน';
                                      FFAppState()
                                          .insuranceBasicCoverTypeNameOutputList = [];
                                      FFAppState()
                                          .insuranceBasicGarageTypeInPackage = [];
                                    });
                                    setState(() {
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
                                      FFAppState().nonePackageImageOther1 = '';
                                      FFAppState().nonePackageImageOther2 = '';
                                      FFAppState().nonePackageImageOther3 = '';
                                      FFAppState().nonePackageImageOther4 = '';
                                      FFAppState().nonePackageImageOther5 = '';
                                      FFAppState().nonePackageIdCardImageUrl =
                                          '';
                                      FFAppState().nonePackageOldVmiImageUrl =
                                          '';
                                      FFAppState()
                                          .nonePackageCompanyBookImageUrl = '';
                                    });

                                    context.goNamed('InsuranceUnSuccessPage');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        content: Text(
                                            InsuranceRequestSendEmailAPICall
                                                .messageLayer2(
                                          (_model.sendRenewApi?.jsonBody ?? ''),
                                        ).toString()),
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
                                } else {
                                  _model.sendNonePackageApi =
                                      await InsuranceRequestSendEmailAPICall
                                          .call(
                                    carBrandId: FFAppState().nonePackageBrandId,
                                    carBrandName:
                                        FFAppState().nonePackageBrandName,
                                    carModelId:
                                        FFAppState().nonePackageModelCode,
                                    carModelName:
                                        FFAppState().nonePackageModelName,
                                    firstName: functions.containWordinStringUrl(
                                            'กรุณา',
                                            FFAppState()
                                                .nonePackageCusFullname)!
                                        ? ''
                                        : FFAppState().nonePackageCusFullname,
                                    lastName: '',
                                    phoneNumber:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageCusPhone)!
                                            ? ''
                                            : FFAppState().nonePackageCusPhone,
                                    driverType: '',
                                    carProvinceCode:
                                        FFAppState().nonePackageProvinceId,
                                    carProvinceName:
                                        FFAppState().nonePackageProvince,
                                    idNumber: '',
                                    carRegistration:
                                        FFAppState().nonePackagePlate,
                                    carRegistrationYear: (int.parse(
                                                FFAppState().nonePackageYear) -
                                            543)
                                        .toString(),
                                    vehicleId:
                                        FFAppState().nonePackageUsedTypeId,
                                    vehicleCode:
                                        FFAppState().nonePackageUsedTypeCode,
                                    vehicleName:
                                        FFAppState().nonePackageUsedTypeName,
                                    idType: '',
                                    branchCode: functions
                                            .checkIsStringLengthInLength(
                                                FFAppState().branchCode, 2)!
                                        ? FFAppState().branchCode
                                        : FFAppState().nonePackageBranchCode,
                                    apiUrl:
                                        FFAppState().apiUrlInsuranceAppState,
                                    insurerCodeList: FFAppState()
                                        .nonePackageInsurerCodeOutputList,
                                    insurerIdList: FFAppState()
                                        .nonePackageInsurerIdOutputList,
                                    insurerNameList: FFAppState()
                                        .nonePackageInsurerNameOutputList,
                                    insurerShortNameList: FFAppState()
                                        .nonePackageInsurerShortNameOutputList,
                                    coverTypeIdList:
                                        functions.createListByItemNumber(
                                            FFAppState().nonePackageCoverTypeId,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    coverTypeCodeList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageCoverTypeCode,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    coverTypeNameList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageCoverTypeName,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    garageTypeIdList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageGarageTypeId,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    garageTypeNameList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageGarageTypeName,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    companyName: '',
                                    flgRenew: '0',
                                    oldVMIPolicyNumber: '',
                                    flgDecoration: '',
                                    decorationDetail: '',
                                    flgCarrier:
                                        FFAppState().nonePackageFlagCarrier
                                            ? '1'
                                            : '0',
                                    flgCoOrg: FFAppState().nonePackageFlagCoop
                                        ? '1'
                                        : '0',
                                    carrierType: functions
                                            .containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageCarrierType)!
                                        ? ''
                                        : FFAppState().nonePackageCarrierType,
                                    carrierPrice: functions
                                            .containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageCarrierPrice)!
                                        ? ''
                                        : FFAppState().nonePackageCarrierPrice,
                                    customerType:
                                        FFAppState().buttonOrdinary == true
                                            ? 'บุคคลธรรมดา'
                                            : 'นิติบุคคล',
                                    trailerCarRegistration:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackagePlateAdditional)!
                                            ? ''
                                            : FFAppState()
                                                .nonePackagePlateAdditional,
                                    carrierPropose:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageTruckCarryPurpose)!
                                            ? ''
                                            : FFAppState()
                                                .nonePackageTruckCarryPurpose,
                                    remark: FFAppState().nonePackageRemark,
                                    carType:
                                        FFAppState().nonePackageVehicleType,
                                    customerMemberchip: functions
                                            .containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageCusMembership)!
                                        ? ''
                                        : (FFAppState()
                                                    .nonePackageCusMembership ==
                                                'ลูกค้านอก'
                                            ? '0'
                                            : '1'),
                                    truckPart: functions.containWordinStringUrl(
                                            'กรุณา',
                                            FFAppState().nonePackageTruckPart)!
                                        ? ''
                                        : (FFAppState().nonePackageTruckPart ==
                                                'หัวลาก + หางพ่วง'
                                            ? '1'
                                            : '0'),
                                    flgAct: FFAppState().nonePackageFlagAct
                                        ? '1'
                                        : '0',
                                    sumInsured: functions
                                            .containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageSumInsured)!
                                        ? ''
                                        : FFAppState().nonePackageSumInsured,
                                    trailerSumInsured:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageTrailerSumInsured)!
                                            ? ''
                                            : FFAppState()
                                                .nonePackageTrailerSumInsured,
                                    truckCurrentPrice:
                                        functions.containWordinStringUrl(
                                                'กรุณา',
                                                FFAppState()
                                                    .nonePackageTruckCurrentPrice)!
                                            ? ''
                                            : FFAppState()
                                                .nonePackageTruckCurrentPrice,
                                    token: FFAppState().accessToken,
                                    garageTypeCodeList:
                                        functions.createListByItemNumber(
                                            FFAppState()
                                                .nonePackageGarageTypeCode,
                                            FFAppState()
                                                .nonePackageInsurerNameOutputList
                                                .length),
                                    oldVMIExpriedDate: '',
                                    reason: () {
                                      if (functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .nonePackageReason
                                                  .toList(),
                                              true) ==
                                          0) {
                                        return 'ไม่มีในเรท';
                                      } else if (functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .nonePackageReason
                                                  .toList(),
                                              true) ==
                                          1) {
                                        return 'ไม่พอใจในทุนประกัน';
                                      } else {
                                        return 'รถแต่งหรือรถต่อคอก';
                                      }
                                    }(),
                                    imageIdcard:
                                        FFAppState().nonePackageIdCardImageUrl,
                                    imageFront: FFAppState()
                                        .nonePackageImageFrontUploaded,
                                    imageRightfront: FFAppState()
                                        .nonePackageImageRightFrontUploaded,
                                    imageRight: FFAppState()
                                        .nonePackageImageRightUploaded,
                                    imageRightrear: FFAppState()
                                        .nonePackageImageRightRearUploaded,
                                    imageRear: FFAppState()
                                        .nonePackageImageRearUploaded,
                                    imageLeftrear: FFAppState()
                                        .nonePackageImageLeftRearUploaded,
                                    imageLeft: FFAppState()
                                        .nonePackageImageLeftUploaded,
                                    imageLeftfront: FFAppState()
                                        .nonePackageImageLeftFrontUploaded,
                                    imageRoof: FFAppState()
                                        .nonePackageImageRoofUploaded,
                                    imageFrontTrailer: FFAppState()
                                        .nonePackageTrailerImageFrontUploaded,
                                    imageRightfrontTrailer: FFAppState()
                                        .nonePackageTrailerImageRightFrontUploaded,
                                    imageRightTrailer: FFAppState()
                                        .nonePackageTrailerImageRightUploaded,
                                    imageRightrearTrailer: FFAppState()
                                        .nonePackageTrailerImageRightRearUploaded,
                                    imageRearTrailer: FFAppState()
                                        .nonePackageTrailerImageRearUploaded,
                                    imageLeftrearTrailer: FFAppState()
                                        .nonePackageTrailerImageLeftRearUploaded,
                                    imageLeftTrailer: FFAppState()
                                        .nonePackageTrailerImageLeftUploaded,
                                    imageLeftfrontTrailer: FFAppState()
                                        .nonePackageTrailerImageLeftFrontUploaded,
                                    imageBluebook: FFAppState()
                                        .nonePackageImageBlueBookUploaded,
                                    imageOther1:
                                        FFAppState().nonePackageImageOther1,
                                    imageOther2:
                                        FFAppState().nonePackageImageOther2,
                                    imageOther3:
                                        FFAppState().nonePackageImageOther3,
                                    imageOther4:
                                        FFAppState().nonePackageImageOther4,
                                    imageOther5:
                                        FFAppState().nonePackageImageOther5,
                                    branchName: functions
                                            .checkIsStringLengthInLength(
                                                FFAppState().branchCode, 2)!
                                        ? FFAppState().profileUnitCodeName
                                        : FFAppState().nonePackageBranchName,
                                    ownerId: FFAppState().employeeID,
                                    ownerName: FFAppState().profileFullName,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.sendNonePackageApi?.statusCode ??
                                          200) !=
                                      200) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                            child: AlertDialog(
                                          content: Text(
                                              'พบข้อผิดพลาดConnection (${(_model.sendNonePackageApi?.statusCode ?? 200).toString()})'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  if (InsuranceRequestSendEmailAPICall
                                          .statusLayer2(
                                        (_model.sendNonePackageApi?.jsonBody ??
                                            ''),
                                      ) !=
                                      201) {
                                    if (InsuranceRequestSendEmailAPICall
                                            .statusLayer2(
                                          (_model.sendNonePackageApi
                                                  ?.jsonBody ??
                                              ''),
                                        ) ==
                                        500) {
                                      setState(() {
                                        FFAppState().nonePackageFlagCarrier =
                                            false;
                                        FFAppState().nonePackageVehicleType =
                                            'กรุณาเลือกประเภทรถ';
                                        FFAppState().nonePackageBrandName =
                                            'กรุณาเลือกยี่ห้อรถ';
                                        FFAppState().nonePackageBrandId = '';
                                        FFAppState().nonePackageModelName =
                                            'กรุณากรอกรุ่นรถ';
                                        FFAppState().nonePackageModelCode = '';
                                        FFAppState().nonePackageYear =
                                            'กรุณาเลือกปีจดทะเบียน';
                                        FFAppState().nonePackageUsedTypeId = '';
                                        FFAppState()
                                            .nonePackageSearchModelList = [];
                                        FFAppState().nonePackageUsedTypeCode =
                                            '';
                                        FFAppState().nonePackageUsedTypeName =
                                            'กรุณาเลือกลักษณะการใช้รถ';
                                        FFAppState().nonePackageCusFullname =
                                            'กรุณากรอกชื่อ';
                                        FFAppState().nonePackageCusPhone =
                                            'กรุณากรอกเบอร์โทรศัพท์';
                                        FFAppState().nonePackagePlate = '';
                                        FFAppState().nonePackageProvince =
                                            'กรุณาเลือกจังหวัดจดทะเบียน';
                                        FFAppState().nonePackageProvinceId = '';
                                        FFAppState().nonePackageSumInsured =
                                            'กรุณากรอกทุนประกัน';
                                        FFAppState().nonePackageFlagAct = true;
                                        FFAppState().nonePackageIsBrandSelect =
                                            false;
                                        FFAppState()
                                            .nonePackageSearchModelIdList = [];
                                        FFAppState().nonePackageCarrierType =
                                            'กรุณาเลือกประเภทตู้เหล็ก';
                                        FFAppState().nonePackageFlagCoop =
                                            false;
                                        FFAppState().nonePackageTruckPart =
                                            'กรุณาเลือกส่วนของรถบรรทุก';
                                        FFAppState().nonePackageCusMembership =
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
                                        FFAppState().nonePackageCarrierPrice =
                                            '';
                                        FFAppState().nonePackageInsurerIdList =
                                            [];
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
                                        FFAppState().nonePackageReason = [];
                                        FFAppState()
                                            .nonePackageInsurerSelectedList = [];
                                        FFAppState().nonePackageCoverTypeId =
                                            '';
                                        FFAppState().nonePackageCoverTypeCode =
                                            '';
                                        FFAppState().nonePackageCoverTypeName =
                                            'กรุณาเลือกประเภทชั้นประกัน';
                                        FFAppState().nonePackageGarageTypeId =
                                            '';
                                        FFAppState().nonePackageGarageTypeName =
                                            'กรุณาเลือกประเภทการซ่อม';
                                        FFAppState().nonePackageGarageTypeCode =
                                            '';
                                        FFAppState().nonePackageFlagRenew =
                                            false;
                                        FFAppState().nonePackageOldVmiExpDate =
                                            'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                        FFAppState().nonePackageOldVmi = '';
                                        FFAppState().nonePackageOldVmiImageUrl =
                                            '';
                                        FFAppState().nonePackageIdCardImageUrl =
                                            '';
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
                                        FFAppState().buttonOrdinary = false;
                                        FFAppState().buttonCorporation = false;
                                        FFAppState().nonePackageCustomerType =
                                            '';
                                        FFAppState()
                                            .nonePackageInsurerDisplayNameOutput = '';
                                        FFAppState().nonePackageImageOther = [];
                                        FFAppState().nonePackageImageFront = [];
                                        FFAppState()
                                            .nonePackageImageRightFront = [];
                                        FFAppState().nonePackageImageRight = [];
                                        FFAppState().nonePackageImageRightRear =
                                            [];
                                        FFAppState().nonePackageImageRear = [];
                                        FFAppState().nonePackageImageLeftRear =
                                            [];
                                        FFAppState().nonePackageImageLeft = [];
                                        FFAppState().nonePackageImageLeftFront =
                                            [];
                                        FFAppState().nonePackageImageRoof = [];
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
                                        FFAppState().nonePackageLeadId = '';
                                        FFAppState().nonePackageLeadNo = '';
                                        FFAppState()
                                            .nonePackageCarImageUploadedList = [];
                                        FFAppState().nonePackageImageOldVmi =
                                            [];
                                        FFAppState()
                                            .nonePackageImageCompanyBook = [];
                                        FFAppState().nonePackageImageIdCard =
                                            [];
                                        FFAppState().nonePackageImageBlueBook =
                                            [];
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
                                        FFAppState().nonePackageImageOther1 =
                                            '';
                                        FFAppState().nonePackageImageOther2 =
                                            '';
                                        FFAppState().nonePackageImageOther3 =
                                            '';
                                        FFAppState().nonePackageImageOther4 =
                                            '';
                                        FFAppState().nonePackageImageOther5 =
                                            '';
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
                                        FFAppState().nonePackageFlagOldVmi = '';
                                        FFAppState().nonePackageWorkType = '';
                                        FFAppState().nonePackageRemark = '';
                                        FFAppState().nonePackageBranchCode = '';
                                        FFAppState().nonePackageBranchName = '';
                                        FFAppState()
                                            .nonePackageInsurerShortNameDupList = [];
                                      });
                                      setState(() {
                                        FFAppState()
                                                .insuranceVehicleTypeDropDown =
                                            'เลือกประเภทรถ';
                                        FFAppState().insuranceBasicBrandName =
                                            'เลือกยี่ห้อรถ';
                                        FFAppState().insuranceBasicBrandId = '';
                                        FFAppState().isSelectBrandInPackage =
                                            false;
                                        FFAppState().insuranceBasicModelName =
                                            'เลือกรุ่นรถ';
                                        FFAppState().insuranceBasicModelId = '';
                                        FFAppState().insuranceBasicYear =
                                            'เลือกปีจดทะเบียน พ.ศ.';
                                        FFAppState()
                                                .insuranceBasicVehicleUsedTypeName =
                                            'เลือกการใช้งาน';
                                        FFAppState()
                                            .insuranceBasicCoverTypeNameOutputList = [];
                                        FFAppState()
                                            .insuranceBasicGarageTypeInPackage = [];
                                      });
                                      setState(() {
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
                                        FFAppState().nonePackageImageOther1 =
                                            '';
                                        FFAppState().nonePackageImageOther2 =
                                            '';
                                        FFAppState().nonePackageImageOther3 =
                                            '';
                                        FFAppState().nonePackageImageOther4 =
                                            '';
                                        FFAppState().nonePackageImageOther5 =
                                            '';
                                        FFAppState().nonePackageIdCardImageUrl =
                                            '';
                                        FFAppState().nonePackageOldVmiImageUrl =
                                            '';
                                        FFAppState()
                                            .nonePackageCompanyBookImageUrl = '';
                                      });

                                      context.goNamed('InsuranceUnSuccessPage');
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${InsuranceRequestSendEmailAPICall.statusLayer2(
                                              (_model.sendNonePackageApi
                                                      ?.jsonBody ??
                                                  ''),
                                            ).toString()})'),
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
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        content: Text(
                                            InsuranceRequestSendEmailAPICall
                                                .messageLayer2(
                                          (_model.sendNonePackageApi
                                                  ?.jsonBody ??
                                              ''),
                                        ).toString()),
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
                                }

                                setState(() {
                                  FFAppState().nonePackageFlagCarrier = false;
                                  FFAppState().nonePackageVehicleType =
                                      'กรุณาเลือกประเภทรถ';
                                  FFAppState().nonePackageBrandName =
                                      'กรุณาเลือกยี่ห้อรถ';
                                  FFAppState().nonePackageBrandId = '';
                                  FFAppState().nonePackageModelName =
                                      'กรุณากรอกรุ่นรถ';
                                  FFAppState().nonePackageModelCode = '';
                                  FFAppState().nonePackageYear =
                                      'กรุณาเลือกปีจดทะเบียน';
                                  FFAppState().nonePackageUsedTypeId = '';
                                  FFAppState().nonePackageSearchModelList = [];
                                  FFAppState().nonePackageUsedTypeCode = '';
                                  FFAppState().nonePackageUsedTypeName =
                                      'กรุณาเลือกลักษณะการใช้รถ';
                                  FFAppState().nonePackageCusFullname =
                                      'กรุณากรอกชื่อ';
                                  FFAppState().nonePackageCusPhone =
                                      'กรุณากรอกเบอร์โทรศัพท์';
                                  FFAppState().nonePackagePlate = '';
                                  FFAppState().nonePackageProvince =
                                      'กรุณาเลือกจังหวัดจดทะเบียน';
                                  FFAppState().nonePackageProvinceId = '';
                                  FFAppState().nonePackageSumInsured =
                                      'กรุณากรอกทุนประกัน';
                                  FFAppState().nonePackageFlagAct = true;
                                  FFAppState().nonePackageIsBrandSelect = false;
                                  FFAppState().nonePackageSearchModelIdList =
                                      [];
                                  FFAppState().nonePackageCarrierType =
                                      'กรุณาเลือกประเภทตู้เหล็ก';
                                  FFAppState().nonePackageFlagCoop = false;
                                  FFAppState().nonePackageTruckPart =
                                      'กรุณาเลือกส่วนของรถบรรทุก';
                                  FFAppState().nonePackageCusMembership =
                                      'กรุณาเลือกประเภทลูกค้า';
                                  FFAppState().nonePackageTruckCurrentPrice =
                                      'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                  FFAppState().nonePackagePlateAdditional =
                                      'กรุณากรอกเลขทะเบียนหางพ่วง';
                                  FFAppState().nonePackageTruckCarryPurpose =
                                      'กรุณากรอกรถใช้บรรทุกอะไร';
                                  FFAppState().nonePackageTrailerSumInsured =
                                      'กรุณากรอกทุนประกันหางพ่วง';
                                  FFAppState().nonePackageCarrierPrice = '';
                                  FFAppState().nonePackageInsurerIdList = [];
                                  FFAppState().nonePackageInsurerCodeList = [];
                                  FFAppState().nonePackageInsurerShortNameList =
                                      [];
                                  FFAppState().nonePackageInsurerNameList = [];
                                  FFAppState().nonePackageInsurerDisplayName =
                                      [];
                                  FFAppState().nonePackageInsurerIdOutputList =
                                      [];
                                  FFAppState()
                                      .nonePackageInsurerCodeOutputList = [];
                                  FFAppState()
                                      .nonePackageInsurerShortNameOutputList = [];
                                  FFAppState()
                                      .nonePackageInsurerNameOutputList = [];
                                  FFAppState().nonePackageReason = [];
                                  FFAppState().nonePackageInsurerSelectedList =
                                      [];
                                  FFAppState().nonePackageCoverTypeId = '';
                                  FFAppState().nonePackageCoverTypeCode = '';
                                  FFAppState().nonePackageCoverTypeName =
                                      'กรุณาเลือกประเภทชั้นประกัน';
                                  FFAppState().nonePackageGarageTypeId = '';
                                  FFAppState().nonePackageGarageTypeName =
                                      'กรุณาเลือกประเภทการซ่อม';
                                  FFAppState().nonePackageGarageTypeCode = '';
                                  FFAppState().nonePackageFlagRenew = false;
                                  FFAppState().nonePackageOldVmiExpDate =
                                      'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                  FFAppState().nonePackageOldVmi = '';
                                  FFAppState().nonePackageOldVmiImageUrl = '';
                                  FFAppState().nonePackageIdCardImageUrl = '';
                                  FFAppState().nonePackageRenewImageUrlList =
                                      [];
                                  FFAppState().nonePackageRenewImageCheckList =
                                      [];
                                  FFAppState()
                                          .nonePackageOldVmiImageUploadedCheck =
                                      false;
                                  FFAppState()
                                          .nonePackageIdCardWatermarkUploadedCheck =
                                      false;
                                  FFAppState().buttonOrdinary = false;
                                  FFAppState().buttonCorporation = false;
                                  FFAppState().nonePackageCustomerType = '';
                                  FFAppState()
                                      .nonePackageInsurerDisplayNameOutput = '';
                                  FFAppState().nonePackageImageOther = [];
                                  FFAppState().nonePackageImageFront = [];
                                  FFAppState().nonePackageImageRightFront = [];
                                  FFAppState().nonePackageImageRight = [];
                                  FFAppState().nonePackageImageRightRear = [];
                                  FFAppState().nonePackageImageRear = [];
                                  FFAppState().nonePackageImageLeftRear = [];
                                  FFAppState().nonePackageImageLeft = [];
                                  FFAppState().nonePackageImageLeftFront = [];
                                  FFAppState().nonePackageImageRoof = [];
                                  FFAppState().nonePackageTrailerImageFront =
                                      [];
                                  FFAppState()
                                      .nonePackageTrailerImageRightFront = [];
                                  FFAppState().nonePackageTrailerImageRight =
                                      [];
                                  FFAppState()
                                      .nonePackageTrailerImageRightRear = [];
                                  FFAppState().nonePackageTrailerImageRear = [];
                                  FFAppState().nonePackageTrailerImageLeftRear =
                                      [];
                                  FFAppState().nonePackageTrailerImageLeft = [];
                                  FFAppState()
                                      .nonePackageTrailerImageLeftFront = [];
                                  FFAppState().nonePackageInsurerOutputIndex =
                                      0;
                                  FFAppState().nonePackageLeadId = '';
                                  FFAppState().nonePackageLeadNo = '';
                                  FFAppState().nonePackageCarImageUploadedList =
                                      [];
                                  FFAppState().nonePackageImageOldVmi = [];
                                  FFAppState().nonePackageImageCompanyBook = [];
                                  FFAppState().nonePackageImageIdCard = [];
                                  FFAppState().nonePackageImageBlueBook = [];
                                  FFAppState()
                                          .nonePackageCompanyBookImageUploadedCheck =
                                      false;
                                  FFAppState().nonePackageCompanyBookImageUrl =
                                      '';
                                  FFAppState().nonePackageImageFrontUploaded =
                                      '';
                                  FFAppState()
                                      .nonePackageImageRightFrontUploaded = '';
                                  FFAppState().nonePackageImageRightUploaded =
                                      '';
                                  FFAppState()
                                      .nonePackageImageRightRearUploaded = '';
                                  FFAppState().nonePackageImageRearUploaded =
                                      '';
                                  FFAppState()
                                      .nonePackageImageLeftRearUploaded = '';
                                  FFAppState().nonePackageImageLeftUploaded =
                                      '';
                                  FFAppState()
                                      .nonePackageImageLeftFrontUploaded = '';
                                  FFAppState().nonePackageImageRoofUploaded =
                                      '';
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
                                  FFAppState().nonePackageImageOther1 = '';
                                  FFAppState().nonePackageImageOther2 = '';
                                  FFAppState().nonePackageImageOther3 = '';
                                  FFAppState().nonePackageImageOther4 = '';
                                  FFAppState().nonePackageImageOther5 = '';
                                  FFAppState().nonePackageImageOtherNameList =
                                      [];
                                  FFAppState()
                                      .nonePackageSelectedInsurerShortName = '';
                                  FFAppState().nonePackageSelectedInsurerName =
                                      '';
                                  FFAppState()
                                      .nonePackageSelectedInsurerShortNameList = [];
                                  FFAppState()
                                      .nonePackageSelectedInsurerNameList = [];
                                  FFAppState().nonePackageFlagOldVmi = '';
                                  FFAppState().nonePackageWorkType = '';
                                  FFAppState().nonePackageRemark = '';
                                  FFAppState().nonePackageBranchCode = '';
                                  FFAppState().nonePackageBranchName = '';
                                  FFAppState()
                                      .nonePackageInsurerShortNameDupList = [];
                                });
                                setState(() {
                                  FFAppState().insuranceVehicleTypeDropDown =
                                      'เลือกประเภทรถ';
                                  FFAppState().insuranceBasicBrandName =
                                      'เลือกยี่ห้อรถ';
                                  FFAppState().insuranceBasicBrandId = '';
                                  FFAppState().isSelectBrandInPackage = false;
                                  FFAppState().insuranceBasicModelName =
                                      'เลือกรุ่นรถ';
                                  FFAppState().insuranceBasicModelId = '';
                                  FFAppState().insuranceBasicYear =
                                      'เลือกปีจดทะเบียน พ.ศ.';
                                  FFAppState()
                                          .insuranceBasicVehicleUsedTypeName =
                                      'เลือกการใช้งาน';
                                  FFAppState()
                                      .insuranceBasicCoverTypeNameOutputList = [];
                                  FFAppState()
                                      .insuranceBasicGarageTypeInPackage = [];
                                });
                                setState(() {
                                  FFAppState().nonePackageImageFrontUploaded =
                                      '';
                                  FFAppState()
                                      .nonePackageImageRightFrontUploaded = '';
                                  FFAppState().nonePackageImageRightUploaded =
                                      '';
                                  FFAppState()
                                      .nonePackageImageRightRearUploaded = '';
                                  FFAppState().nonePackageImageRearUploaded =
                                      '';
                                  FFAppState()
                                      .nonePackageImageLeftRearUploaded = '';
                                  FFAppState().nonePackageImageLeftUploaded =
                                      '';
                                  FFAppState()
                                      .nonePackageImageLeftFrontUploaded = '';
                                  FFAppState().nonePackageImageRoofUploaded =
                                      '';
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
                                  FFAppState().nonePackageImageOther1 = '';
                                  FFAppState().nonePackageImageOther2 = '';
                                  FFAppState().nonePackageImageOther3 = '';
                                  FFAppState().nonePackageImageOther4 = '';
                                  FFAppState().nonePackageImageOther5 = '';
                                  FFAppState().nonePackageIdCardImageUrl = '';
                                  FFAppState().nonePackageOldVmiImageUrl = '';
                                  FFAppState().nonePackageCompanyBookImageUrl =
                                      '';
                                });

                                context.goNamed('InsuranceSuccessPage');

                                if (_shouldSetState) setState(() {});
                              },
                              text: 'ตกลง',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFDB771B),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Colors.white,
                                      fontSize: 15.0,
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
                        ].addToStart(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ].addToStart(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
