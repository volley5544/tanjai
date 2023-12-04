import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pdf_page_view_component_model.dart';
export 'pdf_page_view_component_model.dart';

class PdfPageViewComponentWidget extends StatefulWidget {
  const PdfPageViewComponentWidget({
    Key? key,
    required this.pdfUrlList,
  }) : super(key: key);

  final BannerDataStruct? pdfUrlList;

  @override
  _PdfPageViewComponentWidgetState createState() =>
      _PdfPageViewComponentWidgetState();
}

class _PdfPageViewComponentWidgetState
    extends State<PdfPageViewComponentWidget> {
  late PdfPageViewComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfPageViewComponentModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(-0.90, -0.85),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: FaIcon(
                          FontAwesomeIcons.times,
                          color: Color(0xFFFF0000),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    final pdfListItem =
                        widget.pdfUrlList?.pdfUrl?.toList() ?? [];
                    return Container(
                      width: double.infinity,
                      height: 500.0,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage:
                                          min(0, pdfListItem.length - 1)),
                              scrollDirection: Axis.horizontal,
                              itemCount: pdfListItem.length,
                              itemBuilder: (context, pdfListItemIndex) {
                                final pdfListItemItem =
                                    pdfListItem[pdfListItemIndex];
                                return Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(),
                                  child: FlutterFlowPdfViewer(
                                    networkPath: widget
                                        .pdfUrlList!.pdfUrl[pdfListItemIndex],
                                    height: 300.0,
                                    horizontalScroll: false,
                                  ),
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 16.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage:
                                            min(0, pdfListItem.length - 1)),
                                count: pdfListItem.length,
                                axisDirection: Axis.horizontal,
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
                                      FlutterFlowTheme.of(context).accent1,
                                  activeDotColor: Color(0xFFDB771B),
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
