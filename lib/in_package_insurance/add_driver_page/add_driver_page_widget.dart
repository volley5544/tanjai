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
      'driverInfomationFormComponentOnPageLoadAnimation': AnimationInfo(
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          final driverListItem =
                              FFAppState().DriverList.toList().take(5).toList();
                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              12.0,
                              0,
                              30.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: driverListItem.length,
                            itemBuilder: (context, driverListItemIndex) {
                              final driverListItemItem =
                                  driverListItem[driverListItemIndex];
                              return wrapWithModel(
                                model: _model
                                    .driverInfomationFormComponentModels
                                    .getModel(
                                  driverListItemIndex.toString(),
                                  driverListItemIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: DriverInfomationFormComponentWidget(
                                  key: Key(
                                    'Key12c_${driverListItemIndex.toString()}',
                                  ),
                                  namePrefix: FFAppState()
                                      .DriverList[driverListItemIndex]
                                      .titleTh,
                                  firstname: FFAppState()
                                      .DriverList[driverListItemIndex]
                                      .firstNameTh,
                                  lastname: FFAppState()
                                      .DriverList[driverListItemIndex]
                                      .lastNameTh,
                                  gender: FFAppState()
                                      .DriverList[driverListItemIndex]
                                      .gender,
                                  dateOfBirth: dateTimeFormat(
                                    'd/M/y',
                                    functions.parseStringToDatetime(FFAppState()
                                        .DriverList[driverListItemIndex]
                                        .birthDay),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  occupation: FFAppState()
                                      .DriverList[driverListItemIndex]
                                      .occupationName,
                                  thaiId: FFAppState()
                                      .DriverList[driverListItemIndex]
                                      .nationalThaiId,
                                  driverLicense: FFAppState()
                                      .DriverList[driverListItemIndex]
                                      .licenseNo,
                                  index: driverListItemIndex + 1,
                                  occupationList: FFAppState().defaultList1,
                                  firestoreDataConfigList:
                                      widget.firestoreDataConfigList!,
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'driverInfomationFormComponentOnPageLoadAnimation']!);
                            },
                          );
                        },
                      ),
                      if (FFAppState().DriverList.length < 5)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
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
                          onPressed: () {
                            print('Button pressed ...');
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
