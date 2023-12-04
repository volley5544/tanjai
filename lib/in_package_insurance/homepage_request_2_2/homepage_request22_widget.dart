import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'homepage_request22_model.dart';
export 'homepage_request22_model.dart';

class HomepageRequest22Widget extends StatefulWidget {
  const HomepageRequest22Widget({Key? key}) : super(key: key);

  @override
  _HomepageRequest22WidgetState createState() =>
      _HomepageRequest22WidgetState();
}

class _HomepageRequest22WidgetState extends State<HomepageRequest22Widget> {
  late HomepageRequest22Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageRequest22Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Homepage_Request_2_2'});
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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB771A),
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'พ.ร.บ.',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF204A77),
                    fontSize: 18.0,
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
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'พ.ร.บ.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFF1D4774),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(บังคับเลือก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFB0606),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.noSumValue = true;
                                        });
                                        setState(() {
                                          _model.sumValue = false;
                                        });
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'ราคาไม่รวม พ.ร.บ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFF9F9F9F),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF04A24C),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFF9F9F9F),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 18.0,
                                                  ),
                                                ),
                                              ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFF9F9F9F),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .success,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape: CircleBorder(),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                      .noSumValue ??= (FFAppState()
                                                              .insuranceInfoActOflLegislation !=
                                                          'ราคารวม พ.ร.บ') &&
                                                      (FFAppState()
                                                              .insuranceInfoActOflLegislation !=
                                                          ''),
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.noSumValue =
                                                            newValue!);
                                                    if (newValue!) {
                                                      setState(() {
                                                        _model.noSumValue =
                                                            true;
                                                      });
                                                      setState(() {
                                                        _model.sumValue = false;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _model.noSumValue =
                                                            false;
                                                      });
                                                    }
                                                  },
                                                  activeColor:
                                                      Color(0xFF00FD76),
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBtnText,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.noSumValue = false;
                                        });
                                        setState(() {
                                          _model.sumValue = true;
                                        });
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'ราคารวม พ.ร.บ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFF9F9F9F),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF04A24C),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFF9F9F9F),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 18.0,
                                                  ),
                                                ),
                                              ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFF9F9F9F),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .success,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape: CircleBorder(),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                      .sumValue ??= FFAppState()
                                                          .insuranceInfoActOflLegislation ==
                                                      'ราคารวม พ.ร.บ',
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                        .sumValue = newValue!);
                                                    if (newValue!) {
                                                      setState(() {
                                                        _model.noSumValue =
                                                            false;
                                                      });
                                                      setState(() {
                                                        _model.sumValue = true;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _model.sumValue = false;
                                                      });
                                                    }
                                                  },
                                                  activeColor:
                                                      Color(0xFF00FD76),
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBtnText,
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
                          if (false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'ราคารวม พ.ร.บ.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFF1D4774),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE6E6E6),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFB3B3B3),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                () {
                                                  if (!_model.noSumValue! &&
                                                      !_model.sumValue!) {
                                                    return '0 บาท';
                                                  } else if (_model
                                                      .noSumValue!) {
                                                    return (FFAppState()
                                                                .insuranceInfoApplicationType ==
                                                            'auto'
                                                        ? '${functions.showNumberWithComma(FFAppState().insuranceInfoGrossTotal)} บาท'
                                                        : '${functions.showNumberWithComma(FFAppState().insuranceInfoPage4NetPremiumTotal)} บาท');
                                                  } else {
                                                    return '${functions.showNumberWithComma(functions.getGrossAct(FFAppState().insuranceInfoApplicationType == 'auto' ? FFAppState().insuranceInfoGrossTotal : FFAppState().insuranceInfoPage4NetPremiumTotal, FFAppState().insuranceInfoApplicationType == 'auto' ? '645.21' : (FFAppState().insuranceInfoActAmount != '' ? FFAppState().insuranceInfoActAmount : '0')))} บาท';
                                                  }
                                                }(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (_model.sumValue ?? true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'วันที่ต้องการเริ่มคุ้มครอง พ.ร.บ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '(บังคับเลือก)',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFFB0606),
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (kIsWeb) {
                                            final _datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: (((FFAppState()
                                                                  .nonePackageWorkType ==
                                                              'งานต่ออายุ') ||
                                                          (FFAppState()
                                                                  .nonePackageWorkType ==
                                                              'งานโอนโค้ด')
                                                      ? functions.addDateTimeDuration(
                                                          1,
                                                          functions
                                                              .parseStringToDatetime(
                                                                  FFAppState()
                                                                      .nonePackageOldVmiExpDate)
                                                              ?.toString())
                                                      : getCurrentTimestamp) ??
                                                  DateTime.now()),
                                              firstDate: (((FFAppState()
                                                                  .nonePackageWorkType ==
                                                              'งานต่ออายุ') ||
                                                          (FFAppState()
                                                                  .nonePackageWorkType ==
                                                              'งานโอนโค้ด')
                                                      ? functions.addDateTimeDuration(
                                                          1,
                                                          functions
                                                              .parseStringToDatetime(
                                                                  FFAppState()
                                                                      .nonePackageOldVmiExpDate)
                                                              ?.toString())
                                                      : getCurrentTimestamp) ??
                                                  DateTime.now()),
                                              lastDate: DateTime(2050),
                                            );

                                            if (_datePickedDate != null) {
                                              safeSetState(() {
                                                _model.datePicked = DateTime(
                                                  _datePickedDate.year,
                                                  _datePickedDate.month,
                                                  _datePickedDate.day,
                                                );
                                              });
                                            }
                                          } else {
                                            await DatePicker.showDatePicker(
                                              context,
                                              showTitleActions: true,
                                              onConfirm: (date) {
                                                safeSetState(() {
                                                  _model.datePicked = date;
                                                });
                                              },
                                              currentTime: (FFAppState()
                                                              .nonePackageWorkType ==
                                                          'งานต่ออายุ') ||
                                                      (FFAppState()
                                                              .nonePackageWorkType ==
                                                          'งานโอนโค้ด')
                                                  ? functions.addDateTimeDuration(
                                                      1,
                                                      functions
                                                          .parseStringToDatetime(
                                                              FFAppState()
                                                                  .nonePackageOldVmiExpDate)
                                                          ?.toString())!
                                                  : getCurrentTimestamp,
                                              minTime: (FFAppState()
                                                              .nonePackageWorkType ==
                                                          'งานต่ออายุ') ||
                                                      (FFAppState()
                                                              .nonePackageWorkType ==
                                                          'งานโอนโค้ด')
                                                  ? functions.addDateTimeDuration(
                                                      1,
                                                      functions
                                                          .parseStringToDatetime(
                                                              FFAppState()
                                                                  .nonePackageOldVmiExpDate)
                                                          ?.toString())!
                                                  : getCurrentTimestamp,
                                              locale:
                                                  LocaleType.values.firstWhere(
                                                (l) =>
                                                    l.name ==
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                                orElse: () => LocaleType.en,
                                              ),
                                            );
                                          }

                                          if (!(_model.datePicked != null)) {
                                            await actions.hideKeyboardAction(
                                              context,
                                            );
                                            return;
                                          }
                                          setState(() {
                                            FFAppState()
                                                    .insuranceInfoEffectiveDateAct =
                                                functions.getDateFormat(
                                                    _model.datePicked)!;
                                          });
                                          await actions.hideKeyboardAction(
                                            context,
                                          );
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFAppState().insuranceInfoEffectiveDateAct ==
                                                          ''
                                                      ? 'กรุณาเลือกวันที่ต้องการเริ่มคุ้มครองประกัน'
                                                      : valueOrDefault<String>(
                                                          functions.showDateBE(
                                                              FFAppState()
                                                                  .insuranceInfoEffectiveDateAct),
                                                          '0',
                                                        ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color: FFAppState()
                                                                    .insuranceInfoEffectiveDateAct ==
                                                                ''
                                                            ? Color(0xFF9F9F9F)
                                                            : Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  Icons.edit_calendar_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
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
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 1.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 40.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (!(_model.noSumValue! ||
                                        _model.sumValue!)) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            content: Text(
                                                'กรุณาเลือกราคารวมหรือไม่รวม พ.ร.บ'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ));
                                        },
                                      );
                                      return;
                                    }
                                    if (!((FFAppState()
                                                    .insuranceInfoEffectiveDateAct !=
                                                null &&
                                            FFAppState()
                                                    .insuranceInfoEffectiveDateAct !=
                                                '') ||
                                        _model.noSumValue!)) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            content: Text(
                                                'บังคับเลือกวันคุ้มครอง พ.ร.บ'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ));
                                        },
                                      );
                                      return;
                                    }
                                    if (_model.noSumValue!) {
                                      setState(() {
                                        FFAppState()
                                                .insuranceInfoActOflLegislation =
                                            'ราคาไม่รวม พ.ร.บ';
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState()
                                                .insuranceInfoActOflLegislation =
                                            'ราคารวม พ.ร.บ';
                                      });
                                    }

                                    context.safePop();
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
      ),
    );
  }
}
