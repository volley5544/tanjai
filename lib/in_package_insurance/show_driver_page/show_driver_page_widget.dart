import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_driver_page_model.dart';
export 'show_driver_page_model.dart';

class ShowDriverPageWidget extends StatefulWidget {
  const ShowDriverPageWidget({
    super.key,
    required this.firestoreDataConfigList,
  });

  final DataListRecord? firestoreDataConfigList;

  @override
  State<ShowDriverPageWidget> createState() => _ShowDriverPageWidgetState();
}

class _ShowDriverPageWidgetState extends State<ShowDriverPageWidget> {
  late ShowDriverPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowDriverPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ShowDriverPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().titleDriverList = functions
          .generateDriverTitleList(FFAppState().DriverList.length)!
          .toList()
          .cast<String>();
      setState(() {});
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
            'เพิ่มผู้ขับขี่ (${'${FFAppState().DriverList.length.toString()}/5'})',
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
                child: Builder(
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
                        return Container(
                          width: 100.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'ผู้ขับขี่ที่ ${(driverListItemIndex + 1).toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '${FFAppState().DriverList[driverListItemIndex].firstNameTh} ${FFAppState().DriverList[driverListItemIndex].lastNameTh}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          letterSpacing: 0.0,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (FFAppState().DriverList.length < 5)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 8.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (FFAppState().DriverList.last.firstNameTh ==
                                  '') {
                                context.pushNamed(
                                  'AddDriverPage',
                                  queryParameters: {
                                    'firestoreDataConfigList': serializeParam(
                                      widget.firestoreDataConfigList,
                                      ParamType.Document,
                                    ),
                                    'index': serializeParam(
                                      FFAppState().DriverList.length - 1,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'firestoreDataConfigList':
                                        widget.firestoreDataConfigList,
                                  },
                                );

                                return;
                              }
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
                              setState(() {});

                              context.pushNamed(
                                'AddDriverPage',
                                queryParameters: {
                                  'firestoreDataConfigList': serializeParam(
                                    widget.firestoreDataConfigList,
                                    ParamType.Document,
                                  ),
                                  'index': serializeParam(
                                    FFAppState().DriverList.length - 1,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'firestoreDataConfigList':
                                      widget.firestoreDataConfigList,
                                },
                              );
                            },
                            text: 'เพิ่มผู้ขับขี่',
                            icon: Icon(
                              Icons.person_add_alt_rounded,
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
                      ),
                    if (FFAppState().DriverList.length > 0)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().removeAtIndexFromDriverList(
                                  FFAppState().DriverList.length - 1);
                              setState(() {});
                            },
                            text: 'ลบผู้ขับขี่',
                            icon: Icon(
                              Icons.person_remove_alt_1_rounded,
                              size: 24.0,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFD80000),
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
                      ),
                  ],
                ),
              ),
            ]
                .addToStart(SizedBox(height: 12.0))
                .addToEnd(SizedBox(height: 30.0)),
          ),
        ),
      ),
    );
  }
}
