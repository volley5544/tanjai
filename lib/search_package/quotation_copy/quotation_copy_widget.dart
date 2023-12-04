import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quotation_copy_model.dart';
export 'quotation_copy_model.dart';

class QuotationCopyWidget extends StatefulWidget {
  const QuotationCopyWidget({
    Key? key,
    required this.quotation,
  }) : super(key: key);

  final dynamic quotation;

  @override
  _QuotationCopyWidgetState createState() => _QuotationCopyWidgetState();
}

class _QuotationCopyWidgetState extends State<QuotationCopyWidget> {
  late QuotationCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuotationCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'QuotationCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().indexPdfQuotation = 0;
        FFAppState().lengthListPdfQuotation =
            functions.convertDynamicListToStringList(widget.quotation).length;
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
                context.safePop();
              },
            ),
            title: Text(
              'ใบเสนอราคา',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF003063),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (FFAppState().indexPdfQuotation != 0)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await _model.pageViewController?.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                              setState(() {
                                FFAppState().indexPdfQuotation =
                                    FFAppState().indexPdfQuotation + -1;
                              });
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color:
                                          FlutterFlowTheme.of(context).black600,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    'ก่อนหน้า',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (FFAppState().indexPdfQuotation == 0) Spacer(),
                        if (functions.containWordinStringUrl(
                                'pdf',
                                functions.convertDynamicListToStringList(
                                        widget.quotation)[
                                    FFAppState().indexPdfQuotation]) ??
                            true)
                          FFButtonWidget(
                            onPressed: () async {
                              await launchURL(
                                  functions.convertDynamicListToStringList(
                                          widget.quotation)[
                                      FFAppState().indexPdfQuotation]);
                            },
                            text: 'ดาวน์โหลด PDF',
                            options: FFButtonOptions(
                              width: 130.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        if (FFAppState().indexPdfQuotation ==
                            (FFAppState().lengthListPdfQuotation - 1))
                          Spacer(),
                        if (FFAppState().indexPdfQuotation !=
                            (FFAppState().lengthListPdfQuotation - 1))
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                              setState(() {
                                FFAppState().indexPdfQuotation =
                                    FFAppState().indexPdfQuotation + 1;
                              });
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Text(
                                      'ถัดไป',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color:
                                        FlutterFlowTheme.of(context).black600,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    final listPdf = functions
                        .convertDynamicListToStringList(widget.quotation)
                        .toList();
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: min(0, listPdf.length - 1)),
                            scrollDirection: Axis.vertical,
                            itemCount: listPdf.length,
                            itemBuilder: (context, listPdfIndex) {
                              final listPdfItem = listPdf[listPdfIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.containWordinStringUrl(
                                          'pdf',
                                          functions
                                              .convertDynamicListToStringList(
                                                  widget.quotation)[FFAppState()
                                              .indexPdfQuotation]) ??
                                      true)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {},
                                      onLongPress: () async {},
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: FlutterFlowPdfViewer(
                                          networkPath: functions
                                              .convertDynamicListToStringList(
                                                  widget.quotation)[FFAppState()
                                              .indexPdfQuotation],
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.85,
                                          horizontalScroll: false,
                                        ),
                                      ),
                                    ),
                                  if (!functions.containWordinStringUrl(
                                      'pdf',
                                      functions.convertDynamicListToStringList(
                                              widget.quotation)[
                                          FFAppState().indexPdfQuotation])!)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          functions.stringToImgPath(functions
                                              .convertDynamicListToStringList(
                                                  widget.quotation)[FFAppState()
                                              .indexPdfQuotation])!,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.90, -0.95),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 16.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage:
                                            min(0, listPdf.length - 1)),
                                count: listPdf.length,
                                axisDirection: Axis.vertical,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!
                                      .animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 2.0,
                                  spacing: 8.0,
                                  radius: 16.0,
                                  dotWidth: 16.0,
                                  dotHeight: 8.0,
                                  dotColor:
                                      FlutterFlowTheme.of(context).lineColor,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
