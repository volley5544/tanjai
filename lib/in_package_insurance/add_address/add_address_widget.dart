import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_address_model.dart';
export 'add_address_model.dart';

class AddAddressWidget extends StatefulWidget {
  const AddAddressWidget({Key? key}) : super(key: key);

  @override
  _AddAddressWidgetState createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends State<AddAddressWidget> {
  late AddAddressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAddressModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AddAddress'});
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

      if (!FFAppState().addAddressCallAPI) {
        _model.getAddressMaster = await GetAddressMasterCall.call(
          insuranceUrl: FFAppState().apiUrlInsuranceAppState,
        );
        if ((_model.getAddressMaster?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.getAddressMaster?.statusCode ?? 200).toString()})'),
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
        if (GetAddressMasterCall.statusLayer1(
              (_model.getAddressMaster?.jsonBody ?? ''),
            ) !=
            200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content:
                    Text('พบข้อผิดพลาด (${GetAddressMasterCall.statusLayer1(
                  (_model.getAddressMaster?.jsonBody ?? ''),
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
          FFAppState().addAddressCallAPI = true;
          FFAppState().addAddressProvinceId = (GetAddressMasterCall.provinceid(
            (_model.getAddressMaster?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList()
              .cast<String>();
          FFAppState().addAddressProvinceName =
              (GetAddressMasterCall.provincename(
            (_model.getAddressMaster?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().addAddressDistrictName =
              (GetAddressMasterCall.districtname(
            (_model.getAddressMaster?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().addAddressSubdistrictName =
              (GetAddressMasterCall.subdistrictname(
            (_model.getAddressMaster?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
          FFAppState().addAddressZipCode = (GetAddressMasterCall.zipcode(
            (_model.getAddressMaster?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList()
              .cast<String>();
          FFAppState().addAddressKeyWord = (GetAddressMasterCall.keyword(
            (_model.getAddressMaster?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList()
              .cast<String>();
          FFAppState().addAddressDistrictId = functions
              .convertDynamicListToIntList(getJsonField(
                (_model.getAddressMaster?.jsonBody ?? ''),
                r'''$.results.data[:].district_id''',
                true,
              ))
              .toList()
              .cast<int>();
          FFAppState().addAddressSubdistrictId = functions
              .convertDynamicListToIntList(getJsonField(
                (_model.getAddressMaster?.jsonBody ?? ''),
                r'''$.results.data[:].subdistrict_id''',
                true,
              ))
              .toList()
              .cast<int>();
        });
      }
      Navigator.pop(context);
    });

    _model.address2Controller ??=
        TextEditingController(text: FFAppState().addAddressAtIdCard2);
    _model.address2FocusNode ??= FocusNode();

    _model.address3Controller ??=
        TextEditingController(text: FFAppState().addAddressAtIdCard3);
    _model.address3FocusNode ??= FocusNode();

    _model.address4Controller ??=
        TextEditingController(text: FFAppState().addAddressForDoc2);
    _model.address4FocusNode ??= FocusNode();

    _model.address5Controller ??=
        TextEditingController(text: FFAppState().addAddressForDoc3);
    _model.address5FocusNode ??= FocusNode();

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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB771A),
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'เพิ่มที่อยู่',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF204A77),
                    fontSize: 18.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'ที่อยู่ตามบัตรประชาชน',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF1D4774),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'บังคับกรอกตำบล/อำเภอ/จังหวัด/ไปรษณีย์)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFFB0606),
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
                                          'ค้นหาที่อยู่',
                                          ParamType.String,
                                        ),
                                        'searchLabel': serializeParam(
                                          'ระบุรหัสไปรษณีย์หรือตำบล,อำเภอ,จังหวัด',
                                          ParamType.String,
                                        ),
                                        'dataList': serializeParam(
                                          FFAppState().addAddressKeyWord,
                                          ParamType.String,
                                          true,
                                        ),
                                        'multiSelect': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                        'fromPage': serializeParam(
                                          'addAddressIdCard',
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
                                          child: AutoSizeText(
                                            FFAppState().addAddressAtIdCard !=
                                                        null &&
                                                    FFAppState()
                                                            .addAddressAtIdCard !=
                                                        ''
                                                ? FFAppState()
                                                    .addAddressAtIdCard
                                                : 'กรุณาเพิ่มที่อยู่',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ที่อยู่บรรทัด 1',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(บังคับกรอกเลขที่/หมู่บ้าน/อาคาร/ซอย/ถนน)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFFB0606),
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
                                    onTap: () async {},
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                            controller:
                                                _model.address2Controller,
                                            focusNode: _model.address2FocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              hintText: 'กรุณากรอกที่อยู่',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFB3B3B3),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            validator: _model
                                                .address2ControllerValidator
                                                .asValidator(context),
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
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ที่อยู่บรรทัด 2',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
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
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.address3Controller,
                                          focusNode: _model.address3FocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            hintText: 'กรุณากรอกที่อยู่',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFB3B3B3),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                          validator: _model
                                              .address3ControllerValidator
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
                                      24.0, 0.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ที่อยู่จัดส่งเอกสาร',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF1D4774),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
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
                                      setState(() {
                                        _model.addressAtIdCardValue = true;
                                      });
                                      setState(() {
                                        _model.addressForDocValue = false;
                                      });
                                      await actions.hideKeyboardAction(
                                        context,
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'ที่อยู่ตามบัตรประชาชน',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFB3B3B3),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          if (false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                width: 25.0,
                                                height: 25.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFF9F9F9F),
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                width: 25.0,
                                                height: 25.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: CircleBorder(),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              child: Checkbox(
                                                value: _model.addressAtIdCardValue ??= (FFAppState()
                                                                    .addAddressForDoc !=
                                                                null &&
                                                            FFAppState().addAddressForDoc !=
                                                                '') &&
                                                        (FFAppState().addAddressForDoc !=
                                                            '') &&
                                                        (FFAppState().addAddressForDoc !=
                                                            '')
                                                    ? ((FFAppState().addAddressAtIdCard ==
                                                            FFAppState()
                                                                .addAddressForDoc) &&
                                                        (FFAppState().addAddressAtIdCard != null &&
                                                            FFAppState().addAddressAtIdCard !=
                                                                '') &&
                                                        (FFAppState().addAddressAtIdCard !=
                                                            '') &&
                                                        (FFAppState().addAddressAtIdCard !=
                                                            ''))
                                                    : ((FFAppState().addAddressAtIdCard != null &&
                                                            FFAppState().addAddressAtIdCard != '') &&
                                                        (FFAppState().addAddressAtIdCard != '') &&
                                                        (FFAppState().addAddressAtIdCard != '')),
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                          .addressAtIdCardValue =
                                                      newValue!);
                                                  if (newValue!) {
                                                    setState(() {
                                                      _model.addressAtIdCardValue =
                                                          true;
                                                    });
                                                    setState(() {
                                                      _model.addressForDocValue =
                                                          false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.addressAtIdCardValue =
                                                          false;
                                                    });
                                                  }
                                                },
                                                activeColor: Color(0xFF00B505),
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
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
                              0.0, 15.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.addressAtIdCardValue = false;
                                      });
                                      setState(() {
                                        _model.addressForDocValue = true;
                                      });
                                      await actions.hideKeyboardAction(
                                        context,
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'ที่อยู่จัดส่งเอกสาร',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFB3B3B3),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          if (false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                width: 25.0,
                                                height: 25.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFF9F9F9F),
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Container(
                                                width: 25.0,
                                                height: 25.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF04A24C),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFF9F9F9F),
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: CircleBorder(),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                    .addressForDocValue ??= ((FFAppState()
                                                                    .addAddressForDoc !=
                                                                null &&
                                                            FFAppState()
                                                                    .addAddressForDoc !=
                                                                '') &&
                                                        (FFAppState()
                                                                .addAddressForDoc !=
                                                            '') &&
                                                        (FFAppState()
                                                                .addAddressForDoc !=
                                                            '')) &&
                                                    (FFAppState()
                                                            .addAddressAtIdCard !=
                                                        FFAppState()
                                                            .addAddressForDoc),
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                          .addressForDocValue =
                                                      newValue!);
                                                  if (newValue!) {
                                                    setState(() {
                                                      _model.addressAtIdCardValue =
                                                          false;
                                                    });
                                                    setState(() {
                                                      _model.addressForDocValue =
                                                          true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.addressForDocValue =
                                                          false;
                                                    });
                                                  }
                                                },
                                                activeColor: Color(0xFF00B505),
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
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
                        if (_model.addressForDocValue ?? true)
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
                                        24.0, 0.0, 24.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ที่อยู่จัดส่งเอกสาร',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFF1D4774),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับกรอกตำบล/อำเภอ/จังหวัด/ไปรษณีย์)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFB0606),
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
                                              'ค้นหาที่อยู่',
                                              ParamType.String,
                                            ),
                                            'searchLabel': serializeParam(
                                              'ระบุรหัสไปรษณีย์หรือตำบล,อำเภอ,จังหวัด',
                                              ParamType.String,
                                            ),
                                            'dataList': serializeParam(
                                              FFAppState().addAddressKeyWord,
                                              ParamType.String,
                                              true,
                                            ),
                                            'multiSelect': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                            'fromPage': serializeParam(
                                              'addAddressForDoc',
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Icon(
                                                Icons.navigate_next,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                        if (_model.addressForDocValue ?? true)
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
                                        24.0, 0.0, 24.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ที่อยู่บรรทัด 1',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับกรอกเลขที่/หมู่บ้าน/อาคาร/ซอย/ถนน)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFB0606),
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
                                      onTap: () async {},
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
                                              controller:
                                                  _model.address4Controller,
                                              focusNode:
                                                  _model.address4FocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                hintText: 'กรุณากรอกที่อยู่',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              validator: _model
                                                  .address4ControllerValidator
                                                  .asValidator(context),
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
                        if (_model.addressForDocValue ?? true)
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
                                        24.0, 0.0, 24.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ที่อยู่บรรทัด 2',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal,
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
                                      onTap: () async {},
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
                                              controller:
                                                  _model.address5Controller,
                                              focusNode:
                                                  _model.address5FocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                hintText: 'กรุณากรอกที่อยู่',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              validator: _model
                                                  .address5ControllerValidator
                                                  .asValidator(context),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if ((FFAppState().addAddressAtIdCard !=
                                        'กรุณากรอกที่อยู่') &&
                                    (FFAppState().addAddressAtIdCard != '') &&
                                    (_model.address2Controller.text !=
                                        'กรุณากรอกที่อยู่') &&
                                    (_model.address2Controller.text != '')) {
                                  if (_model.addressAtIdCardValue! &&
                                      !_model.addressForDocValue!) {
                                    setState(() {
                                      FFAppState().addAddressAtIdCard2 =
                                          _model.address2Controller.text;
                                      FFAppState().addAddressAtIdCard3 =
                                          _model.address3Controller.text;
                                      FFAppState().addAddressAtIdCardBool =
                                          _model.addressAtIdCardValue!;
                                      FFAppState().addAddressForDocBool =
                                          _model.addressForDocValue!;
                                    });
                                    context.safePop();
                                    return;
                                  }
                                  setState(() {
                                    FFAppState().addAddressAtIdCard2 =
                                        _model.address2Controller.text;
                                    FFAppState().addAddressAtIdCard3 =
                                        _model.address3Controller.text;
                                    FFAppState().addAddressAtIdCardBool =
                                        _model.addressAtIdCardValue!;
                                    FFAppState().addAddressForDocBool =
                                        _model.addressForDocValue!;
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        content: Text('กรุณากรอกที่อยู่ให้ครบ'),
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

                                if (!((FFAppState().addAddressForDoc !=
                                        'กรุณากรอกที่อยู่') &&
                                    (FFAppState().addAddressForDoc != '') &&
                                    (_model.address4Controller.text !=
                                        'กรุณากรอกที่อยู่') &&
                                    (_model.address4Controller.text != ''))) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        content: Text(
                                            'กรุณากรอกที่อยู่จัดส่งเอกสาร'),
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
                                setState(() {
                                  FFAppState().addAddressAtIdCard2 =
                                      _model.address2Controller.text;
                                  FFAppState().addAddressAtIdCard3 =
                                      _model.address3Controller.text;
                                  FFAppState().addAddressForDoc2 =
                                      _model.address4Controller.text;
                                  FFAppState().addAddressForDoc3 =
                                      _model.address5Controller.text;
                                });
                                context.safePop();
                              },
                              text: 'บันทึก',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                          .primaryBackground,
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
    );
  }
}
