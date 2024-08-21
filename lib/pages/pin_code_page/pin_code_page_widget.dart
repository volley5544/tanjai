import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pin_code_page_model.dart';
export 'pin_code_page_model.dart';

class PinCodePageWidget extends StatefulWidget {
  const PinCodePageWidget({super.key});

  @override
  State<PinCodePageWidget> createState() => _PinCodePageWidgetState();
}

class _PinCodePageWidgetState extends State<PinCodePageWidget>
    with TickerProviderStateMixin {
  late PinCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinCodePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PinCodePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(await getPermissionStatus(notificationsPermission))) {
        await requestPermission(notificationsPermission);
      }
      if (isAndroid) {
        _model.androidIMEI1st = await actions.a3();
        FFAppState().imei = _model.androidIMEI1st!;
        FFAppState().update(() {});
      } else {
        _model.iOSidentifierForVendor1st = await actions.a4();
        FFAppState().imei = _model.iOSidentifierForVendor1st!;
        FFAppState().update(() {});
      }

      _model.checkDeviceLocSer = await actions.a1();
      _model.checkDeviceLocPer = await actions.a2();
      FFAppState().isLoadedInsuranceData = false;
      FFAppState().update(() {});
      _model.checkFirebaseOutput = await actions.checkStatusFirebase(
        FFAppState().employeeID,
      );
      if (!_model.checkFirebaseOutput!) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('เกิดข้อผิดพลาด กรุณาเข้าสู่ระบบใหม่'),
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
        FFAppState().loginStateFirebase = '[loginStateFirebase]';
        FFAppState().deleteAccessToken();
        FFAppState().accessToken = 'access_token';

        FFAppState().update(() {});
        FFAppState().deleteEmployeeID();
        FFAppState().employeeID = 'employee_id';

        FFAppState().update(() {});
        FFAppState().deleteApiURLLocalState();
        FFAppState().apiURLLocalState = 'api_url';

        FFAppState().deleteBranchCode();
        FFAppState().branchCode = 'branch_code';

        FFAppState().update(() {});
        FFAppState().isFromSetPinPage = false;
        FFAppState().leadChannelColor = [];
        FFAppState().update(() {});
        FFAppState().leadChannelList = [];
        FFAppState().isFromLoginPage = false;
        FFAppState().update(() {});
        FFAppState().deletePinCodeAuthen();
        FFAppState().pinCodeAuthen = '013972';

        FFAppState().isFromAuthenPage = false;
        FFAppState().update(() {});
        FFAppState().deleteDateDoNotShowAgain();
        FFAppState().dateDoNotShowAgain = null;

        FFAppState().deleteDoNotShowAgain();
        FFAppState().doNotShowAgain = false;

        FFAppState().update(() {});
        FFAppState().inAppViaNotification = true;
        FFAppState().isInApp = false;
        FFAppState().update(() {});
        FFAppState().deleteFcmToken();
        FFAppState().fcmToken = 'fcm_token';

        FFAppState().isPassLoginSection = false;
        FFAppState().update(() {});
        FFAppState().leadID = [];
        FFAppState().leadCreatedTimeList = [];
        FFAppState().update(() {});
        FFAppState().leadCustomerNameList = [];
        FFAppState().leadChannelList = [];
        FFAppState().update(() {});
        FFAppState().leadChannelColor = [];
        FFAppState().leadCallStatus = [];
        FFAppState().update(() {});
        FFAppState().leadPhoneNumberList = [];
        FFAppState().leadEmployeeID = [];
        FFAppState().update(() {});
        FFAppState().leadChannelLabelColor = [];
        FFAppState().deleteLeadIdCalledInApp();
        FFAppState().leadIdCalledInApp = [];

        FFAppState().update(() {});
        FFAppState().leadBranchCode = [];
        FFAppState().leadUserLevel = 'lead_user_level';
        FFAppState().update(() {});
        FFAppState().leadChannelAmountList = [];
        FFAppState().update(() {});

        context.goNamed('LoginPage');

        return;
      }
      _model.getBuildVersion = await actions.getBuildVersion1();
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1100.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1100.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: FutureBuilder<List<UrlLinkStorageRecord>>(
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
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<UrlLinkStorageRecord> columnfirstUrlLinkStorageRecordList =
                    snapshot.data!;
                final columnfirstUrlLinkStorageRecord =
                    columnfirstUrlLinkStorageRecordList.isNotEmpty
                        ? columnfirstUrlLinkStorageRecordList.first
                        : null;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder<List<BuildVersionRecord>>(
                      future: queryBuildVersionRecordOnce(
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
                        List<BuildVersionRecord>
                            columnsecBuildVersionRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final columnsecBuildVersionRecord =
                            columnsecBuildVersionRecordList.isNotEmpty
                                ? columnsecBuildVersionRecordList.first
                                : null;

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FutureBuilder<List<KeyStorageRecord>>(
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<KeyStorageRecord>
                                      columntriKeyStorageRecordList =
                                      snapshot.data!;
                                  final columntriKeyStorageRecord =
                                      columntriKeyStorageRecordList.isNotEmpty
                                          ? columntriKeyStorageRecordList.first
                                          : null;

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FutureBuilder<List<UserCustomRecord>>(
                                        future: queryUserCustomRecordOnce(
                                          queryBuilder: (userCustomRecord) =>
                                              userCustomRecord.where(
                                            'employee_id',
                                            isEqualTo:
                                                FFAppState().employeeID != ''
                                                    ? FFAppState().employeeID
                                                    : null,
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UserCustomRecord>
                                              columnfourUserCustomRecordList =
                                              snapshot.data!;
                                          final columnfourUserCustomRecord =
                                              columnfourUserCustomRecordList
                                                      .isNotEmpty
                                                  ? columnfourUserCustomRecordList
                                                      .first
                                                  : null;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 55.0,
                                                            icon: Icon(
                                                              Icons.logout,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 35.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              currentUserLocationValue =
                                                                  await getCurrentUserLocation(
                                                                      defaultLocation:
                                                                          LatLng(
                                                                              0.0,
                                                                              0.0));
                                                              var _shouldSetState =
                                                                  false;
                                                              HapticFeedback
                                                                  .mediumImpact();
                                                              showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Color(
                                                                    0x00000000),
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              double.infinity,
                                                                          child:
                                                                              LoadingSceneWidget(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));

                                                              _model.checkDeviceLocSerLogout =
                                                                  await actions
                                                                      .a1();
                                                              _shouldSetState =
                                                                  true;
                                                              if (!_model
                                                                  .checkDeviceLocSerLogout!) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text('กรุณาเปิดGPSเพื่อทำรายการ'),
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
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                              _model.checkDeviceLocPerLogout =
                                                                  await actions
                                                                      .a2();
                                                              _shouldSetState =
                                                                  true;
                                                              if (!_model
                                                                  .checkDeviceLocPerLogout!) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text('กรุณาให้อรุณสวัสดิ์เข้าถึงGPSของคุณ'),
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
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                              _model.checkLatLngLogout =
                                                                  await actions
                                                                      .a8(
                                                                currentUserLocationValue,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if (!_model
                                                                  .checkLatLngLogout!) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text('กรุณาเปิดGPSเพื่อทำรายการ'),
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
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }

                                                              var userLogRecordReference =
                                                                  UserLogRecord
                                                                      .collection
                                                                      .doc();
                                                              await userLogRecordReference
                                                                  .set(
                                                                      createUserLogRecordData(
                                                                employeeId:
                                                                    FFAppState()
                                                                        .employeeID,
                                                                action:
                                                                    'Logout',
                                                                actionTime:
                                                                    getCurrentTimestamp,
                                                                userLocation:
                                                                    currentUserLocationValue,
                                                              ));
                                                              _model.createdUserLogLogout =
                                                                  UserLogRecord
                                                                      .getDocumentFromData(
                                                                          createUserLogRecordData(
                                                                            employeeId:
                                                                                FFAppState().employeeID,
                                                                            action:
                                                                                'Logout',
                                                                            actionTime:
                                                                                getCurrentTimestamp,
                                                                            userLocation:
                                                                                currentUserLocationValue,
                                                                          ),
                                                                          userLogRecordReference);
                                                              _shouldSetState =
                                                                  true;
                                                              FFAppState()
                                                                      .loginStateFirebase =
                                                                  '[loginStateFirebase]';
                                                              FFAppState()
                                                                  .deleteAccessToken();
                                                              FFAppState()
                                                                      .accessToken =
                                                                  'access_token';

                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .deleteEmployeeID();
                                                              FFAppState()
                                                                      .employeeID =
                                                                  'employee_id';

                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .deleteApiURLLocalState();
                                                              FFAppState()
                                                                      .apiURLLocalState =
                                                                  'api_url';

                                                              FFAppState()
                                                                  .deleteBranchCode();
                                                              FFAppState()
                                                                      .branchCode =
                                                                  'branch_code';

                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                      .isFromSetPinPage =
                                                                  false;
                                                              FFAppState()
                                                                  .leadChannelColor = [];
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .leadChannelList = [];
                                                              FFAppState()
                                                                      .isFromLoginPage =
                                                                  false;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .deletePinCodeAuthen();
                                                              FFAppState()
                                                                      .pinCodeAuthen =
                                                                  '013972';

                                                              FFAppState()
                                                                      .isFromAuthenPage =
                                                                  false;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .deleteDateDoNotShowAgain();
                                                              FFAppState()
                                                                      .dateDoNotShowAgain =
                                                                  null;

                                                              FFAppState()
                                                                  .deleteDoNotShowAgain();
                                                              FFAppState()
                                                                      .doNotShowAgain =
                                                                  false;

                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                      .inAppViaNotification =
                                                                  true;
                                                              FFAppState()
                                                                      .isInApp =
                                                                  false;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .deleteFcmToken();
                                                              FFAppState()
                                                                      .fcmToken =
                                                                  'fcm_token';

                                                              FFAppState()
                                                                      .isPassLoginSection =
                                                                  false;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .leadID = [];
                                                              FFAppState()
                                                                  .leadCreatedTimeList = [];
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .leadCustomerNameList = [];
                                                              FFAppState()
                                                                  .leadChannelList = [];
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .leadChannelColor = [];
                                                              FFAppState()
                                                                  .leadCallStatus = [];
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .leadPhoneNumberList = [];
                                                              FFAppState()
                                                                  .leadEmployeeID = [];
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .leadChannelLabelColor = [];
                                                              FFAppState()
                                                                  .deleteLeadIdCalledInApp();
                                                              FFAppState()
                                                                  .leadIdCalledInApp = [];

                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .leadBranchCode = [];
                                                              FFAppState()
                                                                      .leadUserLevel =
                                                                  'lead_user_level';
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .leadChannelAmountList = [];
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              Navigator.pop(
                                                                  context);
                                                              await actions
                                                                  .a22();

                                                              context.goNamed(
                                                                  'LoginPage');

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                        SelectionArea(
                                                            child: Text(
                                                          'ออกจากระบบ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        )),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 55.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .app_blocking_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 33.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              HapticFeedback
                                                                  .mediumImpact();
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
                                                                              content: Text('คุณต้องการจะล้างข้อมูลแอพหรือไม่?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('ยกเลิก'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('ตกลง'),
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
                                                              await actions
                                                                  .a22();
                                                              await actions
                                                                  .clearAllAppDataCopy();
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'เคลียร์แคชเรียบร้อยกรุณาปิดแอปเปิดใหม่'),
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
                                                            },
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
                                                          child: SelectionArea(
                                                              child: Text(
                                                            'ล้างข้อมูลแอพ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          )),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FutureBuilder<
                                                  List<KeyStorage3Record>>(
                                                future:
                                                    queryKeyStorage3RecordOnce(
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<KeyStorage3Record>
                                                      containerKeyStorage3RecordList =
                                                      snapshot.data!;
                                                  final containerKeyStorage3Record =
                                                      containerKeyStorage3RecordList
                                                              .isNotEmpty
                                                          ? containerKeyStorage3RecordList
                                                              .first
                                                          : null;

                                                  return Container(
                                                    width: double.infinity,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  50.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            child: Image.asset(
                                                              'assets/images/PrakunTunjai-icon_(12).jpg',
                                                              width: 100.0,
                                                              height: 100.0,
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'imageOnPageLoadAnimation']!),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'ใส่รหัสผ่าน',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFF1D4774),
                                                                        fontSize:
                                                                            28.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'กรุณาใส่รหัสผ่านเพื่อเข้าใช้งาน',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFF1D4774),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              40.0,
                                                                              32.0,
                                                                              40.0,
                                                                              0.0),
                                                                          child:
                                                                              PinCodeTextField(
                                                                            autoDisposeControllers:
                                                                                false,
                                                                            appContext:
                                                                                context,
                                                                            length:
                                                                                6,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            enableActiveFill:
                                                                                true,
                                                                            autoFocus:
                                                                                false,
                                                                            enablePinAutofill:
                                                                                false,
                                                                            errorTextSpace:
                                                                                16.0,
                                                                            showCursor:
                                                                                false,
                                                                            cursorColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            obscureText:
                                                                                true,
                                                                            obscuringCharacter:
                                                                                '●',
                                                                            hintCharacter:
                                                                                '●',
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            pinTheme:
                                                                                PinTheme(
                                                                              fieldHeight: 55.0,
                                                                              fieldWidth: 50.0,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              shape: PinCodeFieldShape.box,
                                                                              activeColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              selectedColor: Color(0x66FFFFFF),
                                                                            ),
                                                                            controller:
                                                                                _model.pinCodeController,
                                                                            onChanged:
                                                                                (_) {},
                                                                            onCompleted:
                                                                                (_) async {
                                                                              var _shouldSetState = false;
                                                                              HapticFeedback.mediumImpact();
                                                                              if (FFAppState().isProduction) {
                                                                                if (!((FFAppState().employeeID == '31622') || (FFAppState().employeeID == '33511') || (FFAppState().employeeID == '36270'))) {}
                                                                              }
                                                                              if (FFAppState().pinCodeAuthen != _model.pinCodeController!.text) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text('รหัสพินไม่ถูกต้อง กรุณาลองอีกครั้ง'),
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
                                                                                setState(() {
                                                                                  _model.pinCodeController?.clear();
                                                                                });
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              if (!(await getPermissionStatus(notificationsPermission))) {
                                                                                await requestPermission(notificationsPermission);
                                                                              }
                                                                              showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                barrierColor: Color(0x00000000),
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () => FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: Container(
                                                                                          height: double.infinity,
                                                                                          child: LoadingSceneWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));

                                                                              FFAppState().userRef = columnfourUserCustomRecord?.reference;
                                                                              FFAppState().profileImage = columnfourUserCustomRecord!.imgProfile;
                                                                              setState(() {});

                                                                              setState(() {});
                                                                              FFAppState().apiURLLocalState = columntriKeyStorageRecord!.apiURL;
                                                                              FFAppState().update(() {});
                                                                              _model.getUserProfilePin = await GetUserProfileAPICall.call(
                                                                                token: FFAppState().accessToken,
                                                                                apiUrl: FFAppState().apiURLLocalState,
                                                                              );

                                                                              _shouldSetState = true;
                                                                              if ((_model.getUserProfilePin?.statusCode ?? 200) == 200) {
                                                                                FFAppState().userNickname = '${GetUserProfileAPICall.profileNickName(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().profileFullName = '${GetUserProfileAPICall.profileFullName(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().update(() {});
                                                                                FFAppState().profileBirthDate = '${GetUserProfileAPICall.profileBirthDate(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().profileUnitCodeName = '${GetUserProfileAPICall.profileBranchName(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().update(() {});
                                                                                FFAppState().profileParentUnit = '${GetUserProfileAPICall.profileArea(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().profileRegion = '${GetUserProfileAPICall.profileRegion(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().update(() {});
                                                                                FFAppState().profileHiredDate = '${GetUserProfileAPICall.profileHiredDate(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().profileServiceDuration = '${functions.profileServiceDuration('${GetUserProfileAPICall.profileServiceDurationYY(
                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                    )}', '${GetUserProfileAPICall.profileServiceDurationMM(
                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                    )}', '${GetUserProfileAPICall.profileServiceDurationDD(
                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                    )}')}';
                                                                                FFAppState().update(() {});
                                                                                FFAppState().profilePositionAge = '${functions.positionAgeText('${GetUserProfileAPICall.profilePositionAgeYY(
                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                    )}', '${GetUserProfileAPICall.profilePositionAgeMM(
                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                    )}', '${GetUserProfileAPICall.profilePositionAgeDD(
                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                    )}')}';
                                                                                FFAppState().profilePositionAgeCheck = '${GetUserProfileAPICall.profilePositionAgeCheck(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().update(() {});
                                                                                FFAppState().profilePositionName = '${GetUserProfileAPICall.profliePositionName(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().update(() {});
                                                                                FFAppState().ProfilePhoneNumber = '${GetUserProfileAPICall.profilePhoneNumber(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().profileLevel = '${GetUserProfileAPICall.profileLevel(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().profileBranch = '${GetUserProfileAPICall.profileBranch(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().update(() {});
                                                                                FFAppState().branchCode = '${GetUserProfileAPICall.branchCode(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                FFAppState().userRef = columnfourUserCustomRecord?.reference;
                                                                                setState(() {});
                                                                                FFAppState().profileFirstName = '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'first_name')}';
                                                                                FFAppState().profileLastName = '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'last_name')}';
                                                                                setState(() {});
                                                                                FFAppState().departmentProfile = '${GetUserProfileAPICall.department(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                )}';
                                                                                setState(() {});
                                                                                _model.getUserInsuranceLicensePin = await GetUserInsuranceLicenseCall.call(
                                                                                  token: FFAppState().accessToken,
                                                                                  apiUrl: FFAppState().apiURLLocalState,
                                                                                );

                                                                                _shouldSetState = true;
                                                                                if ((_model.getUserInsuranceLicensePin?.statusCode ?? 200) == 200) {
                                                                                  FFAppState().profileInsuranceLicenseFullName = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                            (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          200
                                                                                      ? '${GetUserInsuranceLicenseCall.fullName(
                                                                                          (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                        )}'
                                                                                      : FFAppState().profileInsuranceLicenseFullName;
                                                                                  FFAppState().profileInsuranceLicenseIdCard = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                            (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          200
                                                                                      ? '${GetUserInsuranceLicenseCall.idCard(
                                                                                          (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                        )}'
                                                                                      : FFAppState().profileInsuranceLicenseIdCard;
                                                                                  FFAppState().profileInsuranceLicenseLicenseNo = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                            (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          200
                                                                                      ? '${GetUserInsuranceLicenseCall.licenseNo(
                                                                                          (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                        )}'
                                                                                      : FFAppState().profileInsuranceLicenseLicenseNo;
                                                                                  FFAppState().profileInsuranceLicenseStartDate = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                            (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          200
                                                                                      ? '${GetUserInsuranceLicenseCall.startDate(
                                                                                          (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                        )}'
                                                                                      : FFAppState().profileInsuranceLicenseStartDate;
                                                                                  FFAppState().profileInsuranceLicenseExpireDate = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                            (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          200
                                                                                      ? '${GetUserInsuranceLicenseCall.expireDate(
                                                                                          (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                        )}'
                                                                                      : FFAppState().profileInsuranceLicenseExpireDate;
                                                                                  FFAppState().profileIsHaveInsuranceCard = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                            (_model.getUserInsuranceLicensePin?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          200
                                                                                      ? true
                                                                                      : false;
                                                                                  setState(() {});
                                                                                } else {
                                                                                  if (_shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                              } else {
                                                                                if (!((GetUserProfileAPICall.message(
                                                                                          (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                        ) ==
                                                                                        'The token has been blacklisted') ||
                                                                                    (GetUserProfileAPICall.message(
                                                                                          (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                        ) ==
                                                                                        'Token Signature could not be verified.'))) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                        child: AlertDialog(
                                                                                          content: Text('พบข้อผิดพลาด (${(_model.getUserProfilePin?.statusCode ?? 200).toString()})'),
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
                                                                                  if (_shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text('Session Loginหมดอายุ'),
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
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';

                                                                                FFAppState().update(() {});
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().update(() {});
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';

                                                                                FFAppState().update(() {});
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                                FFAppState().update(() {});
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                                FFAppState().update(() {});
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                                FFAppState().update(() {});
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;

                                                                                FFAppState().update(() {});
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                                FFAppState().update(() {});
                                                                                FFAppState().deleteFcmToken();
                                                                                FFAppState().fcmToken = 'fcm_token';

                                                                                FFAppState().isPassLoginSection = false;
                                                                                FFAppState().update(() {});
                                                                                Navigator.pop(context);
                                                                                await actions.a22();

                                                                                context.goNamed('LoginPage');

                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }

                                                                              FFAppState().isFromAuthenPage = true;
                                                                              FFAppState().apiUrlInsuranceAppState = FFAppState().isProduction ? columnfirstUrlLinkStorageRecord!.urlLink : containerKeyStorage3Record!.uat2ApiUrl;
                                                                              FFAppState().update(() {});
                                                                              Navigator.pop(context);

                                                                              context.goNamed('SuperAppPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                            },
                                                                            autovalidateMode:
                                                                                AutovalidateMode.onUserInteraction,
                                                                            validator:
                                                                                _model.pinCodeControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                        if (false)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                70.0,
                                                                                0.0,
                                                                                80.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: GridView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                        crossAxisCount: 3,
                                                                                        crossAxisSpacing: 10.0,
                                                                                        mainAxisSpacing: 10.0,
                                                                                        childAspectRatio: 1.0,
                                                                                      ),
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '1',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFF1D4774),
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w800,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '2',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFF1D4774),
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w800,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '3',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFF1D4774),
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w800,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '4',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFF1D4774),
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w800,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '5',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFF1D4774),
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w800,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '6',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFF1D4774),
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w800,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '7',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFF1D4774),
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w800,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '8',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFF1D4774),
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w800,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '9',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    color: Color(0xFF1D4774),
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w800,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              '0',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Noto Sans Thai',
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.backspace_outlined,
                                                                                              color: Color(0xFFDF8633),
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'ลืมรหัสผ่าน?',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Noto Sans Thai',
                                                                                            color: Color(0xFFDF8633),
                                                                                            fontSize: 15.0,
                                                                                            letterSpacing: 0.0,
                                                                                            decoration: TextDecoration.underline,
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
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          30.0,
                                                                          0.0,
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
                                                                  var _shouldSetState =
                                                                      false;
                                                                  HapticFeedback
                                                                      .mediumImpact();
                                                                  if (FFAppState()
                                                                      .isProduction) {
                                                                    if (!((FFAppState().employeeID == '31622') ||
                                                                        (FFAppState().employeeID ==
                                                                            '33511') ||
                                                                        (FFAppState().employeeID ==
                                                                            '36270'))) {}
                                                                  }
                                                                  if (!FFAppState()
                                                                      .BioAuthCheck) {
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    content: Text('คุณต้องการจะเปิดใช้งานเข้าสู่ระบบด้วย Face id หรือ สแกนลายนิ้วมือหรือไม่?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('ไม่เปิด'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('เปิด'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      FFAppState()
                                                                              .BioAuthCheck =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              content: Text('คุณได้เปิดการใช้งาน Face id หรือ สแกนนิ้วเรียบร้อย'),
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
                                                                    } else {
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                  }
                                                                  final _localAuth =
                                                                      LocalAuthentication();
                                                                  bool
                                                                      _isBiometricSupported =
                                                                      await _localAuth
                                                                          .isDeviceSupported();
                                                                  bool
                                                                      canCheckBiometrics =
                                                                      await _localAuth
                                                                          .canCheckBiometrics;
                                                                  if (_isBiometricSupported &&
                                                                      canCheckBiometrics) {
                                                                    _model.bioAuthCheck = await _localAuth.authenticate(
                                                                        localizedReason:
                                                                            'ยืนยันตัวตนด้วย Face id หรือ สแกนลายนิ้วมือ',
                                                                        options:
                                                                            const AuthenticationOptions(biometricOnly: true));
                                                                    setState(
                                                                        () {});
                                                                  }

                                                                  _shouldSetState =
                                                                      true;
                                                                  if (!_model
                                                                      .bioAuthCheck!) {
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
                                                                  showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    barrierColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () =>
                                                                              FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: double.infinity,
                                                                              child: LoadingSceneWidget(),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  FFAppState()
                                                                          .userRef =
                                                                      columnfourUserCustomRecord
                                                                          ?.reference;
                                                                  FFAppState()
                                                                          .profileImage =
                                                                      columnfourUserCustomRecord!
                                                                          .imgProfile;
                                                                  setState(
                                                                      () {});

                                                                  setState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .apiURLLocalState =
                                                                      columntriKeyStorageRecord!
                                                                          .apiURL;
                                                                  FFAppState()
                                                                          .apiUrlInsuranceAppState =
                                                                      columnfirstUrlLinkStorageRecord!
                                                                          .urlLink;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  _model.getUserProfileBio =
                                                                      await GetUserProfileAPICall
                                                                          .call(
                                                                    token: FFAppState()
                                                                        .accessToken,
                                                                    apiUrl: FFAppState()
                                                                        .apiURLLocalState,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model.getUserProfileBio
                                                                              ?.statusCode ??
                                                                          200) ==
                                                                      200) {
                                                                    FFAppState()
                                                                            .userNickname =
                                                                        '${GetUserProfileAPICall.profileNickName(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileFullName =
                                                                        '${GetUserProfileAPICall.profileFullName(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profileBirthDate =
                                                                        '${GetUserProfileAPICall.profileBirthDate(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileUnitCodeName =
                                                                        '${GetUserProfileAPICall.profileBranchName(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profileParentUnit =
                                                                        '${GetUserProfileAPICall.profileArea(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileRegion =
                                                                        '${GetUserProfileAPICall.profileRegion(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profileHiredDate =
                                                                        '${GetUserProfileAPICall.profileHiredDate(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileServiceDuration =
                                                                        '${functions.profileServiceDuration('${GetUserProfileAPICall.profileServiceDurationYY(
                                                                              (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                            )}', '${GetUserProfileAPICall.profileServiceDurationMM(
                                                                              (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                            )}', '${GetUserProfileAPICall.profileServiceDurationDD(
                                                                              (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                            )}')}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profilePositionAge =
                                                                        '${functions.positionAgeText('${GetUserProfileAPICall.profilePositionAgeYY(
                                                                              (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                            )}', '${GetUserProfileAPICall.profilePositionAgeMM(
                                                                              (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                            )}', '${GetUserProfileAPICall.profilePositionAgeDD(
                                                                              (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                            )}')}';
                                                                    FFAppState()
                                                                            .profilePositionAgeCheck =
                                                                        '${GetUserProfileAPICall.profilePositionAgeCheck(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .profilePositionName =
                                                                        '${GetUserProfileAPICall.profliePositionName(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .ProfilePhoneNumber =
                                                                        '${GetUserProfileAPICall.profilePhoneNumber(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileLevel =
                                                                        '${GetUserProfileAPICall.profileLevel(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .profileBranch =
                                                                        '${GetUserProfileAPICall.profileBranch(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .branchCode =
                                                                        '${GetUserProfileAPICall.branchCode(
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    FFAppState()
                                                                            .userRef =
                                                                        columnfourUserCustomRecord
                                                                            ?.reference;
                                                                    setState(
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
                                                                      (_model.getUserProfileBio
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}';
                                                                    setState(
                                                                        () {});
                                                                    _model.getUserInsuranceLicenseBio =
                                                                        await GetUserInsuranceLicenseCall
                                                                            .call(
                                                                      token: FFAppState()
                                                                          .accessToken,
                                                                      apiUrl: FFAppState()
                                                                          .apiURLLocalState,
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model.getUserInsuranceLicenseBio?.statusCode ??
                                                                            200) ==
                                                                        200) {
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseFullName = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.fullName(
                                                                              (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseFullName;
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseIdCard = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.idCard(
                                                                              (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseIdCard;
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseLicenseNo = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.licenseNo(
                                                                              (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseLicenseNo;
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseStartDate = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.startDate(
                                                                              (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseStartDate;
                                                                      FFAppState()
                                                                          .profileInsuranceLicenseExpireDate = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? '${GetUserInsuranceLicenseCall.expireDate(
                                                                              (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                            )}'
                                                                          : FFAppState().profileInsuranceLicenseExpireDate;
                                                                      FFAppState()
                                                                          .profileIsHaveInsuranceCard = GetUserInsuranceLicenseCall.statusLayer2(
                                                                                (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? true
                                                                          : false;
                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    if (!((GetUserProfileAPICall.message(
                                                                              (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                            ) ==
                                                                            'The token has been blacklisted') ||
                                                                        (GetUserProfileAPICall.message(
                                                                              (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                            ) ==
                                                                            'Token Signature could not be verified.'))) {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              content: Text('พบข้อผิดพลาด (${(_model.getUserProfileBio?.statusCode ?? 200).toString()})'),
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
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            content:
                                                                                Text('Session Loginหมดอายุ'),
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
                                                                    FFAppState()
                                                                            .loginStateFirebase =
                                                                        '[loginStateFirebase]';
                                                                    FFAppState()
                                                                        .deleteAccessToken();
                                                                    FFAppState()
                                                                            .accessToken =
                                                                        'access_token';

                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                        .deleteEmployeeID();
                                                                    FFAppState()
                                                                            .employeeID =
                                                                        'employee_id';

                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                        .deleteApiURLLocalState();
                                                                    FFAppState()
                                                                            .apiURLLocalState =
                                                                        'api_url';

                                                                    FFAppState()
                                                                        .deleteBranchCode();
                                                                    FFAppState()
                                                                            .branchCode =
                                                                        'branch_code';

                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .isFromSetPinPage =
                                                                        false;
                                                                    FFAppState()
                                                                        .leadChannelColor = [];
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                        .leadChannelList = [];
                                                                    FFAppState()
                                                                            .isFromLoginPage =
                                                                        false;
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                        .deletePinCodeAuthen();
                                                                    FFAppState()
                                                                            .pinCodeAuthen =
                                                                        '013972';

                                                                    FFAppState()
                                                                            .isFromAuthenPage =
                                                                        false;
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                        .deleteDateDoNotShowAgain();
                                                                    FFAppState()
                                                                            .dateDoNotShowAgain =
                                                                        null;

                                                                    FFAppState()
                                                                        .deleteDoNotShowAgain();
                                                                    FFAppState()
                                                                            .doNotShowAgain =
                                                                        false;

                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                            .inAppViaNotification =
                                                                        true;
                                                                    FFAppState()
                                                                            .isInApp =
                                                                        false;
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    FFAppState()
                                                                        .deleteFcmToken();
                                                                    FFAppState()
                                                                            .fcmToken =
                                                                        'fcm_token';

                                                                    FFAppState()
                                                                            .isPassLoginSection =
                                                                        false;
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    Navigator.pop(
                                                                        context);
                                                                    await actions
                                                                        .a22();

                                                                    context.goNamed(
                                                                        'LoginPage');

                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  FFAppState()
                                                                          .isFromAuthenPage =
                                                                      true;
                                                                  FFAppState()
                                                                      .apiUrlInsuranceAppState = FFAppState()
                                                                          .isProduction
                                                                      ? columnfirstUrlLinkStorageRecord!
                                                                          .urlLink
                                                                      : containerKeyStorage3Record!
                                                                          .uat2ApiUrl;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  Navigator.pop(
                                                                      context);

                                                                  context.goNamed(
                                                                      'SuperAppPage');

                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .fingerprint_sharp,
                                                                  color: Color(
                                                                      0xFFDF8633),
                                                                  size: 55.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
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
