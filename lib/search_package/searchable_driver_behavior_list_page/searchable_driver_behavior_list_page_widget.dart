import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'searchable_driver_behavior_list_page_model.dart';
export 'searchable_driver_behavior_list_page_model.dart';

class SearchableDriverBehaviorListPageWidget extends StatefulWidget {
  const SearchableDriverBehaviorListPageWidget({
    super.key,
    String? titleText,
    required this.searchLabel,
    bool? multiSelect,
    int? maxSelected,
    this.fromPage,
    this.index,
  })  : this.titleText = titleText ?? 'เลือก...',
        this.multiSelect = multiSelect ?? false,
        this.maxSelected = maxSelected ?? 0;

  final String titleText;
  final String? searchLabel;
  final bool multiSelect;
  final int maxSelected;
  final String? fromPage;
  final int? index;

  static String routeName = 'SearchableDriverBehaviorListPage';
  static String routePath = 'SearchableDriverBehaviorListPage';

  @override
  State<SearchableDriverBehaviorListPageWidget> createState() =>
      _SearchableDriverBehaviorListPageWidgetState();
}

class _SearchableDriverBehaviorListPageWidgetState
    extends State<SearchableDriverBehaviorListPageWidget> {
  late SearchableDriverBehaviorListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => SearchableDriverBehaviorListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchableDriverBehaviorListPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().searchableListComponentData = FFAppState()
          .driverBehaviorData
          .driverBehaviorName
          .toList()
          .cast<String>();
      FFAppState().searchableListComponentSelectedList = functions
          .createFalseListByItemNumber(
              false, FFAppState().driverBehaviorData.driverBehaviorName.length)!
          .toList()
          .cast<bool>();
      safeSetState(() {});
      FFAppState().searchableListComponentSelectedList = functions
          .setBoolValueListAtIndex(
              functions
                  .createFalseListByItemNumber(false,
                      FFAppState().driverBehaviorData.driverBehavior.length)
                  ?.toList(),
              functions.getIndexOfSomethingList(
                  FFAppState().driverBehaviorData.driverBehaviorName.toList(),
                  FFAppState().insuranceBasicDriverBehaviorName))!
          .toList()
          .cast<bool>();
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFFAFAFA),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB7619),
                size: 30.0,
              ),
            ),
            title: Text(
              widget!.titleText,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.notoSansThai(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Color(0xFF123063),
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
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
                        if (widget!.multiSelect)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget!.multiSelect &&
                                          (widget!.maxSelected > 0)
                                      ? 'สามารถเลือกได้สูงสุด ${widget!.maxSelected.toString()} รายการ (${widget!.multiSelect && (widget!.maxSelected > 0) ? '${functions.countTrueInBoolList(FFAppState().searchableListComponentSelectedList.toList()).toString()}/${widget!.maxSelected.toString()}' : 'เลือกแล้ว ${functions.countTrueInBoolList(FFAppState().searchableListComponentSelectedList.toList()).toString()} รายการ'}'
                                      : 'สามารถเลือกได้มากกว่า 1 รายการ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        if (FFAppState()
                                .driverBehaviorData
                                .driverBehaviorName
                                .length >
                            5)
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 100),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintText: widget!.searchLabel,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.notoSansThai(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.search_outlined,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansThai(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget!.titleText == 'ค้นหาที่อยู่'
                            ? (_model.textController.text != null &&
                                _model.textController.text != '')
                            : true)
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final dataList = FFAppState()
                                      .driverBehaviorData
                                      .driverBehaviorName
                                      .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: dataList.length,
                                    itemBuilder: (context, dataListIndex) {
                                      final dataListItem =
                                          dataList[dataListIndex];
                                      return Visibility(
                                        visible: (_model.textController.text ==
                                                    null ||
                                                _model.textController.text ==
                                                    '') ||
                                            functions.containWordinStringUrl(
                                                _model.textController.text
                                                    .toUpperCase(),
                                                dataListItem)!,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (widget!.multiSelect) {
                                              if (widget!.maxSelected == 0) {
                                                FFAppState()
                                                    .updateSearchableListComponentSelectedListAtIndex(
                                                  dataListIndex,
                                                  (_) => FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .elementAtOrNull(
                                                                  dataListIndex) ==
                                                          true
                                                      ? false
                                                      : true,
                                                );
                                                safeSetState(() {});
                                              } else {
                                                if (functions.countTrueInBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList())! >=
                                                    widget!.maxSelected) {
                                                  FFAppState()
                                                      .updateSearchableListComponentSelectedListAtIndex(
                                                    dataListIndex,
                                                    (_) => false,
                                                  );
                                                  safeSetState(() {});
                                                } else {
                                                  FFAppState()
                                                      .updateSearchableListComponentSelectedListAtIndex(
                                                    dataListIndex,
                                                    (_) => FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .elementAtOrNull(
                                                                    dataListIndex) ==
                                                            true
                                                        ? false
                                                        : true,
                                                  );
                                                  safeSetState(() {});
                                                }
                                              }
                                            } else {
                                              FFAppState()
                                                      .searchableListComponentSelectedList =
                                                  functions
                                                      .setBoolValueListAtIndex(
                                                          functions
                                                              .createFalseListByItemNumber(
                                                                  false,
                                                                  FFAppState()
                                                                      .driverBehaviorData
                                                                      .driverBehavior
                                                                      .length)
                                                              ?.toList(),
                                                          dataListIndex)!
                                                      .toList()
                                                      .cast<bool>();
                                              safeSetState(() {});
                                              if ('${widget!.fromPage}' ==
                                                  'NonePackage') {
                                                FFAppState()
                                                        .nonePackageDriverBehaviorName =
                                                    dataListItem;
                                                FFAppState()
                                                        .nonePackageDriverBehaviorCode =
                                                    FFAppState()
                                                        .driverBehaviorData
                                                        .driverBehavior
                                                        .elementAtOrNull(
                                                            dataListIndex)!;
                                                FFAppState()
                                                        .nonePackageDriverBehaviorFlag =
                                                    FFAppState()
                                                        .driverBehaviorData
                                                        .driverBehaviorFlag
                                                        .elementAtOrNull(
                                                            dataListIndex)!;
                                                safeSetState(() {});
                                              } else {
                                                if ('${widget!.fromPage}' ==
                                                    'AddDriver') {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text('1'),
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
                                                  FFAppState()
                                                      .updateDriverListAtIndex(
                                                    widget!.index!,
                                                    (e) => e
                                                      ..driverBehavior =
                                                          FFAppState()
                                                              .driverBehaviorData
                                                              .driverBehavior
                                                              .elementAtOrNull(
                                                                  dataListIndex),
                                                  );
                                                  safeSetState(() {});
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text('2'),
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
                                                } else {
                                                  FFAppState()
                                                          .insuranceBasicDriverBehaviorName =
                                                      dataListItem;
                                                  FFAppState()
                                                          .insuranceBasicDriverBehaviorCode =
                                                      FFAppState()
                                                          .driverBehaviorData
                                                          .driverBehavior
                                                          .elementAtOrNull(
                                                              dataListIndex)!;
                                                  FFAppState()
                                                          .insuranceBasicDriverBehaviorFlag =
                                                      FFAppState()
                                                          .driverBehaviorData
                                                          .driverBehaviorFlag
                                                          .elementAtOrNull(
                                                              dataListIndex)!;
                                                  safeSetState(() {});
                                                }
                                              }

                                              if (FFAppState()
                                                      .driverBehaviorData
                                                      .driverBehaviorFlag
                                                      .elementAtOrNull(
                                                          dataListIndex)! ||
                                                  ('${widget!.fromPage}' ==
                                                      'NonePackage') ||
                                                  ('${widget!.fromPage}' ==
                                                      'AddDriver')) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text('3'),
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
                                                context.safePop();
                                              } else {
                                                context.goNamed(
                                                    InsuranceWorkSelectPageWidget
                                                        .routeName);
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${FFAppState().driverBehaviorData.driverBehavior.elementAtOrNull(dataListIndex)} ${dataListItem}${FFAppState().driverBehaviorData.driverBehaviorFlag.elementAtOrNull(dataListIndex)! || ('${widget!.fromPage}' == 'NonePackage') ? '' : ' (เฉพาะงานนอกเรท)'}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      if (FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .elementAtOrNull(
                                                                  dataListIndex) ??
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.check_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .success,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                              ],
                                            ),
                                          ),
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
                  if (widget!.multiSelect)
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                        font: GoogleFonts.notoSansThai(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
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
