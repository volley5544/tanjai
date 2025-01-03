import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'fire_lead_follow_up_page_model.dart';
export 'fire_lead_follow_up_page_model.dart';

class FireLeadFollowUpPageWidget extends StatefulWidget {
  const FireLeadFollowUpPageWidget({super.key});

  @override
  State<FireLeadFollowUpPageWidget> createState() =>
      _FireLeadFollowUpPageWidgetState();
}

class _FireLeadFollowUpPageWidgetState
    extends State<FireLeadFollowUpPageWidget> {
  late FireLeadFollowUpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FireLeadFollowUpPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'fireLeadFollowUpPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
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

      _model.getBuildVersion = await actions.getBuildVersion1();
      _model.deviceBuildNumber = await actions.getBuildNumber();
      _model.buildVersionQuery = await queryBuildVersionRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.adminVersionQuery = await queryAuthorizationRecordOnce(
        queryBuilder: (authorizationRecord) => authorizationRecord.where(
          'content_name',
          isEqualTo: 'skip_build_version',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (isAndroid) {
        if (!((_model.buildVersionQuery!.buildNumberAndroid <=
                _model.deviceBuildNumber!) ||
            _model.adminVersionQuery!.employeeIdList
                .contains(FFAppState().employeeID))) {
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
                ),
              );
            },
          );
          await actions.terminateAppAction();
          return;
        }
      } else {
        if (!((_model.buildVersionQuery!.buildNumberIos <=
                _model.deviceBuildNumber!) ||
            _model.adminVersionQuery!.employeeIdList
                .contains(FFAppState().employeeID))) {
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
                ),
              );
            },
          );
          await actions.terminateAppAction();
          return;
        }
      }

      _model.getListFireApi = await HouseInsuranceGroup.getListFireApiCall.call(
        token: FFAppState().accessToken,
        ownerId: FFAppState().employeeID,
        apiUrl: FFAppState().apiUrlInsuranceAppState,
      );

      if ((_model.getListFireApi?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดConnection (${(_model.getListFireApi?.statusCode ?? 200).toString()})'),
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
        return;
      }
      if (!((HouseInsuranceGroup.getListFireApiCall.statusleyer1(
                (_model.getListFireApi?.jsonBody ?? ''),
              ) ==
              200) ||
          (HouseInsuranceGroup.getListFireApiCall.statusleyer1(
                (_model.getListFireApi?.jsonBody ?? ''),
              ) ==
              404))) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${HouseInsuranceGroup.getListFireApiCall.statusleyer1(
                          (_model.getListFireApi?.jsonBody ?? ''),
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
        return;
      }
      Navigator.pop(context);
    });

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFFDB771A),
                size: 30.0,
              ),
              onPressed: () async {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: LoadingSceneWidget(),
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));

                await Future.delayed(const Duration(milliseconds: 500));

                context.goNamed('SuperAppPage');

                Navigator.pop(context);
              },
            ),
            title: Text(
              'ติดตามสถานะ',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF003063),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
        ),
      ),
    );
  }
}
