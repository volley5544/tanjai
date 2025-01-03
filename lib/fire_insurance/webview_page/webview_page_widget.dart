import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'webview_page_model.dart';
export 'webview_page_model.dart';

class WebviewPageWidget extends StatefulWidget {
  const WebviewPageWidget({
    super.key,
    required this.webUrl,
  });

  final String? webUrl;

  @override
  State<WebviewPageWidget> createState() => _WebviewPageWidgetState();
}

class _WebviewPageWidgetState extends State<WebviewPageWidget> {
  late WebviewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebviewPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'WebviewPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text('\"${FFAppState().profileUnitCodeName}\"'),
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.close_outlined,
                color: Color(0xFFDB771A),
                size: 30.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FlutterFlowWebView(
                    content:
                        '${widget!.webUrl}?token=${FFAppState().accessToken}&userProfileData={\"owner_name\":${'\"${FFAppState().profileFullName}\",'}\"owner_phone\":${'\"${FFAppState().ProfilePhoneNumber}\",'}\"owner_id\":${'\"${FFAppState().employeeID}\",'}\"branch_code\":${'\"${FFAppState().profileBranch}\",'}\"branch_name\":${'\"${FFAppState().profileUnitCodeName}\"'}}',
                    bypass: true,
                    height: 500.0,
                    verticalScroll: false,
                    horizontalScroll: false,
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
