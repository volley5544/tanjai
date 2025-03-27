import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_package_fire_insurance_page_model.dart';
export 'search_package_fire_insurance_page_model.dart';

class SearchPackageFireInsurancePageWidget extends StatefulWidget {
  const SearchPackageFireInsurancePageWidget({
    super.key,
    this.token,
    this.userProfileData,
  });

  final String? token;
  final dynamic userProfileData;

  static String routeName = 'SearchPackageFireInsurancePage';
  static String routePath = 'searchPackageFireInsurancePage';

  @override
  State<SearchPackageFireInsurancePageWidget> createState() =>
      _SearchPackageFireInsurancePageWidgetState();
}

class _SearchPackageFireInsurancePageWidgetState
    extends State<SearchPackageFireInsurancePageWidget> {
  late SearchPackageFireInsurancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPackageFireInsurancePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchPackageFireInsurancePage'});
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

      FFAppState().userProfileData = UserProfileModelStruct();
      FFAppState().fireInsuranceSearchPackageData =
          FireInsuranceSearchPackageDataStruct();
      FFAppState().calEstimatedData = HouseCalEstimatedModelStruct();
      safeSetState(() {});
      FFAppState().accessToken = widget!.token!;
      FFAppState().userProfileData =
          UserProfileModelStruct.maybeFromMap(widget!.userProfileData!)!;
      safeSetState(() {});
      FFAppState().employeeID = FFAppState().userProfileData.ownerId;
      FFAppState().branchCode = FFAppState().userProfileData.branchCode;
      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.widthTextFieldTextController ??= TextEditingController();
    _model.widthTextFieldFocusNode ??= FocusNode();
    _model.widthTextFieldFocusNode!.addListener(
      () async {
        if ((_model.widthTextFieldFocusNode?.hasFocus ?? false)) {
          safeSetState(() {
            _model.widthTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.widthTextFieldTextController.text);
          });
        } else {
          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                      '') &&
                  ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                      'null')) &&
              (_model.widthTextFieldTextController.text != '') &&
              (_model.longTextFieldTextController.text != '') &&
              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                      '') &&
                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                      'null'))) {
            _model.calEstimatedOutputWidth =
                await HouseInsuranceGroup.houseCalEstimatedApiCall.call(
              houseAreaType: _model.isSelectedCentimeterSquar ? '02' : '01',
              houseTypeCode:
                  FFAppState().fireInsuranceSearchPackageData.houseTypeCode,
              usableArea: (int.parse(functions.removeCommaFromNumText(
                          _model.widthTextFieldTextController.text)) *
                      int.parse(functions.removeCommaFromNumText(
                          _model.longTextFieldTextController.text)))
                  .toString(),
              token: FFAppState().accessToken,
              apiUrl: FFAppState().apiUrlInsuranceAppState,
              floor: FFAppState().fireInsuranceSearchPackageData.houseFloor,
              width: functions.removeCommaFromNumText(
                  _model.widthTextFieldTextController.text),
              long: functions.removeCommaFromNumText(
                  _model.longTextFieldTextController.text),
            );

            if ((_model.calEstimatedOutputWidth?.statusCode ?? 200) == 200) {
              if ('${getJsonField(
                    (_model.calEstimatedOutputWidth?.jsonBody ?? ''),
                    r'''$.code''',
                  ).toString().toString()}' ==
                  '200') {
                FFAppState().calEstimatedData =
                    HouseInsuranceGroup.houseCalEstimatedApiCall.data(
                  (_model.calEstimatedOutputWidth?.jsonBody ?? ''),
                )!;
                safeSetState(() {});
              } else {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(
                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                          (_model.calEstimatedOutputWidth?.jsonBody ?? ''),
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
              }
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                    child: AlertDialog(
                      content: Text(
                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutputWidth?.statusCode ?? 200).toString()})'),
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
          safeSetState(() {
            _model.widthTextFieldTextController?.text =
                functions.showNumberWithCommaWithoutDot2(
                    _model.widthTextFieldTextController.text)!;
          });
        }

        safeSetState(() {});
      },
    );
    _model.longTextFieldTextController ??= TextEditingController();
    _model.longTextFieldFocusNode ??= FocusNode();
    _model.longTextFieldFocusNode!.addListener(
      () async {
        if ((_model.longTextFieldFocusNode?.hasFocus ?? false)) {
          safeSetState(() {
            _model.longTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.longTextFieldTextController.text);
          });
        } else {
          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                      '') &&
                  ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                      'null')) &&
              (_model.widthTextFieldTextController.text != '') &&
              (_model.longTextFieldTextController.text != '') &&
              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                      '') &&
                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                      'null'))) {
            _model.calEstimatedOutputLong =
                await HouseInsuranceGroup.houseCalEstimatedApiCall.call(
              houseAreaType: _model.isSelectedCentimeterSquar ? '02' : '01',
              houseTypeCode:
                  FFAppState().fireInsuranceSearchPackageData.houseTypeCode,
              usableArea: (int.parse(functions.removeCommaFromNumText(
                          _model.widthTextFieldTextController.text)) *
                      int.parse(functions.removeCommaFromNumText(
                          _model.longTextFieldTextController.text)))
                  .toString(),
              token: FFAppState().accessToken,
              apiUrl: FFAppState().apiUrlInsuranceAppState,
              floor: FFAppState().fireInsuranceSearchPackageData.houseFloor,
              width: functions.removeCommaFromNumText(
                  _model.widthTextFieldTextController.text),
              long: functions.removeCommaFromNumText(
                  _model.longTextFieldTextController.text),
            );

            if ((_model.calEstimatedOutputLong?.statusCode ?? 200) == 200) {
              if ('${getJsonField(
                    (_model.calEstimatedOutputLong?.jsonBody ?? ''),
                    r'''$.code''',
                  ).toString().toString()}' ==
                  '200') {
                FFAppState().calEstimatedData =
                    HouseInsuranceGroup.houseCalEstimatedApiCall.data(
                  (_model.calEstimatedOutputLong?.jsonBody ?? ''),
                )!;
                safeSetState(() {});
              } else {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(
                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                          (_model.calEstimatedOutputLong?.jsonBody ?? ''),
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
              }
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                    child: AlertDialog(
                      content: Text(
                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutputLong?.statusCode ?? 200).toString()})'),
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
          safeSetState(() {
            _model.longTextFieldTextController?.text =
                functions.showNumberWithCommaWithoutDot2(
                    _model.longTextFieldTextController.text)!;
          });
        }

        safeSetState(() {});
      },
    );
    _model.centimeterSquarTextFieldTextController ??= TextEditingController();
    _model.centimeterSquarTextFieldFocusNode ??= FocusNode();
    _model.centimeterSquarTextFieldFocusNode!.addListener(
      () async {
        if ((_model.centimeterSquarTextFieldFocusNode?.hasFocus ?? false)) {
          safeSetState(() {
            _model.centimeterSquarTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.centimeterSquarTextFieldTextController.text);
          });
        } else {
          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                      '') &&
                  ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                      'null')) &&
              (_model.centimeterSquarTextFieldTextController.text != '') &&
              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                      '') &&
                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                      'null'))) {
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

            _model.calEstimatedOutputCmSq =
                await HouseInsuranceGroup.houseCalEstimatedApiCall.call(
              houseAreaType: _model.isSelectedCentimeterSquar ? '02' : '01',
              houseTypeCode:
                  FFAppState().fireInsuranceSearchPackageData.houseTypeCode,
              usableArea: functions.removeCommaFromNumText(
                  _model.centimeterSquarTextFieldTextController.text),
              token: FFAppState().accessToken,
              apiUrl: FFAppState().apiUrlInsuranceAppState,
              floor: FFAppState().fireInsuranceSearchPackageData.houseFloor,
              width: '0',
              long: '0',
            );

            if ((_model.calEstimatedOutputCmSq?.statusCode ?? 200) == 200) {
              if ('${getJsonField(
                    (_model.calEstimatedOutputCmSq?.jsonBody ?? ''),
                    r'''$.code''',
                  ).toString().toString()}' ==
                  '200') {
                FFAppState().calEstimatedData =
                    HouseInsuranceGroup.houseCalEstimatedApiCall.data(
                  (_model.calEstimatedOutputCmSq?.jsonBody ?? ''),
                )!;
                safeSetState(() {});
              } else {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(
                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                          (_model.calEstimatedOutputCmSq?.jsonBody ?? ''),
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
              }
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                    child: AlertDialog(
                      content: Text(
                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutputCmSq?.statusCode ?? 200).toString()})'),
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

            Navigator.pop(context);
          }
          safeSetState(() {
            _model.centimeterSquarTextFieldTextController?.text =
                functions.showNumberWithCommaWithoutDot2(
                    _model.centimeterSquarTextFieldTextController.text)!;
          });
        }

        safeSetState(() {});
      },
    );
    _model.buildinAssetTextFieldTextController ??= TextEditingController();
    _model.buildinAssetTextFieldFocusNode ??= FocusNode();
    _model.buildinAssetTextFieldFocusNode!.addListener(
      () async {
        if ((_model.buildinAssetTextFieldFocusNode?.hasFocus ?? false)) {
          safeSetState(() {
            _model.buildinAssetTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.buildinAssetTextFieldTextController.text);
          });
        } else {
          safeSetState(() {
            _model.buildinAssetTextFieldTextController?.text =
                functions.showNumberWithCommaWithoutDot2(
                    _model.buildinAssetTextFieldTextController.text)!;
          });
        }
      },
    );
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
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB771B),
                size: 30.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            title: Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
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

                  _model.userUID = await actions.a21();
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return WebViewAware(
                        child: AlertDialog(
                          content: Text(_model.userUID!),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  final selectedMedia = await selectMedia(
                    imageQuality: 30,
                    mediaSource: MediaSource.photoGallery,
                    multiImage: false,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    safeSetState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    try {
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();
                    } finally {
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length) {
                      safeSetState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                      });
                    } else {
                      safeSetState(() {});
                      return;
                    }
                  }

                  _model.uploadStorageOutput =
                      await actions.uploadFileFirebaseStorage(
                    'UploadFile',
                    _model.uploadedLocalFile,
                  );
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return WebViewAware(
                        child: AlertDialog(
                          content: Text(_model.uploadStorageOutput!),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  Navigator.pop(context);

                  safeSetState(() {});
                },
                child: Text(
                  'ค้นหาประกันอัคคีภัย',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Noto Sans Thai',
                        color: Color(0xFF003063),
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 23.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ประเภทที่อยู่อาศัย',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF5E5D5D),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(กรุณาเลือก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFFF0202),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState()
                                        .updateFireInsuranceSearchPackageDataStruct(
                                      (e) => e
                                        ..houseAreaType =
                                            _model.isSelectedCentimeterSquar
                                                ? '02'
                                                : '01'
                                        ..usableArea = _model.isSelectedCentimeterSquar
                                            ? (_model.centimeterSquarTextFieldTextController
                                                        .text !=
                                                    ''
                                                ? functions.removeCommaFromNumText(
                                                    _model
                                                        .centimeterSquarTextFieldTextController
                                                        .text)
                                                : '')
                                            : ((_model.widthTextFieldTextController
                                                            .text !=
                                                        '') &&
                                                    (_model.longTextFieldTextController
                                                            .text !=
                                                        '')
                                                ? ((int.parse(functions.removeCommaFromNumText(_model.widthTextFieldTextController.text)) *
                                                        int.parse(functions.removeCommaFromNumText(_model.longTextFieldTextController.text)))
                                                    .toString())
                                                : '')
                                        ..houseWidth = _model
                                                    .widthTextFieldTextController
                                                    .text !=
                                                ''
                                            ? functions.removeCommaFromNumText(
                                                _model
                                                    .widthTextFieldTextController
                                                    .text)
                                            : ''
                                        ..houseLong = _model
                                                    .longTextFieldTextController
                                                    .text !=
                                                ''
                                            ? functions.removeCommaFromNumText(
                                                _model
                                                    .longTextFieldTextController
                                                    .text)
                                            : '',
                                    );
                                    safeSetState(() {});

                                    context.pushNamed(
                                      SearchableHouseListWidget.routeName,
                                      queryParameters: {
                                        'titleText': serializeParam(
                                          'เลือกประเภทที่อยู่อาศัย',
                                          ParamType.String,
                                        ),
                                        'searchLabel': serializeParam(
                                          'กรุณาเลือกประเภทที่อยู่อาศัย',
                                          ParamType.String,
                                        ),
                                        'dataList': serializeParam(
                                          FFAppState().defaultList1,
                                          ParamType.String,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      border: Border.all(
                                        color: Color(0xFF8A8989),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeName,
                                              'เลือกประเภทที่อยู่อาศัย',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                                                              '') &&
                                                          ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                                                              'null')
                                                      ? Colors.black
                                                      : Color(0xFFB3B1B1),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: Color(0xFF5E5D5D),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 23.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ขนาดพื้นที่ใช้สอย',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF5E5D5D),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      if (false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(กรุณาเลือก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFF0202),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 10.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isSelectedCentimeterSquar =
                                              false;
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model
                                                .centimeterSquarTextFieldTextController
                                                ?.clear();
                                            _model
                                                .buildinAssetTextFieldTextController
                                                ?.clear();
                                          });
                                          FFAppState().calEstimatedData =
                                              HouseCalEstimatedModelStruct();
                                          FFAppState()
                                              .updateFireInsuranceSearchPackageDataStruct(
                                            (e) => e
                                              ..houseAreaType = null
                                              ..usableArea = null
                                              ..houseFloor = null
                                              ..sumInsureHouse = null
                                              ..sumInsureBuildin = null
                                              ..houseWidth = null
                                              ..houseLong = null,
                                          );
                                          safeSetState(() {});
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation:
                                              !_model.isSelectedCentimeterSquar
                                                  ? 10.0
                                                  : 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: 100.0,
                                            height: valueOrDefault<double>(
                                              !_model.isSelectedCentimeterSquar
                                                  ? 140.0
                                                  : 128.0,
                                              128.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: !_model
                                                        .isSelectedCentimeterSquar
                                                    ? Color(0xFFDB771B)
                                                    : Color(0xFF8A8989),
                                                width: !_model
                                                        .isSelectedCentimeterSquar
                                                    ? 3.0
                                                    : 1.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/_X_.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'ขนาดกว้าง x ยาว',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF8A8989),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isSelectedCentimeterSquar =
                                              true;
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.widthTextFieldTextController
                                                ?.clear();
                                            _model.longTextFieldTextController
                                                ?.clear();
                                            _model
                                                .buildinAssetTextFieldTextController
                                                ?.clear();
                                          });
                                          FFAppState().calEstimatedData =
                                              HouseCalEstimatedModelStruct();
                                          FFAppState()
                                              .updateFireInsuranceSearchPackageDataStruct(
                                            (e) => e
                                              ..houseAreaType = null
                                              ..usableArea = null
                                              ..houseFloor = null
                                              ..sumInsureHouse = null
                                              ..sumInsureBuildin = null
                                              ..houseWidth = null
                                              ..houseLong = null,
                                          );
                                          safeSetState(() {});
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation:
                                              _model.isSelectedCentimeterSquar
                                                  ? 10.0
                                                  : 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: 100.0,
                                            height: valueOrDefault<double>(
                                              _model.isSelectedCentimeterSquar
                                                  ? 140.0
                                                  : 128.0,
                                              128.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: _model
                                                        .isSelectedCentimeterSquar
                                                    ? Color(0xFFDB771B)
                                                    : Color(0xFF8A8989),
                                                width: _model
                                                        .isSelectedCentimeterSquar
                                                    ? 3.0
                                                    : 1.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/7gkbi_.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'ขนาดตารางเมตร',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF8A8989),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (!_model.isSelectedCentimeterSquar) {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ขนาดกว้าง x ยาว',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFF5E5D5D),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(กรุณากรอก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFF0202),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 10.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (FFAppState().buttonOrdinary ==
                                                  true) {
                                                FFAppState().buttonCorporation =
                                                    false;
                                                FFAppState().buttonOrdinary =
                                                    false;
                                                safeSetState(() {});
                                              } else {
                                                FFAppState().buttonCorporation =
                                                    false;
                                                FFAppState().buttonOrdinary =
                                                    true;
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: Color(0xFF8A8989),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .widthTextFieldTextController,
                                                          focusNode: _model
                                                              .widthTextFieldFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText: 'กว้าง',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: Color(
                                                                          0xFFB3B1B1),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .widthTextFieldTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'X',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF5E5D5D),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (FFAppState().buttonOrdinary ==
                                                  true) {
                                                FFAppState().buttonCorporation =
                                                    false;
                                                FFAppState().buttonOrdinary =
                                                    false;
                                                safeSetState(() {});
                                              } else {
                                                FFAppState().buttonCorporation =
                                                    false;
                                                FFAppState().buttonOrdinary =
                                                    true;
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: Color(0xFF8A8989),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .longTextFieldTextController,
                                                          focusNode: _model
                                                              .longTextFieldFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText: 'ยาว',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: Color(
                                                                          0xFFB3B1B1),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .longTextFieldTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'เมตร',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFF5E5D5D),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ขนาดตารางเมตร',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFF5E5D5D),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(กรุณากรอก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFF0202),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (FFAppState().buttonOrdinary ==
                                                  true) {
                                                FFAppState().buttonCorporation =
                                                    false;
                                                FFAppState().buttonOrdinary =
                                                    false;
                                                safeSetState(() {});
                                              } else {
                                                FFAppState().buttonCorporation =
                                                    false;
                                                FFAppState().buttonOrdinary =
                                                    true;
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: Color(0xFF8A8989),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .centimeterSquarTextFieldTextController,
                                                            focusNode: _model
                                                                .centimeterSquarTextFieldFocusNode,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: false,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  'ขนาดตารางเมตร',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFFB3B1B1),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
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
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .centimeterSquarTextFieldTextControllerValidator
                                                                .asValidator(
                                                                    context),
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
                                      ),
                                      Text(
                                        'ตารางเมตร',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF5E5D5D),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 23.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'จำนวนชั้น',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF5E5D5D),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(กรุณาเลือก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFFFF0202),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState()
                                        .updateFireInsuranceSearchPackageDataStruct(
                                      (e) => e
                                        ..houseAreaType =
                                            _model.isSelectedCentimeterSquar
                                                ? '02'
                                                : '01'
                                        ..usableArea = _model.isSelectedCentimeterSquar
                                            ? (_model.centimeterSquarTextFieldTextController
                                                        .text !=
                                                    ''
                                                ? functions.removeCommaFromNumText(
                                                    _model
                                                        .centimeterSquarTextFieldTextController
                                                        .text)
                                                : '')
                                            : ((_model.widthTextFieldTextController
                                                            .text !=
                                                        '') &&
                                                    (_model.longTextFieldTextController
                                                            .text !=
                                                        '')
                                                ? ((int.parse(functions.removeCommaFromNumText(_model.widthTextFieldTextController.text)) *
                                                        int.parse(functions.removeCommaFromNumText(_model.longTextFieldTextController.text)))
                                                    .toString())
                                                : '')
                                        ..houseWidth = _model
                                                    .widthTextFieldTextController
                                                    .text !=
                                                ''
                                            ? functions.removeCommaFromNumText(
                                                _model
                                                    .widthTextFieldTextController
                                                    .text)
                                            : ''
                                        ..houseLong = _model
                                                    .longTextFieldTextController
                                                    .text !=
                                                ''
                                            ? functions.removeCommaFromNumText(
                                                _model
                                                    .longTextFieldTextController
                                                    .text)
                                            : '',
                                    );
                                    safeSetState(() {});

                                    context.pushNamed(
                                      FireSearchableListPageWidget.routeName,
                                      queryParameters: {
                                        'titleText': serializeParam(
                                          'เลือกจำนวนชั้น',
                                          ParamType.String,
                                        ),
                                        'searchLabel': serializeParam(
                                          'ระบุจำนวนชั้น',
                                          ParamType.String,
                                        ),
                                        'dataList': serializeParam(
                                          ['1', '2', '3', '4', '5'],
                                          ParamType.String,
                                          isList: true,
                                        ),
                                        'multiSelect': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      border: Border.all(
                                        color: Color(0xFF8A8989),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              'เลือกจำนวนชั้น',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                              '') &&
                                                          ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                              'null')
                                                      ? Colors.black
                                                      : Color(0xFFB3B1B1),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: Color(0xFF5E5D5D),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 23.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'สิ่งปลูกสร้าง',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF5E5D5D),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '(ไม่รวมรากฐาน)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: Color(0xFF5E5D5D),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEAEAEA),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    border: Border.all(
                                      color: Color(0xFF8A8989),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            ('${FFAppState().calEstimatedData.estimatedPrice.toString()}' !=
                                                        '') &&
                                                    ('${FFAppState().calEstimatedData.estimatedPrice.toString()}' !=
                                                        'null')
                                                ? functions
                                                    .showNumberWithCommaWithoutDot2(
                                                        FFAppState()
                                                            .calEstimatedData
                                                            .estimatedPrice
                                                            .toString())
                                                : '',
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans Thai',
                                                color: ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                            '') &&
                                                        ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                            'null')
                                                    ? Colors.black
                                                    : Color(0xFFB3B1B1),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 23.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ทรัพย์สินภายในสิ่งปลูกสร้าง',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              color: Color(0xFF5E5D5D),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '(กรุณากรอก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  color: Color(0xFFFF0202),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    border: Border.all(
                                      color: Color(0xFF8A8989),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model
                                                .buildinAssetTextFieldTextController,
                                            focusNode: _model
                                                .buildinAssetTextFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'กรุณากรอกจำนวนเงิน',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFFB3B1B1),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans Thai',
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType: TextInputType.phone,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .buildinAssetTextFieldTextControllerValidator
                                                .asValidator(context),
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
                      ],
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
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (!(('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                                          '') &&
                                      ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' !=
                                          'null'))) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณาเลือกประเภทที่อยู่อาศัย'),
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
                                  if (_model.isSelectedCentimeterSquar) {
                                    if (_model
                                            .centimeterSquarTextFieldTextController
                                            .text ==
                                        '') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณากรอกขนาดตารางเมตร'),
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
                                  } else {
                                    if (_model.widthTextFieldTextController
                                            .text ==
                                        '') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content:
                                                  Text('กรุณากรอกความกว้าง'),
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
                                    if (_model
                                            .longTextFieldTextController.text ==
                                        '') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text('กรุณากรอกความยาว'),
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
                                  }

                                  if (!(('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                          '') &&
                                      ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                          'null'))) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content:
                                                Text('กรุณาเลือกจำนวนชั้น'),
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
                                  if (_model.buildinAssetTextFieldTextController
                                          .text ==
                                      '') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณากรอกทรัพย์สินภายในสิ่งปลูกสร้าง'),
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
                                  FFAppState()
                                      .updateFireInsuranceSearchPackageDataStruct(
                                    (e) => e
                                      ..houseAreaType =
                                          _model.isSelectedCentimeterSquar
                                              ? '02'
                                              : '01'
                                      ..usableArea = _model.isSelectedCentimeterSquar
                                          ? _model.centimeterSquarTextFieldTextController
                                              .text
                                          : ((int.parse((functions
                                                      .removeCommaFromNumber(_model
                                                          .widthTextFieldTextController
                                                          .text)!)) *
                                                  int.parse((functions
                                                      .removeCommaFromNumber(_model
                                                          .longTextFieldTextController
                                                          .text)!)) *
                                                  int.parse(FFAppState()
                                                      .fireInsuranceSearchPackageData
                                                      .houseFloor))
                                              .toString())
                                      ..sumInsureHouse = FFAppState()
                                          .calEstimatedData
                                          .estimatedPrice
                                          .toString()
                                      ..sumInsureBuildin =
                                          functions.removeCommaFromNumber(_model
                                              .buildinAssetTextFieldTextController
                                              .text)
                                      ..houseWidth = _model
                                              .isSelectedCentimeterSquar
                                          ? '0'
                                          : functions.removeCommaFromNumber(
                                              _model
                                                  .widthTextFieldTextController
                                                  .text)
                                      ..houseLong = _model
                                              .isSelectedCentimeterSquar
                                          ? '0'
                                          : functions.removeCommaFromNumber(
                                              _model.longTextFieldTextController
                                                  .text),
                                  );
                                  safeSetState(() {});

                                  context.pushNamed(
                                    FireInsurerListPageWidget.routeName,
                                    queryParameters: {
                                      'yearMin': serializeParam(
                                        '1',
                                        ParamType.String,
                                      ),
                                      'yearMax': serializeParam(
                                        '1',
                                        ParamType.String,
                                      ),
                                      'sumInsured': serializeParam(
                                        (int.parse(FFAppState()
                                                    .fireInsuranceSearchPackageData
                                                    .sumInsureHouse) +
                                                int.parse(FFAppState()
                                                    .fireInsuranceSearchPackageData
                                                    .sumInsureBuildin))
                                            .toString(),
                                        ParamType.String,
                                      ),
                                      'sumInsureHouse': serializeParam(
                                        FFAppState()
                                            .fireInsuranceSearchPackageData
                                            .sumInsureHouse,
                                        ParamType.String,
                                      ),
                                      'sumInsureBuilding': serializeParam(
                                        FFAppState()
                                            .fireInsuranceSearchPackageData
                                            .sumInsureBuildin,
                                        ParamType.String,
                                      ),
                                      'sumInsureOther': serializeParam(
                                        '0',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: 'ค้นหา',
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
                  ),
                ].addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
