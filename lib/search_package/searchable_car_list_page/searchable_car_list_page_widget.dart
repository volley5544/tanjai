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
import 'searchable_car_list_page_model.dart';
export 'searchable_car_list_page_model.dart';

class SearchableCarListPageWidget extends StatefulWidget {
  const SearchableCarListPageWidget({
    super.key,
    String? titleText,
    required this.searchLabel,
    required this.dataList,
    bool? multiSelect,
    int? maxSelected,
    String? fromPage,
  })  : this.titleText = titleText ?? 'เลือก...',
        this.multiSelect = multiSelect ?? false,
        this.maxSelected = maxSelected ?? 0,
        this.fromPage = fromPage ?? '-';

  final String titleText;
  final String? searchLabel;
  final List<String>? dataList;
  final bool multiSelect;
  final int maxSelected;
  final String fromPage;

  static String routeName = 'SearchableCarListPage';
  static String routePath = 'SearchableCarListPage';

  @override
  State<SearchableCarListPageWidget> createState() =>
      _SearchableCarListPageWidgetState();
}

class _SearchableCarListPageWidgetState
    extends State<SearchableCarListPageWidget> {
  late SearchableCarListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchableCarListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchableCarListPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.titleText == 'เลือกประเภทชั้นประกัน') {
        if (widget!.fromPage != 'NonePackage') {
          FFAppState().searchableListComponentData =
              widget!.dataList!.toList().cast<String>();
          FFAppState().searchableListComponentSelectedList = functions
              .createFalseListByItemNumber(true, widget!.dataList?.length)!
              .toList()
              .cast<bool>();
          safeSetState(() {});
          return;
        }
      }
      FFAppState().searchableListComponentData =
          widget!.dataList!.toList().cast<String>();
      FFAppState().searchableListComponentSelectedList = functions
          .createFalseListByItemNumber(false, widget!.dataList?.length)!
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
                        if (false)
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
                        if ((widget!.dataList!.length > 5) && false)
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
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  if ((_model.textController.text == null ||
                                          _model.textController.text == '') ||
                                      functions.containWordinStringUrl(
                                          _model.textController.text
                                              .toUpperCase(),
                                          'รถเก๋ง')!)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget!.multiSelect) {
                                            if (widget!.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget!.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'RenewStep2')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'act'))) {
                                              if ((widget!.fromPage ==
                                                      'searchPackage') ||
                                                  (widget!.fromPage == 'act')) {
                                                FFAppState()
                                                        .insuranceVehicleTypeDropDown =
                                                    'รถเก๋ง';
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  0,
                                                  (_) => true,
                                                );
                                                FFAppState()
                                                        .insuranceCarTypeDetailSelected =
                                                    'รถเก๋ง';
                                                FFAppState()
                                                        .insuranceBasicVehicleGroup =
                                                    'OTHER';
                                                FFAppState()
                                                        .insuranceBasicCarTypeContain =
                                                    '-';
                                                FFAppState()
                                                        .insuranceBasicCarTypeDoors =
                                                    '-';
                                                safeSetState(() {});
                                                FFAppState().insuranceBasicBrandNameList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().insuranceBasicBrandIdList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                FFAppState()
                                                        .insuranceBasicBrandName =
                                                    'เลือกยี่ห้อรถ';
                                                FFAppState()
                                                    .insuranceBasicBrandId = '';
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    'เลือกรุ่นรถ';
                                                FFAppState()
                                                    .insuranceBasicModelId = '';
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .insuranceBasicBrandNameList
                                                        .length <=
                                                    0) {
                                                  FFAppState()
                                                          .insuranceVehicleTypeDropDown =
                                                      'เลือกประเภทรถ';
                                                  safeSetState(() {});
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ไม่พบข้อมูลประกัน'),
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

                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget!.fromPage ==
                                                    'NonePackage') {
                                                  FFAppState()
                                                          .nonePackageVehicleType =
                                                      'รถเก๋ง';
                                                  FFAppState()
                                                          .insuranceCarTypeDetailSelected =
                                                      'รถเก๋ง';
                                                  FFAppState()
                                                          .nonepackagevehicletypeDetail =
                                                      'รถเก๋ง';
                                                  safeSetState(() {});
                                                  FFAppState()
                                                          .insuranceBasicVehicleGroup =
                                                      'OTHER';
                                                  FFAppState()
                                                          .insuranceBasicCarTypeContain =
                                                      '-';
                                                  FFAppState()
                                                          .insuranceBasicCarTypeDoors =
                                                      '-';
                                                  FFAppState().insuranceBasicBrandNameList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState().insuranceBasicBrandIdList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget!.fromPage ==
                                                      'RenewStep2') {
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถเก๋ง';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถเก๋ง';
                                                    FFAppState()
                                                            .insuranceInfoVehicleType =
                                                        'รถเก๋ง';
                                                    safeSetState(() {});
                                                    FFAppState()
                                                            .insuranceBasicVehicleGroup =
                                                        'OTHER';
                                                    FFAppState()
                                                            .insuranceBasicCarTypeContain =
                                                        '-';
                                                    FFAppState()
                                                            .insuranceBasicCarTypeDoors =
                                                        '-';
                                                    safeSetState(() {});
                                                    context.safePop();
                                                    return;
                                                  }
                                                }
                                              }

                                              return;
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.5,
                                            ),
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
                                                        'รถเก๋ง',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/0a22b_.png',
                                                          width: 90.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((_model.textController.text == null ||
                                          _model.textController.text == '') ||
                                      functions.containWordinStringUrl(
                                          _model.textController.text
                                              .toUpperCase(),
                                          'รถเก๋ง')!)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget!.multiSelect) {
                                            if (widget!.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget!.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'RenewStep2')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'act'))) {
                                              if ((widget!.fromPage ==
                                                      'searchPackage') ||
                                                  (widget!.fromPage == 'act')) {
                                                FFAppState()
                                                        .insuranceVehicleTypeDropDown =
                                                    'รถตู้';
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  0,
                                                  (_) => true,
                                                );
                                                FFAppState()
                                                        .insuranceCarTypeDetailSelected =
                                                    'รถตู้';
                                                FFAppState()
                                                        .insuranceBasicVehicleGroup =
                                                    'VAN';
                                                FFAppState()
                                                        .insuranceBasicCarTypeContain =
                                                    '-';
                                                FFAppState()
                                                        .insuranceBasicCarTypeDoors =
                                                    '-';
                                                safeSetState(() {});
                                                FFAppState().insuranceBasicBrandNameList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().insuranceBasicBrandIdList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                FFAppState()
                                                        .insuranceBasicBrandName =
                                                    'เลือกยี่ห้อรถ';
                                                FFAppState()
                                                    .insuranceBasicBrandId = '';
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    'เลือกรุ่นรถ';
                                                FFAppState()
                                                    .insuranceBasicModelId = '';
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .insuranceBasicBrandNameList
                                                        .length <=
                                                    0) {
                                                  FFAppState()
                                                          .insuranceVehicleTypeDropDown =
                                                      'เลือกประเภทรถ';
                                                  safeSetState(() {});
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ไม่พบข้อมูลประกัน'),
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

                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget!.fromPage ==
                                                    'NonePackage') {
                                                  FFAppState()
                                                          .nonePackageVehicleType =
                                                      'รถตู้';
                                                  FFAppState()
                                                          .insuranceCarTypeDetailSelected =
                                                      'รถตู้';
                                                  FFAppState()
                                                          .nonepackagevehicletypeDetail =
                                                      'รถตู้';
                                                  FFAppState()
                                                          .insuranceBasicVehicleGroup =
                                                      'VAN';
                                                  safeSetState(() {});
                                                  FFAppState()
                                                          .insuranceBasicVehicleGroup =
                                                      'VAN';
                                                  FFAppState()
                                                          .insuranceBasicCarTypeContain =
                                                      '-';
                                                  FFAppState()
                                                          .insuranceBasicCarTypeDoors =
                                                      '-';
                                                  FFAppState().insuranceBasicBrandNameList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState().insuranceBasicBrandIdList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget!.fromPage ==
                                                      'RenewStep2') {
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถตู้';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถตู้';
                                                    FFAppState()
                                                            .insuranceBasicVehicleGroup =
                                                        'VAN';
                                                    FFAppState()
                                                            .insuranceInfoVehicleType =
                                                        'รถตู้';
                                                    safeSetState(() {});
                                                    FFAppState()
                                                            .insuranceBasicVehicleGroup =
                                                        'VAN';
                                                    FFAppState()
                                                            .insuranceBasicCarTypeContain =
                                                        '-';
                                                    FFAppState()
                                                            .insuranceBasicCarTypeDoors =
                                                        '-';
                                                    safeSetState(() {});
                                                    context.safePop();
                                                    return;
                                                  }
                                                }
                                              }

                                              return;
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.5,
                                            ),
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
                                                        'รถตู้',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/8h5d5_.png',
                                                          width: 90.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((_model.textController.text == null ||
                                          _model.textController.text == '') ||
                                      functions.containWordinStringUrl(
                                          _model.textController.text
                                              .toUpperCase(),
                                          'รถเก๋ง')!)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget!.multiSelect) {
                                            if (widget!.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget!.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'RenewStep2')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'act'))) {
                                              if ((widget!.fromPage ==
                                                      'searchPackage') ||
                                                  (widget!.fromPage == 'act')) {
                                                FFAppState()
                                                        .insuranceVehicleTypeDropDown =
                                                    'รถกระบะ';
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  0,
                                                  (_) => true,
                                                );
                                                FFAppState()
                                                        .insuranceCarTypeDetailSelected =
                                                    'รถกระบะ 2 ประตู';
                                                FFAppState()
                                                        .insuranceBasicVehicleGroup =
                                                    'PICKUP';
                                                safeSetState(() {});
                                                FFAppState().insuranceBasicBrandNameList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().insuranceBasicBrandIdList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .insuranceBasicBrandNameList
                                                        .length <=
                                                    0) {
                                                  FFAppState()
                                                          .insuranceVehicleTypeDropDown =
                                                      'เลือกประเภทรถ';
                                                  safeSetState(() {});
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ไม่พบข้อมูลประกัน'),
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

                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                }
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed(
                                                  SearchablePickUpListPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกประเภทรถกระบะ 2 ประตู',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'ระบุประเภทรถ',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      FFAppState()
                                                          .insuranceBasicVehicleTypeDropdownList,
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'maxSelected':
                                                        serializeParam(
                                                      0,
                                                      ParamType.int,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'searchPackage',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                return;
                                              } else {
                                                if (widget!.fromPage ==
                                                    'NonePackage') {
                                                  FFAppState()
                                                          .nonePackageVehicleType =
                                                      'รถกระบะ';
                                                  FFAppState()
                                                          .insuranceCarTypeDetailSelected =
                                                      'รถกระบะ 2 ประตู';
                                                  FFAppState()
                                                          .nonepackagevehicletypeDetail =
                                                      'รถกระบะ 2 ประตู';
                                                  FFAppState()
                                                          .insuranceBasicVehicleGroup =
                                                      'PICKUP';
                                                  safeSetState(() {});
                                                  FFAppState().insuranceBasicBrandNameList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState().insuranceBasicBrandIdList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  safeSetState(() {});
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    SearchablePickUpListPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'titleText':
                                                          serializeParam(
                                                        'เลือกประเภทรถกระบะ 2 ประตู',
                                                        ParamType.String,
                                                      ),
                                                      'searchLabel':
                                                          serializeParam(
                                                        'ระบุประเภทรถ',
                                                        ParamType.String,
                                                      ),
                                                      'dataList':
                                                          serializeParam(
                                                        FFAppState()
                                                            .insuranceBasicVehicleTypeDropdownList,
                                                        ParamType.String,
                                                        isList: true,
                                                      ),
                                                      'multiSelect':
                                                          serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                      'maxSelected':
                                                          serializeParam(
                                                        0,
                                                        ParamType.int,
                                                      ),
                                                      'fromPage':
                                                          serializeParam(
                                                        'NonePackage',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  return;
                                                } else {
                                                  if (widget!.fromPage ==
                                                      'RenewStep2') {
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถกระบะ 2 ประตู';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถกระบะ 2 ประตู';
                                                    FFAppState()
                                                            .insuranceBasicVehicleGroup =
                                                        'PICKUP';
                                                    FFAppState()
                                                            .insuranceInfoVehicleType =
                                                        'รถกระบะ';
                                                    safeSetState(() {});
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context.pushNamed(
                                                      SearchablePickUpListPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'titleText':
                                                            serializeParam(
                                                          'เลือกประเภทรถกระบะ 2 ประตู',
                                                          ParamType.String,
                                                        ),
                                                        'searchLabel':
                                                            serializeParam(
                                                          'ระบุประเภทรถ',
                                                          ParamType.String,
                                                        ),
                                                        'dataList':
                                                            serializeParam(
                                                          FFAppState()
                                                              .insuranceBasicVehicleTypeDropdownList,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                        'multiSelect':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                        'maxSelected':
                                                            serializeParam(
                                                          0,
                                                          ParamType.int,
                                                        ),
                                                        'fromPage':
                                                            serializeParam(
                                                          'RenewStep2',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    return;
                                                  }
                                                }
                                              }

                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกยี่ห้อรถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicBrandName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .isSelectBrandInPackage =
                                                    true;
                                                FFAppState()
                                                        .insuranceBasicBrandId =
                                                    FFAppState()
                                                        .insuranceBasicBrandIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                FFAppState().insuranceBasicModelNameList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().insuranceBasicModelIdList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    'เลือกรุ่นรถ';
                                                FFAppState()
                                                    .insuranceBasicModelId = '';
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  1,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .insuranceBasicModelNameList
                                                        .length <=
                                                    0) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ไม่พบข้อมูลประกัน'),
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

                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageBrandName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .nonePackageBrandId =
                                                    FFAppState()
                                                        .insuranceBasicBrandIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageIsBrandSelect =
                                                    true;
                                                safeSetState(() {});
                                                FFAppState().nonePackageSearchModelList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().nonePackageSearchModelIdList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกปีจดทะเบียน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicYear =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  3,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().nonePackageYear =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกลักษณะการใช้รถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState().insuranceBasicVehicleUsedTypeId = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeIdList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().insuranceBasicVehicleUsedTypeName = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeNameList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  4,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().nonePackageUsedTypeId = FFAppState()
                                                    .nonePackageUsedTypeIdList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().nonePackageUsedTypeCode = FFAppState()
                                                    .nonePackageUsedTypeCodeList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().nonePackageUsedTypeName = FFAppState()
                                                    .nonePackageUsedTypeNameList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทชั้นประกัน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicCoverTypeNameOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget!.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicCoverTypeIdOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicCoverTypeIdList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicCoverTypeCodeOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicCoverTypeCodeList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageCoverTypeId =
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageCoverTypeCode =
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeCodeList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageCoverTypeName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทการซ่อม') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicGarageTypeInPackage =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicGarageTypeNameList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicGarageTypeIdInPackage =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicGarageTypeIdList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageGarageTypeId =
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageGarageTypeName =
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeNameList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageGarageTypeCode =
                                                    FFAppState()
                                                        .nonePackageGarageTypeCodeList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                              FFAppState().filterInsurerList = functions
                                                  .returnMappedListFromBoolList(
                                                      widget!.dataList
                                                          ?.toList(),
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบชั้นประกัน') {
                                              FFAppState().filterCoverTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget!.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                              FFAppState()
                                                      .filterGarageTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget!.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ประเภทบัตร') {
                                              FFAppState()
                                                      .insuranceInfoCardType =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText == 'เพศ') {
                                              FFAppState().insuranceInfoGender =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState().insuranceInfoTitle =
                                                  'เลือกคำนำหน้าชื่อ';
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'คำนำหน้า') {
                                              FFAppState().insuranceInfoTitle =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'กลุ่มอาชีพ') {
                                              FFAppState()
                                                      .insuranceInfoOccupationGroup =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationCode =
                                                  (functions
                                                      .removeDupeInList(FFAppState()
                                                          .insuranceInfoOccupationCode
                                                          .toList())!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationName =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubCode =
                                                  functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceInfoOccupationSubCode
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoOccupationName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoSelectOccupationName)
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubName =
                                                  functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceInfoOccupationSubName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoOccupationName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoSelectOccupationName)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              FFAppState()
                                                  .insuranceInfoSelectOccupationSubNameChoose = '';
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกจังหวัดจดทะเบียน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageProvinceId =
                                                  FFAppState()
                                                      .insuranceBasicProvinceIdList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState().nonePackageProvince =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาที่อยู่') {
                                              if (widget!.fromPage ==
                                                  'addAddressIdCard') {
                                                FFAppState()
                                                        .addAddressSelectProvinceId =
                                                    FFAppState()
                                                        .addAddressProvinceId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectProvinceName =
                                                    FFAppState()
                                                        .addAddressProvinceName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDistrictName =
                                                    FFAppState()
                                                        .addAddressDistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectSubdistrictName =
                                                    FFAppState()
                                                        .addAddressSubdistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectZipCode =
                                                    FFAppState()
                                                        .addAddressZipCode
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectKeyWord =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressAtIdCard =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().addAddressForDoc =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocProvinceId =
                                                    FFAppState()
                                                        .addAddressProvinceId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocProvinceName =
                                                    FFAppState()
                                                        .addAddressProvinceName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocDistrictName =
                                                    FFAppState()
                                                        .addAddressDistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDocSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDocSubdistrictName =
                                                    FFAppState()
                                                        .addAddressSubdistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocZipCode =
                                                    FFAppState()
                                                        .addAddressZipCode
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocKeyWord =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทตู้เหล็ก') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageCarrierType =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกส่วนของรถบรรทุก') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageTruckPart =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทลูกค้า') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageCusMembership =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกปีที่ผลิต') {
                                              FFAppState()
                                                      .insuranceInfoProductYear =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'จำนวนงวด') {
                                              FFAppState()
                                                      .insuranceInfoPage4SelectTenor =
                                                  FFAppState()
                                                      .InsuranceInfoPage4Tenor
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoPage4SelectInstallMentFirstDue =
                                                  FFAppState()
                                                      .InsuranceInfoPage4InstallmentFirstDue
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoPage4SelectInstallMentLastDue =
                                                  FFAppState()
                                                      .InsuranceInfoPage4InstallmentLastDue
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกบริษัทประกัน') {
                                              if (widget!.fromPage ==
                                                  'NonePackageSelectedInsurer') {
                                                FFAppState()
                                                        .nonePackageSelectedInsurerShortName =
                                                    FFAppState()
                                                        .nonePackageSelectedInsurerShortNameList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกจังหวัดที่จดทะเบียน') {
                                              FFAppState()
                                                      .insuranceInfoRegistrationCodeSelect =
                                                  FFAppState()
                                                      .insuranceInfoRegistrationCodeList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoRegistrationProvinceSelect =
                                                  FFAppState()
                                                      .insuranceInfoRegistrationprovinceList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกรุ่นรถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .insuranceBasicModelId =
                                                    FFAppState()
                                                        .insuranceBasicModelIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  2,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText == 'อาชีพ') {
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubNameChoose =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.5,
                                            ),
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
                                                        'รถกระบะ 2 ประตู',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/__().png',
                                                          width: 90.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((_model.textController.text == null ||
                                          _model.textController.text == '') ||
                                      functions.containWordinStringUrl(
                                          _model.textController.text
                                              .toUpperCase(),
                                          'รถเก๋ง')!)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget!.multiSelect) {
                                            if (widget!.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget!.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'RenewStep2')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'act'))) {
                                              if ((widget!.fromPage ==
                                                      'searchPackage') ||
                                                  (widget!.fromPage == 'act')) {
                                                FFAppState()
                                                        .insuranceVehicleTypeDropDown =
                                                    'รถกระบะ';
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  0,
                                                  (_) => true,
                                                );
                                                FFAppState()
                                                        .insuranceCarTypeDetailSelected =
                                                    'รถกระบะ 4 ประตู';
                                                FFAppState()
                                                        .insuranceBasicVehicleGroup =
                                                    'PICKUP';
                                                FFAppState()
                                                        .insuranceBasicCarTypeContain =
                                                    '-';
                                                FFAppState()
                                                        .insuranceBasicCarTypeDoors =
                                                    '4 Doors';
                                                safeSetState(() {});
                                                FFAppState().insuranceBasicBrandNameList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().insuranceBasicBrandIdList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                FFAppState()
                                                        .insuranceBasicBrandName =
                                                    'เลือกยี่ห้อรถ';
                                                FFAppState()
                                                    .insuranceBasicBrandId = '';
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    'เลือกรุ่นรถ';
                                                FFAppState()
                                                    .insuranceBasicModelId = '';
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .insuranceBasicBrandNameList
                                                        .length <=
                                                    0) {
                                                  FFAppState()
                                                          .insuranceVehicleTypeDropDown =
                                                      'เลือกประเภทรถ';
                                                  safeSetState(() {});
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ไม่พบข้อมูลประกัน'),
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

                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget!.fromPage ==
                                                    'NonePackage') {
                                                  FFAppState()
                                                          .nonePackageVehicleType =
                                                      'รถกระบะ';
                                                  FFAppState()
                                                          .insuranceCarTypeDetailSelected =
                                                      'รถกระบะ 4 ประตู';
                                                  FFAppState()
                                                          .nonepackagevehicletypeDetail =
                                                      'รถกระบะ 4 ประตู';
                                                  FFAppState()
                                                          .insuranceBasicVehicleGroup =
                                                      'PICKUP';
                                                  safeSetState(() {});
                                                  FFAppState()
                                                          .insuranceBasicVehicleGroup =
                                                      'PICKUP';
                                                  FFAppState()
                                                          .insuranceBasicCarTypeContain =
                                                      '-';
                                                  FFAppState()
                                                          .insuranceBasicCarTypeDoors =
                                                      '4 Doors';
                                                  FFAppState().insuranceBasicBrandNameList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState().insuranceBasicBrandIdList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget!.fromPage ==
                                                      'RenewStep2') {
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถกระบะ 4 ประตู';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถกระบะ 4 ประตู';
                                                    FFAppState()
                                                            .insuranceBasicVehicleGroup =
                                                        'PICKUP';
                                                    FFAppState()
                                                            .insuranceInfoVehicleType =
                                                        'รถกระบะ';
                                                    safeSetState(() {});
                                                    FFAppState()
                                                            .insuranceBasicVehicleGroup =
                                                        'PICKUP';
                                                    FFAppState()
                                                            .insuranceBasicCarTypeContain =
                                                        '-';
                                                    FFAppState()
                                                            .insuranceBasicCarTypeDoors =
                                                        '4 Doors';
                                                    safeSetState(() {});
                                                    context.safePop();
                                                    return;
                                                  }
                                                }
                                              }

                                              return;
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.5,
                                            ),
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
                                                        'รถกระบะ 4 ประตู',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/_4_.png',
                                                          width: 90.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget!.fromPage != 'act')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget!.multiSelect) {
                                            if (widget!.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget!.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'RenewStep2'))) {
                                              if (widget!.fromPage ==
                                                  'searchPackage') {
                                                if (true) {
                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                } else {
                                                  if ((widget!.dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true))) ==
                                                      'รถแต่ง ต่อคอก') {
                                                    context.goNamed(
                                                        InsuranceWorkSelectPageWidget
                                                            .routeName);

                                                    return;
                                                  }
                                                }

                                                FFAppState()
                                                        .insuranceVehicleTypeDropDown =
                                                    'รถบรรทุก หัวลาก หางพ่วง';
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  0,
                                                  (_) => true,
                                                );
                                                FFAppState()
                                                        .insuranceBasicVehicleGroup =
                                                    'OTHERS';
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget!.fromPage ==
                                                    'NonePackage') {
                                                  FFAppState()
                                                          .nonePackageVehicleType =
                                                      'รถบรรทุก หัวลาก หางพ่วง';
                                                  FFAppState()
                                                          .insuranceCarTypeDetailSelected =
                                                      'รถบรรทุก หัวลาก หางพ่วง';
                                                  FFAppState()
                                                          .nonepackagevehicletypeDetail =
                                                      'รถบรรทุก หัวลาก หางพ่วง';
                                                  safeSetState(() {});
                                                  FFAppState()
                                                          .insuranceBasicVehicleGroup =
                                                      'TRUCK';
                                                  FFAppState()
                                                          .insuranceBasicCarTypeContain =
                                                      '-';
                                                  FFAppState()
                                                          .insuranceBasicCarTypeDoors =
                                                      '-';
                                                  FFAppState().insuranceBasicBrandNameList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState().insuranceBasicBrandIdList = functions
                                                      .returnMappedListFrom2ListContain(
                                                          FFAppState()
                                                              .insuranceBasicBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroupBrandList
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicVehicleGroup)
                                                      .toList()
                                                      .cast<String>();
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget!.fromPage ==
                                                      'RenewStep2') {
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถบรรทุก หัวลาก หางพ่วง';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถบรรทุก หัวลาก หางพ่วง';
                                                    FFAppState()
                                                            .insuranceInfoVehicleType =
                                                        'รถบรรทุก หัวลาก หางพ่วง';
                                                    safeSetState(() {});
                                                    FFAppState()
                                                            .insuranceBasicVehicleGroup =
                                                        'TRUCK';
                                                    FFAppState()
                                                            .insuranceBasicCarTypeContain =
                                                        '-';
                                                    FFAppState()
                                                            .insuranceBasicCarTypeDoors =
                                                        '-';
                                                    safeSetState(() {});
                                                    context.safePop();
                                                    return;
                                                  }
                                                }
                                              }

                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกยี่ห้อรถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicBrandName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .isSelectBrandInPackage =
                                                    true;
                                                FFAppState()
                                                        .insuranceBasicBrandId =
                                                    FFAppState()
                                                        .insuranceBasicBrandIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                FFAppState().insuranceBasicModelNameList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().insuranceBasicModelIdList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    'เลือกรุ่นรถ';
                                                FFAppState()
                                                    .insuranceBasicModelId = '';
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  1,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .insuranceBasicModelNameList
                                                        .length <=
                                                    0) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ไม่พบข้อมูลประกัน'),
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

                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageBrandName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .nonePackageBrandId =
                                                    FFAppState()
                                                        .insuranceBasicBrandIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageIsBrandSelect =
                                                    true;
                                                safeSetState(() {});
                                                FFAppState().nonePackageSearchModelList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().nonePackageSearchModelIdList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกปีจดทะเบียน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicYear =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  3,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().nonePackageYear =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกลักษณะการใช้รถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState().insuranceBasicVehicleUsedTypeId = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeIdList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().insuranceBasicVehicleUsedTypeName = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeNameList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  4,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().nonePackageUsedTypeId = FFAppState()
                                                    .nonePackageUsedTypeIdList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().nonePackageUsedTypeCode = FFAppState()
                                                    .nonePackageUsedTypeCodeList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().nonePackageUsedTypeName = FFAppState()
                                                    .nonePackageUsedTypeNameList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทชั้นประกัน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicCoverTypeNameOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget!.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicCoverTypeIdOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicCoverTypeIdList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicCoverTypeCodeOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicCoverTypeCodeList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageCoverTypeId =
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageCoverTypeCode =
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeCodeList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageCoverTypeName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทการซ่อม') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicGarageTypeInPackage =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicGarageTypeNameList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicGarageTypeIdInPackage =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicGarageTypeIdList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageGarageTypeId =
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageGarageTypeName =
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeNameList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageGarageTypeCode =
                                                    FFAppState()
                                                        .nonePackageGarageTypeCodeList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                              FFAppState().filterInsurerList = functions
                                                  .returnMappedListFromBoolList(
                                                      widget!.dataList
                                                          ?.toList(),
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบชั้นประกัน') {
                                              FFAppState().filterCoverTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget!.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                              FFAppState()
                                                      .filterGarageTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget!.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ประเภทบัตร') {
                                              FFAppState()
                                                      .insuranceInfoCardType =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText == 'เพศ') {
                                              FFAppState().insuranceInfoGender =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState().insuranceInfoTitle =
                                                  'เลือกคำนำหน้าชื่อ';
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'คำนำหน้า') {
                                              FFAppState().insuranceInfoTitle =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'กลุ่มอาชีพ') {
                                              FFAppState()
                                                      .insuranceInfoOccupationGroup =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationCode =
                                                  (functions
                                                      .removeDupeInList(FFAppState()
                                                          .insuranceInfoOccupationCode
                                                          .toList())!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationName =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubCode =
                                                  functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceInfoOccupationSubCode
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoOccupationName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoSelectOccupationName)
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubName =
                                                  functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceInfoOccupationSubName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoOccupationName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoSelectOccupationName)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              FFAppState()
                                                  .insuranceInfoSelectOccupationSubNameChoose = '';
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกจังหวัดจดทะเบียน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageProvinceId =
                                                  FFAppState()
                                                      .insuranceBasicProvinceIdList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState().nonePackageProvince =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาที่อยู่') {
                                              if (widget!.fromPage ==
                                                  'addAddressIdCard') {
                                                FFAppState()
                                                        .addAddressSelectProvinceId =
                                                    FFAppState()
                                                        .addAddressProvinceId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectProvinceName =
                                                    FFAppState()
                                                        .addAddressProvinceName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDistrictName =
                                                    FFAppState()
                                                        .addAddressDistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectSubdistrictName =
                                                    FFAppState()
                                                        .addAddressSubdistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectZipCode =
                                                    FFAppState()
                                                        .addAddressZipCode
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectKeyWord =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressAtIdCard =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().addAddressForDoc =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocProvinceId =
                                                    FFAppState()
                                                        .addAddressProvinceId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocProvinceName =
                                                    FFAppState()
                                                        .addAddressProvinceName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocDistrictName =
                                                    FFAppState()
                                                        .addAddressDistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDocSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDocSubdistrictName =
                                                    FFAppState()
                                                        .addAddressSubdistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocZipCode =
                                                    FFAppState()
                                                        .addAddressZipCode
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocKeyWord =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทตู้เหล็ก') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageCarrierType =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกส่วนของรถบรรทุก') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageTruckPart =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทลูกค้า') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageCusMembership =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกปีที่ผลิต') {
                                              FFAppState()
                                                      .insuranceInfoProductYear =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'จำนวนงวด') {
                                              FFAppState()
                                                      .insuranceInfoPage4SelectTenor =
                                                  FFAppState()
                                                      .InsuranceInfoPage4Tenor
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoPage4SelectInstallMentFirstDue =
                                                  FFAppState()
                                                      .InsuranceInfoPage4InstallmentFirstDue
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoPage4SelectInstallMentLastDue =
                                                  FFAppState()
                                                      .InsuranceInfoPage4InstallmentLastDue
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกบริษัทประกัน') {
                                              if (widget!.fromPage ==
                                                  'NonePackageSelectedInsurer') {
                                                FFAppState()
                                                        .nonePackageSelectedInsurerShortName =
                                                    FFAppState()
                                                        .nonePackageSelectedInsurerShortNameList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกจังหวัดที่จดทะเบียน') {
                                              FFAppState()
                                                      .insuranceInfoRegistrationCodeSelect =
                                                  FFAppState()
                                                      .insuranceInfoRegistrationCodeList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoRegistrationProvinceSelect =
                                                  FFAppState()
                                                      .insuranceInfoRegistrationprovinceList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกรุ่นรถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .insuranceBasicModelId =
                                                    FFAppState()
                                                        .insuranceBasicModelIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  2,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText == 'อาชีพ') {
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubNameChoose =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.5,
                                            ),
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
                                                        'รถบรรทุก หัวลาก หางพ่วง',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/__.png',
                                                          width: 140.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget!.fromPage != 'act')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget!.multiSelect) {
                                            if (widget!.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget!.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'RenewStep2'))) {
                                              if (widget!.fromPage ==
                                                  'searchPackage') {
                                                if (false) {
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                } else {
                                                  if (true) {
                                                    context.goNamed(
                                                        InsuranceWorkSelectPageWidget
                                                            .routeName);

                                                    return;
                                                  }
                                                }

                                                FFAppState()
                                                        .insuranceVehicleTypeDropDown =
                                                    'รถเเต่ง ต่อคอก';
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  0,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget!.fromPage ==
                                                    'NonePackage') {
                                                  FFAppState()
                                                          .nonePackageVehicleType =
                                                      'รถเเต่ง';
                                                  FFAppState()
                                                          .insuranceCarTypeDetailSelected =
                                                      'รถเเต่ง';
                                                  FFAppState()
                                                          .nonepackagevehicletypeDetail =
                                                      'รถเเต่ง';
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget!.fromPage ==
                                                      'RenewStep2') {
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถเเต่ง';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถเเต่ง';
                                                    FFAppState()
                                                            .insuranceInfoVehicleType =
                                                        'รถเเต่ง';
                                                    safeSetState(() {});
                                                    context.safePop();
                                                    return;
                                                  }
                                                }
                                              }

                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกยี่ห้อรถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicBrandName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .isSelectBrandInPackage =
                                                    true;
                                                FFAppState()
                                                        .insuranceBasicBrandId =
                                                    FFAppState()
                                                        .insuranceBasicBrandIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                FFAppState().insuranceBasicModelNameList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().insuranceBasicModelIdList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    'เลือกรุ่นรถ';
                                                FFAppState()
                                                    .insuranceBasicModelId = '';
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  1,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .insuranceBasicModelNameList
                                                        .length <=
                                                    0) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ไม่พบข้อมูลประกัน'),
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

                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageBrandName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .nonePackageBrandId =
                                                    FFAppState()
                                                        .insuranceBasicBrandIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageIsBrandSelect =
                                                    true;
                                                safeSetState(() {});
                                                FFAppState().nonePackageSearchModelList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().nonePackageSearchModelIdList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกปีจดทะเบียน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicYear =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  3,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().nonePackageYear =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกลักษณะการใช้รถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState().insuranceBasicVehicleUsedTypeId = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeIdList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().insuranceBasicVehicleUsedTypeName = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeNameList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  4,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().nonePackageUsedTypeId = FFAppState()
                                                    .nonePackageUsedTypeIdList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().nonePackageUsedTypeCode = FFAppState()
                                                    .nonePackageUsedTypeCodeList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().nonePackageUsedTypeName = FFAppState()
                                                    .nonePackageUsedTypeNameList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทชั้นประกัน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicCoverTypeNameOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget!.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicCoverTypeIdOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicCoverTypeIdList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicCoverTypeCodeOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicCoverTypeCodeList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageCoverTypeId =
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageCoverTypeCode =
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeCodeList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageCoverTypeName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทการซ่อม') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicGarageTypeInPackage =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicGarageTypeNameList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicGarageTypeIdInPackage =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicGarageTypeIdList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageGarageTypeId =
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageGarageTypeName =
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeNameList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageGarageTypeCode =
                                                    FFAppState()
                                                        .nonePackageGarageTypeCodeList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                              FFAppState().filterInsurerList = functions
                                                  .returnMappedListFromBoolList(
                                                      widget!.dataList
                                                          ?.toList(),
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบชั้นประกัน') {
                                              FFAppState().filterCoverTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget!.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                              FFAppState()
                                                      .filterGarageTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget!.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ประเภทบัตร') {
                                              FFAppState()
                                                      .insuranceInfoCardType =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText == 'เพศ') {
                                              FFAppState().insuranceInfoGender =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState().insuranceInfoTitle =
                                                  'เลือกคำนำหน้าชื่อ';
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'คำนำหน้า') {
                                              FFAppState().insuranceInfoTitle =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'กลุ่มอาชีพ') {
                                              FFAppState()
                                                      .insuranceInfoOccupationGroup =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationCode =
                                                  (functions
                                                      .removeDupeInList(FFAppState()
                                                          .insuranceInfoOccupationCode
                                                          .toList())!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationName =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubCode =
                                                  functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceInfoOccupationSubCode
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoOccupationName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoSelectOccupationName)
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubName =
                                                  functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceInfoOccupationSubName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoOccupationName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoSelectOccupationName)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              FFAppState()
                                                  .insuranceInfoSelectOccupationSubNameChoose = '';
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกจังหวัดจดทะเบียน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageProvinceId =
                                                  FFAppState()
                                                      .insuranceBasicProvinceIdList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState().nonePackageProvince =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาที่อยู่') {
                                              if (widget!.fromPage ==
                                                  'addAddressIdCard') {
                                                FFAppState()
                                                        .addAddressSelectProvinceId =
                                                    FFAppState()
                                                        .addAddressProvinceId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectProvinceName =
                                                    FFAppState()
                                                        .addAddressProvinceName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDistrictName =
                                                    FFAppState()
                                                        .addAddressDistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectSubdistrictName =
                                                    FFAppState()
                                                        .addAddressSubdistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectZipCode =
                                                    FFAppState()
                                                        .addAddressZipCode
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectKeyWord =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressAtIdCard =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().addAddressForDoc =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocProvinceId =
                                                    FFAppState()
                                                        .addAddressProvinceId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocProvinceName =
                                                    FFAppState()
                                                        .addAddressProvinceName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocDistrictName =
                                                    FFAppState()
                                                        .addAddressDistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDocSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDocSubdistrictName =
                                                    FFAppState()
                                                        .addAddressSubdistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocZipCode =
                                                    FFAppState()
                                                        .addAddressZipCode
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocKeyWord =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทตู้เหล็ก') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageCarrierType =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกส่วนของรถบรรทุก') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageTruckPart =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทลูกค้า') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageCusMembership =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกปีที่ผลิต') {
                                              FFAppState()
                                                      .insuranceInfoProductYear =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'จำนวนงวด') {
                                              FFAppState()
                                                      .insuranceInfoPage4SelectTenor =
                                                  FFAppState()
                                                      .InsuranceInfoPage4Tenor
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoPage4SelectInstallMentFirstDue =
                                                  FFAppState()
                                                      .InsuranceInfoPage4InstallmentFirstDue
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoPage4SelectInstallMentLastDue =
                                                  FFAppState()
                                                      .InsuranceInfoPage4InstallmentLastDue
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกบริษัทประกัน') {
                                              if (widget!.fromPage ==
                                                  'NonePackageSelectedInsurer') {
                                                FFAppState()
                                                        .nonePackageSelectedInsurerShortName =
                                                    FFAppState()
                                                        .nonePackageSelectedInsurerShortNameList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกจังหวัดที่จดทะเบียน') {
                                              FFAppState()
                                                      .insuranceInfoRegistrationCodeSelect =
                                                  FFAppState()
                                                      .insuranceInfoRegistrationCodeList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoRegistrationProvinceSelect =
                                                  FFAppState()
                                                      .insuranceInfoRegistrationprovinceList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกรุ่นรถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .insuranceBasicModelId =
                                                    FFAppState()
                                                        .insuranceBasicModelIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  2,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText == 'อาชีพ') {
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubNameChoose =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.5,
                                            ),
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
                                                        'รถเเต่ง',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/hy5n2_.png',
                                                          width: 90.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget!.fromPage != 'act')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget!.multiSelect) {
                                            if (widget!.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget!.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget!.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget!.fromPage ==
                                                        'RenewStep2'))) {
                                              if (widget!.fromPage ==
                                                  'searchPackage') {
                                                if (false) {
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                } else {
                                                  if (true) {
                                                    context.goNamed(
                                                        InsuranceWorkSelectPageWidget
                                                            .routeName);

                                                    return;
                                                  }
                                                }

                                                FFAppState()
                                                        .insuranceVehicleTypeDropDown =
                                                    'รถเเต่ง ต่อคอก';
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  0,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget!.fromPage ==
                                                    'NonePackage') {
                                                  FFAppState()
                                                          .nonePackageVehicleType =
                                                      'รถโดยสารประจำทาง';
                                                  FFAppState()
                                                          .insuranceCarTypeDetailSelected =
                                                      'รถโดยสารประจำทาง';
                                                  FFAppState()
                                                          .nonepackagevehicletypeDetail =
                                                      'รถโดยสารประจำทาง';
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget!.fromPage ==
                                                      'RenewStep2') {
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถเเต่ง';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถเเต่ง';
                                                    FFAppState()
                                                            .insuranceInfoVehicleType =
                                                        'รถเเต่ง';
                                                    safeSetState(() {});
                                                    context.safePop();
                                                    return;
                                                  }
                                                }
                                              }

                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกยี่ห้อรถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicBrandName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .isSelectBrandInPackage =
                                                    true;
                                                FFAppState()
                                                        .insuranceBasicBrandId =
                                                    FFAppState()
                                                        .insuranceBasicBrandIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                FFAppState().insuranceBasicModelNameList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().insuranceBasicModelIdList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    'เลือกรุ่นรถ';
                                                FFAppState()
                                                    .insuranceBasicModelId = '';
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  1,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                if (FFAppState()
                                                        .insuranceBasicModelNameList
                                                        .length <=
                                                    0) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ไม่พบข้อมูลประกัน'),
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

                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageBrandName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .nonePackageBrandId =
                                                    FFAppState()
                                                        .insuranceBasicBrandIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageIsBrandSelect =
                                                    true;
                                                safeSetState(() {});
                                                FFAppState().nonePackageSearchModelList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().nonePackageSearchModelIdList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicBrandIdList
                                                            .elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)))
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกปีจดทะเบียน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicYear =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  3,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().nonePackageYear =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกลักษณะการใช้รถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState().insuranceBasicVehicleUsedTypeId = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeIdList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().insuranceBasicVehicleUsedTypeName = FFAppState()
                                                    .insuranceBasicVehicleUsedTypeNameList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .insuranceBasicVehicleUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  4,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().nonePackageUsedTypeId = FFAppState()
                                                    .nonePackageUsedTypeIdList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().nonePackageUsedTypeCode = FFAppState()
                                                    .nonePackageUsedTypeCodeList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                FFAppState().nonePackageUsedTypeName = FFAppState()
                                                    .nonePackageUsedTypeNameList
                                                    .elementAtOrNull(functions.getIndexOfSomethingList(
                                                        functions
                                                            .generateInsuranceVehicleTypeDropdown(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCodeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeTypeList
                                                                    .toList(),
                                                                FFAppState()
                                                                    .nonePackageUsedTypeNameList
                                                                    .toList())
                                                            ?.toList(),
                                                        widget!.dataList
                                                            ?.elementAtOrNull(functions
                                                                .getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทชั้นประกัน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicCoverTypeNameOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget!.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicCoverTypeIdOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicCoverTypeIdList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicCoverTypeCodeOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicCoverTypeCodeList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageCoverTypeId =
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageCoverTypeCode =
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeCodeList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageCoverTypeName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทการซ่อม') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicGarageTypeInPackage =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicGarageTypeNameList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicGarageTypeIdInPackage =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            FFAppState()
                                                                .insuranceBasicGarageTypeIdList
                                                                .toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState()
                                                        .nonePackageGarageTypeId =
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageGarageTypeName =
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeNameList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .nonePackageGarageTypeCode =
                                                    FFAppState()
                                                        .nonePackageGarageTypeCodeList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                              FFAppState().filterInsurerList = functions
                                                  .returnMappedListFromBoolList(
                                                      widget!.dataList
                                                          ?.toList(),
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบชั้นประกัน') {
                                              FFAppState().filterCoverTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget!.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                              FFAppState()
                                                      .filterGarageTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget!.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ประเภทบัตร') {
                                              FFAppState()
                                                      .insuranceInfoCardType =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText == 'เพศ') {
                                              FFAppState().insuranceInfoGender =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState().insuranceInfoTitle =
                                                  'เลือกคำนำหน้าชื่อ';
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'คำนำหน้า') {
                                              FFAppState().insuranceInfoTitle =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'กลุ่มอาชีพ') {
                                              FFAppState()
                                                      .insuranceInfoOccupationGroup =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationCode =
                                                  (functions
                                                      .removeDupeInList(FFAppState()
                                                          .insuranceInfoOccupationCode
                                                          .toList())!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationName =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubCode =
                                                  functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceInfoOccupationSubCode
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoOccupationName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoSelectOccupationName)
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubName =
                                                  functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceInfoOccupationSubName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoOccupationName
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceInfoSelectOccupationName)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              FFAppState()
                                                  .insuranceInfoSelectOccupationSubNameChoose = '';
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกจังหวัดจดทะเบียน') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageProvinceId =
                                                  FFAppState()
                                                      .insuranceBasicProvinceIdList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState().nonePackageProvince =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'ค้นหาที่อยู่') {
                                              if (widget!.fromPage ==
                                                  'addAddressIdCard') {
                                                FFAppState()
                                                        .addAddressSelectProvinceId =
                                                    FFAppState()
                                                        .addAddressProvinceId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectProvinceName =
                                                    FFAppState()
                                                        .addAddressProvinceName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDistrictName =
                                                    FFAppState()
                                                        .addAddressDistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectSubdistrictName =
                                                    FFAppState()
                                                        .addAddressSubdistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectZipCode =
                                                    FFAppState()
                                                        .addAddressZipCode
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectKeyWord =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressAtIdCard =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              } else {
                                                FFAppState().addAddressForDoc =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocProvinceId =
                                                    FFAppState()
                                                        .addAddressProvinceId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocProvinceName =
                                                    FFAppState()
                                                        .addAddressProvinceName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAdressSelectDocDistrictName =
                                                    FFAppState()
                                                        .addAddressDistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDocSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDocSubdistrictName =
                                                    FFAppState()
                                                        .addAddressSubdistrictName
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocZipCode =
                                                    FFAppState()
                                                        .addAddressZipCode
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                FFAppState()
                                                        .addAddressSelectDocKeyWord =
                                                    FFAppState()
                                                        .addAddressKeyWord
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทตู้เหล็ก') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageCarrierType =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกส่วนของรถบรรทุก') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageTruckPart =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกประเภทลูกค้า') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              FFAppState()
                                                      .nonePackageCusMembership =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกปีที่ผลิต') {
                                              FFAppState()
                                                      .insuranceInfoProductYear =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'จำนวนงวด') {
                                              FFAppState()
                                                      .insuranceInfoPage4SelectTenor =
                                                  FFAppState()
                                                      .InsuranceInfoPage4Tenor
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoPage4SelectInstallMentFirstDue =
                                                  FFAppState()
                                                      .InsuranceInfoPage4InstallmentFirstDue
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoPage4SelectInstallMentLastDue =
                                                  FFAppState()
                                                      .InsuranceInfoPage4InstallmentLastDue
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกบริษัทประกัน') {
                                              if (widget!.fromPage ==
                                                  'NonePackageSelectedInsurer') {
                                                FFAppState()
                                                        .nonePackageSelectedInsurerShortName =
                                                    FFAppState()
                                                        .nonePackageSelectedInsurerShortNameList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText ==
                                                'เลือกจังหวัดที่จดทะเบียน') {
                                              FFAppState()
                                                      .insuranceInfoRegistrationCodeSelect =
                                                  FFAppState()
                                                      .insuranceInfoRegistrationCodeList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .insuranceInfoRegistrationProvinceSelect =
                                                  FFAppState()
                                                      .insuranceInfoRegistrationprovinceList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.titleText ==
                                                'เลือกรุ่นรถ') {
                                              if (widget!.fromPage !=
                                                  'NonePackage') {
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    (widget!.dataList!
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)))!;
                                                FFAppState()
                                                        .insuranceBasicModelId =
                                                    FFAppState()
                                                        .insuranceBasicModelIdList
                                                        .elementAtOrNull(functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true))!;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  2,
                                                  (_) => true,
                                                );
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget!.titleText == 'อาชีพ') {
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationSubNameChoose =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.5,
                                            ),
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
                                                        'รถโดยสารประจำทาง',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/Screenshot_2567-03-22_at_10.16.17-.png',
                                                        width: 130.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (false &&
                                      ((_model.textController.text == null ||
                                              _model.textController.text ==
                                                  '') ||
                                          functions.containWordinStringUrl(
                                              _model.textController.text
                                                  .toUpperCase(),
                                              'รถเก๋ง')!))
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (widget!.multiSelect) {
                                          if (widget!.maxSelected == 0) {
                                          } else {
                                            if (functions.countTrueInBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList())! >=
                                                widget!.maxSelected) {}
                                          }
                                        } else {
                                          if (((widget!.titleText ==
                                                      'เลือกประเภทรถ') &&
                                                  (widget!.fromPage ==
                                                      'searchPackage')) ||
                                              ((widget!.titleText ==
                                                      'เลือกประเภทรถ') &&
                                                  (widget!.fromPage ==
                                                      'NonePackage'))) {
                                            if (widget!.fromPage ==
                                                'searchPackage') {
                                              if (false) {
                                                context.goNamed(
                                                    InsuranceWorkSelectPageWidget
                                                        .routeName);

                                                return;
                                              } else {
                                                if (true) {
                                                  context.goNamed(
                                                      InsuranceWorkSelectPageWidget
                                                          .routeName);

                                                  return;
                                                }
                                              }

                                              FFAppState()
                                                      .insuranceVehicleTypeDropDown =
                                                  'รถเเต่ง ต่อคอก';
                                              FFAppState()
                                                  .updateSearchPackageCheckFilledAtIndex(
                                                0,
                                                (_) => true,
                                              );
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            } else {
                                              if (widget!.fromPage ==
                                                  'NonePackage') {
                                                FFAppState()
                                                        .nonePackageVehicleType =
                                                    'รถซุปเปอร์คาร์';
                                                FFAppState()
                                                        .insuranceCarTypeDetailSelected =
                                                    'รถซุปเปอร์คาร์';
                                                FFAppState()
                                                        .nonepackagevehicletypeDetail =
                                                    'รถซุปเปอร์คาร์';
                                                safeSetState(() {});
                                                FFAppState()
                                                        .insuranceBasicVehicleGroup =
                                                    'SUPERCAR';
                                                FFAppState()
                                                        .insuranceBasicCarTypeContain =
                                                    '-';
                                                FFAppState()
                                                        .insuranceBasicCarTypeDoors =
                                                    '-';
                                                FFAppState().insuranceBasicBrandNameList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState().insuranceBasicBrandIdList = functions
                                                    .returnMappedListFrom2ListContain(
                                                        FFAppState()
                                                            .insuranceBasicBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroupBrandList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleGroup)
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                context.safePop();
                                                return;
                                              }
                                            }

                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'เลือกยี่ห้อรถ') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              FFAppState()
                                                      .insuranceBasicBrandName =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState()
                                                      .isSelectBrandInPackage =
                                                  true;
                                              FFAppState()
                                                      .insuranceBasicBrandId =
                                                  FFAppState()
                                                      .insuranceBasicBrandIdList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              FFAppState().insuranceBasicModelNameList = functions
                                                  .returnMappedListFrom2List(
                                                      FFAppState()
                                                          .insuranceBasicModelNameListOriginal
                                                          .toList(),
                                                      FFAppState()
                                                          .insuranceBasicModelBrandIdListOriginal
                                                          .toList(),
                                                      FFAppState()
                                                          .insuranceBasicBrandIdList
                                                          .elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)))
                                                  .toList()
                                                  .cast<String>();
                                              FFAppState().insuranceBasicModelIdList = functions
                                                  .returnMappedListFrom2List(
                                                      FFAppState()
                                                          .insuranceBasicModelIdListOriginal
                                                          .toList(),
                                                      FFAppState()
                                                          .insuranceBasicModelBrandIdListOriginal
                                                          .toList(),
                                                      FFAppState()
                                                          .insuranceBasicBrandIdList
                                                          .elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)))
                                                  .toList()
                                                  .cast<String>();
                                              FFAppState()
                                                      .insuranceBasicModelName =
                                                  'เลือกรุ่นรถ';
                                              FFAppState()
                                                  .insuranceBasicModelId = '';
                                              safeSetState(() {});
                                              FFAppState()
                                                  .updateSearchPackageCheckFilledAtIndex(
                                                1,
                                                (_) => true,
                                              );
                                              safeSetState(() {});
                                              if (FFAppState()
                                                      .insuranceBasicModelNameList
                                                      .length <=
                                                  0) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'ไม่พบข้อมูลประกัน'),
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

                                                context.goNamed(
                                                    InsuranceWorkSelectPageWidget
                                                        .routeName);

                                                return;
                                              }
                                              context.safePop();
                                              return;
                                            } else {
                                              FFAppState()
                                                      .nonePackageBrandName =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState().nonePackageBrandId =
                                                  FFAppState()
                                                      .insuranceBasicBrandIdList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .nonePackageIsBrandSelect =
                                                  true;
                                              safeSetState(() {});
                                              FFAppState().nonePackageSearchModelList = functions
                                                  .returnMappedListFrom2List(
                                                      FFAppState()
                                                          .insuranceBasicModelNameListOriginal
                                                          .toList(),
                                                      FFAppState()
                                                          .insuranceBasicModelBrandIdListOriginal
                                                          .toList(),
                                                      FFAppState()
                                                          .insuranceBasicBrandIdList
                                                          .elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)))
                                                  .toList()
                                                  .cast<String>();
                                              FFAppState().nonePackageSearchModelIdList = functions
                                                  .returnMappedListFrom2List(
                                                      FFAppState()
                                                          .insuranceBasicModelIdListOriginal
                                                          .toList(),
                                                      FFAppState()
                                                          .insuranceBasicModelBrandIdListOriginal
                                                          .toList(),
                                                      FFAppState()
                                                          .insuranceBasicBrandIdList
                                                          .elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)))
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget!.titleText ==
                                              'เลือกปีจดทะเบียน') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              FFAppState().insuranceBasicYear =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                  .updateSearchPackageCheckFilledAtIndex(
                                                3,
                                                (_) => true,
                                              );
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            } else {
                                              FFAppState().nonePackageYear =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget!.titleText ==
                                              'เลือกลักษณะการใช้รถ') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              FFAppState().insuranceBasicVehicleUsedTypeId = FFAppState()
                                                  .insuranceBasicVehicleUsedTypeIdList
                                                  .elementAtOrNull(functions.getIndexOfSomethingList(
                                                      functions
                                                          .generateInsuranceVehicleTypeDropdown(
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeCodeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeTypeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeNameList
                                                                  .toList())
                                                          ?.toList(),
                                                      widget!.dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true))))!;
                                              FFAppState().insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                  .insuranceBasicVehicleUsedTypeCodeList
                                                  .elementAtOrNull(functions.getIndexOfSomethingList(
                                                      functions
                                                          .generateInsuranceVehicleTypeDropdown(
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeCodeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeTypeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeNameList
                                                                  .toList())
                                                          ?.toList(),
                                                      widget!.dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true))))!;
                                              FFAppState().insuranceBasicVehicleUsedTypeName = FFAppState()
                                                  .insuranceBasicVehicleUsedTypeNameList
                                                  .elementAtOrNull(functions.getIndexOfSomethingList(
                                                      functions
                                                          .generateInsuranceVehicleTypeDropdown(
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeCodeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeTypeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .insuranceBasicVehicleUsedTypeNameList
                                                                  .toList())
                                                          ?.toList(),
                                                      widget!.dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true))))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                  .updateSearchPackageCheckFilledAtIndex(
                                                4,
                                                (_) => true,
                                              );
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            } else {
                                              FFAppState().nonePackageUsedTypeId = FFAppState()
                                                  .nonePackageUsedTypeIdList
                                                  .elementAtOrNull(functions.getIndexOfSomethingList(
                                                      functions
                                                          .generateInsuranceVehicleTypeDropdown(
                                                              FFAppState()
                                                                  .nonePackageUsedTypeCodeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .nonePackageUsedTypeTypeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .nonePackageUsedTypeNameList
                                                                  .toList())
                                                          ?.toList(),
                                                      widget!.dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true))))!;
                                              FFAppState().nonePackageUsedTypeCode = FFAppState()
                                                  .nonePackageUsedTypeCodeList
                                                  .elementAtOrNull(functions.getIndexOfSomethingList(
                                                      functions
                                                          .generateInsuranceVehicleTypeDropdown(
                                                              FFAppState()
                                                                  .nonePackageUsedTypeCodeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .nonePackageUsedTypeTypeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .nonePackageUsedTypeNameList
                                                                  .toList())
                                                          ?.toList(),
                                                      widget!.dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true))))!;
                                              FFAppState().nonePackageUsedTypeName = FFAppState()
                                                  .nonePackageUsedTypeNameList
                                                  .elementAtOrNull(functions.getIndexOfSomethingList(
                                                      functions
                                                          .generateInsuranceVehicleTypeDropdown(
                                                              FFAppState()
                                                                  .nonePackageUsedTypeCodeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .nonePackageUsedTypeTypeList
                                                                  .toList(),
                                                              FFAppState()
                                                                  .nonePackageUsedTypeNameList
                                                                  .toList())
                                                          ?.toList(),
                                                      widget!.dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true))))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget!.titleText ==
                                              'เลือกประเภทชั้นประกัน') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              FFAppState()
                                                      .insuranceBasicCoverTypeNameOutputList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget!.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState()
                                                      .insuranceBasicCoverTypeIdOutputList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .insuranceBasicCoverTypeIdList
                                                              .toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState()
                                                      .insuranceBasicCoverTypeCodeOutputList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .insuranceBasicCoverTypeCodeList
                                                              .toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            } else {
                                              FFAppState()
                                                      .nonePackageCoverTypeId =
                                                  FFAppState()
                                                      .insuranceBasicCoverTypeIdList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .nonePackageCoverTypeCode =
                                                  FFAppState()
                                                      .insuranceBasicCoverTypeCodeList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .nonePackageCoverTypeName =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget!.titleText ==
                                              'เลือกประเภทการซ่อม') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              FFAppState()
                                                      .insuranceBasicGarageTypeInPackage =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .insuranceBasicGarageTypeNameList
                                                              .toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              FFAppState()
                                                      .insuranceBasicGarageTypeIdInPackage =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          FFAppState()
                                                              .insuranceBasicGarageTypeIdList
                                                              .toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            } else {
                                              FFAppState()
                                                      .nonePackageGarageTypeId =
                                                  FFAppState()
                                                      .insuranceBasicGarageTypeIdList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .nonePackageGarageTypeName =
                                                  FFAppState()
                                                      .insuranceBasicGarageTypeNameList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .nonePackageGarageTypeCode =
                                                  FFAppState()
                                                      .nonePackageGarageTypeCodeList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget!.titleText ==
                                              'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                            FFAppState().filterInsurerList = functions
                                                .returnMappedListFromBoolList(
                                                    widget!.dataList?.toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'ค้นหาเปรียบเทียบชั้นประกัน') {
                                            FFAppState().filterCoverTypeList =
                                                functions
                                                    .returnMappedListFromBoolList(
                                                        widget!.dataList
                                                            ?.toList(),
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)
                                                    .toList()
                                                    .cast<String>();
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                            FFAppState().filterGarageTypeList =
                                                functions
                                                    .returnMappedListFromBoolList(
                                                        widget!.dataList
                                                            ?.toList(),
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)
                                                    .toList()
                                                    .cast<String>();
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'ประเภทบัตร') {
                                            FFAppState().insuranceInfoCardType =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText == 'เพศ') {
                                            FFAppState().insuranceInfoGender =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            FFAppState().insuranceInfoTitle =
                                                'เลือกคำนำหน้าชื่อ';
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText == 'คำนำหน้า') {
                                            FFAppState().insuranceInfoTitle =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'กลุ่มอาชีพ') {
                                            FFAppState()
                                                    .insuranceInfoOccupationGroup =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            FFAppState()
                                                    .insuranceInfoSelectOccupationCode =
                                                (functions
                                                    .removeDupeInList(FFAppState()
                                                        .insuranceInfoOccupationCode
                                                        .toList())!
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)))!;
                                            FFAppState()
                                                    .insuranceInfoSelectOccupationName =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            FFAppState()
                                                    .insuranceInfoSelectOccupationSubCode =
                                                functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceInfoOccupationSubCode
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceInfoOccupationName
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceInfoSelectOccupationName)
                                                    .toList()
                                                    .cast<String>();
                                            FFAppState()
                                                    .insuranceInfoSelectOccupationSubName =
                                                functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceInfoOccupationSubName
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceInfoOccupationName
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceInfoSelectOccupationName)
                                                    .toList()
                                                    .cast<String>();
                                            safeSetState(() {});
                                            FFAppState()
                                                .insuranceInfoSelectOccupationSubNameChoose = '';
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'เลือกจังหวัดจดทะเบียน') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              return;
                                            }

                                            FFAppState().nonePackageProvinceId =
                                                FFAppState()
                                                    .insuranceBasicProvinceIdList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true))!;
                                            FFAppState().nonePackageProvince =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'ค้นหาที่อยู่') {
                                            if (widget!.fromPage ==
                                                'addAddressIdCard') {
                                              FFAppState()
                                                      .addAddressSelectProvinceId =
                                                  FFAppState()
                                                      .addAddressProvinceId
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAddressSelectProvinceName =
                                                  FFAppState()
                                                      .addAddressProvinceName
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAddressSelectDistrictId =
                                                  FFAppState()
                                                      .addAddressDistrictId
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!
                                                      .toString();
                                              FFAppState()
                                                      .addAddressSelectDistrictName =
                                                  FFAppState()
                                                      .addAddressDistrictName
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAddressSelectSubdistrictId =
                                                  FFAppState()
                                                      .addAddressSubdistrictId
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!
                                                      .toString();
                                              FFAppState()
                                                      .addAddressSelectSubdistrictName =
                                                  FFAppState()
                                                      .addAddressSubdistrictName
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAddressSelectZipCode =
                                                  FFAppState()
                                                      .addAddressZipCode
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAddressSelectKeyWord =
                                                  FFAppState()
                                                      .addAddressKeyWord
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState().addAddressAtIdCard =
                                                  FFAppState()
                                                      .addAddressKeyWord
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            } else {
                                              FFAppState().addAddressForDoc =
                                                  FFAppState()
                                                      .addAddressKeyWord
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAdressSelectDocProvinceId =
                                                  FFAppState()
                                                      .addAddressProvinceId
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAdressSelectDocProvinceName =
                                                  FFAppState()
                                                      .addAddressProvinceName
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAdressSelectDocDistrictName =
                                                  FFAppState()
                                                      .addAddressDistrictName
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAddressSelectDocDistrictId =
                                                  FFAppState()
                                                      .addAddressDistrictId
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!
                                                      .toString();
                                              FFAppState()
                                                      .addAddressSelectDocSubdistrictId =
                                                  FFAppState()
                                                      .addAddressSubdistrictId
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!
                                                      .toString();
                                              FFAppState()
                                                      .addAddressSelectDocSubdistrictName =
                                                  FFAppState()
                                                      .addAddressSubdistrictName
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAddressSelectDocZipCode =
                                                  FFAppState()
                                                      .addAddressZipCode
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              FFAppState()
                                                      .addAddressSelectDocKeyWord =
                                                  FFAppState()
                                                      .addAddressKeyWord
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget!.titleText ==
                                              'เลือกประเภทตู้เหล็ก') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              return;
                                            }

                                            FFAppState()
                                                    .nonePackageCarrierType =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'เลือกส่วนของรถบรรทุก') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              return;
                                            }

                                            FFAppState().nonePackageTruckPart =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'เลือกประเภทลูกค้า') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              return;
                                            }

                                            FFAppState()
                                                    .nonePackageCusMembership =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'เลือกปีที่ผลิต') {
                                            FFAppState()
                                                    .insuranceInfoProductYear =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText == 'จำนวนงวด') {
                                            FFAppState()
                                                    .insuranceInfoPage4SelectTenor =
                                                FFAppState()
                                                    .InsuranceInfoPage4Tenor
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true))!;
                                            FFAppState()
                                                    .insuranceInfoPage4SelectInstallMentFirstDue =
                                                FFAppState()
                                                    .InsuranceInfoPage4InstallmentFirstDue
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true))!;
                                            FFAppState()
                                                    .insuranceInfoPage4SelectInstallMentLastDue =
                                                FFAppState()
                                                    .InsuranceInfoPage4InstallmentLastDue
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'เลือกบริษัทประกัน') {
                                            if (widget!.fromPage ==
                                                'NonePackageSelectedInsurer') {
                                              FFAppState()
                                                      .nonePackageSelectedInsurerShortName =
                                                  FFAppState()
                                                      .nonePackageSelectedInsurerShortNameList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget!.titleText ==
                                              'เลือกจังหวัดที่จดทะเบียน') {
                                            FFAppState()
                                                    .insuranceInfoRegistrationCodeSelect =
                                                FFAppState()
                                                    .insuranceInfoRegistrationCodeList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true))!;
                                            FFAppState()
                                                    .insuranceInfoRegistrationProvinceSelect =
                                                FFAppState()
                                                    .insuranceInfoRegistrationprovinceList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                          if (widget!.titleText ==
                                              'เลือกรุ่นรถ') {
                                            if (widget!.fromPage !=
                                                'NonePackage') {
                                              FFAppState()
                                                      .insuranceBasicModelName =
                                                  (widget!.dataList!
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)))!;
                                              FFAppState()
                                                      .insuranceBasicModelId =
                                                  FFAppState()
                                                      .insuranceBasicModelIdList
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true))!;
                                              safeSetState(() {});
                                              FFAppState()
                                                  .updateSearchPackageCheckFilledAtIndex(
                                                2,
                                                (_) => true,
                                              );
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget!.titleText == 'อาชีพ') {
                                            FFAppState()
                                                    .insuranceInfoSelectOccupationSubNameChoose =
                                                (widget!.dataList!.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)))!;
                                            safeSetState(() {});
                                            context.safePop();
                                            return;
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'รถซุปเปอร์คาร์',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/Screenshot_2567-01-16_at_15.47(edit).png',
                                                        width: 90.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
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
                            if (false)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (functions.countTrueInBoolList(FFAppState()
                                            .searchableListComponentSelectedList
                                            .toList())! <=
                                        0) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณาเลือกอย่างน้อย 1 รายการ'),
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
                                      return;
                                    }
                                    if (((widget!.titleText ==
                                                'เลือกประเภทรถ') &&
                                            (widget!.fromPage ==
                                                'searchPackage')) ||
                                        ((widget!.titleText ==
                                                'เลือกประเภทรถ') &&
                                            (widget!.fromPage ==
                                                'NonePackage'))) {
                                      if (widget!.fromPage == 'searchPackage') {
                                        if ((widget!.dataList?.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true))) ==
                                            'รถบรรทุก หัวลาก หางพ่วง') {
                                          context.goNamed(
                                              InsuranceWorkSelectPageWidget
                                                  .routeName);

                                          return;
                                        } else {
                                          if ((widget!.dataList?.elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))) ==
                                              'รถแต่ง ต่อคอก') {
                                            context.goNamed(
                                                InsuranceWorkSelectPageWidget
                                                    .routeName);

                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceVehicleTypeDropDown =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        FFAppState()
                                            .updateSearchPackageCheckFilledAtIndex(
                                          0,
                                          (_) => true,
                                        );
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        if (widget!.fromPage == 'NonePackage') {
                                          FFAppState().nonePackageVehicleType =
                                              (widget!.dataList!.elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)))!;
                                          safeSetState(() {});
                                          context.safePop();
                                          return;
                                        }
                                      }

                                      return;
                                    }
                                    if (widget!.titleText == 'เลือกยี่ห้อรถ') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState().insuranceBasicBrandName =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        FFAppState().isSelectBrandInPackage =
                                            true;
                                        FFAppState().insuranceBasicBrandId =
                                            FFAppState()
                                                .insuranceBasicBrandIdList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        safeSetState(() {});
                                        FFAppState().insuranceBasicModelNameList = functions
                                            .returnMappedListFrom2List(
                                                FFAppState()
                                                    .insuranceBasicModelNameListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicModelBrandIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicBrandIdList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)))
                                            .toList()
                                            .cast<String>();
                                        FFAppState().insuranceBasicModelIdList = functions
                                            .returnMappedListFrom2List(
                                                FFAppState()
                                                    .insuranceBasicModelIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicModelBrandIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicBrandIdList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)))
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        FFAppState()
                                            .updateSearchPackageCheckFilledAtIndex(
                                          1,
                                          (_) => true,
                                        );
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageBrandName =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        FFAppState().nonePackageBrandId =
                                            FFAppState()
                                                .insuranceBasicBrandIdList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageIsBrandSelect =
                                            true;
                                        safeSetState(() {});
                                        FFAppState().nonePackageSearchModelList = functions
                                            .returnMappedListFrom2List(
                                                FFAppState()
                                                    .insuranceBasicModelNameListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicModelBrandIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicBrandIdList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)))
                                            .toList()
                                            .cast<String>();
                                        FFAppState().nonePackageSearchModelIdList = functions
                                            .returnMappedListFrom2List(
                                                FFAppState()
                                                    .insuranceBasicModelIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicModelBrandIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicBrandIdList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)))
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกปีจดทะเบียน') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState().insuranceBasicYear =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        safeSetState(() {});
                                        FFAppState()
                                            .updateSearchPackageCheckFilledAtIndex(
                                          3,
                                          (_) => true,
                                        );
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageYear =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกลักษณะการใช้รถ') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState().insuranceBasicVehicleUsedTypeId = FFAppState()
                                            .insuranceBasicVehicleUsedTypeIdList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        FFAppState().insuranceBasicVehicleUsedTypeCode = FFAppState()
                                            .insuranceBasicVehicleUsedTypeCodeList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        FFAppState().insuranceBasicVehicleUsedTypeName = FFAppState()
                                            .insuranceBasicVehicleUsedTypeNameList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        safeSetState(() {});
                                        FFAppState()
                                            .updateSearchPackageCheckFilledAtIndex(
                                          4,
                                          (_) => true,
                                        );
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageUsedTypeId = FFAppState()
                                            .insuranceBasicVehicleUsedTypeIdList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        FFAppState().nonePackageUsedTypeCode = FFAppState()
                                            .insuranceBasicVehicleUsedTypeCodeList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        FFAppState().nonePackageUsedTypeName = FFAppState()
                                            .insuranceBasicVehicleUsedTypeNameList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกประเภทชั้นประกัน') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState()
                                                .insuranceBasicCoverTypeNameOutputList =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    widget!.dataList?.toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .insuranceBasicCoverTypeIdOutputList =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeIdList
                                                        .toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .insuranceBasicCoverTypeCodeOutputList =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeCodeList
                                                        .toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageCoverTypeId =
                                            FFAppState()
                                                .insuranceBasicCoverTypeIdList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageCoverTypeCode =
                                            FFAppState()
                                                .insuranceBasicCoverTypeCodeList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageCoverTypeName =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกประเภทการซ่อม') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState()
                                                .insuranceBasicGarageTypeInPackage =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeNameList
                                                        .toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .insuranceBasicGarageTypeIdInPackage =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeIdList
                                                        .toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageGarageTypeId =
                                            FFAppState()
                                                .insuranceBasicGarageTypeIdList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageGarageTypeName =
                                            FFAppState()
                                                .insuranceBasicGarageTypeNameList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageGarageTypeCode =
                                            FFAppState()
                                                .nonePackageGarageTypeCodeList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                      FFAppState().filterInsurerList = functions
                                          .returnMappedListFromBoolList(
                                              widget!.dataList?.toList(),
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'ค้นหาเปรียบเทียบชั้นประกัน') {
                                      FFAppState().filterCoverTypeList = functions
                                          .returnMappedListFromBoolList(
                                              widget!.dataList?.toList(),
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                      FFAppState().filterGarageTypeList = functions
                                          .returnMappedListFromBoolList(
                                              widget!.dataList?.toList(),
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'ประเภทบัตร') {
                                      FFAppState().insuranceInfoCardType =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'เพศ') {
                                      FFAppState().insuranceInfoGender =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'คำนำหน้า') {
                                      FFAppState().insuranceInfoTitle =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'กลุ่มอาชีพ') {
                                      FFAppState()
                                              .insuranceInfoOccupationGroup =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'เลือกจังหวัดจดทะเบียน') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      FFAppState().nonePackageProvinceId =
                                          FFAppState()
                                              .insuranceBasicProvinceIdList
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().nonePackageProvince =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'ค้นหาที่อยู่') {
                                      if (widget!.fromPage ==
                                          'addAddressIdCard') {
                                        FFAppState()
                                                .addAddressSelectProvinceId =
                                            FFAppState()
                                                .addAddressProvinceId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectProvinceName =
                                            FFAppState()
                                                .addAddressProvinceName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectDistrictId =
                                            FFAppState()
                                                .addAddressDistrictId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!
                                                .toString();
                                        FFAppState()
                                                .addAddressSelectDistrictName =
                                            FFAppState()
                                                .addAddressDistrictName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectSubdistrictId =
                                            FFAppState()
                                                .addAddressSubdistrictId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!
                                                .toString();
                                        FFAppState()
                                                .addAddressSelectSubdistrictName =
                                            FFAppState()
                                                .addAddressSubdistrictName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().addAddressSelectZipCode =
                                            FFAppState()
                                                .addAddressZipCode
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().addAddressSelectKeyWord =
                                            FFAppState()
                                                .addAddressKeyWord
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().addAddressAtIdCard =
                                            FFAppState()
                                                .addAddressKeyWord
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().addAddressForDoc = FFAppState()
                                            .addAddressKeyWord
                                            .elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true))!;
                                        FFAppState()
                                                .addAdressSelectDocProvinceId =
                                            FFAppState()
                                                .addAddressProvinceId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAdressSelectDocProvinceName =
                                            FFAppState()
                                                .addAddressProvinceName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAdressSelectDocDistrictName =
                                            FFAppState()
                                                .addAddressDistrictName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectDocDistrictId =
                                            FFAppState()
                                                .addAddressDistrictId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!
                                                .toString();
                                        FFAppState()
                                                .addAddressSelectDocSubdistrictId =
                                            FFAppState()
                                                .addAddressSubdistrictId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!
                                                .toString();
                                        FFAppState()
                                                .addAddressSelectDocSubdistrictName =
                                            FFAppState()
                                                .addAddressSubdistrictName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectDocZipCode =
                                            FFAppState()
                                                .addAddressZipCode
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectDocKeyWord =
                                            FFAppState()
                                                .addAddressKeyWord
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกประเภทตู้เหล็ก') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      FFAppState().nonePackageCarrierType =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'เลือกส่วนของรถบรรทุก') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      FFAppState().nonePackageTruckPart =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'เลือกประเภทลูกค้า') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      FFAppState().nonePackageCusMembership =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'เลือกปีที่ผลิต') {
                                      FFAppState().insuranceInfoProductYear =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
