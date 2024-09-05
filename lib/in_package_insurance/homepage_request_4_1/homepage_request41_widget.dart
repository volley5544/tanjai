import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'homepage_request41_model.dart';
export 'homepage_request41_model.dart';

class HomepageRequest41Widget extends StatefulWidget {
  const HomepageRequest41Widget({
    super.key,
    this.fromPage,
  });

  final String? fromPage;

  @override
  State<HomepageRequest41Widget> createState() =>
      _HomepageRequest41WidgetState();
}

class _HomepageRequest41WidgetState extends State<HomepageRequest41Widget> {
  late HomepageRequest41Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageRequest41Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Homepage_Request_4_1'});
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB771A),
                size: 30,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'ประเภทการชำระเงิน',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF204A77),
                    fontSize: 18,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: FutureBuilder<List<InsurerConfig2Record>>(
                future: queryInsurerConfig2RecordOnce(
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<InsurerConfig2Record> columnInsurerConfig2RecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnInsurerConfig2Record =
                      columnInsurerConfig2RecordList.isNotEmpty
                          ? columnInsurerConfig2RecordList.first
                          : null;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'ประเภทการชำระเงิน',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFF1D4774),
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Text(
                                              '(บังคับเลือก)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: Color(0xFFFB0606),
                                                    fontSize: 12,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (!columnInsurerConfig2Record!
                                        .insurerFullPayment
                                        .contains(
                                            FFAppState().insuranceInfoCompayId))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().maxCurrentSelected =
                                                true;
                                            FFAppState().installmentSelected =
                                                false;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xFFB3B3B3),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Text(
                                                    'ชำระเต็มจำนวน',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                if (!FFAppState()
                                                    .maxCurrentSelected)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 0),
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF9F9F9F),
                                                          width: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                    .maxCurrentSelected)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 0),
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Icon(
                                                          Icons.check,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            if (!columnInsurerConfig2Record!.insurerInstallment
                                .contains(FFAppState().insuranceInfoCompayId))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().maxCurrentSelected = false;
                                  FFAppState().installmentSelected = true;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xFFB3B3B3),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'ผ่อนชำระ (เป้า ง)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFB3B3B3),
                                                fontSize: 15,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      if (!FFAppState().installmentSelected)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFF9F9F9F),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().installmentSelected)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                          ]
                              .divide(SizedBox(height: 12))
                              .addToStart(SizedBox(height: 12))
                              .addToEnd(SizedBox(height: 24)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(0, 0.75),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 50),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      if (!(FFAppState().maxCurrentSelected ||
                                          FFAppState().installmentSelected)) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'กรุณาเลือกการชำระเงิน'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if (widget!.fromPage == 'RenewBasic') {
                                        FFAppState().renewPaymentType =
                                            FFAppState().maxCurrentSelected
                                                ? 'จ่ายเต็ม'
                                                : 'ผ่อนชำระ';
                                        safeSetState(() {});
                                        context.safePop();
                                      } else {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: LoadingSceneWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        _model.save4APIOutput =
                                            await IbsApplicationsSaveCall.call(
                                          action: 'save_draft',
                                          quotationId: FFAppState()
                                              .insuranceInfoQuotationId,
                                          step: '4',
                                          paymentType:
                                              FFAppState().maxCurrentSelected
                                                  ? 'จ่ายเต็ม'
                                                  : 'ผ่อนชำระ',
                                          imageApplication: FFAppState()
                                              .insuranceInfoPage4ImageApplication,
                                          fileLoanApplicationRegister: FFAppState()
                                              .insuranceInfoPage4FileLoanApplicationRegister,
                                          insuranceUrl: FFAppState()
                                              .apiUrlInsuranceAppState,
                                          leadDtlId: FFAppState()
                                              .insuranceInfoLeadDetailId,
                                          token: FFAppState().accessToken,
                                          subProduct:
                                              FFAppState().insuranceinfoActType,
                                        );

                                        _shouldSetState = true;
                                        if ((_model.save4APIOutput
                                                    ?.statusCode ??
                                                200) !=
                                            200) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาด (${(_model.save4APIOutput?.statusCode ?? 200).toString()})'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (IbsApplicationsSaveCall
                                                .statuslayer1(
                                              (_model.save4APIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            200) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      IbsApplicationsSaveCall
                                                          .messageLayer1(
                                                    (_model.save4APIOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (IbsApplicationsSaveCall.paymenttype(
                                              (_model.save4APIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            'ผ่อนชำระ') {
                                          FFAppState()
                                                  .insuranceInfoPage4NetPremiumTotal =
                                              '${IbsApplicationsSaveCall.netpremiumtotal(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfoPage4GrossTotalNet =
                                              '${IbsApplicationsSaveCall.grosstotalnet(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfoPage4ActTotal =
                                              '${IbsApplicationsSaveCall.acttotal(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfoPage4PaymentChannel =
                                              '${IbsApplicationsSaveCall.paymentchannel(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfoPage4PaymentType =
                                              '${IbsApplicationsSaveCall.paymenttype(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfo4pagePaymentStatus =
                                              '${IbsApplicationsSaveCall.paymentstatus(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfo4pageStatus =
                                              '${IbsApplicationsSaveCall.status(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          safeSetState(() {});
                                          FFAppState()
                                                  .InsuranceInfoPage4PaymentFirst =
                                              IbsApplicationsSaveCall
                                                      .paymentfirst(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          FFAppState()
                                                  .InsuranceInfoPage4InstallmentFirstDue =
                                              IbsApplicationsSaveCall
                                                      .installmentfirstdue(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          FFAppState()
                                                  .InsuranceInfoPage4InstallmentLastDue =
                                              IbsApplicationsSaveCall
                                                      .installmentlastdue(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          FFAppState().InsuranceInfoPage4Tenor =
                                              IbsApplicationsSaveCall.tenor(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          safeSetState(() {});
                                        } else {
                                          FFAppState()
                                                  .insuranceInfoPage4NetPremiumTotal =
                                              '${IbsApplicationsSaveCall.netpremiumtotal(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfoPage4GrossTotalNet =
                                              '${IbsApplicationsSaveCall.grosstotalnet(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfoPage4ActTotal =
                                              '${IbsApplicationsSaveCall.acttotal(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfoPage4PaymentChannel =
                                              '${IbsApplicationsSaveCall.paymentchannel(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfoPage4PaymentType =
                                              '${IbsApplicationsSaveCall.paymenttype(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfo4pagePaymentStatus =
                                              '${IbsApplicationsSaveCall.paymentstatus(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          FFAppState()
                                                  .insuranceInfo4pageStatus =
                                              '${IbsApplicationsSaveCall.status(
                                            (_model.save4APIOutput?.jsonBody ??
                                                ''),
                                          )}';
                                          safeSetState(() {});
                                        }

                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'เลือกประเภทการชำระเงินสำเร็จ'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );

                                        context.pushNamed(
                                          'insuranceInfoPage4_2',
                                          queryParameters: {
                                            'quotationId': serializeParam(
                                              FFAppState()
                                                  .insuranceInfoQuotationId,
                                              ParamType.String,
                                            ),
                                            'leadDetailId': serializeParam(
                                              functions.stringToInteger(
                                                  FFAppState()
                                                      .insuranceInfoLeadDetailId),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );

                                        Navigator.pop(context);
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'ตกลง',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 60,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 24, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: Color(0xFFDB771B),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Colors.white,
                                            fontSize: 15,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              ].addToStart(SizedBox(height: 16)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
