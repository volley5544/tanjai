import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qr_code_show_component_model.dart';
export 'qr_code_show_component_model.dart';

class QrCodeShowComponentWidget extends StatefulWidget {
  const QrCodeShowComponentWidget({Key? key}) : super(key: key);

  @override
  _QrCodeShowComponentWidgetState createState() =>
      _QrCodeShowComponentWidgetState();
}

class _QrCodeShowComponentWidgetState extends State<QrCodeShowComponentWidget> {
  late QrCodeShowComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrCodeShowComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: FaIcon(
                    FontAwesomeIcons.timesCircle,
                    color: Color(0xFFFF0000),
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/S__14966814.jpg',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                await launchURL('https://line.me/ti/g/Vnu3qGS_XY');
              },
              text: 'เปิดไลน์',
              options: FFButtonOptions(
                width: 180.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFDB771B),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Noto Sans Thai',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ].addToStart(SizedBox(height: 24.0)).addToEnd(SizedBox(height: 24.0)),
      ),
    );
  }
}
