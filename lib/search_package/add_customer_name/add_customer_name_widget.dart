import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_customer_name_model.dart';
export 'add_customer_name_model.dart';

class AddCustomerNameWidget extends StatefulWidget {
  const AddCustomerNameWidget({
    Key? key,
    required this.insurerId,
    required this.insurerCode,
    required this.insurerShortName,
    required this.insurerName,
    required this.coverTypeId,
    required this.coverTypeCode,
    required this.coverTypeName,
    required this.garageTypeId,
    required this.garageTypeCode,
    required this.garageTypeName,
    required this.productId,
    required this.packageId,
    required this.packageName,
    required this.sumInsured,
    required this.workType,
    required this.roadsideAssistance,
    required this.tpbiPerson,
    required this.tpbiAccident,
    required this.tppd,
    required this.flood,
    required this.deductible,
    required this.pa,
    required this.me,
    required this.bb,
    required this.assessory,
    required this.seat,
    required this.netPremium,
    required this.vat,
    required this.stamp,
    required this.grossTotal,
    required this.carType,
    String? driverType,
    required this.carRegistrationYear,
    required this.carBrandId,
    required this.carBrandName,
    required this.carModelName,
    required this.carModelId,
    required this.vehicleId,
    required this.vehicleCode,
    required this.vehicleName,
    required this.contractProcessstate,
    this.fromPage,
    this.fromBtn,
    this.indexPage,
  })  : this.driverType = driverType ?? '0',
        super(key: key);

  final List<String>? insurerId;
  final List<String>? insurerCode;
  final List<String>? insurerShortName;
  final List<String>? insurerName;
  final List<String>? coverTypeId;
  final List<String>? coverTypeCode;
  final List<String>? coverTypeName;
  final List<String>? garageTypeId;
  final List<String>? garageTypeCode;
  final List<String>? garageTypeName;
  final List<String>? productId;
  final List<String>? packageId;
  final List<String>? packageName;
  final List<String>? sumInsured;
  final List<String>? workType;
  final List<String>? roadsideAssistance;
  final List<String>? tpbiPerson;
  final List<String>? tpbiAccident;
  final List<String>? tppd;
  final List<String>? flood;
  final List<String>? deductible;
  final List<String>? pa;
  final List<String>? me;
  final List<String>? bb;
  final List<String>? assessory;
  final List<String>? seat;
  final List<String>? netPremium;
  final List<String>? vat;
  final List<String>? stamp;
  final List<String>? grossTotal;
  final String? carType;
  final String driverType;
  final String? carRegistrationYear;
  final String? carBrandId;
  final String? carBrandName;
  final String? carModelName;
  final String? carModelId;
  final String? vehicleId;
  final String? vehicleCode;
  final String? vehicleName;
  final List<String>? contractProcessstate;
  final String? fromPage;
  final String? fromBtn;
  final int? indexPage;

  @override
  _AddCustomerNameWidgetState createState() => _AddCustomerNameWidgetState();
}

class _AddCustomerNameWidgetState extends State<AddCustomerNameWidget> {
  late AddCustomerNameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCustomerNameModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddCustomerName'});
    _model.firstnameController ??= TextEditingController(
        text: FFAppState().AddCustomerPageFirstname != null &&
                FFAppState().AddCustomerPageFirstname != ''
            ? FFAppState().AddCustomerPageFirstname
            : '');
    _model.firstnameFocusNode ??= FocusNode();

    _model.lastnameController ??= TextEditingController(
        text: FFAppState().AddCustomerPageLastname != null &&
                FFAppState().AddCustomerPageLastname != ''
            ? FFAppState().AddCustomerPageLastname
            : '');
    _model.lastnameFocusNode ??= FocusNode();

    _model.phonenumberController ??= TextEditingController(
        text: FFAppState().AddCustomerPagePhone != null &&
                FFAppState().AddCustomerPagePhone != ''
            ? FFAppState().AddCustomerPagePhone
            : '');
    _model.phonenumberFocusNode ??= FocusNode();

    _model.textFieldController ??= TextEditingController(
        text: FFAppState().AddCustomerPageCarRegistration != null &&
                FFAppState().AddCustomerPageCarRegistration != ''
            ? FFAppState().AddCustomerPageCarRegistration
            : '');
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
              'เพิ่มชื่อลูกค้า',
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                                        'ชื่อลูกค้า',
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
                                          '(บังคับกรอก)',
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
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 0.5,
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
                                                controller:
                                                    _model.firstnameController,
                                                focusNode:
                                                    _model.firstnameFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  hintText: 'กรุณากรอก',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFAAAAAA),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
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
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                validator: _model
                                                    .firstnameControllerValidator
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
                                              color: Color(0xFF404040),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      if (false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับกรอก)',
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
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 0.5,
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
                                                controller:
                                                    _model.lastnameController,
                                                focusNode:
                                                    _model.lastnameFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  hintText: 'กรุณากรอก',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFAAAAAA),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
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
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                validator: _model
                                                    .lastnameControllerValidator
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
                        Container(
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
                                      'เบอร์โทรศัพท์',
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
                                        '(บังคับกรอก)',
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
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
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
                                              controller:
                                                  _model.phonenumberController,
                                              focusNode:
                                                  _model.phonenumberFocusNode,
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
                                                hintText: 'กรุณากรอก',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFAAAAAA),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
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
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .phonenumberControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                _model.phonenumberMask
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
                        Container(
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
                                      'ทะเบียนรถ',
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
                                        '(ไม่ต้องมีขีด - ) ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Colors.black,
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
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textFieldController,
                                      focusNode: _model.textFieldFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'กรุณากรอก',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFFAAAAAA),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      validator: _model
                                          .textFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.75),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (!(_model.firstnameController.text != null &&
                                    _model.firstnameController.text != '')) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        content: Text('บังคับกรอกชื่อ'),
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
                                if (_model.phonenumberController.text != null &&
                                    _model.phonenumberController.text != '') {
                                  if (!functions.checkIsStringPhoneLength(
                                      functions.removeCommaFromNumText(
                                          _model.phonenumberController.text),
                                      10)!) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณากรอกเบอร์โทรศัพ 10 หลัก',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        content: Text('บังคับกรอกเบอร์โทรศัพ'),
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

                                if (_model.textFieldController.text != null &&
                                    _model.textFieldController.text != '') {
                                  if (!functions.checkIsStringLengthInLength(
                                      _model.textFieldController.text, 10)!) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณากรอกทะเบียนรถไม่เกิน 10 หลัก',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB2000000),
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                                child: AlertDialog(
                                              content: Text(
                                                  'คุณต้องการบันทึกใช่หรือไม่'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ตกลง'),
                                                ),
                                              ],
                                            ));
                                          },
                                        ) ??
                                        false;
                                if (!confirmDialogResponse) {
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                        child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: LoadingSceneWidget(),
                                      ),
                                    ));
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.aPIQuotationSaveOutput =
                                    await IbsQuotationsSaveCall.call(
                                  firstName: _model.firstnameController.text,
                                  carType: widget.carType,
                                  phoneNumber: functions.removeCommaFromNumText(
                                      _model.phonenumberController.text),
                                  carRegistration:
                                      _model.textFieldController.text,
                                  driverType: widget.driverType,
                                  carRegistrationYear:
                                      (int.parse(widget.carRegistrationYear!) -
                                              543)
                                          .toString(),
                                  carBrandId: widget.carBrandId,
                                  carBrandName: widget.carBrandName,
                                  carModelName: widget.carModelName,
                                  carModelId: widget.carModelId,
                                  vehicleId: widget.vehicleId,
                                  vehicleCode: widget.vehicleCode,
                                  vehicleName: widget.vehicleName,
                                  ownerName:
                                      '${functions.replaceAllTabAndSpace(FFAppState().profileFirstName)} ${functions.replaceAllTabAndSpace(FFAppState().profileLastName)}',
                                  ownerPhone: functions.replaceAllTabAndSpace(
                                      FFAppState().ProfilePhoneNumber),
                                  branchCode: functions.replaceAllTabAndSpace(
                                      FFAppState().profileBranch),
                                  branchName: functions.replaceAllTabAndSpace(
                                      FFAppState().profileUnitCodeName),
                                  insurerPackageJson: getJsonField(
                                    functions.sendJsonData(
                                        widget.insurerId?.toList(),
                                        widget.insurerCode?.toList(),
                                        widget.insurerShortName?.toList(),
                                        widget.insurerName?.toList(),
                                        widget.coverTypeId?.toList(),
                                        widget.coverTypeCode?.toList(),
                                        widget.coverTypeName?.toList(),
                                        widget.garageTypeId?.toList(),
                                        widget.garageTypeCode?.toList(),
                                        widget.garageTypeName?.toList(),
                                        widget.productId?.toList(),
                                        widget.packageId?.toList(),
                                        widget.packageName?.toList(),
                                        widget.sumInsured?.toList(),
                                        widget.roadsideAssistance?.toList(),
                                        widget.tpbiPerson?.toList(),
                                        widget.tpbiAccident?.toList(),
                                        widget.tppd?.toList(),
                                        widget.flood?.toList(),
                                        widget.deductible?.toList(),
                                        widget.pa?.toList(),
                                        widget.me?.toList(),
                                        widget.bb?.toList(),
                                        widget.assessory?.toList(),
                                        widget.seat?.toList(),
                                        widget.netPremium?.toList(),
                                        widget.vat?.toList(),
                                        widget.stamp?.toList(),
                                        widget.grossTotal?.toList(),
                                        widget.contractProcessstate?.toList()),
                                    r'''$''',
                                  ),
                                  insuranceUrl:
                                      FFAppState().apiUrlInsuranceAppState,
                                  lastName: _model.lastnameController.text,
                                  token: FFAppState().accessToken,
                                  ownerId: FFAppState().employeeID,
                                );
                                _shouldSetState = true;
                                if ((_model.aPIQuotationSaveOutput
                                            ?.statusCode ??
                                        200) !=
                                    200) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        content: Text(
                                            'พบข้อผิดพลาด (${(_model.aPIQuotationSaveOutput?.statusCode ?? 200).toString()})'),
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
                                  Navigator.pop(context);
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                if (IbsQuotationsSaveCall.statuslayer1(
                                      (_model.aPIQuotationSaveOutput
                                              ?.jsonBody ??
                                          ''),
                                    ) !=
                                    200) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        content: Text(
                                            'พบข้อผิดพลาด (${IbsQuotationsSaveCall.statuslayer1(
                                          (_model.aPIQuotationSaveOutput
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
                                  Navigator.pop(context);
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                setState(() {
                                  FFAppState().AddCustomerPageFirstname =
                                      _model.firstnameController.text;
                                  FFAppState().AddCustomerPageLastname =
                                      _model.lastnameController.text;
                                  FFAppState().AddCustomerPagePhone =
                                      _model.phonenumberController.text;
                                  FFAppState().AddCustomerPageCarRegistration =
                                      _model.textFieldController.text;
                                  FFAppState().addCustomerQuotationSaveSuccess =
                                      true;
                                  FFAppState().insurarerQuotationPdf =
                                      (IbsQuotationsSaveCall.url(
                                    (_model.aPIQuotationSaveOutput?.jsonBody ??
                                        ''),
                                  ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()!
                                          .toList()
                                          .cast<String>();
                                });
                                setState(() {
                                  FFAppState().addToInsurarerQuotationPdf(
                                      IbsQuotationsSaveCall.urlCompare(
                                    (_model.aPIQuotationSaveOutput?.jsonBody ??
                                        ''),
                                  ).toString());
                                });
                                Navigator.pop(context);
                                if (widget.fromPage == 'compare') {
                                  if (widget.fromBtn == 'saveBtn') {
                                    context.pushNamed(
                                      'insuranceInfoPage1',
                                      queryParameters: {
                                        'quotationId': serializeParam(
                                          IbsQuotationsSaveCall.quotationid(
                                            (_model.aPIQuotationSaveOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'leadDtailId': serializeParam(
                                          IbsQuotationsSaveCall.leaddtlid(
                                            (_model.aPIQuotationSaveOutput
                                                    ?.jsonBody ??
                                                ''),
                                          )[widget.indexPage!],
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed('Quotation');
                                  }
                                } else {
                                  if (widget.fromBtn == 'saveBtn') {
                                    context.pushNamed(
                                      'insuranceInfoPage1',
                                      queryParameters: {
                                        'quotationId': serializeParam(
                                          IbsQuotationsSaveCall.quotationid(
                                            (_model.aPIQuotationSaveOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'leadDtailId': serializeParam(
                                          IbsQuotationsSaveCall.leaddtlid(
                                            (_model.aPIQuotationSaveOutput
                                                    ?.jsonBody ??
                                                ''),
                                          )[0],
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed('Quotation');
                                  }
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: 'บันทึก',
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
                          ].addToStart(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 50.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
