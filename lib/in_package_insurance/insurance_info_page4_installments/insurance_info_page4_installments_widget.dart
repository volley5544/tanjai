import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'insurance_info_page4_installments_model.dart';
export 'insurance_info_page4_installments_model.dart';

class InsuranceInfoPage4InstallmentsWidget extends StatefulWidget {
  const InsuranceInfoPage4InstallmentsWidget({
    Key? key,
    String? titleText,
    required this.searchLabel,
    required this.dataList,
    bool? multiSelect,
    int? maxSelected,
    String? fromPage,
  })  : this.titleText = titleText ?? 'เลือก...',
        this.multiSelect = multiSelect ?? false,
        this.maxSelected = maxSelected ?? 0,
        this.fromPage = fromPage ?? '-',
        super(key: key);

  final String titleText;
  final String? searchLabel;
  final List<String>? dataList;
  final bool multiSelect;
  final int maxSelected;
  final String fromPage;

  @override
  _InsuranceInfoPage4InstallmentsWidgetState createState() =>
      _InsuranceInfoPage4InstallmentsWidgetState();
}

class _InsuranceInfoPage4InstallmentsWidgetState
    extends State<InsuranceInfoPage4InstallmentsWidget> {
  late InsuranceInfoPage4InstallmentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceInfoPage4InstallmentsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insuranceInfoPage4_installments'});
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
          backgroundColor: Color(0xFFFAFAFA),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: Icon(
              Icons.arrow_back,
              color: Color(0xFFDB7619),
              size: 30.0,
            ),
            title: Text(
              'จำนวนงวด',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF123063),
                    fontSize: 16.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final dataList = widget.dataList!.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: dataList.length,
                                  itemBuilder: (context, dataListIndex) {
                                    final dataListItem =
                                        dataList[dataListIndex];
                                    return Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '1',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                if (FFAppState()
                                                        .searchableListComponentSelectedList[
                                                    dataListIndex])
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Icon(
                                                      Icons.check_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToStart(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 24.0)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'ตกลง',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFDB771B),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                        ].addToStart(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
