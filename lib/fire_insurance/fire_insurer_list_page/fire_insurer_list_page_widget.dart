import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'fire_insurer_list_page_model.dart';
export 'fire_insurer_list_page_model.dart';

class FireInsurerListPageWidget extends StatefulWidget {
  const FireInsurerListPageWidget({
    super.key,
    required this.yearMin,
    required this.yearMax,
    required this.sumInsured,
    required this.sumInsureHouse,
    required this.sumInsureBuilding,
    required this.sumInsureOther,
  });

  final String? yearMin;
  final String? yearMax;
  final String? sumInsured;
  final String? sumInsureHouse;
  final String? sumInsureBuilding;
  final String? sumInsureOther;

  static String routeName = 'fireInsurerListPage';
  static String routePath = 'fireInsurerListPage';

  @override
  State<FireInsurerListPageWidget> createState() =>
      _FireInsurerListPageWidgetState();
}

class _FireInsurerListPageWidgetState extends State<FireInsurerListPageWidget>
    with TickerProviderStateMixin {
  late FireInsurerListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FireInsurerListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'fireInsurerListPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      );

      _model.apiGetpackageOutput =
          await HouseInsuranceGroup.getPackageFireInsuranceCall.call(
        apiUrl: FFAppState().apiUrlInsuranceAppState,
        yearCoverMin: widget!.yearMin,
        yearCoverMax: widget!.yearMax,
        sumInsured: widget!.sumInsured,
      );

      if ((_model.apiGetpackageOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด connection (${(_model.apiGetpackageOutput?.statusCode ?? 200).toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        return;
      }
      if ('${getJsonField(
            (_model.apiGetpackageOutput?.jsonBody ?? ''),
            r'''$.code''',
          ).toString().toString()}' !=
          '200') {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    '${HouseInsuranceGroup.getPackageFireInsuranceCall.message(
                  (_model.apiGetpackageOutput?.jsonBody ?? ''),
                )}'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        return;
      }
      _model.packagePageStage = HouseInsuranceGroup.getPackageFireInsuranceCall
          .data(
            (_model.apiGetpackageOutput?.jsonBody ?? ''),
          )!
          .toList()
          .cast<GetPackageFireInsurerDataTypeStruct>();
      safeSetState(() {});
      Navigator.pop(context);
    });

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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
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
                'ค้นหาประกันอัคคีภัย',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Noto Sans Thai',
                      color: Color(0xFF003063),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                _model.textBool!
                                                    ? 'ราคาเบี้ย มาก -> น้อย'
                                                    : 'ราคาเบี้ย น้อย -> มาก',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.packagePageStage = functions
                                                  .reverseDataTypeList(_model
                                                      .packagePageStage
                                                      .toList())!
                                                  .toList()
                                                  .cast<
                                                      GetPackageFireInsurerDataTypeStruct>();
                                              safeSetState(() {});
                                              _model.textBool =
                                                  !(_model.textBool ?? true);
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 190.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x3EA6A6A6),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 25.0,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .longArrowAltUp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .longArrowAltDown,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'เรียงราคาเบี้ยประกัน/ปี',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                  Divider(
                                    thickness: 2.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.9,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.packagePageStage.length >
                                              0)
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  final listInsuranceItem =
                                                      _model.packagePageStage
                                                          .toList();

                                                  return ListView.builder(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      4.0,
                                                      0,
                                                      100.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: listInsuranceItem
                                                        .length,
                                                    itemBuilder: (context,
                                                        listInsuranceItemIndex) {
                                                      final listInsuranceItemItem =
                                                          listInsuranceItem[
                                                              listInsuranceItemIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    8.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 9,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 15.0, 30.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                          shape: BoxShape.rectangle,
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                          child: Image.network(
                                                                                            getCORSProxyUrl(
                                                                                              valueOrDefault<String>(
                                                                                                functions.stringToImgPath('${listInsuranceItemItem.logo}'),
                                                                                                'https://is-dev.swpfin.com/ssw_insurance_manual_api/storage/images/No_image_available.png?v=1692265949',
                                                                                              ),
                                                                                            ),
                                                                                            width: 150.0,
                                                                                            height: 150.0,
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 3,
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Text(
                                                                                            '${listInsuranceItemItem.serialName}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                                  fontSize: 11.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  if (false)
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'ประเภทประกัน',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto Sans Thai',
                                                                                                fontSize: 11.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                          child: Text(
                                                                                            'ประกันอัคคีภัย',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                                  fontSize: 11.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'แผนประกัน',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto Sans Thai',
                                                                                                fontSize: 11.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                          child: Text(
                                                                                            '${listInsuranceItemItem.packageName}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                                  fontSize: 11.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'ทุนประกันภัย',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto Sans Thai',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.showNumberWithComma('${listInsuranceItemItem.sumInsured}'),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'สิ่งปลูกสร้าง (ไม่รวมฐานราก)',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto Sans Thai',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.showNumberWithComma('${widget!.sumInsureHouse}'),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'ทรัพย์สินภายในสิ่งปลูกสร้าง',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Noto Sans Thai',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.showNumberWithComma('${widget!.sumInsureBuilding}'),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'ราคาเบี้ยประกัน/ปี',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      functions.showNumberWithComma('${listInsuranceItemItem.grossTotal}'),
                                                                                      '0',
                                                                                    )} บาท',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Noto Sans Thai',
                                                                                          fontSize: 11.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 10.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  FFAppState().addCustomerQuotationSaveSuccess = false;
                                                                                  safeSetState(() {});

                                                                                  context.pushNamed(
                                                                                    DetailsFireInsurancePageWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'packageData': serializeParam(
                                                                                        _model.packagePageStage.elementAtOrNull(listInsuranceItemIndex),
                                                                                        ParamType.DataStruct,
                                                                                      ),
                                                                                      'sumInsureHouse': serializeParam(
                                                                                        widget!.sumInsureHouse,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'sumInsureBuildin': serializeParam(
                                                                                        widget!.sumInsureBuilding,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                text: 'รายละเอียด',
                                                                                options: FFButtonOptions(
                                                                                  height: 30.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0x9EFF6500),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Noto Sans Thai',
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  elevation: 3.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(10.0),
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
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          if (_model.packagePageStage.length ==
                                              0)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.53,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 1.0,
                                                        color:
                                                            Color(0x33000000),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'ไม่พบข้อมูลรายการประกัน',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                ].addToStart(SizedBox(height: 12.0)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
