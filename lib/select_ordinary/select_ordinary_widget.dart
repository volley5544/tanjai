import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_ordinary_model.dart';
export 'select_ordinary_model.dart';

class SelectOrdinaryWidget extends StatefulWidget {
  const SelectOrdinaryWidget({super.key});

  @override
  State<SelectOrdinaryWidget> createState() => _SelectOrdinaryWidgetState();
}

class _SelectOrdinaryWidgetState extends State<SelectOrdinaryWidget> {
  late SelectOrdinaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectOrdinaryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SelectOrdinary'});
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xCAFF6500),
              size: 30,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'ประเภทบุคคล',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Noto Sans Thai',
                  color: Color(0xFF1D4774),
                  fontSize: 18,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F8),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (FFAppState().buttonOrdinary ==
                                            true) {
                                          FFAppState().buttonCorporation =
                                              false;
                                          FFAppState().buttonOrdinary = false;
                                          safeSetState(() {});
                                          FFAppState().insuranceInfoCardType =
                                              'เลือกประเภทบัตร';
                                          safeSetState(() {});
                                        } else {
                                          FFAppState().buttonCorporation =
                                              false;
                                          FFAppState().buttonOrdinary = true;
                                          safeSetState(() {});
                                          FFAppState().insuranceInfoCardType =
                                              'เลือกประเภทบัตร';
                                          safeSetState(() {});
                                        }

                                        context.safePop();
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            FFAppState().buttonOrdinary == true
                                                ? Color(0xFFDBE2E7)
                                                : Colors.white,
                                            Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60),
                                                    border: Border.all(
                                                      color: Color(0xFF1D4774),
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons
                                                          .person_outline_sharp,
                                                      color: Color(0xFF1D4774),
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'บุคคลธรรมดา',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF1D4774),
                                                          fontSize: 15,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (FFAppState().buttonCorporation ==
                                            true) {
                                          FFAppState().buttonCorporation =
                                              false;
                                          FFAppState().buttonOrdinary = false;
                                          safeSetState(() {});
                                          FFAppState().insuranceInfoCardType =
                                              'เลือกประเภทบัตร';
                                          safeSetState(() {});
                                        } else {
                                          FFAppState().buttonCorporation = true;
                                          FFAppState().buttonOrdinary = false;
                                          safeSetState(() {});
                                          FFAppState().insuranceInfoCardType =
                                              '3';
                                          safeSetState(() {});
                                        }

                                        context.safePop();
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            FFAppState().buttonCorporation ==
                                                    true
                                                ? Color(0xFFDBE2E7)
                                                : Colors.white,
                                            Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60),
                                                    border: Border.all(
                                                      color: Color(0xFF1D4774),
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons.home_work_outlined,
                                                      color: Color(0xFF1D4774),
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'นิติบุคคล',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF1D4774),
                                                          fontSize: 15,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
