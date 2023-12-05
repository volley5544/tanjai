import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/pdf_page_view_component/pdf_page_view_component_widget.dart';
import '/components/search_employee_component/search_employee_component_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'super_app_page_model.dart';
export 'super_app_page_model.dart';

class SuperAppPageWidget extends StatefulWidget {
  const SuperAppPageWidget({
    Key? key,
    this.dailyText,
  }) : super(key: key);

  final String? dailyText;

  @override
  _SuperAppPageWidgetState createState() => _SuperAppPageWidgetState();
}

class _SuperAppPageWidgetState extends State<SuperAppPageWidget> {
  late SuperAppPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuperAppPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SuperAppPage'});
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
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Container(
                height: double.infinity,
                child: LoadingSceneWidget(),
              ),
            ),
          ));
        },
      ).then((value) => safeSetState(() {}));

      setDarkModeSetting(context, ThemeMode.light);
      _model.getBuildVersion = await actions.getBuildVersion1();
      _model.buildVersionQuery = await queryBuildVersionRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (isAndroid) {
        if (_model.buildVersionQuery?.appVersion != _model.getBuildVersion) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content: Text(
                    'มีประกันทันใจเวอร์ชั่นใหม่แล้ว! กรุณาอัพเดท ประกันทันใจใน Play Store ให้เป็นเวอร์ชั่นล่าสุด'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ));
            },
          );
          await actions.terminateAppAction();
          return;
        }
      } else {
        if (_model.buildVersionQuery?.appVersionIos != _model.getBuildVersion) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                content: Text(
                    'มีประกันทันใจเวอร์ชั่นใหม่แล้ว! กรุณาอัพเดท ประกันทันใจใน TestFlight ให้เป็นเวอร์ชั่นล่าสุด'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ));
            },
          );
          await actions.terminateAppAction();
          return;
        }
      }

      setState(() {
        FFAppState().insuranceVehicleTypeDropDown = 'เลือกประเภทรถ';
        FFAppState().insuranceBasicBrandName = 'เลือกยี่ห้อรถ';
        FFAppState().insuranceBasicBrandId = '';
        FFAppState().isSelectBrandInPackage = false;
        FFAppState().insuranceBasicModelName = 'เลือกรุ่นรถ';
        FFAppState().insuranceBasicModelId = '';
        FFAppState().insuranceBasicYear = 'เลือกปีจดทะเบียน พ.ศ.';
        FFAppState().insuranceBasicVehicleUsedTypeName = 'เลือกการใช้งาน';
        FFAppState().insuranceBasicCoverTypeNameOutputList = [];
        FFAppState().insuranceBasicGarageTypeInPackage = [];
      });
      setState(() {
        FFAppState().typeList = 'list';
      });
      setState(() {
        FFAppState().nonePackageFlagCarrier = false;
        FFAppState().nonePackageVehicleType = 'กรุณาเลือกประเภทรถ';
        FFAppState().nonePackageBrandName = 'กรุณาเลือกยี่ห้อรถ';
        FFAppState().nonePackageBrandId = '';
        FFAppState().nonePackageModelName = 'กรุณากรอกรุ่นรถ';
        FFAppState().nonePackageModelCode = '';
        FFAppState().nonePackageYear = 'กรุณาเลือกปีจดทะเบียน';
        FFAppState().nonePackageUsedTypeId = '';
        FFAppState().nonePackageSearchModelList = [];
        FFAppState().nonePackageUsedTypeCode = '';
        FFAppState().nonePackageUsedTypeName = 'กรุณาเลือกลักษณะการใช้รถ';
        FFAppState().nonePackageCusFullname = 'กรุณากรอกชื่อ';
        FFAppState().nonePackageCusPhone = 'กรุณากรอกเบอร์โทรศัพท์';
        FFAppState().nonePackagePlate = '';
        FFAppState().nonePackageProvince = 'กรุณาเลือกจังหวัดจดทะเบียน';
        FFAppState().nonePackageProvinceId = '';
        FFAppState().nonePackageSumInsured = 'กรุณากรอกทุนประกัน';
        FFAppState().nonePackageFlagAct = true;
        FFAppState().nonePackageIsBrandSelect = false;
        FFAppState().nonePackageSearchModelIdList = [];
        FFAppState().nonePackageCarrierType = 'กรุณาเลือกประเภทตู้เหล็ก';
        FFAppState().nonePackageFlagCoop = false;
        FFAppState().nonePackageTruckPart = 'กรุณาเลือกส่วนของรถบรรทุก';
        FFAppState().nonePackageCusMembership = 'กรุณาเลือกประเภทลูกค้า';
        FFAppState().nonePackageTruckCurrentPrice =
            'กรุณากรอกราคาซื้อขายปัจจุบัน';
        FFAppState().nonePackagePlateAdditional = 'กรุณากรอกเลขทะเบียนหางพ่วง';
        FFAppState().nonePackageTruckCarryPurpose = 'กรุณากรอกรถใช้บรรทุกอะไร';
        FFAppState().nonePackageTrailerSumInsured = 'กรุณากรอกทุนประกันหางพ่วง';
        FFAppState().nonePackageCarrierPrice = '';
        FFAppState().nonePackageInsurerIdList = [];
        FFAppState().nonePackageInsurerCodeList = [];
        FFAppState().nonePackageInsurerShortNameList = [];
        FFAppState().nonePackageInsurerNameList = [];
        FFAppState().nonePackageInsurerDisplayName = [];
        FFAppState().nonePackageInsurerIdOutputList = [];
        FFAppState().nonePackageInsurerCodeOutputList = [];
        FFAppState().nonePackageInsurerShortNameOutputList = [];
        FFAppState().nonePackageInsurerNameOutputList = [];
        FFAppState().nonePackageReason = [];
        FFAppState().nonePackageInsurerSelectedList = [];
        FFAppState().nonePackageCoverTypeId = '';
        FFAppState().nonePackageCoverTypeCode = '';
        FFAppState().nonePackageCoverTypeName = 'กรุณาเลือกประเภทชั้นประกัน';
        FFAppState().nonePackageGarageTypeId = '';
        FFAppState().nonePackageGarageTypeName = 'กรุณาเลือกประเภทการซ่อม';
        FFAppState().nonePackageGarageTypeCode = '';
        FFAppState().nonePackageFlagRenew = false;
        FFAppState().nonePackageOldVmiExpDate =
            'กรุณาเลือกวันที่หมดอายุประกันเดิม';
        FFAppState().nonePackageOldVmi = '';
        FFAppState().nonePackageOldVmiImageUrl = '';
        FFAppState().nonePackageIdCardImageUrl = '';
        FFAppState().nonePackageRenewImageUrlList = [];
        FFAppState().nonePackageRenewImageCheckList = [];
        FFAppState().nonePackageOldVmiImageUploadedCheck = false;
        FFAppState().nonePackageIdCardWatermarkUploadedCheck = false;
        FFAppState().buttonOrdinary = false;
        FFAppState().buttonCorporation = false;
        FFAppState().nonePackageCustomerType = '';
        FFAppState().nonePackageInsurerDisplayNameOutput = '';
        FFAppState().nonePackageImageOther = [];
        FFAppState().nonePackageImageFront = [];
        FFAppState().nonePackageImageRightFront = [];
        FFAppState().nonePackageImageRight = [];
        FFAppState().nonePackageImageRightRear = [];
        FFAppState().nonePackageImageRear = [];
        FFAppState().nonePackageImageLeftRear = [];
        FFAppState().nonePackageImageLeft = [];
        FFAppState().nonePackageImageLeftFront = [];
        FFAppState().nonePackageImageRoof = [];
        FFAppState().nonePackageTrailerImageFront = [];
        FFAppState().nonePackageTrailerImageRightFront = [];
        FFAppState().nonePackageTrailerImageRight = [];
        FFAppState().nonePackageTrailerImageRightRear = [];
        FFAppState().nonePackageTrailerImageRear = [];
        FFAppState().nonePackageTrailerImageLeftRear = [];
        FFAppState().nonePackageTrailerImageLeft = [];
        FFAppState().nonePackageTrailerImageLeftFront = [];
        FFAppState().nonePackageInsurerOutputIndex = 0;
        FFAppState().nonePackageLeadId = '';
        FFAppState().nonePackageLeadNo = '';
        FFAppState().nonePackageCarImageUploadedList = [];
        FFAppState().nonePackageImageOldVmi = [];
        FFAppState().nonePackageImageCompanyBook = [];
        FFAppState().nonePackageImageIdCard = [];
        FFAppState().nonePackageImageBlueBook = [];
        FFAppState().nonePackageCompanyBookImageUploadedCheck = false;
        FFAppState().nonePackageCompanyBookImageUrl = '';
        FFAppState().nonePackageImageFrontUploaded = '';
        FFAppState().nonePackageImageRightFrontUploaded = '';
        FFAppState().nonePackageImageRightUploaded = '';
        FFAppState().nonePackageImageRightRearUploaded = '';
        FFAppState().nonePackageImageRearUploaded = '';
        FFAppState().nonePackageImageLeftRearUploaded = '';
        FFAppState().nonePackageImageLeftUploaded = '';
        FFAppState().nonePackageImageLeftFrontUploaded = '';
        FFAppState().nonePackageImageRoofUploaded = '';
        FFAppState().nonePackageTrailerImageFrontUploaded = '';
        FFAppState().nonePackageTrailerImageRightFrontUploaded = '';
        FFAppState().nonePackageTrailerImageRightUploaded = '';
        FFAppState().nonePackageTrailerImageRightRearUploaded = '';
        FFAppState().nonePackageTrailerImageRearUploaded = '';
        FFAppState().nonePackageTrailerImageLeftRearUploaded = '';
        FFAppState().nonePackageTrailerImageLeftUploaded = '';
        FFAppState().nonePackageTrailerImageLeftFrontUploaded = '';
        FFAppState().nonePackageImageBlueBookUploaded = '';
        FFAppState().nonePackageImageOther1 = '';
        FFAppState().nonePackageImageOther2 = '';
        FFAppState().nonePackageImageOther3 = '';
        FFAppState().nonePackageImageOther4 = '';
        FFAppState().nonePackageImageOther5 = '';
        FFAppState().nonePackageImageOtherNameList = [];
        FFAppState().nonePackageSelectedInsurerShortName = '';
        FFAppState().nonePackageSelectedInsurerName = '';
        FFAppState().nonePackageSelectedInsurerShortNameList = [];
        FFAppState().nonePackageSelectedInsurerNameList = [];
        FFAppState().nonePackageFlagOldVmi = '';
        FFAppState().nonePackageWorkType = '';
        FFAppState().nonePackageRemark = '';
        FFAppState().nonePackageBranchCode = '';
        FFAppState().nonePackageBranchName = '';
        FFAppState().nonePackageInsurerShortNameDupList = [];
      });
      if (true
          ? true
          : FFAppState().adminEMP.contains(FFAppState().employeeID)) {
        if (isAndroid) {
          await actions.allowScreenRecordAndroid();
        } else {
          await actions.allowScreenRecordIOS();
        }
      } else {
        if (isAndroid) {
          await actions.preventScreenRecordAndroid();
        } else {
          await actions.preventScreenRecordIOS();
        }
      }

      if (FFAppState().apiURLLocalState == 'api_url_local_state') {
        await actions.a22();
        Navigator.pop(context);

        context.goNamed('LoginPage');

        return;
      }
      await actions.lockOrientation();
      if (FFAppState().isFromLoginPage) {
        if (!FFAppState().isFromSetPinPage) {
          Navigator.pop(context);

          context.goNamed('SetPinCodePage');

          return;
        }
      } else {
        if (!FFAppState().isFromAuthenPage) {
          Navigator.pop(context);

          context.goNamed('PinCodePage');

          return;
        }
      }

      _model.getVMIApi = await GetVMICall.call(
        url: FFAppState().apiUrlInsuranceAppState,
        ownerId: FFAppState().employeeID,
      );
      if (GetVMICall.statusLayer1(
            (_model.getVMIApi?.jsonBody ?? ''),
          ) ==
          200) {
        if (GetVMICall.statusLayer2(
              (_model.getVMIApi?.jsonBody ?? ''),
            ) !=
            200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                title: Text('พบข้อผิดพลาด'),
                content: Text('${GetVMICall.massageLayer2(
                  (_model.getVMIApi?.jsonBody ?? ''),
                ).toString()}(${GetVMICall.statusLayer2(
                  (_model.getVMIApi?.jsonBody ?? ''),
                ).toString().toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ));
            },
          );
          return;
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              title: Text('พบข้อผิดพลาด'),
              content: Text('${GetVMICall.massageLayer1(
                (_model.getVMIApi?.jsonBody ?? ''),
              ).toString()}(${GetVMICall.statusLayer1(
                (_model.getVMIApi?.jsonBody ?? ''),
              ).toString().toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );
        return;
      }

      if (FFAppState().isInApp) {
        Navigator.pop(context);
        return;
      }
      FFAppState().update(() {
        FFAppState().isInApp = true;
      });
      Navigator.pop(context);
    });

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
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 347.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.6,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/header-background2.png',
                              ).image,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 25.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (!FFAppState().isProduction)
                                            Text(
                                              'ทดสอบ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 50.0,
                                                      ),
                                            ),
                                          if (FFAppState().isProduction)
                                            VerticalDivider(
                                              thickness: 1.0,
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.asset(
                                                'assets/images/logo__1_-removebg-preview.png',
                                                width: 130.0,
                                                height: 40.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                1.00, -1.00),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x48FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(60.0),
                                                border: Border.all(
                                                  color: Color(0xFFDB771A),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: StreamBuilder<
                                                  UserCustomRecord>(
                                                stream: UserCustomRecord
                                                    .getDocument(
                                                        FFAppState().userRef!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final imageUserCustomRecord =
                                                      snapshot.data!;
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60.0),
                                                    child: Image.network(
                                                      imageUserCustomRecord
                                                          .imgProfile,
                                                      width: 100.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.waving_hand_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'สวัสดี คุณ${FFAppState().profileFirstName}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF003063),
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.95,
                                          height: 63.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(17.0),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {},
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                GetVMICall
                                                                    .monthText(
                                                                  (_model.getVMIApi
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                GetVMICall
                                                                    .dateFullText(
                                                                  (_model.getVMIApi
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      fontSize:
                                                                          10.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'จำนวนกรมธรรม์',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                                                child: Text(
                                                                  GetVMICall
                                                                      .total(
                                                                    (_model.getVMIApi
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: Color(
                                                                            0xFF003063),
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
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
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                      'SearchInsurancePage');
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.28,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      6.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.search,
                                                            color: Color(
                                                                0xFFDB771A),
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      7.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'ค้นหาประกันรถ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'MakeInsuranceListPage',
                                                    queryParameters: {
                                                      'checkTotal':
                                                          serializeParam(
                                                        GetVMICall.approve(
                                                          (_model.getVMIApi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                      'list': serializeParam(
                                                        GetVMICall.approveList(
                                                          (_model.getVMIApi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        ParamType.JSON,
                                                        true,
                                                      ),
                                                      'checkPayment':
                                                          serializeParam(
                                                        '0',
                                                        ParamType.String,
                                                      ),
                                                      'checkVMI':
                                                          serializeParam(
                                                        '1',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.28,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.library_books,
                                                        color:
                                                            Color(0xFFDB771A),
                                                        size: 38.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'จำนวนกรมธรรม์',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.goNamed(
                                                    'LeadFollowUpPage');
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.28,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.task,
                                                      color: Color(0xFFDF8633),
                                                      size: 35.0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'ติดตามสถานะ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18.0,
                          child: VerticalDivider(
                            thickness: 3.0,
                            color: Color(0xFFDB771A),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'ใบเสนอราคาของฉัน',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFF003063),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed('insuranceListPage');
                            },
                            child: Text(
                              'ดูทั้งหมด',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFFEDA44C),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 260.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (GetVMICall.quotationTotal(
                                  (_model.getVMIApi?.jsonBody ?? ''),
                                ) !=
                                0
                            ? true
                            : false)
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Builder(
                                builder: (context) {
                                  final leadList = ((GetVMICall.leadIdList(
                                            (_model.getVMIApi?.jsonBody ?? ''),
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()
                                              ?.toList() ??
                                          [])
                                      .take(5)
                                      .toList();
                                  return Container(
                                    width: double.infinity,
                                    height: 235.0,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 4.0),
                                          child: PageView.builder(
                                            controller: _model
                                                    .pageViewController1 ??=
                                                PageController(
                                                    initialPage: min(0,
                                                        leadList.length - 1)),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: leadList.length,
                                            itemBuilder:
                                                (context, leadListIndex) {
                                              final leadListItem =
                                                  leadList[leadListIndex];
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, -1.00),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  height: 210.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      12.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.37,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        'ชื่อลูกค้า',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: FlutterFlowTheme.of(context).black600,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 10.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      ':',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).black600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        '${functions.checkNullValueAndReturn((GetVMICall.firstNameList(
                                                                          (_model.getVMIApi?.jsonBody ??
                                                                              ''),
                                                                        ) as List).map<String>((s) => s.toString()).toList()[leadListIndex])} ${functions.checkNullValueAndReturn((GetVMICall.lastNameList(
                                                                          (_model.getVMIApi?.jsonBody ??
                                                                              ''),
                                                                        ) as List).map<String>((s) => s.toString()).toList()[leadListIndex])}',
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: FlutterFlowTheme.of(context).black600,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.37,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        'ประเภท',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: FlutterFlowTheme.of(context).black600,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 10.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      ':',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).black600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (((GetVMICall.flgRenew(
                                                                                    (_model.getVMIApi?.jsonBody ?? ''),
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()[leadListIndex] ==
                                                                                  '1') &&
                                                                              ((GetVMICall.oldVMIFlg(
                                                                                    (_model.getVMIApi?.jsonBody ?? ''),
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()[leadListIndex] ==
                                                                                  '1')) {
                                                                            return 'งานโอนโค้ด';
                                                                          } else if (((GetVMICall.flgRenew(
                                                                                    (_model.getVMIApi?.jsonBody ?? ''),
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()[leadListIndex] ==
                                                                                  '1') &&
                                                                              ((GetVMICall.oldVMIFlg(
                                                                                    (_model.getVMIApi?.jsonBody ?? ''),
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()[leadListIndex] ==
                                                                                  '0')) {
                                                                            return 'งานต่ออายุ';
                                                                          } else {
                                                                            return 'งานใหม่';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: FlutterFlowTheme.of(context).black600,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.37,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        'ใบเสนอราคามีผลใช้ถึง',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: FlutterFlowTheme.of(context).black600,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 10.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      ':',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).black600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        functions.checkNullValueAndReturn((GetVMICall.expireDate(
                                                                          (_model.getVMIApi?.jsonBody ??
                                                                              ''),
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()[leadListIndex]),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: FlutterFlowTheme.of(context).black600,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.37,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        'สถานะ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: FlutterFlowTheme.of(context).black600,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 10.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      ':',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).black600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        functions.checkNullValueAndReturn((GetVMICall.quotationStatus(
                                                                          (_model.getVMIApi?.jsonBody ??
                                                                              ''),
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()[leadListIndex]),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans Thai',
                                                                              color: FlutterFlowTheme.of(context).black600,
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 6.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      20.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    var _shouldSetState =
                                                                        false;
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                  content: Text('ต้องการจะบันทึกเตรียมข้อมูลใช่หรือไม่?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('ยกเลิก'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('ยืนยัน'),
                                                                                    ),
                                                                                  ],
                                                                                ));
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      _model.listFromDash =
                                                                          await InsuranceRequestListAPIDashBoardCall
                                                                              .call(
                                                                        apiUrl:
                                                                            FFAppState().apiUrlInsuranceAppState,
                                                                        token: FFAppState()
                                                                            .accessToken,
                                                                        leadId: (GetVMICall.leadIdList(
                                                                          (_model.getVMIApi?.jsonBody ??
                                                                              ''),
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()[leadListIndex],
                                                                        list: FFAppState()
                                                                            .typeList,
                                                                        mode:
                                                                            'arunsawad',
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      if ((_model.listFromDash?.statusCode ??
                                                                              200) ==
                                                                          200) {
                                                                        if (InsuranceRequestListAPIDashBoardCall.statusLayer2(
                                                                              (_model.listFromDash?.jsonBody ?? ''),
                                                                            ) ==
                                                                            200) {
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                title: Text('พบข้อผิดพลาด'),
                                                                                content: Text('${InsuranceRequestListAPIDashBoardCall.messageLayer2(
                                                                                  (_model.listFromDash?.jsonBody ?? ''),
                                                                                ).toString()}(${InsuranceRequestListAPIDashBoardCall.statusLayer2(
                                                                                  (_model.listFromDash?.jsonBody ?? ''),
                                                                                ).toString()})'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              ));
                                                                            },
                                                                          );
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        context
                                                                            .pushNamed(
                                                                          'MakeInsuranceListPage',
                                                                          queryParameters:
                                                                              {
                                                                            'checkTotal':
                                                                                serializeParam(
                                                                              InsuranceRequestListAPIDashBoardCall.waitingInfo(
                                                                                (_model.listFromDash?.jsonBody ?? ''),
                                                                              ),
                                                                              ParamType.int,
                                                                            ),
                                                                            'list':
                                                                                serializeParam(
                                                                              InsuranceRequestListAPIDashBoardCall.waitingInfoList(
                                                                                (_model.listFromDash?.jsonBody ?? ''),
                                                                              ),
                                                                              ParamType.JSON,
                                                                              true,
                                                                            ),
                                                                            'checkPayment':
                                                                                serializeParam(
                                                                              '0',
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                                child: AlertDialog(
                                                                              title: Text('connection'),
                                                                              content: Text('${InsuranceRequestListAPIDashBoardCall.messageLayer1(
                                                                                (_model.listFromDash?.jsonBody ?? ''),
                                                                              ).toString()}(${InsuranceRequestListAPIDashBoardCall.statusLayer1(
                                                                                (_model.listFromDash?.jsonBody ?? ''),
                                                                              ).toString()})'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            ));
                                                                          },
                                                                        );
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }
                                                                    } else {
                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                      return;
                                                                    }

                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                  },
                                                                  text:
                                                                      'ทำประกัน',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0xFFD9761A),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              15.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 1.00),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController1 ??=
                                                PageController(
                                                    initialPage: min(0,
                                                        leadList.length - 1)),
                                            count: leadList.length,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController1!
                                                  .animateToPage(
                                                i,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            effect: smooth_page_indicator
                                                .ExpandingDotsEffect(
                                              expansionFactor: 2.0,
                                              spacing: 8.0,
                                              radius: 16.0,
                                              dotWidth: 16.0,
                                              dotHeight: 8.0,
                                              dotColor: Color(0xFFF3C5A2),
                                              activeDotColor: Color(0xFFD9761A),
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        if (GetVMICall.quotationTotal(
                                  (_model.getVMIApi?.jsonBody ?? ''),
                                ) ==
                                0
                            ? true
                            : false)
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    'ไม่พบข้อมูล',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
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
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 4.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 18.0,
                                child: VerticalDivider(
                                  thickness: 3.0,
                                  color: Color(0xFFE8903E),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'โปรโมชั่นพิเศษ!!',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF003063),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      HapticFeedback.mediumImpact();

                                      context.goNamed('webViewPromotionPage');
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/6yzu7_.jpg',
                                        height: 200.0,
                                        fit: BoxFit.cover,
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
                  if (false)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 4.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 18.0,
                                  child: VerticalDivider(
                                    thickness: 3.0,
                                    color: Color(0xFFE8903E),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'ตรวจสอบอู่บริษัทประกัน',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            color: Color(0xFF003063),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 200.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.asset(
                                              'assets/images/garage-02_0.png',
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: 'imageTag4',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'imageTag4',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.asset(
                                          'assets/images/garage-02_0.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: 200.0,
                                          fit: BoxFit.cover,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 4.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 18.0,
                                child: VerticalDivider(
                                  thickness: 3.0,
                                  color: Color(0xFFE8903E),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'ตารางแสดงประกันในเรท',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF003063),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.asset(
                                            'assets/images/S__15712417.jpg',
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag5',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag5',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        'assets/images/S__15712417.jpg',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        height: 200.0,
                                        fit: BoxFit.cover,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 4.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 18.0,
                                child: VerticalDivider(
                                  thickness: 3.0,
                                  color: Color(0xFFE8903E),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'ตามงานกลุ่มประกัน',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Color(0xFF003063),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await launchURL(
                                        'https://line.me/ti/g/Vnu3qGS_XY');
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/S__14966814.jpg',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 4.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 18.0,
                              child: VerticalDivider(
                                thickness: 3.0,
                                color: Color(0xFFE8903E),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'ไทยไพบูลย์',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color: Color(0xFF003063),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: FutureBuilder<List<AuthorizationRecord>>(
                          future: queryAuthorizationRecordOnce(
                            queryBuilder: (authorizationRecord) =>
                                authorizationRecord.where(
                              'content_name',
                              isEqualTo: 'kpi_ceo',
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<AuthorizationRecord>
                                propiedasdesListAuthorizationRecordList =
                                snapshot.data!;
                            final propiedasdesListAuthorizationRecord =
                                propiedasdesListAuthorizationRecordList
                                        .isNotEmpty
                                    ? propiedasdesListAuthorizationRecordList
                                        .first
                                    : null;
                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 200.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<
                                        List<UrlLinkStorageRecord>>(
                                      future: queryUrlLinkStorageRecordOnce(
                                        queryBuilder: (urlLinkStorageRecord) =>
                                            urlLinkStorageRecord.where(
                                          'url_name',
                                          isEqualTo: 'thaipaiboon_web_url',
                                        ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<UrlLinkStorageRecord>
                                            carouselUrlLinkStorageRecordList =
                                            snapshot.data!;
                                        final carouselUrlLinkStorageRecord =
                                            carouselUrlLinkStorageRecordList
                                                    .isNotEmpty
                                                ? carouselUrlLinkStorageRecordList
                                                    .first
                                                : null;
                                        return Container(
                                          width: double.infinity,
                                          height: 200.0,
                                          child: CarouselSlider(
                                            items: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await launchURL(
                                                        carouselUrlLinkStorageRecord!
                                                            .urlLink);
                                                  },
                                                  child: Container(
                                                    width: 280.0,
                                                    height: 180.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFFFA361),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  4.0,
                                                                  4.0,
                                                                  4.0),
                                                      child: Container(
                                                        width: 280.0,
                                                        height: 155.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF2EAE5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          child: Image.asset(
                                                            'assets/images/Card-line-Final1_0.png',
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: FutureBuilder<
                                                    List<UrlLinkStorageRecord>>(
                                                  future:
                                                      queryUrlLinkStorageRecordOnce(
                                                    queryBuilder:
                                                        (urlLinkStorageRecord) =>
                                                            urlLinkStorageRecord
                                                                .where(
                                                      'url_name',
                                                      isEqualTo: functions.checkIsHaveThisValueInList(
                                                              propiedasdesListAuthorizationRecord
                                                                  ?.employeeIdList
                                                                  ?.toList(),
                                                              FFAppState()
                                                                  .employeeID)!
                                                          ? 'tableau_thaipaiboon_ceo'
                                                          : 'tableau_thaipaiboon' !=
                                                                  ''
                                                              ? functions.checkIsHaveThisValueInList(
                                                                      propiedasdesListAuthorizationRecord
                                                                          ?.employeeIdList
                                                                          ?.toList(),
                                                                      FFAppState()
                                                                          .employeeID)!
                                                                  ? 'tableau_thaipaiboon_ceo'
                                                                  : 'tableau_thaipaiboon'
                                                              : null,
                                                    ),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UrlLinkStorageRecord>
                                                        containerUrlLinkStorageRecordList =
                                                        snapshot.data!;
                                                    final containerUrlLinkStorageRecord =
                                                        containerUrlLinkStorageRecordList
                                                                .isNotEmpty
                                                            ? containerUrlLinkStorageRecordList
                                                                .first
                                                            : null;
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (functions.checkIsHaveThisValueInList(
                                                            propiedasdesListAuthorizationRecord
                                                                ?.employeeIdList
                                                                ?.toList(),
                                                            FFAppState()
                                                                .employeeID)!) {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.6,
                                                                    child:
                                                                        SearchEmployeeComponentWidget(
                                                                      tableauUrlLink:
                                                                          containerUrlLinkStorageRecord
                                                                              ?.urlLink,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        } else {
                                                          await actions
                                                              .openTableauBrowser(
                                                            FFAppState()
                                                                .accessToken,
                                                            containerUrlLinkStorageRecord
                                                                ?.urlLink,
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 280.0,
                                                        height: 170.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFFFA361),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Container(
                                                            width: 280.0,
                                                            height: 155.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF2EAE5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Card-line-Final2_0.png',
                                                                width: 300.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                            carouselController:
                                                _model.carouselController ??=
                                                    CarouselController(),
                                            options: CarouselOptions(
                                              initialPage: 0,
                                              viewportFraction: 0.75,
                                              disableCenter: true,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.3,
                                              enableInfiniteScroll: true,
                                              scrollDirection: Axis.horizontal,
                                              autoPlay: true,
                                              autoPlayAnimationDuration:
                                                  Duration(milliseconds: 800),
                                              autoPlayInterval: Duration(
                                                  milliseconds: (800 + 4000)),
                                              autoPlayCurve: Curves.linear,
                                              pauseAutoPlayInFiniteScroll: true,
                                              onPageChanged: (index, _) =>
                                                  _model.carouselCurrentIndex =
                                                      index,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18.0,
                          child: VerticalDivider(
                            thickness: 3.0,
                            color: Color(0xFFDB771A),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'ผลิตภัณฑ์อื่น ๆ',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Color(0xFF003063),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAE4D1),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: FutureBuilder<List<TanjaiBannerRecord>>(
                            future: queryTanjaiBannerRecordOnce(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<TanjaiBannerRecord>
                                  pageViewTanjaiBannerRecordList =
                                  snapshot.data!;
                              final pageViewTanjaiBannerRecord =
                                  pageViewTanjaiBannerRecordList.isNotEmpty
                                      ? pageViewTanjaiBannerRecordList.first
                                      : null;
                              return Builder(
                                builder: (context) {
                                  final imageListItem =
                                      pageViewTanjaiBannerRecord?.imageUrl
                                              ?.toList() ??
                                          [];
                                  return Container(
                                    width: double.infinity,
                                    height: 220.0,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: PageView.builder(
                                            controller: _model
                                                    .pageViewController2 ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        imageListItem.length -
                                                            1)),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: imageListItem.length,
                                            itemBuilder:
                                                (context, imageListItemIndex) {
                                              final imageListItemItem =
                                                  imageListItem[
                                                      imageListItemIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if ((pageViewTanjaiBannerRecord
                                                                  ?.contentLink?[
                                                              imageListItemIndex]) !=
                                                          'ThaiPaiBoon') {
                                                        return;
                                                      }
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Color(0xC0000000),
                                                        enableDrag: false,
                                                        useSafeArea: true,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    PdfPageViewComponentWidget(
                                                                  pdfUrlList: pageViewTanjaiBannerRecord!
                                                                          .pdfUrl[
                                                                      imageListItemIndex],
                                                                ),
                                                              ),
                                                            ),
                                                          ));
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Hero(
                                                      tag: pageViewTanjaiBannerRecord!
                                                              .imageUrl[
                                                          imageListItemIndex],
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: OctoImage(
                                                          placeholderBuilder:
                                                              OctoPlaceholder
                                                                  .blurHash(
                                                            'LCH_NU=jE-b;0ZysS2My03D,s+o~',
                                                          ),
                                                          image: NetworkImage(
                                                            pageViewTanjaiBannerRecord!
                                                                    .imageUrl[
                                                                imageListItemIndex],
                                                          ),
                                                          width: 300.0,
                                                          height: 227.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 16.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller: _model
                                                      .pageViewController2 ??=
                                                  PageController(
                                                      initialPage: min(
                                                          0,
                                                          imageListItem.length -
                                                              1)),
                                              count: imageListItem.length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) async {
                                                await _model
                                                    .pageViewController2!
                                                    .animateToPage(
                                                  i,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              effect: smooth_page_indicator
                                                  .ExpandingDotsEffect(
                                                expansionFactor: 2.0,
                                                spacing: 8.0,
                                                radius: 16.0,
                                                dotWidth: 16.0,
                                                dotHeight: 8.0,
                                                dotColor: Color(0xFFF3C5A2),
                                                activeDotColor:
                                                    Color(0xFFD9761A),
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
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
