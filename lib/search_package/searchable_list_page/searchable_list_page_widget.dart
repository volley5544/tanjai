import '/backend/schema/structs/index.dart';
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
import 'searchable_list_page_model.dart';
export 'searchable_list_page_model.dart';

class SearchableListPageWidget extends StatefulWidget {
  const SearchableListPageWidget({
    super.key,
    String? titleText,
    required this.searchLabel,
    required this.dataList,
    bool? multiSelect,
    int? maxSelected,
    String? fromPage,
    this.index,
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
  final int? index;

  @override
  State<SearchableListPageWidget> createState() =>
      _SearchableListPageWidgetState();
}

class _SearchableListPageWidgetState extends State<SearchableListPageWidget> {
  late SearchableListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchableListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchableListPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().searchableListComponentData =
          widget!.dataList!.toList().cast<String>();
      FFAppState().searchableListComponentSelectedList = functions
          .createFalseListByItemNumber(false, widget!.dataList?.length)!
          .toList()
          .cast<bool>();
      setState(() {});
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
      onTap: () => FocusScope.of(context).unfocus(),
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
              widget!.titleText,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF123063),
                    fontSize: 16.0,
                    letterSpacing: 0.0,
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
                                        fontFamily: 'Noto Sans Thai',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        if (widget!.dataList!.length > 5)
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
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: widget!.searchLabel,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              letterSpacing: 0.0,
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
                                            fontFamily: 'Noto Sans Thai',
                                            letterSpacing: 0.0,
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
                                  final dataList = widget!.dataList!.toList();

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
                                                widget!
                                                    .dataList?[dataListIndex])!,
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
                                                                  .searchableListComponentSelectedList[
                                                              dataListIndex] ==
                                                          true
                                                      ? false
                                                      : true,
                                                );
                                                setState(() {});
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
                                                  setState(() {});
                                                } else {
                                                  FFAppState()
                                                      .updateSearchableListComponentSelectedListAtIndex(
                                                    dataListIndex,
                                                    (_) => FFAppState()
                                                                    .searchableListComponentSelectedList[
                                                                dataListIndex] ==
                                                            true
                                                        ? false
                                                        : true,
                                                  );
                                                  setState(() {});
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
                                                                  widget!
                                                                      .dataList
                                                                      ?.length)
                                                              ?.toList(),
                                                          dataListIndex)!
                                                      .toList()
                                                      .cast<bool>();
                                              setState(() {});
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
                                                  if ((widget!.dataList?[functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)]) ==
                                                      'รถบรรทุก หัวลาก หางพ่วง') {
                                                    context.goNamed(
                                                        'InsuranceWorkSelectPage');

                                                    return;
                                                  } else {
                                                    if ((widget!.dataList?[functions
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

                                                  FFAppState()
                                                          .insuranceVehicleTypeDropDown =
                                                      widget!.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    0,
                                                    (_) => true,
                                                  );
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  if (widget!.fromPage ==
                                                      'NonePackage') {
                                                    FFAppState()
                                                            .nonePackageVehicleType =
                                                        widget!.dataList![functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)];
                                                    setState(() {});
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
                                                  if (FFAppState()
                                                          .insuranceBasicVehicleGroup ==
                                                      'PICKUP') {
                                                    FFAppState().insuranceBasicModelNameList = functions
                                                        .returnMappedListFrom3List(
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
                                                                    true)],
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroupList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroup,
                                                            FFAppState()
                                                                .insuranceBasicCarGroupDetail
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicCarTypeContain,
                                                            FFAppState()
                                                                .insuranceBasicCarDoorList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicCarTypeDoors)
                                                        .toList()
                                                        .cast<String>();
                                                    FFAppState().insuranceBasicModelIdList = functions
                                                        .returnMappedListFrom3List(
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
                                                                    true)],
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroupList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroup,
                                                            FFAppState()
                                                                .insuranceBasicCarGroupDetail
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicCarTypeContain,
                                                            FFAppState()
                                                                .insuranceBasicCarDoorList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicCarTypeDoors)
                                                        .toList()
                                                        .cast<String>();
                                                    FFAppState()
                                                            .insuranceBasicModelName =
                                                        'เลือกรุ่นรถ';
                                                    FFAppState()
                                                        .insuranceBasicModelId = '';
                                                    setState(() {});
                                                    FFAppState()
                                                        .updateSearchPackageCheckFilledAtIndex(
                                                      1,
                                                      (_) => true,
                                                    );
                                                    setState(() {});
                                                    if (FFAppState()
                                                            .insuranceBasicModelNameList
                                                            .length >
                                                        0) {
                                                      FFAppState()
                                                          .insuranceBasicBrandName = widget!
                                                              .dataList![
                                                          functions
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
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                      setState(() {});
                                                    } else {
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
                                                                  child: Text(
                                                                      'Ok'),
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
                                                    FFAppState().insuranceBasicModelNameList = functions
                                                        .returnMappedListFrom3ListOther(
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
                                                                    true)],
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroupList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroup)
                                                        .toList()
                                                        .cast<String>();
                                                    FFAppState().insuranceBasicModelIdList = functions
                                                        .returnMappedListFrom3ListOther(
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
                                                                    true)],
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroupList
                                                                .toList(),
                                                            FFAppState()
                                                                .insuranceBasicVehicleGroup)
                                                        .toList()
                                                        .cast<String>();
                                                    FFAppState()
                                                            .insuranceBasicModelName =
                                                        'เลือกรุ่นรถ';
                                                    FFAppState()
                                                        .insuranceBasicModelId = '';
                                                    setState(() {});
                                                    FFAppState()
                                                        .updateSearchPackageCheckFilledAtIndex(
                                                      1,
                                                      (_) => true,
                                                    );
                                                    setState(() {});
                                                    if (FFAppState()
                                                            .insuranceBasicModelNameList
                                                            .length >
                                                        0) {
                                                      FFAppState()
                                                          .insuranceBasicBrandName = widget!
                                                              .dataList![
                                                          functions
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
                                                          functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)];
                                                      setState(() {});
                                                    } else {
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
                                                                  child: Text(
                                                                      'Ok'),
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
                                                  }
                                                } else {
                                                  FFAppState()
                                                          .nonePackageBrandName =
                                                      widget!.dataList![functions
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
                                                  setState(() {});
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
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                }
                                              }
                                              if (widget!.titleText ==
                                                  'เลือกปีจดทะเบียน') {
                                                if (widget!.fromPage !=
                                                    'NonePackage') {
                                                  if (widget!.fromPage !=
                                                      'RenewStep2') {
                                                    FFAppState()
                                                            .insuranceBasicYear =
                                                        widget!.dataList![functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)];
                                                    FFAppState()
                                                            .insuranceInfoRegisYear =
                                                        widget!.dataList![functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)];
                                                    setState(() {});
                                                    FFAppState()
                                                            .nonePackageYearChrist =
                                                        functions.reverseList(
                                                            functions
                                                                .ganerateYearList(
                                                                    1957, 2024)
                                                                ?.toList())[functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)];
                                                    setState(() {});
                                                    FFAppState()
                                                        .updateSearchPackageCheckFilledAtIndex(
                                                      3,
                                                      (_) => true,
                                                    );
                                                    setState(() {});
                                                    context.safePop();
                                                    return;
                                                  }
                                                  FFAppState()
                                                          .insuranceInfoCarRegis =
                                                      widget!.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  setState(() {});
                                                  FFAppState()
                                                          .insuranceInfoRegisYear =
                                                      (int.parse((widget!
                                                                      .dataList![
                                                                  functions.getIndexOfBoolList(
                                                                      FFAppState()
                                                                          .searchableListComponentSelectedList
                                                                          .toList(),
                                                                      true)])) -
                                                              543)
                                                          .toString();
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  FFAppState()
                                                      .nonePackageYear = widget!
                                                          .dataList![
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  setState(() {});
                                                  FFAppState()
                                                          .nonePackageYearChrist =
                                                      functions.reverseList(
                                                          functions
                                                              .ganerateYearList(
                                                                  1957, 2024)
                                                              ?.toList())[functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                }
                                              }
                                              if (widget!.titleText ==
                                                  'เลือกลักษณะการใช้รถ') {
                                                if (widget!.fromPage !=
                                                    'NonePackage') {
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
                                                          widget!.dataList?[functions
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
                                                          widget!.dataList?[functions
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
                                                          widget!.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .insuranceInfoVehicleCode = FFAppState()
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
                                                          widget!.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .insuranceInfoVehicleId = FFAppState()
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
                                                          widget!.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                      .insuranceInfoVehicleName = FFAppState()
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
                                                          widget!.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  FFAppState()
                                                          .insuranceInfoVehicleUsage =
                                                      '${FFAppState().insuranceBasicVehicleUsedTypeCodeList[functions.getIndexOfSomethingList(functions.generateInsuranceVehicleTypeDropdown(FFAppState().insuranceBasicVehicleUsedTypeCodeList.toList(), FFAppState().insuranceBasicVehicleUsedTypeTypeList.toList(), FFAppState().insuranceBasicVehicleUsedTypeNameList.toList())?.toList(), widget!.dataList?[functions.getIndexOfBoolList(FFAppState().searchableListComponentSelectedList.toList(), true)])]}  ${FFAppState().insuranceBasicVehicleUsedTypeNameList[functions.getIndexOfSomethingList(functions.generateInsuranceVehicleTypeDropdown(FFAppState().insuranceBasicVehicleUsedTypeCodeList.toList(), FFAppState().insuranceBasicVehicleUsedTypeTypeList.toList(), FFAppState().insuranceBasicVehicleUsedTypeNameList.toList())?.toList(), widget!.dataList?[functions.getIndexOfBoolList(FFAppState().searchableListComponentSelectedList.toList(), true)])]}';
                                                  setState(() {});
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    4,
                                                    (_) => true,
                                                  );
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
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
                                                          widget!.dataList?[functions
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
                                                          widget!.dataList?[functions
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
                                                          widget!.dataList?[functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)])];
                                                  setState(() {});
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
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
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
                                                      widget!.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  setState(() {});
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
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
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
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                }
                                              }
                                              if (widget!.titleText ==
                                                  'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                                FFAppState().filterInsurerList =
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
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'ค้นหาเปรียบเทียบชั้นประกัน') {
                                                FFAppState()
                                                        .filterCoverTypeList =
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
                                                setState(() {});
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
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'ประเภทบัตร') {
                                                FFAppState()
                                                        .insuranceInfoCardType =
                                                    widget!.dataList![functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)];
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText == 'เพศ') {
                                                if (widget!.fromPage !=
                                                    'AddDriverPage') {
                                                  FFAppState()
                                                          .insuranceInfoGender =
                                                      widget!.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  FFAppState()
                                                          .insuranceInfoTitle =
                                                      'เลือกคำนำหน้าชื่อ';
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                }
                                                FFAppState()
                                                        .insuranceInfoTitle =
                                                    'เลือกคำนำหน้าชื่อ';
                                                FFAppState()
                                                    .updateDriverListAtIndex(
                                                  widget!.index!,
                                                  (e) => e
                                                    ..gender = (widget!
                                                                    .dataList?[
                                                                functions.getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true)]) ==
                                                            'ชาย'
                                                        ? 'MALE'
                                                        : 'FEMALE',
                                                );
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'คำนำหน้า') {
                                                if (widget!.fromPage !=
                                                    'AddDriverPage') {
                                                  FFAppState()
                                                          .insuranceInfoTitle =
                                                      widget!.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                }
                                                FFAppState()
                                                    .updateDriverListAtIndex(
                                                  widget!.index!,
                                                  (e) => e
                                                    ..titleThId = ''
                                                    ..titleTh = widget!
                                                            .dataList?[
                                                        functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)],
                                                );
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'กลุ่มอาชีพ') {
                                                FFAppState()
                                                        .insuranceInfoOccupationGroup =
                                                    widget!.dataList![functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)];
                                                setState(() {});
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
                                                        .insuranceInfoSelectOccupationName =
                                                    widget!.dataList![functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)];
                                                setState(() {});
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
                                                setState(() {});
                                                FFAppState()
                                                    .insuranceInfoSelectOccupationSubNameChoose = '';
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'เลือกจังหวัดจดทะเบียน') {
                                                if (widget!.fromPage !=
                                                    'NonePackage') {
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
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
                                                  FFAppState()
                                                      .nonePackageProvinceId = FFAppState()
                                                          .insuranceBasicProvinceIdList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  FFAppState()
                                                          .nonePackageProvince =
                                                      widget!.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                }
                                              }
                                              if (widget!.titleText ==
                                                  'ค้นหาที่อยู่') {
                                                if (widget!.fromPage ==
                                                    'addAddressIdCard') {
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
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                } else {
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
                                                  setState(() {});
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
                                                    widget!.dataList![functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)];
                                                setState(() {});
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
                                                    .nonePackageTruckPart = widget!
                                                        .dataList![
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true)];
                                                setState(() {});
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
                                                    widget!.dataList![functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)];
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'เลือกปีที่ผลิต') {
                                                FFAppState()
                                                        .insuranceInfoProductYear =
                                                    widget!.dataList![functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)];
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'จำนวนงวด') {
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
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'เลือกบริษัทประกัน') {
                                                if (widget!.fromPage ==
                                                    'NonePackageSelectedInsurer') {
                                                  FFAppState()
                                                      .nonePackageSelectedInsurerShortName = FFAppState()
                                                          .nonePackageSelectedInsurerShortNameList[
                                                      functions.getIndexOfBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList(),
                                                          true)];
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                }
                                              }
                                              if (widget!.titleText ==
                                                  'เลือกจังหวัดที่จดทะเบียน') {
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
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'เลือกรุ่นรถ') {
                                                if (widget!.fromPage !=
                                                    'NonePackage') {
                                                  FFAppState()
                                                          .insuranceBasicModelName =
                                                      widget!.dataList![functions
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
                                                  setState(() {});
                                                  FFAppState()
                                                      .updateSearchPackageCheckFilledAtIndex(
                                                    2,
                                                    (_) => true,
                                                  );
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                }
                                              }
                                              if (widget!.titleText ==
                                                  'อาชีพ') {
                                                if (widget!.fromPage !=
                                                    'AddDriverPage') {
                                                  FFAppState()
                                                          .insuranceInfoSelectOccupationSubNameChoose =
                                                      widget!.dataList![functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .toList(),
                                                              true)];
                                                  setState(() {});
                                                  context.safePop();
                                                  return;
                                                }
                                                FFAppState()
                                                    .updateDriverListAtIndex(
                                                  widget!.index!,
                                                  (e) => e
                                                    ..occupationId = ''
                                                    ..occupationCode = FFAppState()
                                                            .insuranceInfoOccupationCode[
                                                        functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)]
                                                    ..occupationName = FFAppState()
                                                            .insuranceInfoOccupationName[
                                                        functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)]
                                                    ..occupationSubcode = ''
                                                    ..occupationSubname = FFAppState()
                                                            .insuranceInfoOccupationSubName[
                                                        functions
                                                            .getIndexOfBoolList(
                                                                FFAppState()
                                                                    .searchableListComponentSelectedList
                                                                    .toList(),
                                                                true)],
                                                );
                                                setState(() {});
                                                context.safePop();
                                                return;
                                              }
                                              if (widget!.titleText ==
                                                  'ค้นหาชื่อบริษัทประกัน') {
                                                FFAppState().filterInsurerList =
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
                                                setState(() {});
                                                context.safePop();
                                                return;
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
                                                          valueOrDefault<
                                                              String>(
                                                            () {
                                                              if (widget!
                                                                      .titleText ==
                                                                  'ค้นหาเปรียบเทียบชั้นประกัน') {
                                                                return (functions
                                                                    .coverTypeCodeToName(widget!
                                                                        .dataList
                                                                        ?.toList())?[dataListIndex]);
                                                              } else if (widget!
                                                                      .titleText ==
                                                                  'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                                                return (functions
                                                                    .garageTypeCodeToName(widget!
                                                                        .dataList
                                                                        ?.toList())?[dataListIndex]);
                                                              } else {
                                                                return (widget!
                                                                        .dataList?[
                                                                    dataListIndex]);
                                                              }
                                                            }(),
                                                            '-',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      if (FFAppState()
                                                              .searchableListComponentSelectedList[
                                                          dataListIndex])
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
                                                onPressed: () => Navigator.pop(
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
                                  if (((widget!.titleText == 'เลือกประเภทรถ') &&
                                          (widget!.fromPage ==
                                              'searchPackage')) ||
                                      ((widget!.titleText == 'เลือกประเภทรถ') &&
                                          (widget!.fromPage ==
                                              'NonePackage'))) {
                                    if (widget!.fromPage == 'searchPackage') {
                                      if ((widget!.dataList?[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)]) ==
                                          'รถบรรทุก หัวลาก หางพ่วง') {
                                        context
                                            .goNamed('InsuranceWorkSelectPage');

                                        return;
                                      } else {
                                        if ((widget!.dataList?[
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

                                      FFAppState()
                                          .insuranceVehicleTypeDropDown = widget!
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
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    } else {
                                      if (widget!.fromPage == 'NonePackage') {
                                        FFAppState()
                                            .nonePackageVehicleType = widget!
                                                .dataList![
                                            functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .searchableListComponentSelectedList
                                                    .toList(),
                                                true)];
                                        setState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }

                                    return;
                                  }
                                  if (widget!.titleText == 'เลือกยี่ห้อรถ') {
                                    if (widget!.fromPage != 'NonePackage') {
                                      FFAppState()
                                          .insuranceBasicBrandName = widget!
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
                                      setState(() {});
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
                                      setState(() {});
                                      FFAppState()
                                          .updateSearchPackageCheckFilledAtIndex(
                                        1,
                                        (_) => true,
                                      );
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    } else {
                                      FFAppState()
                                          .nonePackageBrandName = widget!
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
                                      FFAppState().nonePackageIsBrandSelect =
                                          true;
                                      setState(() {});
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
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    }
                                  }
                                  if (widget!.titleText == 'เลือกปีจดทะเบียน') {
                                    if (widget!.fromPage != 'NonePackage') {
                                      FFAppState().insuranceBasicYear = widget!
                                              .dataList![
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)];
                                      setState(() {});
                                      FFAppState()
                                          .updateSearchPackageCheckFilledAtIndex(
                                        3,
                                        (_) => true,
                                      );
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    } else {
                                      FFAppState().nonePackageYear = widget!
                                              .dataList![
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)];
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    }
                                  }
                                  if (widget!.titleText ==
                                      'เลือกลักษณะการใช้รถ') {
                                    if (widget!.fromPage != 'NonePackage') {
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
                                              widget!.dataList?[
                                                  functions.getIndexOfBoolList(
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
                                              widget!.dataList?[
                                                  functions.getIndexOfBoolList(
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
                                              widget!.dataList?[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)])];
                                      setState(() {});
                                      FFAppState()
                                          .updateSearchPackageCheckFilledAtIndex(
                                        4,
                                        (_) => true,
                                      );
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    } else {
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
                                              widget!.dataList?[
                                                  functions.getIndexOfBoolList(
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
                                              widget!.dataList?[
                                                  functions.getIndexOfBoolList(
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
                                              widget!.dataList?[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)])];
                                      setState(() {});
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
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    } else {
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
                                          .nonePackageCoverTypeName = widget!
                                              .dataList![
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)];
                                      setState(() {});
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
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    } else {
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
                                      setState(() {});
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
                                    setState(() {});
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
                                    setState(() {});
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
                                    setState(() {});
                                    context.safePop();
                                    return;
                                  }
                                  if (widget!.titleText == 'ประเภทบัตร') {
                                    FFAppState().insuranceInfoCardType = widget!
                                            .dataList![
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    setState(() {});
                                    context.safePop();
                                    return;
                                  }
                                  if (widget!.titleText == 'เพศ') {
                                    FFAppState().insuranceInfoGender = widget!
                                            .dataList![
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    setState(() {});
                                    context.safePop();
                                    return;
                                  }
                                  if (widget!.titleText == 'คำนำหน้า') {
                                    FFAppState().insuranceInfoTitle = widget!
                                            .dataList![
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    setState(() {});
                                    context.safePop();
                                    return;
                                  }
                                  if (widget!.titleText == 'กลุ่มอาชีพ') {
                                    FFAppState()
                                        .insuranceInfoOccupationGroup = widget!
                                            .dataList![
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    setState(() {});
                                    context.safePop();
                                    return;
                                  }
                                  if (widget!.titleText ==
                                      'เลือกจังหวัดจดทะเบียน') {
                                    if (widget!.fromPage != 'NonePackage') {
                                      return;
                                    }

                                    FFAppState()
                                        .nonePackageProvinceId = FFAppState()
                                            .insuranceBasicProvinceIdList[
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    FFAppState().nonePackageProvince = widget!
                                            .dataList![
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    setState(() {});
                                    context.safePop();
                                    return;
                                  }
                                  if (widget!.titleText == 'ค้นหาที่อยู่') {
                                    if (widget!.fromPage ==
                                        'addAddressIdCard') {
                                      FFAppState().addAddressSelectProvinceId =
                                          FFAppState().addAddressProvinceId[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                      FFAppState()
                                              .addAddressSelectProvinceName =
                                          FFAppState().addAddressProvinceName[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                      FFAppState().addAddressSelectDistrictId =
                                          FFAppState()
                                              .addAddressDistrictId[
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)]
                                              .toString();
                                      FFAppState()
                                              .addAddressSelectDistrictName =
                                          FFAppState().addAddressDistrictName[
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
                                      FFAppState()
                                          .addAddressSelectZipCode = FFAppState()
                                              .addAddressZipCode[
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)];
                                      FFAppState()
                                          .addAddressSelectKeyWord = FFAppState()
                                              .addAddressKeyWord[
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
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    } else {
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
                                          FFAppState().addAddressProvinceName[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                      FFAppState()
                                              .addAdressSelectDocDistrictName =
                                          FFAppState().addAddressDistrictName[
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
                                              .addAddressSelectDocSubdistrictName =
                                          FFAppState()
                                                  .addAddressSubdistrictName[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                      FFAppState().addAddressSelectDocZipCode =
                                          FFAppState().addAddressZipCode[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                      FFAppState().addAddressSelectDocKeyWord =
                                          FFAppState().addAddressKeyWord[
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)];
                                      setState(() {});
                                      context.safePop();
                                      return;
                                    }
                                  }
                                  if (widget!.titleText ==
                                      'เลือกประเภทตู้เหล็ก') {
                                    if (widget!.fromPage != 'NonePackage') {
                                      return;
                                    }

                                    FFAppState()
                                        .nonePackageCarrierType = widget!
                                            .dataList![
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    setState(() {});
                                    context.safePop();
                                    return;
                                  }
                                  if (widget!.titleText ==
                                      'เลือกส่วนของรถบรรทุก') {
                                    if (widget!.fromPage != 'NonePackage') {
                                      return;
                                    }

                                    FFAppState().nonePackageTruckPart = widget!
                                            .dataList![
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    setState(() {});
                                    context.safePop();
                                    return;
                                  }
                                  if (widget!.titleText ==
                                      'เลือกประเภทลูกค้า') {
                                    if (widget!.fromPage != 'NonePackage') {
                                      return;
                                    }

                                    FFAppState()
                                        .nonePackageCusMembership = widget!
                                            .dataList![
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    setState(() {});
                                    context.safePop();
                                    return;
                                  }
                                  if (widget!.titleText == 'เลือกปีที่ผลิต') {
                                    FFAppState()
                                        .insuranceInfoProductYear = widget!
                                            .dataList![
                                        functions.getIndexOfBoolList(
                                            FFAppState()
                                                .searchableListComponentSelectedList
                                                .toList(),
                                            true)];
                                    setState(() {});
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
                                        letterSpacing: 0.0,
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
