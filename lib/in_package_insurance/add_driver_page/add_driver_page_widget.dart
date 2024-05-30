import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/driver_infomation_form_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_driver_page_model.dart';
export 'add_driver_page_model.dart';

class AddDriverPageWidget extends StatefulWidget {
  const AddDriverPageWidget({
    super.key,
    required this.firestoreDataConfigList,
  });

  final DataListRecord? firestoreDataConfigList;

  @override
  State<AddDriverPageWidget> createState() => _AddDriverPageWidgetState();
}

class _AddDriverPageWidgetState extends State<AddDriverPageWidget>
    with TickerProviderStateMixin {
  late AddDriverPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddDriverPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddDriverPage'});
    animationsMap.addAll({
      'driverInfomationFormComponentOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'driverInfomationFormComponentOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'driverInfomationFormComponentOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'driverInfomationFormComponentOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'driverInfomationFormComponentOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
            'เพิ่มผู้ขับขี่',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Noto Sans Thai',
                  color: Color(0xFF204A77),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    12.0,
                    0,
                    30.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    if (FFAppState().DriverList.length > 0)
                      Container(
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.driverInfomationFormComponentModel1,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: DriverInfomationFormComponentWidget(
                            index: 0,
                            firestoreDataConfigList:
                                widget.firestoreDataConfigList!,
                          ),
                        ).animateOnPageLoad(animationsMap[
                            'driverInfomationFormComponentOnPageLoadAnimation1']!),
                      ),
                    if (FFAppState().DriverList.length > 1)
                      Container(
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.driverInfomationFormComponentModel2,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: DriverInfomationFormComponentWidget(
                            index: 1,
                            firestoreDataConfigList:
                                widget.firestoreDataConfigList!,
                          ),
                        ).animateOnPageLoad(animationsMap[
                            'driverInfomationFormComponentOnPageLoadAnimation2']!),
                      ),
                    if (FFAppState().DriverList.length > 2)
                      Container(
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.driverInfomationFormComponentModel3,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: DriverInfomationFormComponentWidget(
                            index: 2,
                            firestoreDataConfigList:
                                widget.firestoreDataConfigList!,
                          ),
                        ).animateOnPageLoad(animationsMap[
                            'driverInfomationFormComponentOnPageLoadAnimation3']!),
                      ),
                    if (FFAppState().DriverList.length > 3)
                      Container(
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.driverInfomationFormComponentModel4,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: DriverInfomationFormComponentWidget(
                            index: 3,
                            firestoreDataConfigList:
                                widget.firestoreDataConfigList!,
                          ),
                        ).animateOnPageLoad(animationsMap[
                            'driverInfomationFormComponentOnPageLoadAnimation4']!),
                      ),
                    if (FFAppState().DriverList.length > 4)
                      Container(
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.driverInfomationFormComponentModel5,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: DriverInfomationFormComponentWidget(
                            index: 4,
                            firestoreDataConfigList:
                                widget.firestoreDataConfigList!,
                          ),
                        ).animateOnPageLoad(animationsMap[
                            'driverInfomationFormComponentOnPageLoadAnimation5']!),
                      ),
                  ],
                ),
              ),
              if (FFAppState().DriverList.length < 5)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        FFAppState().addToDriverList(DriverDataStruct(
                          driverId: '',
                          driverNo: '',
                          applicationId: '',
                          idTypeId: '',
                          nationalThaiId: '',
                          licenseNo: '',
                          gender: '',
                          titleThId: '',
                          titleTh: '',
                          firstNameTh: '',
                          lastNameTh: '',
                          birthDay: '',
                          imageIdcard: '',
                          imageLicenseNo: '',
                          occupationId: '',
                          occupationCode: '',
                          occupationName: '',
                          occupationSubcode: '',
                          occupationSubname: '',
                        ));
                      });
                    },
                    text: 'เพิ่มผู้ขับขี่',
                    icon: Icon(
                      Icons.person_add_sharp,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Noto Sans Thai',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
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
              if (FFAppState().DriverList.length > 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 20.0),
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
                              if (FFAppState().DriverList.length <= 0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาเพิ่มผู้ขับขี่อย่างน้อย 1 คน'),
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
                              if (FFAppState().DriverList.length <= 1) {
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    0,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel1
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel1
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[0].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[0].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel1
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel1
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[0].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[0].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[0]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[0]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[0]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[0]
                                          .occupationSubname,
                                  );
                                });
                                context.safePop();
                                return;
                              }
                              if (FFAppState().DriverList.length <= 2) {
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    0,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel1
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel1
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[0].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[0].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel1
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel1
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[0].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[0].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[0]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[0]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[0]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[0]
                                          .occupationSubname,
                                  );
                                });
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    1,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel2
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel2
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[1].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[1].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel2
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel2
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[1].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[1].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[1]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[1]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[1]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[1]
                                          .occupationSubname,
                                  );
                                });
                                context.safePop();
                                return;
                              }
                              if (FFAppState().DriverList.length <= 3) {
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    0,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel1
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel1
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[0].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[0].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel1
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel1
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[0].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[0].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[0]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[0]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[0]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[0]
                                          .occupationSubname,
                                  );
                                });
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    1,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel2
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel2
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[1].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[1].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel2
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel2
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[1].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[1].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[1]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[1]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[1]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[1]
                                          .occupationSubname,
                                  );
                                });
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    2,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel3
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel3
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[2].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[2].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel3
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel3
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[2].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[2].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[2]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[2]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[2]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[2]
                                          .occupationSubname,
                                  );
                                });
                                context.safePop();
                                return;
                              }
                              if (FFAppState().DriverList.length <= 4) {
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    0,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel1
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel1
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[0].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[0].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel1
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel1
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[0].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[0].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[0]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[0]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[0]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[0]
                                          .occupationSubname,
                                  );
                                });
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    1,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel2
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel2
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[1].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[1].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel2
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel2
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[1].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[1].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[1]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[1]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[1]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[1]
                                          .occupationSubname,
                                  );
                                });
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    2,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel3
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel3
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[2].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[2].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel3
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel3
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[2].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[2].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[2]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[2]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[2]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[2]
                                          .occupationSubname,
                                  );
                                });
                                setState(() {
                                  FFAppState().updateDriverListAtIndex(
                                    3,
                                    (e) => e
                                      ..driverId = ''
                                      ..driverNo = ''
                                      ..applicationId = FFAppState()
                                          .insuranceInfoApplicationId
                                      ..idTypeId = '1'
                                      ..nationalThaiId = functions
                                          .removeCommaFromNumText(_model
                                              .driverInfomationFormComponentModel4
                                              .thaiIdTextfieldTextController
                                              .text)
                                      ..licenseNo = _model
                                          .driverInfomationFormComponentModel4
                                          .driverLicenseTextfieldTextController
                                          .text
                                      ..gender =
                                          FFAppState().DriverList[3].gender
                                      ..titleThId = ''
                                      ..titleTh =
                                          FFAppState().DriverList[3].titleTh
                                      ..firstNameTh = _model
                                          .driverInfomationFormComponentModel4
                                          .firstnameTextfieldTextController
                                          .text
                                      ..lastNameTh = _model
                                          .driverInfomationFormComponentModel4
                                          .address4LastnameTextfieldTextController
                                          .text
                                      ..birthDay =
                                          FFAppState().DriverList[3].birthDay
                                      ..imageIdcard =
                                          FFAppState().DriverList[3].imageIdcard
                                      ..imageLicenseNo = FFAppState()
                                          .DriverList[3]
                                          .imageLicenseNo
                                      ..occupationId = ''
                                      ..occupationCode = FFAppState()
                                          .DriverList[3]
                                          .occupationCode
                                      ..occupationName = FFAppState()
                                          .DriverList[3]
                                          .occupationName
                                      ..occupationSubcode = ''
                                      ..occupationSubname = FFAppState()
                                          .DriverList[3]
                                          .occupationSubname,
                                  );
                                });
                                context.safePop();
                                return;
                              }
                              setState(() {
                                FFAppState().updateDriverListAtIndex(
                                  0,
                                  (e) => e
                                    ..driverId = ''
                                    ..driverNo = ''
                                    ..applicationId =
                                        FFAppState().insuranceInfoApplicationId
                                    ..idTypeId = '1'
                                    ..nationalThaiId =
                                        functions.removeCommaFromNumText(_model
                                            .driverInfomationFormComponentModel1
                                            .thaiIdTextfieldTextController
                                            .text)
                                    ..licenseNo = _model
                                        .driverInfomationFormComponentModel1
                                        .driverLicenseTextfieldTextController
                                        .text
                                    ..gender = FFAppState().DriverList[0].gender
                                    ..titleThId = ''
                                    ..titleTh =
                                        FFAppState().DriverList[0].titleTh
                                    ..firstNameTh = _model
                                        .driverInfomationFormComponentModel1
                                        .firstnameTextfieldTextController
                                        .text
                                    ..lastNameTh = _model
                                        .driverInfomationFormComponentModel1
                                        .address4LastnameTextfieldTextController
                                        .text
                                    ..birthDay =
                                        FFAppState().DriverList[0].birthDay
                                    ..imageIdcard =
                                        FFAppState().DriverList[0].imageIdcard
                                    ..imageLicenseNo = FFAppState()
                                        .DriverList[0]
                                        .imageLicenseNo
                                    ..occupationId = ''
                                    ..occupationCode = FFAppState()
                                        .DriverList[0]
                                        .occupationCode
                                    ..occupationName = FFAppState()
                                        .DriverList[0]
                                        .occupationName
                                    ..occupationSubcode = ''
                                    ..occupationSubname = FFAppState()
                                        .DriverList[0]
                                        .occupationSubname,
                                );
                              });
                              setState(() {
                                FFAppState().updateDriverListAtIndex(
                                  1,
                                  (e) => e
                                    ..driverId = ''
                                    ..driverNo = ''
                                    ..applicationId =
                                        FFAppState().insuranceInfoApplicationId
                                    ..idTypeId = '1'
                                    ..nationalThaiId =
                                        functions.removeCommaFromNumText(_model
                                            .driverInfomationFormComponentModel2
                                            .thaiIdTextfieldTextController
                                            .text)
                                    ..licenseNo = _model
                                        .driverInfomationFormComponentModel2
                                        .driverLicenseTextfieldTextController
                                        .text
                                    ..gender = FFAppState().DriverList[1].gender
                                    ..titleThId = ''
                                    ..titleTh =
                                        FFAppState().DriverList[1].titleTh
                                    ..firstNameTh = _model
                                        .driverInfomationFormComponentModel2
                                        .firstnameTextfieldTextController
                                        .text
                                    ..lastNameTh = _model
                                        .driverInfomationFormComponentModel2
                                        .address4LastnameTextfieldTextController
                                        .text
                                    ..birthDay =
                                        FFAppState().DriverList[1].birthDay
                                    ..imageIdcard =
                                        FFAppState().DriverList[1].imageIdcard
                                    ..imageLicenseNo = FFAppState()
                                        .DriverList[1]
                                        .imageLicenseNo
                                    ..occupationId = ''
                                    ..occupationCode = FFAppState()
                                        .DriverList[1]
                                        .occupationCode
                                    ..occupationName = FFAppState()
                                        .DriverList[1]
                                        .occupationName
                                    ..occupationSubcode = ''
                                    ..occupationSubname = FFAppState()
                                        .DriverList[1]
                                        .occupationSubname,
                                );
                              });
                              setState(() {
                                FFAppState().updateDriverListAtIndex(
                                  2,
                                  (e) => e
                                    ..driverId = ''
                                    ..driverNo = ''
                                    ..applicationId =
                                        FFAppState().insuranceInfoApplicationId
                                    ..idTypeId = '1'
                                    ..nationalThaiId =
                                        functions.removeCommaFromNumText(_model
                                            .driverInfomationFormComponentModel3
                                            .thaiIdTextfieldTextController
                                            .text)
                                    ..licenseNo = _model
                                        .driverInfomationFormComponentModel3
                                        .driverLicenseTextfieldTextController
                                        .text
                                    ..gender = FFAppState().DriverList[2].gender
                                    ..titleThId = ''
                                    ..titleTh =
                                        FFAppState().DriverList[2].titleTh
                                    ..firstNameTh = _model
                                        .driverInfomationFormComponentModel3
                                        .firstnameTextfieldTextController
                                        .text
                                    ..lastNameTh = _model
                                        .driverInfomationFormComponentModel3
                                        .address4LastnameTextfieldTextController
                                        .text
                                    ..birthDay =
                                        FFAppState().DriverList[2].birthDay
                                    ..imageIdcard =
                                        FFAppState().DriverList[2].imageIdcard
                                    ..imageLicenseNo = FFAppState()
                                        .DriverList[2]
                                        .imageLicenseNo
                                    ..occupationId = ''
                                    ..occupationCode = FFAppState()
                                        .DriverList[2]
                                        .occupationCode
                                    ..occupationName = FFAppState()
                                        .DriverList[2]
                                        .occupationName
                                    ..occupationSubcode = ''
                                    ..occupationSubname = FFAppState()
                                        .DriverList[2]
                                        .occupationSubname,
                                );
                              });
                              setState(() {
                                FFAppState().updateDriverListAtIndex(
                                  3,
                                  (e) => e
                                    ..driverId = ''
                                    ..driverNo = ''
                                    ..applicationId =
                                        FFAppState().insuranceInfoApplicationId
                                    ..idTypeId = '1'
                                    ..nationalThaiId =
                                        functions.removeCommaFromNumText(_model
                                            .driverInfomationFormComponentModel4
                                            .thaiIdTextfieldTextController
                                            .text)
                                    ..licenseNo = _model
                                        .driverInfomationFormComponentModel4
                                        .driverLicenseTextfieldTextController
                                        .text
                                    ..gender = FFAppState().DriverList[3].gender
                                    ..titleThId = ''
                                    ..titleTh =
                                        FFAppState().DriverList[3].titleTh
                                    ..firstNameTh = _model
                                        .driverInfomationFormComponentModel4
                                        .firstnameTextfieldTextController
                                        .text
                                    ..lastNameTh = _model
                                        .driverInfomationFormComponentModel4
                                        .address4LastnameTextfieldTextController
                                        .text
                                    ..birthDay =
                                        FFAppState().DriverList[3].birthDay
                                    ..imageIdcard =
                                        FFAppState().DriverList[3].imageIdcard
                                    ..imageLicenseNo = FFAppState()
                                        .DriverList[3]
                                        .imageLicenseNo
                                    ..occupationId = ''
                                    ..occupationCode = FFAppState()
                                        .DriverList[3]
                                        .occupationCode
                                    ..occupationName = FFAppState()
                                        .DriverList[3]
                                        .occupationName
                                    ..occupationSubcode = ''
                                    ..occupationSubname = FFAppState()
                                        .DriverList[3]
                                        .occupationSubname,
                                );
                              });
                              setState(() {
                                FFAppState().updateDriverListAtIndex(
                                  4,
                                  (e) => e
                                    ..driverId = ''
                                    ..driverNo = ''
                                    ..applicationId =
                                        FFAppState().insuranceInfoApplicationId
                                    ..idTypeId = '1'
                                    ..nationalThaiId =
                                        functions.removeCommaFromNumText(_model
                                            .driverInfomationFormComponentModel5
                                            .thaiIdTextfieldTextController
                                            .text)
                                    ..licenseNo = _model
                                        .driverInfomationFormComponentModel5
                                        .driverLicenseTextfieldTextController
                                        .text
                                    ..gender = FFAppState().DriverList[4].gender
                                    ..titleThId = ''
                                    ..titleTh =
                                        FFAppState().DriverList[4].titleTh
                                    ..firstNameTh = _model
                                        .driverInfomationFormComponentModel5
                                        .firstnameTextfieldTextController
                                        .text
                                    ..lastNameTh = _model
                                        .driverInfomationFormComponentModel5
                                        .address4LastnameTextfieldTextController
                                        .text
                                    ..birthDay =
                                        FFAppState().DriverList[4].birthDay
                                    ..imageIdcard =
                                        FFAppState().DriverList[4].imageIdcard
                                    ..imageLicenseNo = FFAppState()
                                        .DriverList[4]
                                        .imageLicenseNo
                                    ..occupationId = ''
                                    ..occupationCode = FFAppState()
                                        .DriverList[4]
                                        .occupationCode
                                    ..occupationName = FFAppState()
                                        .DriverList[4]
                                        .occupationName
                                    ..occupationSubcode = ''
                                    ..occupationSubname = FFAppState()
                                        .DriverList[4]
                                        .occupationSubname,
                                );
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
                                    letterSpacing: 0.0,
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
    );
  }
}
