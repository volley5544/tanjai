import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
            'เพิ่มผู้ขับขี่ (${'${FFAppState().DriverList.length == 1 ? ((FFAppState().DriverList.length == 1) && ((FFAppState().DriverList.firstOrNull?.firstNameTh != '') && (FFAppState().DriverList.firstOrNull?.lastNameTh != '') && (FFAppState().DriverList.firstOrNull?.birthDay != '') && (FFAppState().DriverList.firstOrNull?.nationalThaiId != '') && (FFAppState().DriverList.firstOrNull?.licenseNo != '') && (FFAppState().DriverList.firstOrNull?.imageIdcard != '') && (FFAppState().DriverList.firstOrNull?.imageLicenseNo != '')) ? FFAppState().DriverList.length.toString() : '0') : FFAppState().DriverList.length.toString()}/5'})',
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
                        return Visibility(
                          visible: FFAppState().DriverList.length == 1
                              ? ((FFAppState().DriverList.length == 1) &&
                                  ((FFAppState().DriverList.firstOrNull?.firstNameTh != '') &&
                                      (FFAppState()
                                              .DriverList
                                              .firstOrNull
                                              ?.lastNameTh !=
                                          '') &&
                                      (FFAppState().DriverList.firstOrNull?.birthDay !=
                                          '') &&
                                      (FFAppState()
                                              .DriverList
                                              .firstOrNull
                                              ?.nationalThaiId !=
                                          '') &&
                                      (FFAppState().DriverList.firstOrNull?.licenseNo !=
                                          '') &&
                                      (FFAppState()
                                              .DriverList
                                              .firstOrNull
                                              ?.imageIdcard !=
                                          '') &&
                                      (FFAppState()
                                              .DriverList
                                              .firstOrNull
                                              ?.imageLicenseNo !=
                                          '')))
                              : true,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 16.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'AddDriverPage',
                                  queryParameters: {
                                    'firestoreDataConfigList': serializeParam(
                                      widget!.firestoreDataConfigList,
                                      ParamType.Document,
                                    ),
                                    'index': serializeParam(
                                      driverListItemIndex,
                                      ParamType.int,
                                    ),
                                    'isEditing': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'firestoreDataConfigList':
                                        widget!.firestoreDataConfigList,
                                  },
                                );
                              },
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.sports_motorsports,
                                                      color: Color(0xFF204A77),
                                                      size: 24.0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'ผู้ขับขี่ที่ ${(driverListItemIndex + 1).toString()}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFF204A77),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'แก้ไขข้อมูล',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Color(
                                                                0xFF204A77),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.navigate_next,
                                                        color:
                                                            Color(0xFF204A77),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${FFAppState().DriverList.elementAtOrNull(driverListItemIndex)?.titleTh} ${FFAppState().DriverList.elementAtOrNull(driverListItemIndex)?.firstNameTh} ${FFAppState().DriverList.elementAtOrNull(driverListItemIndex)?.lastNameTh}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFF204A77),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'วัน/เดือน/ปีเกิด',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FFAppState()
                                                                            .DriverList
                                                                            .elementAtOrNull(
                                                                                driverListItemIndex)
                                                                            ?.birthDay !=
                                                                        ''
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        functions.showDateBE(FFAppState()
                                                                            .DriverList
                                                                            .elementAtOrNull(driverListItemIndex)
                                                                            ?.birthDay),
                                                                        '-',
                                                                      )
                                                                    : '-',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'อาชีพ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FFAppState()
                                                                    .DriverList
                                                                    .elementAtOrNull(
                                                                        driverListItemIndex)!
                                                                    .occupationSubname,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'เลขที่บัตรประชาชน',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFAppState()
                                                                              .DriverList
                                                                              .elementAtOrNull(
                                                                                  driverListItemIndex)
                                                                              ?.nationalThaiId !=
                                                                          ''
                                                                      ? valueOrDefault<
                                                                          String>(
                                                                          functions.showThaiIdNumberForm(FFAppState()
                                                                              .DriverList
                                                                              .elementAtOrNull(driverListItemIndex)
                                                                              ?.nationalThaiId),
                                                                          '-',
                                                                        )
                                                                      : '-',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'เลขที่ใบอนุญาตขับขี่',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFAppState()
                                                                      .DriverList
                                                                      .elementAtOrNull(
                                                                          driverListItemIndex)!
                                                                      .nationalThaiId,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text('คุณต้องการจะลบผู้ขับขี่ที่ ${(driverListItemIndex + 1).toString()} หรือไม่?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('ยกเลิก'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('ลบ'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (!confirmDialogResponse) {
                                                          return;
                                                        }
                                                        FFAppState()
                                                            .removeAtIndexFromDriverList(
                                                                driverListItemIndex);
                                                        FFAppState()
                                                            .loopCountTemp = 0;
                                                        safeSetState(() {});
                                                        while (FFAppState()
                                                                .loopCountTemp <
                                                            FFAppState()
                                                                .DriverList
                                                                .length) {
                                                          FFAppState()
                                                              .updateDriverListAtIndex(
                                                            FFAppState()
                                                                .loopCountTemp,
                                                            (e) => e
                                                              ..driverNo =
                                                                  (FFAppState()
                                                                              .loopCountTemp +
                                                                          1)
                                                                      .toString(),
                                                          );
                                                          FFAppState()
                                                                  .loopCountTemp =
                                                              FFAppState()
                                                                      .loopCountTemp +
                                                                  1;
                                                          safeSetState(() {});
                                                        }
                                                        FFAppState()
                                                            .loopCountTemp = 0;
                                                        safeSetState(() {});
                                                      },
                                                      text: 'ลบผู้ขับขี่',
                                                      icon: Icon(
                                                        Icons
                                                            .person_remove_alt_1_rounded,
                                                        size: 24.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 150.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFD80000),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().DriverList.length < 5)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().DriverList.length != 0) {
                                  if (FFAppState()
                                          .DriverList
                                          .lastOrNull
                                          ?.firstNameTh ==
                                      '') {
                                    context.pushNamed(
                                      'AddDriverPage',
                                      queryParameters: {
                                        'firestoreDataConfigList':
                                            serializeParam(
                                          widget!.firestoreDataConfigList,
                                          ParamType.Document,
                                        ),
                                        'index': serializeParam(
                                          FFAppState().DriverList.length - 1,
                                          ParamType.int,
                                        ),
                                        'isEditing': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'firestoreDataConfigList':
                                            widget!.firestoreDataConfigList,
                                      },
                                    );

                                    return;
                                  }
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
                                safeSetState(() {});

                                context.pushNamed(
                                  'AddDriverPage',
                                  queryParameters: {
                                    'firestoreDataConfigList': serializeParam(
                                      widget!.firestoreDataConfigList,
                                      ParamType.Document,
                                    ),
                                    'index': serializeParam(
                                      FFAppState().DriverList.length - 1,
                                      ParamType.int,
                                    ),
                                    'isEditing': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'firestoreDataConfigList':
                                        widget!.firestoreDataConfigList,
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
                      if (() {
                            if (FFAppState().DriverList.length == 0) {
                              return false;
                            } else if (FFAppState().DriverList.length > 0) {
                              return (FFAppState().DriverList.length == 1
                                  ? ((FFAppState().DriverList.length == 1) &&
                                      ((FFAppState().DriverList.firstOrNull?.firstNameTh != '') &&
                                          (FFAppState()
                                                  .DriverList
                                                  .firstOrNull
                                                  ?.lastNameTh !=
                                              '') &&
                                          (FFAppState().DriverList.firstOrNull?.birthDay !=
                                              '') &&
                                          (FFAppState()
                                                  .DriverList
                                                  .firstOrNull
                                                  ?.nationalThaiId !=
                                              '') &&
                                          (FFAppState()
                                                  .DriverList
                                                  .firstOrNull
                                                  ?.licenseNo !=
                                              '') &&
                                          (FFAppState()
                                                  .DriverList
                                                  .firstOrNull
                                                  ?.imageIdcard !=
                                              '') &&
                                          (FFAppState()
                                                  .DriverList
                                                  .firstOrNull
                                                  ?.imageLicenseNo !=
                                              '')))
                                  : true);
                            } else {
                              return true;
                            }
                          }() &&
                          false)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().removeAtIndexFromDriverList(
                                    FFAppState().DriverList.length - 1);
                                safeSetState(() {});
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
