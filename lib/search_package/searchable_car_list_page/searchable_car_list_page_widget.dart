import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
      if (widget.titleText == 'เลือกประเภทชั้นประกัน') {
        if (widget.fromPage != 'NonePackage') {
          setState(() {
            FFAppState().searchableListComponentData =
                widget.dataList!.toList().cast<String>();
            FFAppState().searchableListComponentSelectedList = functions
                .createFalseListByItemNumber(true, widget.dataList?.length)!
                .toList()
                .cast<bool>();
          });
          return;
        }
      }
      setState(() {
        FFAppState().searchableListComponentData =
            widget.dataList!.toList().cast<String>();
        FFAppState().searchableListComponentSelectedList = functions
            .createFalseListByItemNumber(false, widget.dataList?.length)!
            .toList()
            .cast<bool>();
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
              widget.titleText,
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
                        if (false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.multiSelect && (widget.maxSelected > 0)
                                      ? 'สามารถเลือกได้สูงสุด ${widget.maxSelected.toString()} รายการ (${widget.multiSelect && (widget.maxSelected > 0) ? '${functions.countTrueInBoolList(FFAppState().searchableListComponentSelectedList.toList()).toString()}/${widget.maxSelected.toString()}' : 'เลือกแล้ว ${functions.countTrueInBoolList(FFAppState().searchableListComponentSelectedList.toList()).toString()} รายการ'}'
                                      : 'สามารถเลือกได้มากกว่า 1 รายการ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        if ((widget.dataList!.length > 5) && false)
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
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText: widget.searchLabel,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.search_outlined,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget.titleText == 'ค้นหาที่อยู่'
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
                                          if (widget.multiSelect) {
                                            if (widget.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'RenewStep2')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'act'))) {
                                              if ((widget.fromPage ==
                                                      'searchPackage') ||
                                                  (widget.fromPage == 'act')) {
                                                setState(() {
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
                                                });
                                                setState(() {
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
                                                });
                                                setState(() {
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget.fromPage ==
                                                    'NonePackage') {
                                                  setState(() {
                                                    FFAppState()
                                                            .nonePackageVehicleType =
                                                        'รถเก๋ง';
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถเก๋ง';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถเก๋ง';
                                                  });
                                                  setState(() {
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
                                                  });
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget.fromPage ==
                                                      'RenewStep2') {
                                                    setState(() {
                                                      FFAppState()
                                                              .insuranceCarTypeDetailSelected =
                                                          'รถเก๋ง';
                                                      FFAppState()
                                                              .nonepackagevehicletypeDetail =
                                                          'รถเก๋ง';
                                                      FFAppState()
                                                              .insuranceInfoVehicleType =
                                                          'รถเก๋ง';
                                                    });
                                                    setState(() {
                                                      FFAppState()
                                                              .insuranceBasicVehicleGroup =
                                                          'OTHER';
                                                      FFAppState()
                                                              .insuranceBasicCarTypeContain =
                                                          '-';
                                                      FFAppState()
                                                              .insuranceBasicCarTypeDoors =
                                                          '-';
                                                    });
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
                                                                .bodyMedium,
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
                                          if (widget.multiSelect) {
                                            if (widget.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'RenewStep2')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'act'))) {
                                              if ((widget.fromPage ==
                                                      'searchPackage') ||
                                                  (widget.fromPage == 'act')) {
                                                setState(() {
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
                                                });
                                                setState(() {
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
                                                });
                                                setState(() {
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget.fromPage ==
                                                    'NonePackage') {
                                                  setState(() {
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
                                                  });
                                                  setState(() {
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
                                                  });
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget.fromPage ==
                                                      'RenewStep2') {
                                                    setState(() {
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
                                                    });
                                                    setState(() {
                                                      FFAppState()
                                                              .insuranceBasicVehicleGroup =
                                                          'VAN';
                                                      FFAppState()
                                                              .insuranceBasicCarTypeContain =
                                                          '-';
                                                      FFAppState()
                                                              .insuranceBasicCarTypeDoors =
                                                          '-';
                                                    });
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
                                                                .bodyMedium,
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
                                          if (widget.multiSelect) {
                                            if (widget.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'RenewStep2')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'act'))) {
                                              if ((widget.fromPage ==
                                                      'searchPackage') ||
                                                  (widget.fromPage == 'act')) {
                                                setState(() {
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
                                                });
                                                setState(() {
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
                                                });
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed(
                                                  'SearchablePickUpListPage',
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
                                                      true,
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
                                                if (widget.fromPage ==
                                                    'NonePackage') {
                                                  setState(() {
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
                                                  });
                                                  setState(() {
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
                                                  });
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    'SearchablePickUpListPage',
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
                                                        true,
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
                                                  if (widget.fromPage ==
                                                      'RenewStep2') {
                                                    setState(() {
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
                                                    });
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context.pushNamed(
                                                      'SearchablePickUpListPage',
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
                                                          true,
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
                                            if (widget.titleText ==
                                                'เลือกยี่ห้อรถ') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicBrandName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                          .isSelectBrandInPackage =
                                                      true;
                                                  FFAppState()
                                                      .insuranceBasicBrandId = FFAppState()
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                setState(() {
                                                  FFAppState().insuranceBasicModelNameList = functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceBasicModelNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
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
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState()
                                                          .insuranceBasicModelName =
                                                      'เลือกรุ่นรถ';
                                                  FFAppState()
                                                      .insuranceBasicModelId = '';
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    1,
                                                    (_) => true,
                                                  );
                                                });
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
                                                      'InsuranceWorkSelectPage');

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                          .nonePackageBrandName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                      .nonePackageBrandId = FFAppState()
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .nonePackageIsBrandSelect =
                                                      true;
                                                });
                                                setState(() {
                                                  FFAppState().nonePackageSearchModelList = functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceBasicModelNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
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
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
                                                      .toList()
                                                      .cast<String>();
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกปีจดทะเบียน') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicYear =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    3,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageYear = widget
                                                          .dataList![
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกลักษณะการใช้รถ') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                      .insuranceBasicVehicleUsedTypeId = FFAppState()
                                                          .insuranceBasicVehicleUsedTypeIdList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                          .insuranceBasicVehicleUsedTypeCodeList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .insuranceBasicVehicleUsedTypeName = FFAppState()
                                                          .insuranceBasicVehicleUsedTypeNameList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    4,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageUsedTypeId = FFAppState()
                                                          .nonePackageUsedTypeIdList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .nonePackageUsedTypeCode = FFAppState()
                                                          .nonePackageUsedTypeCodeList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .nonePackageUsedTypeName = FFAppState()
                                                          .nonePackageUsedTypeNameList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทชั้นประกัน') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicCoverTypeNameOutputList =
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              widget.dataList
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageCoverTypeId = FFAppState()
                                                          .insuranceBasicCoverTypeIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .nonePackageCoverTypeCode = FFAppState()
                                                          .insuranceBasicCoverTypeCodeList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .nonePackageCoverTypeName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทการซ่อม') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageGarageTypeId = FFAppState()
                                                          .insuranceBasicGarageTypeIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .nonePackageGarageTypeName = FFAppState()
                                                          .insuranceBasicGarageTypeNameList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .nonePackageGarageTypeCode = FFAppState()
                                                          .nonePackageGarageTypeCodeList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                              setState(() {
                                                FFAppState().filterInsurerList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาเปรียบเทียบชั้นประกัน') {
                                              setState(() {
                                                FFAppState()
                                                        .filterCoverTypeList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                              setState(() {
                                                FFAppState()
                                                        .filterGarageTypeList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ประเภทบัตร') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoCardType = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText == 'เพศ') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoGender = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .insuranceInfoTitle =
                                                    'เลือกคำนำหน้าชื่อ';
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'คำนำหน้า') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoTitle = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'กลุ่มอาชีพ') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoOccupationGroup = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              setState(() {
                                                FFAppState()
                                                        .insuranceInfoSelectOccupationCode =
                                                    functions.removeDupeInList(
                                                        FFAppState()
                                                            .insuranceInfoOccupationCode
                                                            .toList())![functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)];
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationName = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              setState(() {
                                                FFAppState().insuranceInfoSelectOccupationSubCode = functions
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
                                                FFAppState().insuranceInfoSelectOccupationSubName = functions
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
                                              });
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationSubNameChoose = '';
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกจังหวัดจดทะเบียน') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageProvinceId = FFAppState()
                                                        .insuranceBasicProvinceIdList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .nonePackageProvince = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาที่อยู่') {
                                              if (widget.fromPage ==
                                                  'addAddressIdCard') {
                                                setState(() {
                                                  FFAppState()
                                                      .addAddressSelectProvinceId = FFAppState()
                                                          .addAddressProvinceId[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAddressSelectProvinceName = FFAppState()
                                                          .addAddressProvinceName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectDistrictId =
                                                      FFAppState()
                                                          .addAddressDistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                      .addAddressSelectDistrictName = FFAppState()
                                                          .addAddressDistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectSubdistrictId =
                                                      FFAppState()
                                                          .addAddressSubdistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                      .addAddressSelectSubdistrictName = FFAppState()
                                                          .addAddressSubdistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectZipCode =
                                                      FFAppState()
                                                              .addAddressZipCode[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                  FFAppState()
                                                          .addAddressSelectKeyWord =
                                                      FFAppState()
                                                              .addAddressKeyWord[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                  FFAppState()
                                                      .addAddressAtIdCard = FFAppState()
                                                          .addAddressKeyWord[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .addAddressForDoc = FFAppState()
                                                          .addAddressKeyWord[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAdressSelectDocProvinceId = FFAppState()
                                                          .addAddressProvinceId[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAdressSelectDocProvinceName = FFAppState()
                                                          .addAddressProvinceName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAdressSelectDocDistrictName = FFAppState()
                                                          .addAddressDistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectDocDistrictId =
                                                      FFAppState()
                                                          .addAddressDistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                          .addAddressSelectDocSubdistrictId =
                                                      FFAppState()
                                                          .addAddressSubdistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                      .addAddressSelectDocSubdistrictName = FFAppState()
                                                          .addAddressSubdistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectDocZipCode =
                                                      FFAppState()
                                                              .addAddressZipCode[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                  FFAppState()
                                                          .addAddressSelectDocKeyWord =
                                                      FFAppState()
                                                              .addAddressKeyWord[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทตู้เหล็ก') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageCarrierType = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกส่วนของรถบรรทุก') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageTruckPart = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทลูกค้า') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageCusMembership = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกปีที่ผลิต') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoProductYear = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'จำนวนงวด') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoPage4SelectTenor = FFAppState()
                                                        .InsuranceInfoPage4Tenor[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceInfoPage4SelectInstallMentFirstDue = FFAppState()
                                                        .InsuranceInfoPage4InstallmentFirstDue[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceInfoPage4SelectInstallMentLastDue = FFAppState()
                                                        .InsuranceInfoPage4InstallmentLastDue[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกบริษัทประกัน') {
                                              if (widget.fromPage ==
                                                  'NonePackageSelectedInsurer') {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageSelectedInsurerShortName = FFAppState()
                                                          .nonePackageSelectedInsurerShortNameList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกจังหวัดที่จดทะเบียน') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoRegistrationCodeSelect = FFAppState()
                                                        .insuranceInfoRegistrationCodeList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceInfoRegistrationProvinceSelect = FFAppState()
                                                        .insuranceInfoRegistrationprovinceList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกรุ่นรถ') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicModelName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                      .insuranceBasicModelId = FFAppState()
                                                          .insuranceBasicModelIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    2,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText == 'อาชีพ') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationSubNameChoose = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
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
                                                                .bodyMedium,
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
                                          if (widget.multiSelect) {
                                            if (widget.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'RenewStep2')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'act'))) {
                                              if ((widget.fromPage ==
                                                      'searchPackage') ||
                                                  (widget.fromPage == 'act')) {
                                                setState(() {
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
                                                });
                                                setState(() {
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
                                                });
                                                setState(() {
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget.fromPage ==
                                                    'NonePackage') {
                                                  setState(() {
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
                                                  });
                                                  setState(() {
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
                                                  });
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget.fromPage ==
                                                      'RenewStep2') {
                                                    setState(() {
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
                                                    });
                                                    setState(() {
                                                      FFAppState()
                                                              .insuranceBasicVehicleGroup =
                                                          'PICKUP';
                                                      FFAppState()
                                                              .insuranceBasicCarTypeContain =
                                                          '-';
                                                      FFAppState()
                                                              .insuranceBasicCarTypeDoors =
                                                          '4 Doors';
                                                    });
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
                                                                .bodyMedium,
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
                                  if (widget.fromPage != 'act')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget.multiSelect) {
                                            if (widget.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'RenewStep2'))) {
                                              if (widget.fromPage ==
                                                  'searchPackage') {
                                                if (true) {
                                                  context.goNamed(
                                                      'InsuranceWorkSelectPage');

                                                  return;
                                                } else {
                                                  if ((widget.dataList?[functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)]) ==
                                                      'รถแต่ง ต่อคอก') {
                                                    context.goNamed(
                                                        'InsuranceWorkSelectPage');

                                                    return;
                                                  }
                                                }

                                                setState(() {
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget.fromPage ==
                                                    'NonePackage') {
                                                  setState(() {
                                                    FFAppState()
                                                            .nonePackageVehicleType =
                                                        'รถบรรทุก หัวลาก หางพ่วง';
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถบรรทุก หัวลาก หางพ่วง';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถบรรทุก หัวลาก หางพ่วง';
                                                  });
                                                  setState(() {
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
                                                  });
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget.fromPage ==
                                                      'RenewStep2') {
                                                    setState(() {
                                                      FFAppState()
                                                              .insuranceCarTypeDetailSelected =
                                                          'รถบรรทุก หัวลาก หางพ่วง';
                                                      FFAppState()
                                                              .nonepackagevehicletypeDetail =
                                                          'รถบรรทุก หัวลาก หางพ่วง';
                                                      FFAppState()
                                                              .insuranceInfoVehicleType =
                                                          'รถบรรทุก หัวลาก หางพ่วง';
                                                    });
                                                    setState(() {
                                                      FFAppState()
                                                              .insuranceBasicVehicleGroup =
                                                          'TRUCK';
                                                      FFAppState()
                                                              .insuranceBasicCarTypeContain =
                                                          '-';
                                                      FFAppState()
                                                              .insuranceBasicCarTypeDoors =
                                                          '-';
                                                    });
                                                    context.safePop();
                                                    return;
                                                  }
                                                }
                                              }

                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกยี่ห้อรถ') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicBrandName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                          .isSelectBrandInPackage =
                                                      true;
                                                  FFAppState()
                                                      .insuranceBasicBrandId = FFAppState()
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                setState(() {
                                                  FFAppState().insuranceBasicModelNameList = functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceBasicModelNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
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
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState()
                                                          .insuranceBasicModelName =
                                                      'เลือกรุ่นรถ';
                                                  FFAppState()
                                                      .insuranceBasicModelId = '';
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    1,
                                                    (_) => true,
                                                  );
                                                });
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
                                                      'InsuranceWorkSelectPage');

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                          .nonePackageBrandName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                      .nonePackageBrandId = FFAppState()
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .nonePackageIsBrandSelect =
                                                      true;
                                                });
                                                setState(() {
                                                  FFAppState().nonePackageSearchModelList = functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceBasicModelNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
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
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
                                                      .toList()
                                                      .cast<String>();
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกปีจดทะเบียน') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicYear =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    3,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageYear = widget
                                                          .dataList![
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกลักษณะการใช้รถ') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                      .insuranceBasicVehicleUsedTypeId = FFAppState()
                                                          .insuranceBasicVehicleUsedTypeIdList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                          .insuranceBasicVehicleUsedTypeCodeList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .insuranceBasicVehicleUsedTypeName = FFAppState()
                                                          .insuranceBasicVehicleUsedTypeNameList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    4,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageUsedTypeId = FFAppState()
                                                          .nonePackageUsedTypeIdList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .nonePackageUsedTypeCode = FFAppState()
                                                          .nonePackageUsedTypeCodeList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .nonePackageUsedTypeName = FFAppState()
                                                          .nonePackageUsedTypeNameList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทชั้นประกัน') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicCoverTypeNameOutputList =
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              widget.dataList
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageCoverTypeId = FFAppState()
                                                          .insuranceBasicCoverTypeIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .nonePackageCoverTypeCode = FFAppState()
                                                          .insuranceBasicCoverTypeCodeList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .nonePackageCoverTypeName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทการซ่อม') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageGarageTypeId = FFAppState()
                                                          .insuranceBasicGarageTypeIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .nonePackageGarageTypeName = FFAppState()
                                                          .insuranceBasicGarageTypeNameList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .nonePackageGarageTypeCode = FFAppState()
                                                          .nonePackageGarageTypeCodeList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                              setState(() {
                                                FFAppState().filterInsurerList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาเปรียบเทียบชั้นประกัน') {
                                              setState(() {
                                                FFAppState()
                                                        .filterCoverTypeList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                              setState(() {
                                                FFAppState()
                                                        .filterGarageTypeList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ประเภทบัตร') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoCardType = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText == 'เพศ') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoGender = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .insuranceInfoTitle =
                                                    'เลือกคำนำหน้าชื่อ';
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'คำนำหน้า') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoTitle = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'กลุ่มอาชีพ') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoOccupationGroup = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              setState(() {
                                                FFAppState()
                                                        .insuranceInfoSelectOccupationCode =
                                                    functions.removeDupeInList(
                                                        FFAppState()
                                                            .insuranceInfoOccupationCode
                                                            .toList())![functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)];
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationName = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              setState(() {
                                                FFAppState().insuranceInfoSelectOccupationSubCode = functions
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
                                                FFAppState().insuranceInfoSelectOccupationSubName = functions
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
                                              });
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationSubNameChoose = '';
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกจังหวัดจดทะเบียน') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageProvinceId = FFAppState()
                                                        .insuranceBasicProvinceIdList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .nonePackageProvince = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาที่อยู่') {
                                              if (widget.fromPage ==
                                                  'addAddressIdCard') {
                                                setState(() {
                                                  FFAppState()
                                                      .addAddressSelectProvinceId = FFAppState()
                                                          .addAddressProvinceId[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAddressSelectProvinceName = FFAppState()
                                                          .addAddressProvinceName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectDistrictId =
                                                      FFAppState()
                                                          .addAddressDistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                      .addAddressSelectDistrictName = FFAppState()
                                                          .addAddressDistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectSubdistrictId =
                                                      FFAppState()
                                                          .addAddressSubdistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                      .addAddressSelectSubdistrictName = FFAppState()
                                                          .addAddressSubdistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectZipCode =
                                                      FFAppState()
                                                              .addAddressZipCode[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                  FFAppState()
                                                          .addAddressSelectKeyWord =
                                                      FFAppState()
                                                              .addAddressKeyWord[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                  FFAppState()
                                                      .addAddressAtIdCard = FFAppState()
                                                          .addAddressKeyWord[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .addAddressForDoc = FFAppState()
                                                          .addAddressKeyWord[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAdressSelectDocProvinceId = FFAppState()
                                                          .addAddressProvinceId[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAdressSelectDocProvinceName = FFAppState()
                                                          .addAddressProvinceName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAdressSelectDocDistrictName = FFAppState()
                                                          .addAddressDistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectDocDistrictId =
                                                      FFAppState()
                                                          .addAddressDistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                          .addAddressSelectDocSubdistrictId =
                                                      FFAppState()
                                                          .addAddressSubdistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                      .addAddressSelectDocSubdistrictName = FFAppState()
                                                          .addAddressSubdistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectDocZipCode =
                                                      FFAppState()
                                                              .addAddressZipCode[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                  FFAppState()
                                                          .addAddressSelectDocKeyWord =
                                                      FFAppState()
                                                              .addAddressKeyWord[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทตู้เหล็ก') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageCarrierType = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกส่วนของรถบรรทุก') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageTruckPart = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทลูกค้า') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageCusMembership = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกปีที่ผลิต') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoProductYear = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'จำนวนงวด') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoPage4SelectTenor = FFAppState()
                                                        .InsuranceInfoPage4Tenor[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceInfoPage4SelectInstallMentFirstDue = FFAppState()
                                                        .InsuranceInfoPage4InstallmentFirstDue[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceInfoPage4SelectInstallMentLastDue = FFAppState()
                                                        .InsuranceInfoPage4InstallmentLastDue[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกบริษัทประกัน') {
                                              if (widget.fromPage ==
                                                  'NonePackageSelectedInsurer') {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageSelectedInsurerShortName = FFAppState()
                                                          .nonePackageSelectedInsurerShortNameList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกจังหวัดที่จดทะเบียน') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoRegistrationCodeSelect = FFAppState()
                                                        .insuranceInfoRegistrationCodeList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceInfoRegistrationProvinceSelect = FFAppState()
                                                        .insuranceInfoRegistrationprovinceList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกรุ่นรถ') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicModelName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                      .insuranceBasicModelId = FFAppState()
                                                          .insuranceBasicModelIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    2,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText == 'อาชีพ') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationSubNameChoose = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
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
                                                                .bodyMedium,
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
                                  if (widget.fromPage != 'act')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget.multiSelect) {
                                            if (widget.maxSelected == 0) {
                                            } else {
                                              if (functions.countTrueInBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList())! >=
                                                  widget.maxSelected) {}
                                            }
                                          } else {
                                            if (((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'searchPackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'NonePackage')) ||
                                                ((widget.titleText ==
                                                        'เลือกประเภทรถ') &&
                                                    (widget.fromPage ==
                                                        'RenewStep2'))) {
                                              if (widget.fromPage ==
                                                  'searchPackage') {
                                                if (false) {
                                                  context.goNamed(
                                                      'InsuranceWorkSelectPage');

                                                  return;
                                                } else {
                                                  if (true) {
                                                    context.goNamed(
                                                        'InsuranceWorkSelectPage');

                                                    return;
                                                  }
                                                }

                                                setState(() {
                                                  FFAppState()
                                                          .insuranceVehicleTypeDropDown =
                                                      'รถเเต่ง ต่อคอก';
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    0,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                if (widget.fromPage ==
                                                    'NonePackage') {
                                                  setState(() {
                                                    FFAppState()
                                                            .nonePackageVehicleType =
                                                        'รถเเต่ง';
                                                    FFAppState()
                                                            .insuranceCarTypeDetailSelected =
                                                        'รถเเต่ง';
                                                    FFAppState()
                                                            .nonepackagevehicletypeDetail =
                                                        'รถเเต่ง';
                                                  });
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget.fromPage ==
                                                      'RenewStep2') {
                                                    setState(() {
                                                      FFAppState()
                                                              .insuranceCarTypeDetailSelected =
                                                          'รถเเต่ง';
                                                      FFAppState()
                                                              .nonepackagevehicletypeDetail =
                                                          'รถเเต่ง';
                                                      FFAppState()
                                                              .insuranceInfoVehicleType =
                                                          'รถเเต่ง';
                                                    });
                                                    context.safePop();
                                                    return;
                                                  }
                                                }
                                              }

                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกยี่ห้อรถ') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicBrandName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                          .isSelectBrandInPackage =
                                                      true;
                                                  FFAppState()
                                                      .insuranceBasicBrandId = FFAppState()
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                setState(() {
                                                  FFAppState().insuranceBasicModelNameList = functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceBasicModelNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
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
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
                                                      .toList()
                                                      .cast<String>();
                                                  FFAppState()
                                                          .insuranceBasicModelName =
                                                      'เลือกรุ่นรถ';
                                                  FFAppState()
                                                      .insuranceBasicModelId = '';
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    1,
                                                    (_) => true,
                                                  );
                                                });
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
                                                      'InsuranceWorkSelectPage');

                                                  return;
                                                }
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                          .nonePackageBrandName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                      .nonePackageBrandId = FFAppState()
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .nonePackageIsBrandSelect =
                                                      true;
                                                });
                                                setState(() {
                                                  FFAppState().nonePackageSearchModelList = functions
                                                      .returnMappedListFrom2List(
                                                          FFAppState()
                                                              .insuranceBasicModelNameListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                              .insuranceBasicModelBrandIdListOriginal
                                                              .toList(),
                                                          FFAppState()
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
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
                                                                  .insuranceBasicBrandIdList[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])
                                                      .toList()
                                                      .cast<String>();
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกปีจดทะเบียน') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicYear =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    3,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageYear = widget
                                                          .dataList![
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกลักษณะการใช้รถ') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                      .insuranceBasicVehicleUsedTypeId = FFAppState()
                                                          .insuranceBasicVehicleUsedTypeIdList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                          .insuranceBasicVehicleUsedTypeCodeList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .insuranceBasicVehicleUsedTypeName = FFAppState()
                                                          .insuranceBasicVehicleUsedTypeNameList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    4,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageUsedTypeId = FFAppState()
                                                          .nonePackageUsedTypeIdList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .nonePackageUsedTypeCode = FFAppState()
                                                          .nonePackageUsedTypeCodeList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .nonePackageUsedTypeName = FFAppState()
                                                          .nonePackageUsedTypeNameList[
                                                      functions.getIndexOfSomethingList(
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
                                                          widget.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทชั้นประกัน') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicCoverTypeNameOutputList =
                                                      functions
                                                          .returnMappedListFromBoolList(
                                                              widget.dataList
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageCoverTypeId = FFAppState()
                                                          .insuranceBasicCoverTypeIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .nonePackageCoverTypeCode = FFAppState()
                                                          .insuranceBasicCoverTypeCodeList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .nonePackageCoverTypeName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทการซ่อม') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
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
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageGarageTypeId = FFAppState()
                                                          .insuranceBasicGarageTypeIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .nonePackageGarageTypeName = FFAppState()
                                                          .insuranceBasicGarageTypeNameList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .nonePackageGarageTypeCode = FFAppState()
                                                          .nonePackageGarageTypeCodeList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                              setState(() {
                                                FFAppState().filterInsurerList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาเปรียบเทียบชั้นประกัน') {
                                              setState(() {
                                                FFAppState()
                                                        .filterCoverTypeList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                              setState(() {
                                                FFAppState()
                                                        .filterGarageTypeList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)
                                                        .toList()
                                                        .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ประเภทบัตร') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoCardType = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText == 'เพศ') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoGender = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .insuranceInfoTitle =
                                                    'เลือกคำนำหน้าชื่อ';
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'คำนำหน้า') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoTitle = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'กลุ่มอาชีพ') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoOccupationGroup = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              setState(() {
                                                FFAppState()
                                                        .insuranceInfoSelectOccupationCode =
                                                    functions.removeDupeInList(
                                                        FFAppState()
                                                            .insuranceInfoOccupationCode
                                                            .toList())![functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)];
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationName = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              setState(() {
                                                FFAppState().insuranceInfoSelectOccupationSubCode = functions
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
                                                FFAppState().insuranceInfoSelectOccupationSubName = functions
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
                                              });
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationSubNameChoose = '';
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกจังหวัดจดทะเบียน') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageProvinceId = FFAppState()
                                                        .insuranceBasicProvinceIdList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .nonePackageProvince = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'ค้นหาที่อยู่') {
                                              if (widget.fromPage ==
                                                  'addAddressIdCard') {
                                                setState(() {
                                                  FFAppState()
                                                      .addAddressSelectProvinceId = FFAppState()
                                                          .addAddressProvinceId[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAddressSelectProvinceName = FFAppState()
                                                          .addAddressProvinceName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectDistrictId =
                                                      FFAppState()
                                                          .addAddressDistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                      .addAddressSelectDistrictName = FFAppState()
                                                          .addAddressDistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectSubdistrictId =
                                                      FFAppState()
                                                          .addAddressSubdistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                      .addAddressSelectSubdistrictName = FFAppState()
                                                          .addAddressSubdistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectZipCode =
                                                      FFAppState()
                                                              .addAddressZipCode[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                  FFAppState()
                                                          .addAddressSelectKeyWord =
                                                      FFAppState()
                                                              .addAddressKeyWord[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                  FFAppState()
                                                      .addAddressAtIdCard = FFAppState()
                                                          .addAddressKeyWord[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .addAddressForDoc = FFAppState()
                                                          .addAddressKeyWord[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAdressSelectDocProvinceId = FFAppState()
                                                          .addAddressProvinceId[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAdressSelectDocProvinceName = FFAppState()
                                                          .addAddressProvinceName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                      .addAdressSelectDocDistrictName = FFAppState()
                                                          .addAddressDistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectDocDistrictId =
                                                      FFAppState()
                                                          .addAddressDistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                          .addAddressSelectDocSubdistrictId =
                                                      FFAppState()
                                                          .addAddressSubdistrictId[
                                                              functions.getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)]
                                                          .toString();
                                                  FFAppState()
                                                      .addAddressSelectDocSubdistrictName = FFAppState()
                                                          .addAddressSubdistrictName[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .addAddressSelectDocZipCode =
                                                      FFAppState()
                                                              .addAddressZipCode[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                  FFAppState()
                                                          .addAddressSelectDocKeyWord =
                                                      FFAppState()
                                                              .addAddressKeyWord[
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทตู้เหล็ก') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageCarrierType = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกส่วนของรถบรรทุก') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageTruckPart = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกประเภทลูกค้า') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                return;
                                              }

                                              setState(() {
                                                FFAppState()
                                                    .nonePackageCusMembership = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกปีที่ผลิต') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoProductYear = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'จำนวนงวด') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoPage4SelectTenor = FFAppState()
                                                        .InsuranceInfoPage4Tenor[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceInfoPage4SelectInstallMentFirstDue = FFAppState()
                                                        .InsuranceInfoPage4InstallmentFirstDue[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceInfoPage4SelectInstallMentLastDue = FFAppState()
                                                        .InsuranceInfoPage4InstallmentLastDue[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกบริษัทประกัน') {
                                              if (widget.fromPage ==
                                                  'NonePackageSelectedInsurer') {
                                                setState(() {
                                                  FFAppState()
                                                      .nonePackageSelectedInsurerShortName = FFAppState()
                                                          .nonePackageSelectedInsurerShortNameList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText ==
                                                'เลือกจังหวัดที่จดทะเบียน') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoRegistrationCodeSelect = FFAppState()
                                                        .insuranceInfoRegistrationCodeList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceInfoRegistrationProvinceSelect = FFAppState()
                                                        .insuranceInfoRegistrationprovinceList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                            if (widget.titleText ==
                                                'เลือกรุ่นรถ') {
                                              if (widget.fromPage !=
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .insuranceBasicModelName =
                                                      widget.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                      .insuranceBasicModelId = FFAppState()
                                                          .insuranceBasicModelIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    2,
                                                    (_) => true,
                                                  );
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }
                                            if (widget.titleText == 'อาชีพ') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationSubNameChoose = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
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
                                                                .bodyMedium,
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
                                        if (widget.multiSelect) {
                                          if (widget.maxSelected == 0) {
                                          } else {
                                            if (functions.countTrueInBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList())! >=
                                                widget.maxSelected) {}
                                          }
                                        } else {
                                          if (((widget.titleText ==
                                                      'เลือกประเภทรถ') &&
                                                  (widget.fromPage ==
                                                      'searchPackage')) ||
                                              ((widget.titleText ==
                                                      'เลือกประเภทรถ') &&
                                                  (widget.fromPage ==
                                                      'NonePackage'))) {
                                            if (widget.fromPage ==
                                                'searchPackage') {
                                              if (false) {
                                                context.goNamed(
                                                    'InsuranceWorkSelectPage');

                                                return;
                                              } else {
                                                if (true) {
                                                  context.goNamed(
                                                      'InsuranceWorkSelectPage');

                                                  return;
                                                }
                                              }

                                              setState(() {
                                                FFAppState()
                                                        .insuranceVehicleTypeDropDown =
                                                    'รถเเต่ง ต่อคอก';
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  0,
                                                  (_) => true,
                                                );
                                              });
                                              context.safePop();
                                              return;
                                            } else {
                                              if (widget.fromPage ==
                                                  'NonePackage') {
                                                setState(() {
                                                  FFAppState()
                                                          .nonePackageVehicleType =
                                                      'รถซุปเปอร์คาร์';
                                                  FFAppState()
                                                          .insuranceCarTypeDetailSelected =
                                                      'รถซุปเปอร์คาร์';
                                                  FFAppState()
                                                          .nonepackagevehicletypeDetail =
                                                      'รถซุปเปอร์คาร์';
                                                });
                                                setState(() {
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
                                                });
                                                context.safePop();
                                                return;
                                              }
                                            }

                                            return;
                                          }
                                          if (widget.titleText ==
                                              'เลือกยี่ห้อรถ') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceBasicBrandName = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .isSelectBrandInPackage =
                                                    true;
                                                FFAppState()
                                                    .insuranceBasicBrandId = FFAppState()
                                                        .insuranceBasicBrandIdList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              setState(() {
                                                FFAppState().insuranceBasicModelNameList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                                .insuranceBasicBrandIdList[
                                                            functions.getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])
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
                                                                .insuranceBasicBrandIdList[
                                                            functions.getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])
                                                    .toList()
                                                    .cast<String>();
                                                FFAppState()
                                                        .insuranceBasicModelName =
                                                    'เลือกรุ่นรถ';
                                                FFAppState()
                                                    .insuranceBasicModelId = '';
                                              });
                                              setState(() {
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  1,
                                                  (_) => true,
                                                );
                                              });
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
                                                    'InsuranceWorkSelectPage');

                                                return;
                                              }
                                              context.safePop();
                                              return;
                                            } else {
                                              setState(() {
                                                FFAppState()
                                                    .nonePackageBrandName = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .nonePackageBrandId = FFAppState()
                                                        .insuranceBasicBrandIdList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .nonePackageIsBrandSelect =
                                                    true;
                                              });
                                              setState(() {
                                                FFAppState().nonePackageSearchModelList = functions
                                                    .returnMappedListFrom2List(
                                                        FFAppState()
                                                            .insuranceBasicModelNameListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicModelBrandIdListOriginal
                                                            .toList(),
                                                        FFAppState()
                                                                .insuranceBasicBrandIdList[
                                                            functions.getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])
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
                                                                .insuranceBasicBrandIdList[
                                                            functions.getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])
                                                    .toList()
                                                    .cast<String>();
                                              });
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget.titleText ==
                                              'เลือกปีจดทะเบียน') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceBasicYear = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              setState(() {
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  3,
                                                  (_) => true,
                                                );
                                              });
                                              context.safePop();
                                              return;
                                            } else {
                                              setState(() {
                                                FFAppState()
                                                    .nonePackageYear = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget.titleText ==
                                              'เลือกลักษณะการใช้รถ') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceBasicVehicleUsedTypeId = FFAppState()
                                                        .insuranceBasicVehicleUsedTypeIdList[
                                                    functions.getIndexOfSomethingList(
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
                                                        widget.dataList?[functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])];
                                                FFAppState()
                                                    .insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                        .insuranceBasicVehicleUsedTypeCodeList[
                                                    functions.getIndexOfSomethingList(
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
                                                        widget.dataList?[functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])];
                                                FFAppState()
                                                    .insuranceBasicVehicleUsedTypeName = FFAppState()
                                                        .insuranceBasicVehicleUsedTypeNameList[
                                                    functions.getIndexOfSomethingList(
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
                                                        widget.dataList?[functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])];
                                              });
                                              setState(() {
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  4,
                                                  (_) => true,
                                                );
                                              });
                                              context.safePop();
                                              return;
                                            } else {
                                              setState(() {
                                                FFAppState()
                                                    .nonePackageUsedTypeId = FFAppState()
                                                        .nonePackageUsedTypeIdList[
                                                    functions.getIndexOfSomethingList(
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
                                                        widget.dataList?[functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])];
                                                FFAppState()
                                                    .nonePackageUsedTypeCode = FFAppState()
                                                        .nonePackageUsedTypeCodeList[
                                                    functions.getIndexOfSomethingList(
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
                                                        widget.dataList?[functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])];
                                                FFAppState()
                                                    .nonePackageUsedTypeName = FFAppState()
                                                        .nonePackageUsedTypeNameList[
                                                    functions.getIndexOfSomethingList(
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
                                                        widget.dataList?[functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)])];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget.titleText ==
                                              'เลือกประเภทชั้นประกัน') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              setState(() {
                                                FFAppState().insuranceBasicCoverTypeNameOutputList =
                                                    functions
                                                        .returnMappedListFromBoolList(
                                                            widget.dataList
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
                                              });
                                              context.safePop();
                                              return;
                                            } else {
                                              setState(() {
                                                FFAppState()
                                                    .nonePackageCoverTypeId = FFAppState()
                                                        .insuranceBasicCoverTypeIdList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .nonePackageCoverTypeCode = FFAppState()
                                                        .insuranceBasicCoverTypeCodeList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .nonePackageCoverTypeName = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget.titleText ==
                                              'เลือกประเภทการซ่อม') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              setState(() {
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
                                              });
                                              context.safePop();
                                              return;
                                            } else {
                                              setState(() {
                                                FFAppState()
                                                    .nonePackageGarageTypeId = FFAppState()
                                                        .insuranceBasicGarageTypeIdList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .nonePackageGarageTypeName = FFAppState()
                                                        .insuranceBasicGarageTypeNameList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .nonePackageGarageTypeCode = FFAppState()
                                                        .nonePackageGarageTypeCodeList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget.titleText ==
                                              'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                            setState(() {
                                              FFAppState().filterInsurerList = functions
                                                  .returnMappedListFromBoolList(
                                                      widget.dataList?.toList(),
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)
                                                  .toList()
                                                  .cast<String>();
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'ค้นหาเปรียบเทียบชั้นประกัน') {
                                            setState(() {
                                              FFAppState().filterCoverTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                            setState(() {
                                              FFAppState()
                                                      .filterGarageTypeList =
                                                  functions
                                                      .returnMappedListFromBoolList(
                                                          widget.dataList
                                                              ?.toList(),
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)
                                                      .toList()
                                                      .cast<String>();
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'ประเภทบัตร') {
                                            setState(() {
                                              FFAppState()
                                                  .insuranceInfoCardType = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText == 'เพศ') {
                                            setState(() {
                                              FFAppState()
                                                  .insuranceInfoGender = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                              FFAppState().insuranceInfoTitle =
                                                  'เลือกคำนำหน้าชื่อ';
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText == 'คำนำหน้า') {
                                            setState(() {
                                              FFAppState()
                                                  .insuranceInfoTitle = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'กลุ่มอาชีพ') {
                                            setState(() {
                                              FFAppState()
                                                  .insuranceInfoOccupationGroup = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            setState(() {
                                              FFAppState()
                                                      .insuranceInfoSelectOccupationCode =
                                                  functions.removeDupeInList(
                                                      FFAppState()
                                                          .insuranceInfoOccupationCode
                                                          .toList())![functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                              FFAppState()
                                                  .insuranceInfoSelectOccupationName = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            setState(() {
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
                                            });
                                            setState(() {
                                              FFAppState()
                                                  .insuranceInfoSelectOccupationSubNameChoose = '';
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'เลือกจังหวัดจดทะเบียน') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              return;
                                            }

                                            setState(() {
                                              FFAppState()
                                                  .nonePackageProvinceId = FFAppState()
                                                      .insuranceBasicProvinceIdList[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                              FFAppState()
                                                  .nonePackageProvince = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'ค้นหาที่อยู่') {
                                            if (widget.fromPage ==
                                                'addAddressIdCard') {
                                              setState(() {
                                                FFAppState()
                                                    .addAddressSelectProvinceId = FFAppState()
                                                        .addAddressProvinceId[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .addAddressSelectProvinceName = FFAppState()
                                                        .addAddressProvinceName[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .addAddressSelectDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId[functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)]
                                                        .toString();
                                                FFAppState()
                                                    .addAddressSelectDistrictName = FFAppState()
                                                        .addAddressDistrictName[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .addAddressSelectSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId[
                                                            functions.getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)]
                                                        .toString();
                                                FFAppState()
                                                    .addAddressSelectSubdistrictName = FFAppState()
                                                        .addAddressSubdistrictName[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .addAddressSelectZipCode =
                                                    FFAppState()
                                                            .addAddressZipCode[
                                                        functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)];
                                                FFAppState()
                                                        .addAddressSelectKeyWord =
                                                    FFAppState()
                                                            .addAddressKeyWord[
                                                        functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)];
                                                FFAppState()
                                                    .addAddressAtIdCard = FFAppState()
                                                        .addAddressKeyWord[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            } else {
                                              setState(() {
                                                FFAppState()
                                                    .addAddressForDoc = FFAppState()
                                                        .addAddressKeyWord[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .addAdressSelectDocProvinceId = FFAppState()
                                                        .addAddressProvinceId[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .addAdressSelectDocProvinceName = FFAppState()
                                                        .addAddressProvinceName[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .addAdressSelectDocDistrictName = FFAppState()
                                                        .addAddressDistrictName[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .addAddressSelectDocDistrictId =
                                                    FFAppState()
                                                        .addAddressDistrictId[functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)]
                                                        .toString();
                                                FFAppState()
                                                        .addAddressSelectDocSubdistrictId =
                                                    FFAppState()
                                                        .addAddressSubdistrictId[
                                                            functions.getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)]
                                                        .toString();
                                                FFAppState()
                                                    .addAddressSelectDocSubdistrictName = FFAppState()
                                                        .addAddressSubdistrictName[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                        .addAddressSelectDocZipCode =
                                                    FFAppState()
                                                            .addAddressZipCode[
                                                        functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)];
                                                FFAppState()
                                                        .addAddressSelectDocKeyWord =
                                                    FFAppState()
                                                            .addAddressKeyWord[
                                                        functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget.titleText ==
                                              'เลือกประเภทตู้เหล็ก') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              return;
                                            }

                                            setState(() {
                                              FFAppState()
                                                  .nonePackageCarrierType = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'เลือกส่วนของรถบรรทุก') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              return;
                                            }

                                            setState(() {
                                              FFAppState()
                                                  .nonePackageTruckPart = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'เลือกประเภทลูกค้า') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              return;
                                            }

                                            setState(() {
                                              FFAppState()
                                                  .nonePackageCusMembership = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'เลือกปีที่ผลิต') {
                                            setState(() {
                                              FFAppState()
                                                  .insuranceInfoProductYear = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText == 'จำนวนงวด') {
                                            setState(() {
                                              FFAppState()
                                                  .insuranceInfoPage4SelectTenor = FFAppState()
                                                      .InsuranceInfoPage4Tenor[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                              FFAppState()
                                                  .insuranceInfoPage4SelectInstallMentFirstDue = FFAppState()
                                                      .InsuranceInfoPage4InstallmentFirstDue[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                              FFAppState()
                                                  .insuranceInfoPage4SelectInstallMentLastDue = FFAppState()
                                                      .InsuranceInfoPage4InstallmentLastDue[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'เลือกบริษัทประกัน') {
                                            if (widget.fromPage ==
                                                'NonePackageSelectedInsurer') {
                                              setState(() {
                                                FFAppState()
                                                    .nonePackageSelectedInsurerShortName = FFAppState()
                                                        .nonePackageSelectedInsurerShortNameList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget.titleText ==
                                              'เลือกจังหวัดที่จดทะเบียน') {
                                            setState(() {
                                              FFAppState()
                                                  .insuranceInfoRegistrationCodeSelect = FFAppState()
                                                      .insuranceInfoRegistrationCodeList[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                              FFAppState()
                                                  .insuranceInfoRegistrationProvinceSelect = FFAppState()
                                                      .insuranceInfoRegistrationprovinceList[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
                                            context.safePop();
                                            return;
                                          }
                                          if (widget.titleText ==
                                              'เลือกรุ่นรถ') {
                                            if (widget.fromPage !=
                                                'NonePackage') {
                                              setState(() {
                                                FFAppState()
                                                    .insuranceBasicModelName = widget
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                FFAppState()
                                                    .insuranceBasicModelId = FFAppState()
                                                        .insuranceBasicModelIdList[
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                              });
                                              setState(() {
                                                FFAppState()
                                                    .updateSearchPackageCheckFilledAtIndex(
                                                  2,
                                                  (_) => true,
                                                );
                                              });
                                              context.safePop();
                                              return;
                                            }
                                          }
                                          if (widget.titleText == 'อาชีพ') {
                                            setState(() {
                                              FFAppState()
                                                  .insuranceInfoSelectOccupationSubNameChoose = widget
                                                      .dataList![
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                            });
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
                                                              .bodyMedium,
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
                  if (widget.multiSelect)
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
                                    if (((widget.titleText ==
                                                'เลือกประเภทรถ') &&
                                            (widget.fromPage ==
                                                'searchPackage')) ||
                                        ((widget.titleText ==
                                                'เลือกประเภทรถ') &&
                                            (widget.fromPage ==
                                                'NonePackage'))) {
                                      if (widget.fromPage == 'searchPackage') {
                                        if ((widget.dataList?[
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)]) ==
                                            'รถบรรทุก หัวลาก หางพ่วง') {
                                          context.goNamed(
                                              'InsuranceWorkSelectPage');

                                          return;
                                        } else {
                                          if ((widget.dataList?[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)]) ==
                                              'รถแต่ง ต่อคอก') {
                                            context.goNamed(
                                                'InsuranceWorkSelectPage');

                                            return;
                                          }
                                        }

                                        setState(() {
                                          FFAppState()
                                              .insuranceVehicleTypeDropDown = widget
                                                  .dataList![
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                          FFAppState()
                                              .updateSearchPackageCheckFilledAtIndex(
                                            0,
                                            (_) => true,
                                          );
                                        });
                                        context.safePop();
                                        return;
                                      } else {
                                        if (widget.fromPage == 'NonePackage') {
                                          setState(() {
                                            FFAppState()
                                                .nonePackageVehicleType = widget
                                                    .dataList![
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)];
                                          });
                                          context.safePop();
                                          return;
                                        }
                                      }

                                      return;
                                    }
                                    if (widget.titleText == 'เลือกยี่ห้อรถ') {
                                      if (widget.fromPage != 'NonePackage') {
                                        setState(() {
                                          FFAppState()
                                              .insuranceBasicBrandName = widget
                                                  .dataList![
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                          FFAppState().isSelectBrandInPackage =
                                              true;
                                          FFAppState()
                                              .insuranceBasicBrandId = FFAppState()
                                                  .insuranceBasicBrandIdList[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                        });
                                        setState(() {
                                          FFAppState().insuranceBasicModelNameList = functions
                                              .returnMappedListFrom2List(
                                                  FFAppState()
                                                      .insuranceBasicModelNameListOriginal
                                                      .toList(),
                                                  FFAppState()
                                                      .insuranceBasicModelBrandIdListOriginal
                                                      .toList(),
                                                  FFAppState()
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])
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
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])
                                              .toList()
                                              .cast<String>();
                                        });
                                        setState(() {
                                          FFAppState()
                                              .updateSearchPackageCheckFilledAtIndex(
                                            1,
                                            (_) => true,
                                          );
                                        });
                                        context.safePop();
                                        return;
                                      } else {
                                        setState(() {
                                          FFAppState()
                                              .nonePackageBrandName = widget
                                                  .dataList![
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                          FFAppState()
                                              .nonePackageBrandId = FFAppState()
                                                  .insuranceBasicBrandIdList[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                          FFAppState()
                                              .nonePackageIsBrandSelect = true;
                                        });
                                        setState(() {
                                          FFAppState().nonePackageSearchModelList = functions
                                              .returnMappedListFrom2List(
                                                  FFAppState()
                                                      .insuranceBasicModelNameListOriginal
                                                      .toList(),
                                                  FFAppState()
                                                      .insuranceBasicModelBrandIdListOriginal
                                                      .toList(),
                                                  FFAppState()
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])
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
                                                          .insuranceBasicBrandIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])
                                              .toList()
                                              .cast<String>();
                                        });
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget.titleText ==
                                        'เลือกปีจดทะเบียน') {
                                      if (widget.fromPage != 'NonePackage') {
                                        setState(() {
                                          FFAppState()
                                              .insuranceBasicYear = widget
                                                  .dataList![
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                        });
                                        setState(() {
                                          FFAppState()
                                              .updateSearchPackageCheckFilledAtIndex(
                                            3,
                                            (_) => true,
                                          );
                                        });
                                        context.safePop();
                                        return;
                                      } else {
                                        setState(() {
                                          FFAppState().nonePackageYear = widget
                                                  .dataList![
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                        });
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget.titleText ==
                                        'เลือกลักษณะการใช้รถ') {
                                      if (widget.fromPage != 'NonePackage') {
                                        setState(() {
                                          FFAppState()
                                              .insuranceBasicVehicleUsedTypeId = FFAppState()
                                                  .insuranceBasicVehicleUsedTypeIdList[
                                              functions.getIndexOfSomethingList(
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
                                                  widget.dataList?[functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])];
                                          FFAppState()
                                              .insuranceBasicVehicleUsedTypeCode = FFAppState()
                                                  .insuranceBasicVehicleUsedTypeCodeList[
                                              functions.getIndexOfSomethingList(
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
                                                  widget.dataList?[functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])];
                                          FFAppState()
                                              .insuranceBasicVehicleUsedTypeName = FFAppState()
                                                  .insuranceBasicVehicleUsedTypeNameList[
                                              functions.getIndexOfSomethingList(
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
                                                  widget.dataList?[functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])];
                                        });
                                        setState(() {
                                          FFAppState()
                                              .updateSearchPackageCheckFilledAtIndex(
                                            4,
                                            (_) => true,
                                          );
                                        });
                                        context.safePop();
                                        return;
                                      } else {
                                        setState(() {
                                          FFAppState()
                                              .nonePackageUsedTypeId = FFAppState()
                                                  .insuranceBasicVehicleUsedTypeIdList[
                                              functions.getIndexOfSomethingList(
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
                                                  widget.dataList?[functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])];
                                          FFAppState()
                                              .nonePackageUsedTypeCode = FFAppState()
                                                  .insuranceBasicVehicleUsedTypeCodeList[
                                              functions.getIndexOfSomethingList(
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
                                                  widget.dataList?[functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])];
                                          FFAppState()
                                              .nonePackageUsedTypeName = FFAppState()
                                                  .insuranceBasicVehicleUsedTypeNameList[
                                              functions.getIndexOfSomethingList(
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
                                                  widget.dataList?[functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)])];
                                        });
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget.titleText ==
                                        'เลือกประเภทชั้นประกัน') {
                                      if (widget.fromPage != 'NonePackage') {
                                        setState(() {
                                          FFAppState()
                                                  .insuranceBasicCoverTypeNameOutputList =
                                              functions
                                                  .returnMappedListFromBoolList(
                                                      widget.dataList?.toList(),
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
                                        });
                                        context.safePop();
                                        return;
                                      } else {
                                        setState(() {
                                          FFAppState()
                                              .nonePackageCoverTypeId = FFAppState()
                                                  .insuranceBasicCoverTypeIdList[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                          FFAppState()
                                              .nonePackageCoverTypeCode = FFAppState()
                                                  .insuranceBasicCoverTypeCodeList[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                          FFAppState()
                                              .nonePackageCoverTypeName = widget
                                                  .dataList![
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                        });
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget.titleText ==
                                        'เลือกประเภทการซ่อม') {
                                      if (widget.fromPage != 'NonePackage') {
                                        setState(() {
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
                                        });
                                        context.safePop();
                                        return;
                                      } else {
                                        setState(() {
                                          FFAppState()
                                              .nonePackageGarageTypeId = FFAppState()
                                                  .insuranceBasicGarageTypeIdList[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                          FFAppState()
                                              .nonePackageGarageTypeName = FFAppState()
                                                  .insuranceBasicGarageTypeNameList[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                          FFAppState()
                                              .nonePackageGarageTypeCode = FFAppState()
                                                  .nonePackageGarageTypeCodeList[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                        });
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget.titleText ==
                                        'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                      setState(() {
                                        FFAppState().filterInsurerList = functions
                                            .returnMappedListFromBoolList(
                                                widget.dataList?.toList(),
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)
                                            .toList()
                                            .cast<String>();
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText ==
                                        'ค้นหาเปรียบเทียบชั้นประกัน') {
                                      setState(() {
                                        FFAppState().filterCoverTypeList = functions
                                            .returnMappedListFromBoolList(
                                                widget.dataList?.toList(),
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)
                                            .toList()
                                            .cast<String>();
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText ==
                                        'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                      setState(() {
                                        FFAppState().filterGarageTypeList =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    widget.dataList?.toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText == 'ประเภทบัตร') {
                                      setState(() {
                                        FFAppState()
                                            .insuranceInfoCardType = widget
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText == 'เพศ') {
                                      setState(() {
                                        FFAppState()
                                            .insuranceInfoGender = widget
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText == 'คำนำหน้า') {
                                      setState(() {
                                        FFAppState().insuranceInfoTitle = widget
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText == 'กลุ่มอาชีพ') {
                                      setState(() {
                                        FFAppState()
                                            .insuranceInfoOccupationGroup = widget
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText ==
                                        'เลือกจังหวัดจดทะเบียน') {
                                      if (widget.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      setState(() {
                                        FFAppState()
                                            .nonePackageProvinceId = FFAppState()
                                                .insuranceBasicProvinceIdList[
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                        FFAppState()
                                            .nonePackageProvince = widget
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText == 'ค้นหาที่อยู่') {
                                      if (widget.fromPage ==
                                          'addAddressIdCard') {
                                        setState(() {
                                          FFAppState()
                                                  .addAddressSelectProvinceId =
                                              FFAppState().addAddressProvinceId[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState()
                                                  .addAddressSelectProvinceName =
                                              FFAppState()
                                                      .addAddressProvinceName[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState()
                                                  .addAddressSelectDistrictId =
                                              FFAppState()
                                                  .addAddressDistrictId[functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)]
                                                  .toString();
                                          FFAppState()
                                                  .addAddressSelectDistrictName =
                                              FFAppState()
                                                      .addAddressDistrictName[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState()
                                                  .addAddressSelectSubdistrictId =
                                              FFAppState()
                                                  .addAddressSubdistrictId[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)]
                                                  .toString();
                                          FFAppState()
                                                  .addAddressSelectSubdistrictName =
                                              FFAppState()
                                                      .addAddressSubdistrictName[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState().addAddressSelectZipCode =
                                              FFAppState().addAddressZipCode[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState().addAddressSelectKeyWord =
                                              FFAppState().addAddressKeyWord[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState()
                                              .addAddressAtIdCard = FFAppState()
                                                  .addAddressKeyWord[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                        });
                                        context.safePop();
                                        return;
                                      } else {
                                        setState(() {
                                          FFAppState()
                                              .addAddressForDoc = FFAppState()
                                                  .addAddressKeyWord[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                          FFAppState()
                                                  .addAdressSelectDocProvinceId =
                                              FFAppState().addAddressProvinceId[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState()
                                                  .addAdressSelectDocProvinceName =
                                              FFAppState()
                                                      .addAddressProvinceName[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState()
                                                  .addAdressSelectDocDistrictName =
                                              FFAppState()
                                                      .addAddressDistrictName[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState()
                                                  .addAddressSelectDocDistrictId =
                                              FFAppState()
                                                  .addAddressDistrictId[functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)]
                                                  .toString();
                                          FFAppState()
                                                  .addAddressSelectDocSubdistrictId =
                                              FFAppState()
                                                  .addAddressSubdistrictId[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)]
                                                  .toString();
                                          FFAppState()
                                                  .addAddressSelectDocSubdistrictName =
                                              FFAppState()
                                                      .addAddressSubdistrictName[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState()
                                                  .addAddressSelectDocZipCode =
                                              FFAppState().addAddressZipCode[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                          FFAppState()
                                                  .addAddressSelectDocKeyWord =
                                              FFAppState().addAddressKeyWord[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)];
                                        });
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget.titleText ==
                                        'เลือกประเภทตู้เหล็ก') {
                                      if (widget.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      setState(() {
                                        FFAppState()
                                            .nonePackageCarrierType = widget
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText ==
                                        'เลือกส่วนของรถบรรทุก') {
                                      if (widget.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      setState(() {
                                        FFAppState()
                                            .nonePackageTruckPart = widget
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText ==
                                        'เลือกประเภทลูกค้า') {
                                      if (widget.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      setState(() {
                                        FFAppState()
                                            .nonePackageCusMembership = widget
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                      });
                                      context.safePop();
                                      return;
                                    }
                                    if (widget.titleText == 'เลือกปีที่ผลิต') {
                                      setState(() {
                                        FFAppState()
                                            .insuranceInfoProductYear = widget
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                      });
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
