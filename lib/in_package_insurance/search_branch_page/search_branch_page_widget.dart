import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_branch_page_model.dart';
export 'search_branch_page_model.dart';

class SearchBranchPageWidget extends StatefulWidget {
  const SearchBranchPageWidget({
    super.key,
    required this.fromPage,
  });

  final String? fromPage;

  static String routeName = 'SearchBranchPage';
  static String routePath = 'SearchBranchPage';

  @override
  State<SearchBranchPageWidget> createState() => _SearchBranchPageWidgetState();
}

class _SearchBranchPageWidgetState extends State<SearchBranchPageWidget> {
  late SearchBranchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBranchPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchBranchPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.getBranchSearched = await GetlocationAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
      );

      if (((_model.getBranchSearched?.statusCode ?? 200) == 200) &&
          (GetlocationAPICall.statusLayer2(
                (_model.getBranchSearched?.jsonBody ?? ''),
              ) ==
              200)) {
      } else {
        if ((_model.getBranchSearched?.statusCode ?? 200) == 200) {
          if (GetlocationAPICall.statusLayer2(
                (_model.getBranchSearched?.jsonBody ?? ''),
              ) ==
              404) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text('ไม่พบข้อมูลสาขา'),
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
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาดLayer2 (${GetlocationAPICall.statusLayer2(
                      (_model.getBranchSearched2?.jsonBody ?? ''),
                    )?.toString()})'),
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
          }
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดConnection (${(_model.getBranchSearched2?.statusCode ?? 200).toString()})'),
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
        }
      }

      Navigator.pop(context);
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
              'ค้นหาสาขาที่จะลงผลงาน',
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
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              Duration(milliseconds: 100),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              hintText:
                                                  'กรอกชื่อสาขาที่จะค้นหา',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSansThai(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                              prefixIcon: Icon(
                                                Icons.search_outlined,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font:
                                                      GoogleFonts.notoSansThai(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (false)
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    HapticFeedback.mediumImpact();
                                    if (!(_model.textController.text != null &&
                                        _model.textController.text != '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณากรอกรหัสสาขา/ชื่อสาขา ที่ต้องการจะค้นหา'),
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
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x00000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: double.infinity,
                                                child: LoadingSceneWidget(),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    _model.getBranchSearched2 =
                                        await GetlocationAPICall.call(
                                      token: FFAppState().accessToken,
                                      branch: _model.textController.text,
                                      apiUrl: FFAppState().apiURLLocalState,
                                    );

                                    _shouldSetState = true;
                                    if (((_model.getBranchSearched2
                                                    ?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetlocationAPICall.statusLayer2(
                                              (_model.getBranchSearched2
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200)) {
                                      FFAppState()
                                              .searchableListComponentSelectedList =
                                          functions
                                              .createFalseListByItemNumber(
                                                  false,
                                                  GetlocationAPICall.branchCode(
                                                    (_model.getBranchSearched2
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.length)!
                                              .toList()
                                              .cast<bool>();
                                      safeSetState(() {});
                                    } else {
                                      if ((_model.getBranchSearched2
                                                  ?.statusCode ??
                                              200) ==
                                          200) {
                                        if (GetlocationAPICall.statusLayer2(
                                              (_model.getBranchSearched2
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            404) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content:
                                                      Text('ไม่พบข้อมูลสาขา'),
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
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาดLayer2 (${GetlocationAPICall.statusLayer2(
                                                    (_model.getBranchSearched2
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.toString()})'),
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
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาดConnection (${(_model.getBranchSearched2?.statusCode ?? 200).toString()})'),
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
                                      }
                                    }

                                    Navigator.pop(context);
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'ค้นหา',
                                  options: FFButtonOptions(
                                    width: 110.0,
                                    height: 40.0,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: ((_model.getBranchSearched?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetlocationAPICall.statusLayer2(
                                        (_model.getBranchSearched?.jsonBody ??
                                            ''),
                                      ) ==
                                      200),
                              child: Builder(
                                builder: (context) {
                                  final branchListItem =
                                      GetlocationAPICall.branchCode(
                                            (_model.getBranchSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toList() ??
                                          [];

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: branchListItem.length,
                                    itemBuilder:
                                        (context, branchListItemIndex) {
                                      final branchListItemItem =
                                          branchListItem[branchListItemIndex];
                                      return Visibility(
                                        visible: _model.textController.text !=
                                                    null &&
                                                _model.textController.text != ''
                                            ? (functions.containWordinStringUrl(
                                                    _model.textController.text
                                                        .toUpperCase(),
                                                    GetlocationAPICall
                                                        .branchCode(
                                                      (_model.getBranchSearched
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.elementAtOrNull(
                                                        branchListItemIndex))! ||
                                                functions
                                                    .containWordinStringUrl(
                                                        _model
                                                            .textController.text
                                                            .toUpperCase(),
                                                        GetlocationAPICall
                                                            .branchName(
                                                          (_model.getBranchSearched
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.elementAtOrNull(
                                                            branchListItemIndex))!)
                                            : true,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (widget!.fromPage ==
                                                'RenewBasic') {
                                              FFAppState().renewBranchCode =
                                                  ((GetlocationAPICall
                                                              .branchCode(
                                                (_model.getBranchSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                          .elementAtOrNull(
                                                              branchListItemIndex))!)
                                                      .toUpperCase();
                                              FFAppState().renewBranchName =
                                                  (GetlocationAPICall
                                                          .branchName(
                                                (_model.getBranchSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                      .elementAtOrNull(
                                                          branchListItemIndex))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            if (widget!.fromPage ==
                                                'NonePackage') {
                                              FFAppState()
                                                      .nonePackageBranchCode =
                                                  ((GetlocationAPICall
                                                              .branchCode(
                                                (_model.getBranchSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                          .elementAtOrNull(
                                                              branchListItemIndex))!)
                                                      .toUpperCase();
                                              FFAppState()
                                                      .nonePackageBranchName =
                                                  (GetlocationAPICall
                                                          .branchName(
                                                (_model.getBranchSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                      .elementAtOrNull(
                                                          branchListItemIndex))!;
                                              safeSetState(() {});
                                              context.safePop();
                                              return;
                                            }
                                            FFAppState()
                                                    .insuranceInfoBranchCode =
                                                ((GetlocationAPICall.branchCode(
                                              (_model.getBranchSearched
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                                        .elementAtOrNull(
                                                            branchListItemIndex))!)
                                                    .toUpperCase();
                                            FFAppState()
                                                    .insuranceInfoBranchNameOutput =
                                                (GetlocationAPICall.branchName(
                                              (_model.getBranchSearched
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                                    .elementAtOrNull(
                                                        branchListItemIndex))!;
                                            safeSetState(() {});
                                            context.safePop();
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
                                                  height: 50.0,
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
                                                          '(${GetlocationAPICall.branchCode(
                                                            (_model.getBranchSearched
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.elementAtOrNull(branchListItemIndex)}) ${GetlocationAPICall.branchName(
                                                            (_model.getBranchSearched
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.elementAtOrNull(branchListItemIndex)}',
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
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToStart(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 24.0)),
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
