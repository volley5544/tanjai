import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_insurance_page_model.dart';
export 'search_insurance_page_model.dart';

class SearchInsurancePageWidget extends StatefulWidget {
  const SearchInsurancePageWidget({Key? key}) : super(key: key);

  @override
  _SearchInsurancePageWidgetState createState() =>
      _SearchInsurancePageWidgetState();
}

class _SearchInsurancePageWidgetState extends State<SearchInsurancePageWidget>
    with TickerProviderStateMixin {
  late SearchInsurancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: Offset(0.0, -20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

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

      _model.getBuildVersion = await actions.getBuildVersion1();
      _model.buildVersionQuery = await queryBuildVersionRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (isAndroid) {
        if (_model.buildVersionQuery?.appVersion != _model.getBuildVersion) {
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
              ));
            },
          );
          await actions.terminateAppAction();
          return;
        }
      } else {
        if (_model.buildVersionQuery?.appVersionIos != _model.getBuildVersion) {
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
              ));
            },
          );
          await actions.terminateAppAction();
          return;
        }
      }

      setState(() {
        FFAppState().AddCustomerPageFirstname = '';
        FFAppState().AddCustomerPageLastname = '';
        FFAppState().AddCustomerPagePhone = '';
        FFAppState().AddCustomerPageCarRegistration = '';
        FFAppState().addCustomerQuotationSaveSuccess = false;
        FFAppState().insurarerQuotationPdf = [];
      });
      if (!FFAppState().insuranceRequestIsLoadedData) {
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
              ));
            },
          );
          return;
        }
        if (TeleGetBrandAPICall.statusLevel1(
              (_model.getBrandAPI?.jsonBody ?? ''),
            ) ==
            200) {
          setState(() {
            FFAppState().insuranceBasicBrandNameList =
                (TeleGetBrandAPICall.brandName(
              (_model.getBrandAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicBrandIdList =
                (TeleGetBrandAPICall.brandID(
              (_model.getBrandAPI?.jsonBody ?? ''),
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
                content: Text('พบข้อผิดพลาด (${TeleGetBrandAPICall.statusLevel1(
                  (_model.getBrandAPI?.jsonBody ?? ''),
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
                    'พบข้อผิดพลาด (${(_model.getBrandAPI?.statusCode ?? 200).toString()})'),
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
        if (TeleGetModelAPICall.statusLevel1(
              (_model.getModelAPI?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().update(() {
            FFAppState().insuranceBasicModelIdListOriginal =
                (TeleGetModelAPICall.modelCode(
              (_model.getModelAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicModelNameListOriginal =
                (TeleGetModelAPICall.modelName(
              (_model.getModelAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicModelBrandIdListOriginal =
                (TeleGetModelAPICall.brandID(
              (_model.getModelAPI?.jsonBody ?? ''),
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
                content: Text('พบข้อผิดพลาด (${TeleGetModelAPICall.statusLevel1(
                  (_model.getModelAPI?.jsonBody ?? ''),
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
              ));
            },
          );
          return;
        }
        if (TeleGetCoverTypeAPICall.statusLevel1(
              (_model.getCoverTypeAPI?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().update(() {
            FFAppState().insuranceBasicCoverTypeNameList =
                (TeleGetCoverTypeAPICall.coverTypeName(
              (_model.getCoverTypeAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCoverTypeCodeList =
                (TeleGetCoverTypeAPICall.coverTypeCode(
              (_model.getCoverTypeAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicCoverTypeIdList =
                (TeleGetCoverTypeAPICall.coverTypeId(
              (_model.getCoverTypeAPI?.jsonBody ?? ''),
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
                    Text('พบข้อผิดพลาด (${TeleGetCoverTypeAPICall.statusLevel1(
                  (_model.getCoverTypeAPI?.jsonBody ?? ''),
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
            FFAppState().insuranceBasicVehicleUsedTypeCodeList =
                (InsuranceRequestGetVehicleAPICall.vehicleCode(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeNameList =
                (InsuranceRequestGetVehicleAPICall.vehicleName(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeTypeList =
                (InsuranceRequestGetVehicleAPICall.vehicletype(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList()
                    .cast<String>();
            FFAppState().insuranceBasicVehicleUsedTypeIdList =
                (InsuranceRequestGetVehicleAPICall.vehicleId(
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
                content: Text(InsuranceRequestGetVehicleAPICall.statusLayer1(
                  (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
                ).toString().toString()),
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
          FFAppState().insuranceRequestIsLoadedData = true;
        });
      }
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
                setState(() {
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
                });

                context.goNamed('SuperAppPage');
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB7619),
                size: 30.0,
              ),
            ),
            title: Text(
              'ค้นหาประกันรถ',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF123063),
                    fontSize: 18.0,
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
                                      24.0, 0.0, 24.0, 4.0),
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
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
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
                                                .insuranceBasicVehicleTypeDropdownList,
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
                                            'searchPackage',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
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
                                                        fontSize: 15.0,
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
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
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
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
                                            true,
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
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
                                                        fontSize: 15.0,
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
                                        24.0, 0.0, 24.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                    child: AlertDialog(
                                                  content: Text(FFAppState()
                                                      .insuranceBasicModelNameList
                                                      .length
                                                      .toString()),
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
                                          },
                                          child: Text(
                                            'รุ่นรถ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFF404040),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับเลือก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFF40606),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
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
                                              'SearchPackage',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
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
                                                      fontSize: 15.0,
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
                                      24.0, 0.0, 24.0, 4.0),
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
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
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
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
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
                                                        fontSize: 15.0,
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
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
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
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
                                            true,
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
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
                                                                        .insuranceBasicVehicleUsedTypeName)!
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15.0,
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
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
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับเลือก สามารถเลือกได้มากกว่า 1)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
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
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
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
                                                        fontSize: 15.0,
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 4.0),
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
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับเลือก สามารถเลือกได้มากกว่า 1)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFF40606),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
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
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
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
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFF143678),
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
                              ],
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 8.0))
                            .addToStart(SizedBox(height: 20.0))
                            .addToEnd(SizedBox(height: 36.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
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
                              16.0, 0.0, 16.0, 0.0),
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ));
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ));
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ));
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ));
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
                                      content: Text('กรุณาเลือกลักษณะการใช้รถ'),
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ));
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
                                      content: Text('กรุณาเลือกประเภทการซ่อม'),
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ));
                                  },
                                );

                                context.pushNamed('InsuranceWorkSelectPage');

                                return;
                              }
                              setState(() {
                                FFAppState().filterInsurerList = [];
                                FFAppState().filterGarageTypeList = [];
                                FFAppState().filterCoverTypeList = [];
                              });

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
                                    'กรุงเทพมหานคร',
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
                                    true,
                                  ),
                                  'garageType': serializeParam(
                                    functions.createGarageTypeCodeList(
                                        FFAppState()
                                            .insuranceBasicGarageTypeInPackage
                                            .toList()),
                                    ParamType.String,
                                    true,
                                  ),
                                  'brandName': serializeParam(
                                    FFAppState().insuranceBasicBrandName,
                                    ParamType.String,
                                  ),
                                  'modelName': serializeParam(
                                    FFAppState().insuranceBasicModelName,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'ค้นหา',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
