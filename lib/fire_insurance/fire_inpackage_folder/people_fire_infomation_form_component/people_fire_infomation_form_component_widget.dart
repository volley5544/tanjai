import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'people_fire_infomation_form_component_model.dart';
export 'people_fire_infomation_form_component_model.dart';

class PeopleFireInfomationFormComponentWidget extends StatefulWidget {
  const PeopleFireInfomationFormComponentWidget({
    super.key,
    required this.index,
    required this.firestoreDataConfigList,
    required this.clearFormTextfield,
  });

  final int? index;
  final DataListRecord? firestoreDataConfigList;
  final Future Function()? clearFormTextfield;

  @override
  State<PeopleFireInfomationFormComponentWidget> createState() =>
      _PeopleFireInfomationFormComponentWidgetState();
}

class _PeopleFireInfomationFormComponentWidgetState
    extends State<PeopleFireInfomationFormComponentWidget> {
  late PeopleFireInfomationFormComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => PeopleFireInfomationFormComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.firstnameTextfieldTextController?.text = FFAppState()
                    .benefitorData
                    .elementAtOrNull(widget!.index!)
                    ?.firstNameTh !=
                ''
            ? FFAppState()
                .benefitorData
                .elementAtOrNull(widget!.index!)!
                .firstNameTh
            : '';

        _model.address4LastnameTextfieldTextController?.text = FFAppState()
                    .benefitorData
                    .elementAtOrNull(widget!.index!)
                    ?.lastNameTh !=
                ''
            ? FFAppState()
                .benefitorData
                .elementAtOrNull(widget!.index!)!
                .lastNameTh
            : '';

        _model.benefitorNameTextfieldTextController?.text = FFAppState()
                    .benefitorData
                    .elementAtOrNull(widget!.index!)
                    ?.beneficiaryName !=
                ''
            ? FFAppState()
                .benefitorData
                .elementAtOrNull(widget!.index!)!
                .beneficiaryName
            : '';

        _model.relationshipTextFieldTextController?.text = FFAppState()
                    .benefitorData
                    .elementAtOrNull(widget!.index!)
                    ?.relationName !=
                ''
            ? FFAppState()
                .benefitorData
                .elementAtOrNull(widget!.index!)!
                .relationName
            : '';
      });
    });

    _model.firstnameTextfieldTextController ??= TextEditingController(
        text: FFAppState()
                    .benefitorData
                    .elementAtOrNull(widget!.index!)
                    ?.firstNameTh !=
                ''
            ? FFAppState()
                .benefitorData
                .elementAtOrNull(widget!.index!)
                ?.firstNameTh
            : '');
    _model.firstnameTextfieldFocusNode ??= FocusNode();

    _model.address4LastnameTextfieldTextController ??= TextEditingController(
        text: FFAppState()
                    .benefitorData
                    .elementAtOrNull(widget!.index!)
                    ?.lastNameTh !=
                ''
            ? FFAppState()
                .benefitorData
                .elementAtOrNull(widget!.index!)
                ?.lastNameTh
            : '');
    _model.address4LastnameTextfieldFocusNode ??= FocusNode();

    _model.benefitorNameTextfieldTextController ??= TextEditingController(
        text: FFAppState()
                    .benefitorData
                    .elementAtOrNull(widget!.index!)
                    ?.beneficiaryName !=
                ''
            ? FFAppState()
                .benefitorData
                .elementAtOrNull(widget!.index!)
                ?.beneficiaryName
            : '');
    _model.benefitorNameTextfieldFocusNode ??= FocusNode();

    _model.relationshipTextFieldTextController ??= TextEditingController(
        text: FFAppState()
                    .benefitorData
                    .elementAtOrNull(widget!.index!)
                    ?.relationName !=
                ''
            ? FFAppState()
                .benefitorData
                .elementAtOrNull(widget!.index!)
                ?.relationName
            : '');
    _model.relationshipTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ผู้รับประกันภัยที่ ${((widget!.index!) + 1).toString()}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Noto Sans Thai',
                      color: Color(0xFF1D4774),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              if (false)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().removeAtIndexFromDriverList(widget!.index!);
                    _model.updatePage(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Color(0xFFEF3939),
                        borderRadius: 20.0,
                        borderWidth: 2.0,
                        buttonSize: 32.0,
                        fillColor: Color(0x00616161),
                        icon: FaIcon(
                          FontAwesomeIcons.userMinus,
                          color: Color(0xFFFF0000),
                          size: 15.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'ลบสมาชิก',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFFFF0000),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'ประเภทผู้เอาประกันภัย',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Color(0xFF1D4774),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'บังคับเลือก',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFFFB0606),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState()
                                  .benefitorData
                                  .elementAtOrNull(widget!.index!)
                                  ?.insuredPersonTypeName ==
                              'ผู้เอาประกัน') {
                            return;
                          }

                          context.pushNamed(
                            'FireSearchableListPage',
                            queryParameters: {
                              'titleText': serializeParam(
                                'ประเภทผู้เอาประกันภัย',
                                ParamType.String,
                              ),
                              'searchLabel': serializeParam(
                                'ระบุประเภทผู้เอาประกันภัย',
                                ParamType.String,
                              ),
                              'dataList': serializeParam(
                                ['คู่สมรส', 'บุตร', 'อื่นๆ'],
                                ParamType.String,
                                isList: true,
                              ),
                              'multiSelect': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                              'maxSelected': serializeParam(
                                0,
                                ParamType.int,
                              ),
                              'fromPage': serializeParam(
                                'AddPeoplePage',
                                ParamType.String,
                              ),
                              'index': serializeParam(
                                widget!.index,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          await actions.hideKeyboardAction(
                            context,
                          );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFFB3B3B3),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    FFAppState()
                                                .benefitorData
                                                .elementAtOrNull(widget!.index!)
                                                ?.insuredPersonTypeName !=
                                            ''
                                        ? FFAppState()
                                            .benefitorData
                                            .elementAtOrNull(widget!.index!)
                                            ?.insuredPersonTypeName
                                        : 'กรุณาเลือกประเภทผู้เอาประกันภัย',
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: FFAppState()
                                                    .benefitorData
                                                    .elementAtOrNull(
                                                        widget!.index!)
                                                    ?.insuredPersonTypeName !=
                                                ''
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  Icons.navigate_next,
                                  color: FlutterFlowTheme.of(context)
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
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Text(
                              'เพศ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFF1D4774),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'บังคับเลือก',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFFFB0606),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (false) {
                            return;
                          }

                          context.pushNamed(
                            'FireSearchableListPage',
                            queryParameters: {
                              'titleText': serializeParam(
                                'เพศ',
                                ParamType.String,
                              ),
                              'searchLabel': serializeParam(
                                'ระบุเพศ',
                                ParamType.String,
                              ),
                              'dataList': serializeParam(
                                widget!.firestoreDataConfigList?.gender,
                                ParamType.String,
                                isList: true,
                              ),
                              'multiSelect': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                              'maxSelected': serializeParam(
                                0,
                                ParamType.int,
                              ),
                              'fromPage': serializeParam(
                                'AddPeoplePage',
                                ParamType.String,
                              ),
                              'index': serializeParam(
                                widget!.index,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          await actions.hideKeyboardAction(
                            context,
                          );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFFB3B3B3),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    FFAppState()
                                                .benefitorData
                                                .elementAtOrNull(widget!.index!)
                                                ?.gender !=
                                            ''
                                        ? (FFAppState()
                                                    .benefitorData
                                                    .elementAtOrNull(
                                                        widget!.index!)
                                                    ?.gender ==
                                                'MALE'
                                            ? 'ชาย'
                                            : 'หญิง')
                                        : 'กรุณาเลือกเพศ',
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: FFAppState()
                                                    .benefitorData
                                                    .elementAtOrNull(
                                                        widget!.index!)
                                                    ?.gender !=
                                                ''
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  Icons.navigate_next,
                                  color: FlutterFlowTheme.of(context)
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
              if (FFAppState()
                      .benefitorData
                      .elementAtOrNull(widget!.index!)
                      ?.gender !=
                  '')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'คำนำหน้าชื่อ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFF1D4774),
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'บังคับเลือก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFFFB0606),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (false) {
                                return;
                              }

                              context.pushNamed(
                                'FireSearchableListPage',
                                queryParameters: {
                                  'titleText': serializeParam(
                                    'คำนำหน้า',
                                    ParamType.String,
                                  ),
                                  'searchLabel': serializeParam(
                                    'ระบุคำนำหน้า',
                                    ParamType.String,
                                  ),
                                  'dataList': serializeParam(
                                    (FFAppState()
                                                    .benefitorData
                                                    .elementAtOrNull(
                                                        widget!.index!)
                                                    ?.gender ==
                                                'MALE') ||
                                            (FFAppState()
                                                    .benefitorData
                                                    .elementAtOrNull(
                                                        widget!.index!)
                                                    ?.gender ==
                                                'ชาย')
                                        ? widget!.firestoreDataConfigList?.title
                                        : widget!
                                            .firestoreDataConfigList?.title2,
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'multiSelect': serializeParam(
                                    false,
                                    ParamType.bool,
                                  ),
                                  'maxSelected': serializeParam(
                                    0,
                                    ParamType.int,
                                  ),
                                  'fromPage': serializeParam(
                                    'AddPeoplePage',
                                    ParamType.String,
                                  ),
                                  'index': serializeParam(
                                    widget!.index,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );

                              await actions.hideKeyboardAction(
                                context,
                              );
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
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
                                        10.0, 0.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        FFAppState()
                                                    .benefitorData
                                                    .elementAtOrNull(
                                                        widget!.index!)
                                                    ?.titleTh !=
                                                ''
                                            ? FFAppState()
                                                .benefitorData
                                                .elementAtOrNull(widget!.index!)
                                                ?.titleTh
                                            : 'กรุณาเลือกคำนำหน้าชื่อ',
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: FFAppState()
                                                        .benefitorData
                                                        .elementAtOrNull(
                                                            widget!.index!)
                                                        ?.titleTh !=
                                                    ''
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: FlutterFlowTheme.of(context)
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'ชื่อ ผู้ขอเอาประกันภัย (ไม่ต้องระบุคำนำหน้า)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFF1D4774),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'บังคับกรอก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFFFB0606),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFFB3B3B3),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: _model
                                          .firstnameTextfieldTextController,
                                      focusNode:
                                          _model.firstnameTextfieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.firstnameTextfieldTextController',
                                        Duration(milliseconds: 100),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'กรุณากรอกชื่อ',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      validator: _model
                                          .firstnameTextfieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'นามสกุล ผู้ขอเอาประกันภัย',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFF1D4774),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'บังคับกรอก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFFFB0606),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFFB3B3B3),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: _model
                                          .address4LastnameTextfieldTextController,
                                      focusNode: _model
                                          .address4LastnameTextfieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.address4LastnameTextfieldTextController',
                                        Duration(milliseconds: 100),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'กรุณากรอกสกุล',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      validator: _model
                                          .address4LastnameTextfieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'วันเดือนปีเกิด (พ.ศ.)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFF1D4774),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'บังคับเลือก',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans Thai',
                                      color: Color(0xFFFB0606),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (false) {
                              return;
                            }
                            final _datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: (functions.currentDate18YearsAgo(
                                      getCurrentTimestamp) ??
                                  DateTime.now()),
                              firstDate: DateTime(1900),
                              lastDate: (functions.currentDate18YearsAgo(
                                      getCurrentTimestamp) ??
                                  DateTime.now()),
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
                            FFAppState().updateBenefitorDataAtIndex(
                              widget!.index!,
                              (e) => e
                                ..birthDay =
                                    functions.getDateFormat(_model.datePicked),
                            );
                            safeSetState(() {});
                            await actions.hideKeyboardAction(
                              context,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFB3B3B3),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: AutoSizeText(
                                    valueOrDefault<String>(
                                      FFAppState()
                                                  .benefitorData
                                                  .elementAtOrNull(
                                                      widget!.index!)
                                                  ?.birthDay !=
                                              ''
                                          ? functions.showDateBE(functions
                                              .parseStringToDatetime(
                                                  FFAppState()
                                                      .benefitorData
                                                      .elementAtOrNull(
                                                          widget!.index!)
                                                      ?.birthDay)
                                              ?.toString())
                                          : 'กรุณาเลือกวันเดือนปีเกิด',
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: FFAppState()
                                                      .benefitorData
                                                      .elementAtOrNull(
                                                          widget!.index!)
                                                      ?.birthDay !=
                                                  ''
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: FlutterFlowTheme.of(context)
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
              if ((FFAppState()
                          .benefitorData
                          .elementAtOrNull(widget!.index!)
                          ?.insuredPersonTypeName !=
                      '') &&
                  (FFAppState()
                          .benefitorData
                          .elementAtOrNull(widget!.index!)
                          ?.gender !=
                      '') &&
                  (FFAppState()
                          .benefitorData
                          .elementAtOrNull(widget!.index!)
                          ?.titleTh !=
                      '') &&
                  (_model.firstnameTextfieldTextController.text != null &&
                      _model.firstnameTextfieldTextController.text != '') &&
                  (_model.address4LastnameTextfieldTextController.text !=
                          null &&
                      _model.address4LastnameTextfieldTextController.text !=
                          '') &&
                  (FFAppState()
                          .benefitorData
                          .elementAtOrNull(widget!.index!)
                          ?.birthDay !=
                      ''))
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Divider(
                      height: 40.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent4,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'ผู้รับผลประโยชน์ของคุณ ${_model.firstnameTextfieldTextController.text}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Color(0xFF1D4774),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'ชื่อผู้รับผลประโยชน์',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF1D4774),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'บังคับกรอก',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFFFB0606),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .benefitorNameTextfieldTextController,
                                            focusNode: _model
                                                .benefitorNameTextfieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              hintText:
                                                  'กรุณาชื่อผู้รับผลประโยชน์',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Noto Sans Thai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            validator: _model
                                                .benefitorNameTextfieldTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'ความสัมพันธ์',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF1D4774),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'บังคับกรอก',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFFFB0606),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: _model
                                          .relationshipTextFieldTextController,
                                      focusNode:
                                          _model.relationshipTextFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'กรุณากรอกความสัมพันธ์',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      validator: _model
                                          .relationshipTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              Divider(
                height: 40.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
