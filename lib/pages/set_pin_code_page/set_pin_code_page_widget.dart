import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'set_pin_code_page_model.dart';
export 'set_pin_code_page_model.dart';

class SetPinCodePageWidget extends StatefulWidget {
  const SetPinCodePageWidget({Key? key}) : super(key: key);

  @override
  _SetPinCodePageWidgetState createState() => _SetPinCodePageWidgetState();
}

class _SetPinCodePageWidgetState extends State<SetPinCodePageWidget> {
  late SetPinCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetPinCodePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SetPinCodePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().isLoadedInsuranceData = false;
      });
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
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'ตั้ง PIN ของคุณ',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFF1D4774),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  44.0, 8.0, 44.0, 0.0),
                              child: Text(
                                'รหัสพินนี้จะใช้ในการเข้าสู่ระบบในครั้งถัดไป',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFF1D4774),
                                      fontSize: 15.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 40.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 0.0),
                                  child: FutureBuilder<
                                      List<InsuranceLicenseDataRecord>>(
                                    future: queryInsuranceLicenseDataRecordOnce(
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
                                      List<InsuranceLicenseDataRecord>
                                          pinCodeInsuranceLicenseDataRecordList =
                                          snapshot.data!;
                                      final pinCodeInsuranceLicenseDataRecord =
                                          pinCodeInsuranceLicenseDataRecordList
                                                  .isNotEmpty
                                              ? pinCodeInsuranceLicenseDataRecordList
                                                  .first
                                              : null;
                                      return PinCodeTextField(
                                        autoDisposeControllers: false,
                                        appContext: context,
                                        length: 6,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        enableActiveFill: true,
                                        autoFocus: true,
                                        enablePinAutofill: true,
                                        errorTextSpace: 16.0,
                                        showCursor: false,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        obscureText: true,
                                        obscuringCharacter: '●',
                                        hintCharacter: '*',
                                        keyboardType: TextInputType.number,
                                        pinTheme: PinTheme(
                                          fieldHeight: 55.0,
                                          fieldWidth: 50.0,
                                          borderWidth: 2.0,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: PinCodeFieldShape.box,
                                          activeColor: Colors.white,
                                          inactiveColor: Color(0xFFF6F6F6),
                                          selectedColor: Color(0x66FFFFFF),
                                          activeFillColor: Colors.white,
                                          inactiveFillColor: Color(0xFFF6F6F6),
                                          selectedFillColor: Color(0x66FFFFFF),
                                        ),
                                        controller: _model.pinCodeController,
                                        onChanged: (_) {},
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: _model
                                            .pinCodeControllerValidator
                                            .asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 44.0),
                  child: FutureBuilder<List<UserCustomRecord>>(
                    future: queryUserCustomRecordOnce(
                      queryBuilder: (userCustomRecord) =>
                          userCustomRecord.where(
                        'employee_id',
                        isEqualTo: FFAppState().employeeID != ''
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
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UserCustomRecord> buttonUserCustomRecordList =
                          snapshot.data!;
                      final buttonUserCustomRecord =
                          buttonUserCustomRecordList.isNotEmpty
                              ? buttonUserCustomRecordList.first
                              : null;
                      return FFButtonWidget(
                        onPressed: () async {
                          currentUserLocationValue =
                              await getCurrentUserLocation(
                                  defaultLocation: LatLng(0.0, 0.0));
                          var _shouldSetState = false;
                          HapticFeedback.mediumImpact();
                          if (!(_model.pinCodeController!.text != null &&
                              _model.pinCodeController!.text != '')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'กรุณาใส่พิน',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                duration: Duration(milliseconds: 3000),
                                backgroundColor: Color(0xCC000000),
                              ),
                            );
                            if (_shouldSetState) setState(() {});
                            return;
                          }
                          if (!functions.checkPinCodeInput(
                              _model.pinCodeController!.text)) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                    child: AlertDialog(
                                  content:
                                      Text('กรุณาใส่รหัสพิน6หลัก (ตัวเลข)'),
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
                            if (_shouldSetState) setState(() {});
                            return;
                          }
                          FFAppState().update(() {
                            FFAppState().pinCodeAuthen =
                                _model.pinCodeController!.text;
                            FFAppState().isFromSetPinPage = true;
                          });
                          setState(() {
                            FFAppState().userRef =
                                buttonUserCustomRecord?.reference;
                            FFAppState().profileImage =
                                buttonUserCustomRecord!.imgProfile;
                          });

                          var userLogRecordReference =
                              UserLogRecord.collection.doc();
                          await userLogRecordReference
                              .set(createUserLogRecordData(
                            employeeId: FFAppState().employeeID,
                            action: 'Set_Pin_Code',
                            actionTime: getCurrentTimestamp,
                            userLocation: currentUserLocationValue,
                          ));
                          _model.createdUserLogSetPin =
                              UserLogRecord.getDocumentFromData(
                                  createUserLogRecordData(
                                    employeeId: FFAppState().employeeID,
                                    action: 'Set_Pin_Code',
                                    actionTime: getCurrentTimestamp,
                                    userLocation: currentUserLocationValue,
                                  ),
                                  userLogRecordReference);
                          _shouldSetState = true;
                          if (isAndroid) {
                            var fcmTokenRecordReference1 =
                                FcmTokenRecord.createDoc(FFAppState().userRef!);
                            await fcmTokenRecordReference1
                                .set(createFcmTokenRecordData(
                              fcmToken: FFAppState().fcmToken,
                              employeeId: FFAppState().employeeID,
                              createDate: getCurrentTimestamp,
                              uid: currentUserUid,
                              deviceType: 'android',
                            ));
                            _model.androidCreateFMCTokenDoc =
                                FcmTokenRecord.getDocumentFromData(
                                    createFcmTokenRecordData(
                                      fcmToken: FFAppState().fcmToken,
                                      employeeId: FFAppState().employeeID,
                                      createDate: getCurrentTimestamp,
                                      uid: currentUserUid,
                                      deviceType: 'android',
                                    ),
                                    fcmTokenRecordReference1);
                            _shouldSetState = true;
                          } else {
                            if (!isiOS) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                      child: AlertDialog(
                                    content: Text(
                                        'แอพพลิเคชั่นนี้ ให้ใช้ได้แค่ใน Android หรือ Ios เท่านั้น'),
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
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            var fcmTokenRecordReference2 =
                                FcmTokenRecord.createDoc(FFAppState().userRef!);
                            await fcmTokenRecordReference2
                                .set(createFcmTokenRecordData(
                              fcmToken: FFAppState().fcmToken,
                              employeeId: FFAppState().employeeID,
                              createDate: getCurrentTimestamp,
                              uid: currentUserUid,
                              deviceType: 'ios',
                            ));
                            _model.iosCreateFMCTokenDoc =
                                FcmTokenRecord.getDocumentFromData(
                                    createFcmTokenRecordData(
                                      fcmToken: FFAppState().fcmToken,
                                      employeeId: FFAppState().employeeID,
                                      createDate: getCurrentTimestamp,
                                      uid: currentUserUid,
                                      deviceType: 'ios',
                                    ),
                                    fcmTokenRecordReference2);
                            _shouldSetState = true;
                          }

                          context.goNamed('SuperAppPage');

                          if (_shouldSetState) setState(() {});
                        },
                        text: 'ยืนยัน',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFDF8633),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      );
                    },
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
