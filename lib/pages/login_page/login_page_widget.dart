import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    super.key,
    this.apiURL,
    String? token,
  }) : this.token = token ?? '[token]';

  final DocumentReference? apiURL;
  final String token;

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoginPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getFCMToken = await actions.a11();
      await actions.lockOrientation();
      setDarkModeSetting(context, ThemeMode.light);
      FFAppState().fcmToken = _model.getFCMToken!;
      setState(() {});
      _model.getBuildVersion = await actions.getBuildVersion1();
      if (isAndroid) {
        _model.getAndroidImei = await actions.a3();
      } else {
        _model.getIosImei = await actions.a4();
      }

      if (await getPermissionStatus(notificationsPermission)) {
        return;
      }
      await requestPermission(notificationsPermission);
    });

    _model.usernameTextFieldTextController ??= TextEditingController();
    _model.usernameTextFieldFocusNode ??= FocusNode();

    _model.passwordTextFieldTextController ??= TextEditingController();
    _model.passwordTextFieldFocusNode ??= FocusNode();
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            top: true,
            child: FutureBuilder<List<KeyStorage3Record>>(
              future: queryKeyStorage3RecordOnce(
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
                List<KeyStorage3Record> columnKeyStorage3RecordList =
                    snapshot.data!;

                final columnKeyStorage3Record =
                    columnKeyStorage3RecordList.isNotEmpty
                        ? columnKeyStorage3RecordList.first
                        : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FutureBuilder<List<KeyStorageRecord>>(
                        future: queryKeyStorageRecordOnce(
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
                          List<KeyStorageRecord> columnKeyStorageRecordList =
                              snapshot.data!;

                          final columnKeyStorageRecord =
                              columnKeyStorageRecordList.isNotEmpty
                                  ? columnKeyStorageRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child:
                                    FutureBuilder<List<UrlLinkStorageRecord>>(
                                  future: queryUrlLinkStorageRecordOnce(
                                    queryBuilder: (urlLinkStorageRecord) =>
                                        urlLinkStorageRecord.where(
                                      'url_name',
                                      isEqualTo: 'insurance_api_url',
                                    ),
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UrlLinkStorageRecord>
                                        stackUrlLinkStorageRecordList =
                                        snapshot.data!;

                                    final stackUrlLinkStorageRecord =
                                        stackUrlLinkStorageRecordList.isNotEmpty
                                            ? stackUrlLinkStorageRecordList
                                                .first
                                            : null;
                                    return Stack(
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 390.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.2,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Image.asset(
                                                              'assets/images/header-background2.png',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -0.65),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/logo__1_-removebg-preview.png',
                                                                  width: 200.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.2),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.55,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(30.0),
                                                      topRight:
                                                          Radius.circular(30.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                30.0,
                                                                20.0,
                                                                0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 70,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {},
                                                                    child: Text(
                                                                      'เข้าสู่ระบบ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                Color(0xFF002D5E),
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await launchURL(
                                                                        'https://vcall.swpfin.com:8888/self-room');
                                                                  },
                                                                  child: Text(
                                                                    'Username',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFF7F8A8D),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .usernameTextFieldTextController,
                                                                  focusNode: _model
                                                                      .usernameTextFieldFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'username',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFDBDBDB),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFA6AFB1),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                  validator: _model
                                                                      .usernameTextFieldTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .urlLauncherAction(
                                                                          'https://vcall.swpfin.com:8888/self-room',
                                                                          'android',
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Password',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: Color(0xFF7F8A8D),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .passwordTextFieldTextController,
                                                                  focusNode: _model
                                                                      .passwordTextFieldFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      !_model
                                                                          .passwordTextFieldVisibility,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'password',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFDBDBDB),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFA6AFB1),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    suffixIcon:
                                                                        InkWell(
                                                                      onTap: () =>
                                                                          setState(
                                                                        () => _model.passwordTextFieldVisibility =
                                                                            !_model.passwordTextFieldVisibility,
                                                                      ),
                                                                      focusNode:
                                                                          FocusNode(
                                                                              skipTraversal: true),
                                                                      child:
                                                                          Icon(
                                                                        _model.passwordTextFieldVisibility
                                                                            ? Icons.visibility_outlined
                                                                            : Icons.visibility_off_outlined,
                                                                        size:
                                                                            22,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .passwordTextFieldTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await launchURL(
                                                                      'https://www.sawad.co.th/pragantanjai-policy/');
                                                                },
                                                                child: Text(
                                                                  'นโยบายความเป็นส่วนตัว',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFF5D78FF),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context.goNamed(
                                                                      'LoginScreen_1');
                                                                },
                                                                child: Text(
                                                                  'สมัครสมาชิก',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await launchURL(
                                                                      'http://10.1.114.94/swpauthenticate/api/login?redirect_uri=http%3A%2F%2F10.1.114.86%2Fsurvey%2Fpublic%2Fcallback&access_token=A0TNFQGdGu9z0MMW8kzSysS7W6GHdek4ig3IpZoy4Ldg0ppPf1NobkzPba3QoY4EvO6yn0S1uZS85quN6OyUToklQr1zkgSsKnuLeEUCitPPMEdyBqvdaUvDDIzjQGpX43TuGdkSEoJsCUOYeLIsol9NfdKYY2qlhQTgd00Qj8sxUG4wpWKcamZ2FJGBVkzN1ljAwJe1bVmxTfzvdXFz5r45eCuPPegeapVrXjcf41JPwlHk9C8P3dSSNeUfF67r');
                                                                },
                                                                child: Text(
                                                                  'ลืมรหัสผ่าน',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFFDB771A),
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            60.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    currentUserLocationValue = await getCurrentUserLocation(
                                                                        defaultLocation: LatLng(
                                                                            0.0,
                                                                            0.0));
                                                                    var _shouldSetState =
                                                                        false;
                                                                    if (!((_model.usernameTextFieldTextController.text == '31622') ||
                                                                        (_model.usernameTextFieldTextController.text ==
                                                                            '33511') ||
                                                                        (_model.usernameTextFieldTextController.text ==
                                                                            '36270') ||
                                                                        (_model.usernameTextFieldTextController.text ==
                                                                            '32758'))) {}
                                                                    FFAppState()
                                                                            .apiURLLocalState =
                                                                        columnKeyStorageRecord!
                                                                            .apiURL;
                                                                    FFAppState()
                                                                        .apiUrlInsuranceAppState = FFAppState()
                                                                            .isProduction
                                                                        ? stackUrlLinkStorageRecord!
                                                                            .urlLink
                                                                        : columnKeyStorage3Record!
                                                                            .uat2ApiUrl;
                                                                    setState(
                                                                        () {});
                                                                    if (!(_model.usernameTextFieldTextController.text !=
                                                                            null &&
                                                                        _model.usernameTextFieldTextController.text !=
                                                                            '')) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'กรุณากรอก Username',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 3000),
                                                                          backgroundColor:
                                                                              Color(0xB2000000),
                                                                        ),
                                                                      );
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                    if (!(_model.passwordTextFieldTextController.text !=
                                                                            null &&
                                                                        _model.passwordTextFieldTextController.text !=
                                                                            '')) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'กรุณากรอก Password',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 3000),
                                                                          backgroundColor:
                                                                              Color(0xB2000000),
                                                                        ),
                                                                      );
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                    if (!(await getPermissionStatus(
                                                                        notificationsPermission))) {
                                                                      await requestPermission(
                                                                          notificationsPermission);
                                                                    }
                                                                    _model.authernApiOutput =
                                                                        await AuthenAPICall
                                                                            .call(
                                                                      username: _model
                                                                          .usernameTextFieldTextController
                                                                          .text,
                                                                      password: _model
                                                                          .passwordTextFieldTextController
                                                                          .text,
                                                                      apiUrl: FFAppState()
                                                                          .apiURLLocalState,
                                                                      fcmToken:
                                                                          _model
                                                                              .getFCMToken,
                                                                      uid: isAndroid
                                                                          ? _model
                                                                              .getAndroidImei
                                                                          : _model
                                                                              .getIosImei,
                                                                      check:
                                                                          'Y',
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model.authernApiOutput?.statusCode ??
                                                                            200) !=
                                                                        200) {
                                                                      if ((_model.authernApiOutput?.statusCode ??
                                                                              200) ==
                                                                          401) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              AuthenAPICall.message(
                                                                                (_model.authernApiOutput?.jsonBody ?? ''),
                                                                              )!,
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
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              content: Text('พบข้อผิดพลาดConnection (${(_model.authernApiOutput?.statusCode ?? 200).toString()})'),
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
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                    if (AuthenAPICall
                                                                            .status(
                                                                          (_model.authernApiOutput?.jsonBody ??
                                                                              ''),
                                                                        ) !=
                                                                        200) {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              content: Text('พบข้อผิดพลาด (${AuthenAPICall.status(
                                                                                (_model.authernApiOutput?.jsonBody ?? ''),
                                                                              )?.toString()})'),
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
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                    FFAppState()
                                                                            .accessToken =
                                                                        '${AuthenAPICall.token(
                                                                      (_model.authernApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .employeeID =
                                                                        '${AuthenAPICall.employeeID(
                                                                      (_model.authernApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .branchCode =
                                                                        '${AuthenAPICall.branchCode(
                                                                      (_model.authernApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    _model.getUserProfileApiOutput =
                                                                        await GetUserProfileAPICall
                                                                            .call(
                                                                      token: FFAppState()
                                                                          .accessToken,
                                                                      apiUrl: FFAppState()
                                                                          .apiURLLocalState,
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model.getUserProfileApiOutput?.statusCode ??
                                                                            200) !=
                                                                        200) {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              content: Text('พบข้อผิดพลาดConnection (${(_model.getUserProfileApiOutput?.statusCode ?? 200).toString()})'),
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
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                    if (GetUserProfileAPICall
                                                                            .statusLayer1(
                                                                          (_model.getUserProfileApiOutput?.jsonBody ??
                                                                              ''),
                                                                        ) !=
                                                                        200) {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              content: Text('พบข้อผิดพลาด (${GetUserProfileAPICall.statusLayer1(
                                                                                (_model.getUserProfileApiOutput?.jsonBody ?? ''),
                                                                              )?.toString()})'),
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
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                    FFAppState()
                                                                            .userNickname =
                                                                        '${GetUserProfileAPICall.profileNickName(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileFullName =
                                                                        '${GetUserProfileAPICall.profileFullName(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profileBirthDate =
                                                                        '${GetUserProfileAPICall.profileBirthDate(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileUnitCodeName =
                                                                        '${GetUserProfileAPICall.profileBranchName(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profileParentUnit =
                                                                        '${GetUserProfileAPICall.profileArea(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileRegion =
                                                                        '${GetUserProfileAPICall.profileRegion(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profileHiredDate =
                                                                        '${GetUserProfileAPICall.profileHiredDate(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileServiceDuration =
                                                                        '${functions.profileServiceDuration('${GetUserProfileAPICall.profileServiceDurationYY(
                                                                              (_model.getUserProfileApiOutput?.jsonBody ?? ''),
                                                                            )}', '${GetUserProfileAPICall.profileServiceDurationMM(
                                                                              (_model.getUserProfileApiOutput?.jsonBody ?? ''),
                                                                            )}', '${GetUserProfileAPICall.profileServiceDurationDD(
                                                                              (_model.getUserProfileApiOutput?.jsonBody ?? ''),
                                                                            )}')}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profilePositionAge =
                                                                        '${functions.positionAgeText('${GetUserProfileAPICall.profilePositionAgeYY(
                                                                              (_model.getUserProfileApiOutput?.jsonBody ?? ''),
                                                                            )}', '${GetUserProfileAPICall.profilePositionAgeMM(
                                                                              (_model.getUserProfileApiOutput?.jsonBody ?? ''),
                                                                            )}', '${GetUserProfileAPICall.profilePositionAgeDD(
                                                                              (_model.getUserProfileApiOutput?.jsonBody ?? ''),
                                                                            )}')}';
                                                                    FFAppState()
                                                                            .profilePositionAgeCheck =
                                                                        '${GetUserProfileAPICall.profilePositionAgeCheck(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profilePositionName =
                                                                        '${GetUserProfileAPICall.profliePositionName(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .ProfilePhoneNumber =
                                                                        '${GetUserProfileAPICall.profilePhoneNumber(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileLevel =
                                                                        '${GetUserProfileAPICall.profileLevel(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileBranch =
                                                                        '${GetUserProfileAPICall.profileBranch(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profileFirstName =
                                                                        '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'first_name')}';
                                                                    FFAppState()
                                                                            .profileLastName =
                                                                        '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'last_name')}';
                                                                    setState(
                                                                        () {});
                                                                    FFAppState()
                                                                            .departmentProfile =
                                                                        '${GetUserProfileAPICall.department(
                                                                      (_model.getUserProfileApiOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    setState(
                                                                        () {});
                                                                    _model.getUserInsuranceLicense =
                                                                        await GetUserInsuranceLicenseCall
                                                                            .call(
                                                                      token: FFAppState()
                                                                          .accessToken,
                                                                      apiUrl: FFAppState()
                                                                          .apiURLLocalState,
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model.getUserInsuranceLicense?.statusCode ??
                                                                            200) ==
                                                                        200) {
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseFullName = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.fullName(
                                                                              (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseFullName;
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseIdCard = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.idCard(
                                                                              (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseIdCard;
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseLicenseNo = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.licenseNo(
                                                                              (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseLicenseNo;
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseStartDate = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.startDate(
                                                                              (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseStartDate;
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseExpireDate = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.expireDate(
                                                                              (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseExpireDate;
                                                                      FFAppState()
                                                                          .profileIsHaveInsuranceCard = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? true
                                                                          : false;
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    FFAppState()
                                                                            .isFromLoginPage =
                                                                        true;
                                                                    setState(
                                                                        () {});
                                                                    _model.customFirebaseAuthen =
                                                                        await actions
                                                                            .a13(
                                                                      functions.generateStuffFirebaseEmail(functions.toUpperCase(_model
                                                                          .usernameTextFieldTextController
                                                                          .text)),
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    if (_model
                                                                            .customFirebaseAuthen ==
                                                                        'Create') {
                                                                      _model.userUID =
                                                                          await actions
                                                                              .a21();
                                                                      _shouldSetState =
                                                                          true;

                                                                      var userCustomRecordReference = UserCustomRecord
                                                                          .collection
                                                                          .doc();
                                                                      await userCustomRecordReference
                                                                          .set(
                                                                              createUserCustomRecordData(
                                                                        createdTime:
                                                                            getCurrentTimestamp,
                                                                        email: functions
                                                                            .generateStuffFirebaseEmail(FFAppState().employeeID),
                                                                        uid: _model
                                                                            .userUID,
                                                                        employeeId:
                                                                            FFAppState().employeeID,
                                                                        imgProfile:
                                                                            'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                                      ));
                                                                      _model.createdUserCustom = UserCustomRecord.getDocumentFromData(
                                                                          createUserCustomRecordData(
                                                                            createdTime:
                                                                                getCurrentTimestamp,
                                                                            email:
                                                                                functions.generateStuffFirebaseEmail(FFAppState().employeeID),
                                                                            uid:
                                                                                _model.userUID,
                                                                            employeeId:
                                                                                FFAppState().employeeID,
                                                                            imgProfile:
                                                                                'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                                          ),
                                                                          userCustomRecordReference);
                                                                      _shouldSetState =
                                                                          true;
                                                                    }

                                                                    context.goNamed(
                                                                        'SetPinCodePage');

                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                  },
                                                                  text:
                                                                      'เข้าสู่ระบบ',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        70.0,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0xFFDB771A),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Color(0xFFE4E3E3),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
