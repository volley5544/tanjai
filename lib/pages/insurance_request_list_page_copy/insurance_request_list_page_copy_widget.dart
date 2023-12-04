import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_request_list_page_copy_model.dart';
export 'insurance_request_list_page_copy_model.dart';

class InsuranceRequestListPageCopyWidget extends StatefulWidget {
  const InsuranceRequestListPageCopyWidget({Key? key}) : super(key: key);

  @override
  _InsuranceRequestListPageCopyWidgetState createState() =>
      _InsuranceRequestListPageCopyWidgetState();
}

class _InsuranceRequestListPageCopyWidgetState
    extends State<InsuranceRequestListPageCopyWidget> {
  late InsuranceRequestListPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceRequestListPageCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InsuranceRequestListPageCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
              child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Container(
                height: double.infinity,
                child: LoadingSceneWidget(),
              ),
            ),
          ));
        },
      ).then((value) => safeSetState(() {}));

      _model.getRequestList = await InsuranceRequestListAPICall.call(
        apiUrl: 'https://is-dev.swpfin.com',
        token: FFAppState().accessToken,
        ownerId: FFAppState().employeeID,
        mode: 'arunsawad',
      );
      if ((_model.getRequestList?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(
                  'พบข้อผิดพลาดConnection (${(_model.getRequestList?.statusCode ?? 200).toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );
        return;
      }
      if (InsuranceRequestListAPICall.statusLayer2(
            (_model.getRequestList?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${InsuranceRequestListAPICall.statusLayer2(
                (_model.getRequestList?.jsonBody ?? ''),
              ).toString().toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );
      }
      setState(() {
        FFAppState().insuranceOperationChoiceChips = 'งานใหม่          ';
        FFAppState().insuranceCustomerTypeChoiceChips = 'บุคคลธรรมดา';
        FFAppState().insuranceBoxCheckbokValue = false;
        FFAppState().insuranceBoxTypeChoiceChip = 'ตู้แห้ง';
        FFAppState().insuranceVehicleTypeDropDown = 'กรุณาเลือก';
      });
      Navigator.pop(context);
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed('InsuranceRequestDashboardPage');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFFFF6500),
                  size: 30.0,
                ),
              ),
              title: Text(
                'งานนอกเรท',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Noto Sans Thai',
                      color: FlutterFlowTheme.of(context).black600,
                      fontSize: 18.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              toolbarHeight: 70.0,
              elevation: 10.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[]
                  .addToStart(SizedBox(height: 12.0))
                  .addToEnd(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
