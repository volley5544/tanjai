import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/insurance_type_color/insurance_type_color_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_list_page_model.dart';
export 'insurance_list_page_model.dart';

class InsuranceListPageWidget extends StatefulWidget {
  const InsuranceListPageWidget({
    Key? key,
    this.checkType,
  }) : super(key: key);

  final dynamic checkType;

  @override
  _InsuranceListPageWidgetState createState() =>
      _InsuranceListPageWidgetState();
}

class _InsuranceListPageWidgetState extends State<InsuranceListPageWidget>
    with TickerProviderStateMixin {
  late InsuranceListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'insuranceListPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
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
        FFAppState().searchList1 = '0';
      });
      _model.getRequestList = await InsuranceRequestListAPICall.call(
        apiUrl: FFAppState().apiUrlInsuranceAppState,
        token: FFAppState().accessToken,
        ownerId: FFAppState().employeeID,
        mode: 'arunsawad',
        list: 'quotation',
      );
      if ((_model.getRequestList?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(
                  'พบข้อผิดพลาดConnection (${(_model.getRequestList?.statusCode ?? 200).toString()})'),
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
      if (!((InsuranceRequestListAPICall.statusLayer2(
                (_model.getRequestList?.jsonBody ?? ''),
              ) ==
              200) ||
          (InsuranceRequestListAPICall.statusLayer2(
                (_model.getRequestList?.jsonBody ?? ''),
              ) ==
              404))) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${InsuranceRequestListAPICall.statusLayer2(
                (_model.getRequestList?.jsonBody ?? ''),
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
      setState(() {
        FFAppState().insuranceOperationChoiceChips = 'งานใหม่          ';
        FFAppState().insuranceCustomerTypeChoiceChips = 'บุคคลธรรมดา';
        FFAppState().insuranceBoxCheckbokValue = false;
        FFAppState().insuranceBoxTypeChoiceChip = 'ตู้แห้ง';
        FFAppState().insuranceVehicleTypeDropDown = 'กรุณาเลือก';
      });
      Navigator.pop(context);
    });

    _model.searchFirstnameController ??= TextEditingController();
    _model.searchFirstnameFocusNode ??= FocusNode();

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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 48.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFFD9761A),
                size: 30.0,
              ),
              onPressed: () async {
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
                  FFAppState().nonePackageUsedTypeName =
                      'กรุณาเลือกลักษณะการใช้รถ';
                  FFAppState().nonePackageCusFullname = 'กรุณากรอกชื่อ';
                  FFAppState().nonePackageCusPhone = 'กรุณากรอกเบอร์โทรศัพท์';
                  FFAppState().nonePackagePlate = '';
                  FFAppState().nonePackageProvince =
                      'กรุณาเลือกจังหวัดจดทะเบียน';
                  FFAppState().nonePackageProvinceId = '';
                  FFAppState().nonePackageSumInsured = 'กรุณากรอกทุนประกัน';
                  FFAppState().nonePackageFlagAct = true;
                  FFAppState().nonePackageIsBrandSelect = false;
                  FFAppState().nonePackageSearchModelIdList = [];
                  FFAppState().nonePackageCarrierType =
                      'กรุณาเลือกประเภทตู้เหล็ก';
                  FFAppState().nonePackageFlagCoop = false;
                  FFAppState().nonePackageTruckPart =
                      'กรุณาเลือกส่วนของรถบรรทุก';
                  FFAppState().nonePackageCusMembership =
                      'กรุณาเลือกประเภทลูกค้า';
                  FFAppState().nonePackageTruckCurrentPrice =
                      'กรุณากรอกราคาซื้อขายปัจจุบัน';
                  FFAppState().nonePackagePlateAdditional =
                      'กรุณากรอกเลขทะเบียนหางพ่วง';
                  FFAppState().nonePackageTruckCarryPurpose =
                      'กรุณากรอกรถใช้บรรทุกอะไร';
                  FFAppState().nonePackageTrailerSumInsured =
                      'กรุณากรอกทุนประกันหางพ่วง';
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
                  FFAppState().nonePackageCoverTypeName =
                      'กรุณาเลือกประเภทชั้นประกัน';
                  FFAppState().nonePackageGarageTypeId = '';
                  FFAppState().nonePackageGarageTypeName =
                      'กรุณาเลือกประเภทการซ่อม';
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
                await Future.delayed(const Duration(milliseconds: 500));

                context.goNamed('SuperAppPage');
              },
            ),
            title: Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Text(
                'จำนวนลูกค้าทั้งหมด',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Noto Sans Thai',
                      color: Color(0xFF003063),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: FaIcon(
                    FontAwesomeIcons.exclamationTriangle,
                    color: Color(0xFFDB771A),
                    size: 30.0,
                  ),
                  onPressed: () async {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                            child: GestureDetector(
                          onTap: () => _model.unfocusNode.canRequestFocus
                              ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                              : FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              child: InsuranceTypeColorWidget(),
                            ),
                          ),
                        ));
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 0.1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF878787),
                                  size: 24.0,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.5, 8.0, 0.5),
                                    child: TextFormField(
                                      controller:
                                          _model.searchFirstnameController,
                                      focusNode:
                                          _model.searchFirstnameFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.searchFirstnameController',
                                        Duration(milliseconds: 100),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 14.0,
                                            ),
                                        hintText: 'ค้นหาชื่อลูกค้า',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              fontSize: 14.0,
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
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      validator: _model
                                          .searchFirstnameControllerValidator
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
                if (InsuranceRequestListAPICall.statusLayer2(
                          (_model.getRequestList?.jsonBody ?? ''),
                        ) ==
                        200
                    ? true
                    : false)
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            final list = InsuranceRequestListAPICall.leadId(
                                  (_model.getRequestList?.jsonBody ?? ''),
                                )?.toList() ??
                                [];
                            return ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                50.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: list.length,
                              itemBuilder: (context, listIndex) {
                                final listItem = list[listIndex];
                                return Visibility(
                                  visible: (functions.containWordinStringUrl(
                                              _model.searchFirstnameController
                                                  .text,
                                              (InsuranceRequestListAPICall
                                                      .firstname(
                                                (_model.getRequestList
                                                        ?.jsonBody ??
                                                    ''),
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()[listIndex])! ||
                                          (_model.searchFirstnameController
                                                      .text ==
                                                  null ||
                                              _model.searchFirstnameController
                                                      .text ==
                                                  '')) &&
                                      ((FFAppState().searchList1 == '0') ||
                                          (FFAppState().searchList1 ==
                                              (InsuranceRequestListAPICall
                                                      .quotationType(
                                                (_model.getRequestList
                                                        ?.jsonBody ??
                                                    ''),
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()[listIndex])),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: (InsuranceRequestListAPICall
                                                          .quotationType(
                                                    (_model.getRequestList
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()[listIndex] !=
                                                  'manual'
                                              ? Color(0xFFF9DCC3)
                                              : Color(0xFFD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: (InsuranceRequestListAPICall
                                                            .quotationType(
                                                      (_model.getRequestList
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()[listIndex] !=
                                                    'manual'
                                                ? Color(0xFFD9761A)
                                                : Color(0xFF95A1AC),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 12.0,
                                                          12.0, 12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            flex: 5,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.37,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                'ชื่อลูกค้า',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
                                                                  '${functions.checkNullValueAndReturn((InsuranceRequestListAPICall.firstname(
                                                                    (_model.getRequestList
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List).map<String>((s) => s.toString()).toList()[listIndex])} ${functions.checkNullValueAndReturn((InsuranceRequestListAPICall.lastname(
                                                                    (_model.getRequestList
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List).map<String>((s) => s.toString()).toList()[listIndex])}',
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .black600,
                                                                        fontSize:
                                                                            15.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 5,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.37,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                'เบอร์โทร',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                functions.checkNullValueAndReturn((InsuranceRequestListAPICall
                                                                        .phoneNumber(
                                                                  (_model.getRequestList
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()[listIndex]),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 5,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.37,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                'ประเภท',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                () {
                                                                  if (((InsuranceRequestListAPICall.flagRenew(
                                                                            (_model.getRequestList?.jsonBody ??
                                                                                ''),
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()[listIndex] ==
                                                                          '1') &&
                                                                      ((InsuranceRequestListAPICall.oldVMIFlg(
                                                                            (_model.getRequestList?.jsonBody ??
                                                                                ''),
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()[listIndex] ==
                                                                          '0')) {
                                                                    return 'งานต่ออายุ';
                                                                  } else if (((InsuranceRequestListAPICall.flagRenew(
                                                                            (_model.getRequestList?.jsonBody ??
                                                                                ''),
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()[listIndex] ==
                                                                          '1') &&
                                                                      ((InsuranceRequestListAPICall.oldVMIFlg(
                                                                            (_model.getRequestList?.jsonBody ??
                                                                                ''),
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()[listIndex] ==
                                                                          '1')) {
                                                                    return 'งานโอนโค้ด';
                                                                  } else {
                                                                    return 'งานใหม่';
                                                                  }
                                                                }(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 5,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.37,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                'วันที่บันทึก',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                functions.checkNullValueAndReturn((InsuranceRequestListAPICall
                                                                        .quotationDate(
                                                                  (_model.getRequestList
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()[listIndex]),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 5,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.37,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                'ใบเสนอราคามีผลใช้ถึง',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                functions.checkNullValueAndReturn((InsuranceRequestListAPICall
                                                                        .expireDate(
                                                                  (_model.getRequestList
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()[listIndex]),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 5,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.37,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                'สถานะ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                functions.checkNullValueAndReturn((InsuranceRequestListAPICall
                                                                        .quotationStatus(
                                                                  (_model.getRequestList
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()[listIndex]),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: functions.checkNullValueAndReturn((InsuranceRequestListAPICall.quotationStatus(
                                                                                (_model.getRequestList?.jsonBody ?? ''),
                                                                              ) as List)
                                                                                  .map<String>((s) => s.toString())
                                                                                  .toList()[listIndex]) ==
                                                                              'ประกันปฏิเสธ'
                                                                          ? FlutterFlowTheme.of(context).error
                                                                          : FlutterFlowTheme.of(context).black600,
                                                                      fontSize:
                                                                          15.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 5,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.37,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                'เลขที่ใบคำขอ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                functions.checkNullValueAndReturn((InsuranceRequestListAPICall
                                                                        .quotationNo(
                                                                  (_model.getRequestList
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()[listIndex]),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans Thai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .black600,
                                                                      fontSize:
                                                                          15.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                                if ((((InsuranceRequestListAPICall
                                                                                .phoneNumber(
                                                                      (_model.getRequestList
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                            .map<String>((s) => s
                                                                                .toString())
                                                                            .toList()[
                                                                        listIndex] !=
                                                                    null &&
                                                                (InsuranceRequestListAPICall
                                                                                .phoneNumber(
                                                                      (_model.getRequestList
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                            .map<String>((s) => s
                                                                                .toString())
                                                                            .toList()[
                                                                        listIndex] !=
                                                                    '') &&
                                                            ((InsuranceRequestListAPICall
                                                                        .phoneNumber(
                                                                  (_model.getRequestList
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()[listIndex] !=
                                                                '')
                                                        ? true
                                                        : false) &&
                                                    responsiveVisibility(
                                                      context: context,
                                                      tablet: false,
                                                    ))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.00, -1.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 55.0,
                                                        height: 55.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .black600,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await launchUrl(
                                                                      Uri(
                                                                    scheme:
                                                                        'tel',
                                                                    path: functions.checkNullValueAndReturn((InsuranceRequestListAPICall
                                                                            .phoneNumber(
                                                                      (_model.getRequestList
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) =>
                                                                            s.toString())
                                                                        .toList()[listIndex]),
                                                                  ));
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .phone_in_talk_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black600,
                                                                  size: 30.0,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (((InsuranceRequestListAPICall
                                                                          .quotationType(
                                                                (_model.getRequestList
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) as List)
                                                                      .map<String>((s) => s
                                                                          .toString())
                                                                      .toList()[
                                                                  listIndex] ==
                                                              'manual') &&
                                                          (functions.checkNullValueAndReturn((InsuranceRequestListAPICall
                                                                      .quotationStatus(
                                                                (_model.getRequestList
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[listIndex]) !=
                                                              'ประกันปฏิเสธ')
                                                      ? true
                                                      : false)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          showModalBottomSheet(
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
                                                                    height: double
                                                                        .infinity,
                                                                    child:
                                                                        LoadingSceneWidget(),
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          setState(() {
                                                            FFAppState()
                                                                    .nonePackageFlagCarrier =
                                                                false;
                                                            FFAppState()
                                                                    .nonePackageVehicleType =
                                                                'กรุณาเลือกประเภทรถ';
                                                            FFAppState()
                                                                    .nonePackageBrandName =
                                                                'กรุณาเลือกยี่ห้อรถ';
                                                            FFAppState()
                                                                .nonePackageBrandId = '';
                                                            FFAppState()
                                                                    .nonePackageModelName =
                                                                'กรุณากรอกรุ่นรถ';
                                                            FFAppState()
                                                                .nonePackageModelCode = '';
                                                            FFAppState()
                                                                    .nonePackageYear =
                                                                'กรุณาเลือกปีจดทะเบียน';
                                                            FFAppState()
                                                                .nonePackageUsedTypeId = '';
                                                            FFAppState()
                                                                .nonePackageSearchModelList = [];
                                                            FFAppState()
                                                                .nonePackageUsedTypeCode = '';
                                                            FFAppState()
                                                                    .nonePackageUsedTypeName =
                                                                'กรุณาเลือกลักษณะการใช้รถ';
                                                            FFAppState()
                                                                    .nonePackageCusFullname =
                                                                'กรุณากรอกชื่อ';
                                                            FFAppState()
                                                                    .nonePackageCusPhone =
                                                                'กรุณากรอกเบอร์โทรศัพท์';
                                                            FFAppState()
                                                                .nonePackagePlate = '';
                                                            FFAppState()
                                                                    .nonePackageProvince =
                                                                'กรุณาเลือกจังหวัดจดทะเบียน';
                                                            FFAppState()
                                                                .nonePackageProvinceId = '';
                                                            FFAppState()
                                                                    .nonePackageSumInsured =
                                                                'กรุณากรอกทุนประกัน';
                                                            FFAppState()
                                                                    .nonePackageFlagAct =
                                                                true;
                                                            FFAppState()
                                                                    .nonePackageIsBrandSelect =
                                                                false;
                                                            FFAppState()
                                                                .nonePackageSearchModelIdList = [];
                                                            FFAppState()
                                                                    .nonePackageCarrierType =
                                                                'กรุณาเลือกประเภทตู้เหล็ก';
                                                            FFAppState()
                                                                    .nonePackageFlagCoop =
                                                                false;
                                                            FFAppState()
                                                                    .nonePackageTruckPart =
                                                                'กรุณาเลือกส่วนของรถบรรทุก';
                                                            FFAppState()
                                                                    .nonePackageCusMembership =
                                                                'กรุณาเลือกประเภทลูกค้า';
                                                            FFAppState()
                                                                    .nonePackageTruckCurrentPrice =
                                                                'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                                            FFAppState()
                                                                    .nonePackagePlateAdditional =
                                                                'กรุณากรอกเลขทะเบียนหางพ่วง';
                                                            FFAppState()
                                                                    .nonePackageTruckCarryPurpose =
                                                                'กรุณากรอกรถใช้บรรทุกอะไร';
                                                            FFAppState()
                                                                    .nonePackageTrailerSumInsured =
                                                                'กรุณากรอกทุนประกันหางพ่วง';
                                                            FFAppState()
                                                                .nonePackageCarrierPrice = '';
                                                            FFAppState()
                                                                .nonePackageInsurerIdList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerCodeList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerShortNameList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerNameList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerDisplayName = [];
                                                            FFAppState()
                                                                .nonePackageInsurerIdOutputList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerCodeOutputList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerShortNameOutputList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerNameOutputList = [];
                                                            FFAppState()
                                                                .nonePackageReason = [];
                                                            FFAppState()
                                                                .nonePackageInsurerSelectedList = [];
                                                            FFAppState()
                                                                .nonePackageCoverTypeId = '';
                                                            FFAppState()
                                                                .nonePackageCoverTypeCode = '';
                                                            FFAppState()
                                                                    .nonePackageCoverTypeName =
                                                                'กรุณาเลือกประเภทชั้นประกัน';
                                                            FFAppState()
                                                                .nonePackageGarageTypeId = '';
                                                            FFAppState()
                                                                    .nonePackageGarageTypeName =
                                                                'กรุณาเลือกประเภทการซ่อม';
                                                            FFAppState()
                                                                .nonePackageGarageTypeCode = '';
                                                            FFAppState()
                                                                    .nonePackageFlagRenew =
                                                                false;
                                                            FFAppState()
                                                                    .nonePackageOldVmiExpDate =
                                                                'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                                            FFAppState()
                                                                .nonePackageOldVmi = '';
                                                            FFAppState()
                                                                .nonePackageOldVmiImageUrl = '';
                                                            FFAppState()
                                                                .nonePackageIdCardImageUrl = '';
                                                            FFAppState()
                                                                .nonePackageRenewImageUrlList = [];
                                                            FFAppState()
                                                                .nonePackageRenewImageCheckList = [];
                                                            FFAppState()
                                                                    .nonePackageOldVmiImageUploadedCheck =
                                                                false;
                                                            FFAppState()
                                                                    .nonePackageIdCardWatermarkUploadedCheck =
                                                                false;
                                                            FFAppState()
                                                                    .buttonOrdinary =
                                                                false;
                                                            FFAppState()
                                                                    .buttonCorporation =
                                                                false;
                                                            FFAppState()
                                                                .nonePackageCustomerType = '';
                                                            FFAppState()
                                                                .nonePackageInsurerDisplayNameOutput = '';
                                                            FFAppState()
                                                                .nonePackageImageOther = [];
                                                            FFAppState()
                                                                .nonePackageImageFront = [];
                                                            FFAppState()
                                                                .nonePackageImageRightFront = [];
                                                            FFAppState()
                                                                .nonePackageImageRight = [];
                                                            FFAppState()
                                                                .nonePackageImageRightRear = [];
                                                            FFAppState()
                                                                .nonePackageImageRear = [];
                                                            FFAppState()
                                                                .nonePackageImageLeftRear = [];
                                                            FFAppState()
                                                                .nonePackageImageLeft = [];
                                                            FFAppState()
                                                                .nonePackageImageLeftFront = [];
                                                            FFAppState()
                                                                .nonePackageImageRoof = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageFront = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightFront = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageRight = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightRear = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageRear = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftRear = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeft = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftFront = [];
                                                            FFAppState()
                                                                .nonePackageInsurerOutputIndex = 0;
                                                            FFAppState()
                                                                .nonePackageLeadId = '';
                                                            FFAppState()
                                                                .nonePackageLeadNo = '';
                                                            FFAppState()
                                                                .nonePackageCarImageUploadedList = [];
                                                            FFAppState()
                                                                .nonePackageImageOldVmi = [];
                                                            FFAppState()
                                                                .nonePackageImageCompanyBook = [];
                                                            FFAppState()
                                                                .nonePackageImageIdCard = [];
                                                            FFAppState()
                                                                .nonePackageImageBlueBook = [];
                                                            FFAppState()
                                                                    .nonePackageCompanyBookImageUploadedCheck =
                                                                false;
                                                            FFAppState()
                                                                .nonePackageCompanyBookImageUrl = '';
                                                            FFAppState()
                                                                .nonePackageImageFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRightFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRightUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRightRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageLeftRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageLeftUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageLeftFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRoofUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageBlueBookUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageOther1 = '';
                                                            FFAppState()
                                                                .nonePackageImageOther2 = '';
                                                            FFAppState()
                                                                .nonePackageImageOther3 = '';
                                                            FFAppState()
                                                                .nonePackageImageOther4 = '';
                                                            FFAppState()
                                                                .nonePackageImageOther5 = '';
                                                            FFAppState()
                                                                .nonePackageImageOtherNameList = [];
                                                            FFAppState()
                                                                .nonePackageSelectedInsurerShortName = '';
                                                            FFAppState()
                                                                .nonePackageSelectedInsurerName = '';
                                                            FFAppState()
                                                                .nonePackageSelectedInsurerShortNameList = [];
                                                            FFAppState()
                                                                .nonePackageSelectedInsurerNameList = [];
                                                            FFAppState()
                                                                .nonePackageFlagOldVmi = '';
                                                            FFAppState()
                                                                .nonePackageWorkType = '';
                                                            FFAppState()
                                                                .nonePackageRemark = '';
                                                            FFAppState()
                                                                .nonePackageBranchCode = '';
                                                            FFAppState()
                                                                .nonePackageBranchName = '';
                                                            FFAppState()
                                                                .nonePackageInsurerShortNameDupList = [];
                                                          });
                                                          _model.getDetailAPIEdit =
                                                              await InsuranceRequestDetailAPICall
                                                                  .call(
                                                            apiUrl: FFAppState()
                                                                .apiUrlInsuranceAppState,
                                                            token: FFAppState()
                                                                .accessToken,
                                                            leadId: (InsuranceRequestListAPICall
                                                                    .leadId(
                                                              (_model.getRequestList
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                .map<String>(
                                                                    (s) => s
                                                                        .toString())
                                                                .toList()[
                                                                    listIndex]
                                                                .toString(),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (InsuranceRequestDetailAPICall
                                                                  .statusLayer1(
                                                                (_model.getDetailAPIEdit
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              200) {
                                                            Navigator.pop(
                                                                context);
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                  title: Text(
                                                                      'พบข้อผิดพลาด'),
                                                                  content: Text(
                                                                      'กรุณาติดต่อเจ้าหน้าที่(${InsuranceRequestDetailAPICall.messageLayer1(
                                                                    (_model.getDetailAPIEdit
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString()})'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ));
                                                              },
                                                            );
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          if (InsuranceRequestDetailAPICall
                                                                  .statusLayer2(
                                                                (_model.getDetailAPIEdit
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              200) {
                                                            Navigator.pop(
                                                                context);
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                  title: Text(
                                                                      'พบข้อผิดพลาด'),
                                                                  content: Text(
                                                                      'กรุณาติดต่อเจ้าหน้าที่(${InsuranceRequestDetailAPICall.messageLayer2(
                                                                    (_model.getDetailAPIEdit
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString()})'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ));
                                                              },
                                                            );
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            FFAppState()
                                                                    .nonePackageFlagCarrier =
                                                                InsuranceRequestDetailAPICall
                                                                            .flagCarrier(
                                                                          (_model.getDetailAPIEdit?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        '1'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                    .nonePackageVehicleType =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carType(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageBrandName =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .brandName(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageModelName =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .modelName(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageYear =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .year(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageUsedTypeId =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .vehicleId(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageUsedTypeCode =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .vehicleCode(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageUsedTypeName =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .vehicleName(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageCusFullname =
                                                                functions
                                                                    .checkNullValueAndReturn(
                                                                        '${InsuranceRequestDetailAPICall.firstname(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString()} ${InsuranceRequestDetailAPICall.lastname(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString()}');
                                                            FFAppState()
                                                                    .nonePackageCusPhone =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .phoneNumber(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackagePlate =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .plateNo(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageProvince =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .province(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageSumInsured =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .sumInsured(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageFlagAct =
                                                                InsuranceRequestDetailAPICall
                                                                            .flagAct(
                                                                          (_model.getDetailAPIEdit?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        '1'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                    .nonePackageCarrierType =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carrierType(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageFlagCoop =
                                                                InsuranceRequestDetailAPICall
                                                                            .flagCoop(
                                                                          (_model.getDetailAPIEdit?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        '1'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                    .nonePackageTruckPart =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .truckPart(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageCusMembership =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .customerMemberchip(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageTruckCurrentPrice =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .truckCurrentPrice(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackagePlateAdditional =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .trailerPlateNo(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageTruckCarryPurpose =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carrierPropose(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageTrailerSumInsured =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .trailerSumInsured(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageCarrierPrice =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carrierPrice(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageInsurerDisplayName =
                                                                (InsuranceRequestDetailAPICall
                                                                        .insurerNameList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageCoverTypeName =
                                                                functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                        .coverTypeNameList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .first);
                                                            FFAppState()
                                                                    .nonePackageGarageTypeName =
                                                                functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                        .garageTypeNameList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .first);
                                                            FFAppState()
                                                                    .nonePackageFlagRenew =
                                                                InsuranceRequestDetailAPICall
                                                                            .flagRenew(
                                                                          (_model.getDetailAPIEdit?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        '1'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                    .nonePackageOldVmiExpDate =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .oldVmiExpriedDate(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageOldVmi =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .oldVmiPolicyNumber(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageCustomerType =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .customerType(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageLeadId =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .leadId(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageLeadNo =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .leadNo(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageInsurerShortNameList =
                                                                (InsuranceRequestDetailAPICall
                                                                        .insurerShortName(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .buttonOrdinary =
                                                                FFAppState().nonePackageCustomerType ==
                                                                        'บุคคลธรรมดา'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                    .buttonCorporation =
                                                                FFAppState().nonePackageCustomerType !=
                                                                        'บุคคลธรรมดา'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                    .nonePackageRemark =
                                                                functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .remark(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString());
                                                            FFAppState()
                                                                    .nonePackageBranchCode =
                                                                InsuranceRequestDetailAPICall
                                                                    .branchCode(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString();
                                                            FFAppState()
                                                                    .nonePackageBranchName =
                                                                InsuranceRequestDetailAPICall
                                                                    .branchName(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString();
                                                          });
                                                          setState(() {
                                                            FFAppState()
                                                                    .nonePackageImageOther =
                                                                getJsonField(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.results.info[:].leads_detail[:].image_other''',
                                                              true,
                                                            )!
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            FFAppState()
                                                                    .nonePackageImageFront =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageFrontList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageRightFront =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageRightFrontList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageRight =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageRightList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageRightRear =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageRightRearList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageRear =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageRearList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageLeftRear =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageLeftRearList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageLeft =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageLeftList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageLeftFront =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageLeftFrontList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageRoof =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageRoofList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageTrailerImageFront =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageFrontTrailerList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageTrailerImageRightFront =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageRightFrontTrailerList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageTrailerImageRight =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageRightTrailerList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageTrailerImageRightRear =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageRightRearTrailerList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageTrailerImageRear =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageRearTrailerList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageTrailerImageLeftRear =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageLeftRearTrailerList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageTrailerImageLeft =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageLeftTrailerList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageTrailerImageLeftFront =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageLeftFrontTrailerList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageOldVmi =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageOldVmi(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageCompanyBook =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageCompanyBook(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageIdCard =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageIdCardList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageBlueBook =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageBluebookList(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageImageOtherNameList =
                                                                (InsuranceRequestDetailAPICall
                                                                        .imageOtherName(
                                                              (_model.getDetailAPIEdit
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                          });

                                                          context.pushNamed(
                                                              'NonePackageEditPage1');

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        text: 'แก้ไข',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 110.0,
                                                          height: 35.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: Colors.white,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFA19AAC),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                    ),
                                                  if ((InsuranceRequestListAPICall
                                                              .quotationType(
                                                        (_model.getRequestList
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()[listIndex] ==
                                                      'manual')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          showModalBottomSheet(
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
                                                                    height: double
                                                                        .infinity,
                                                                    child:
                                                                        LoadingSceneWidget(),
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          setState(() {
                                                            FFAppState()
                                                                    .nonePackageFlagCarrier =
                                                                false;
                                                            FFAppState()
                                                                    .nonePackageVehicleType =
                                                                'กรุณาเลือกประเภทรถ';
                                                            FFAppState()
                                                                    .nonePackageBrandName =
                                                                'กรุณาเลือกยี่ห้อรถ';
                                                            FFAppState()
                                                                .nonePackageBrandId = '';
                                                            FFAppState()
                                                                    .nonePackageModelName =
                                                                'กรุณากรอกรุ่นรถ';
                                                            FFAppState()
                                                                .nonePackageModelCode = '';
                                                            FFAppState()
                                                                    .nonePackageYear =
                                                                'กรุณาเลือกปีจดทะเบียน';
                                                            FFAppState()
                                                                .nonePackageUsedTypeId = '';
                                                            FFAppState()
                                                                .nonePackageSearchModelList = [];
                                                            FFAppState()
                                                                .nonePackageUsedTypeCode = '';
                                                            FFAppState()
                                                                    .nonePackageUsedTypeName =
                                                                'กรุณาเลือกลักษณะการใช้รถ';
                                                            FFAppState()
                                                                    .nonePackageCusFullname =
                                                                'กรุณากรอกชื่อ';
                                                            FFAppState()
                                                                    .nonePackageCusPhone =
                                                                'กรุณากรอกเบอร์โทรศัพท์';
                                                            FFAppState()
                                                                .nonePackagePlate = '';
                                                            FFAppState()
                                                                    .nonePackageProvince =
                                                                'กรุณาเลือกจังหวัดจดทะเบียน';
                                                            FFAppState()
                                                                .nonePackageProvinceId = '';
                                                            FFAppState()
                                                                    .nonePackageSumInsured =
                                                                'กรุณากรอกทุนประกัน';
                                                            FFAppState()
                                                                    .nonePackageFlagAct =
                                                                true;
                                                            FFAppState()
                                                                    .nonePackageIsBrandSelect =
                                                                false;
                                                            FFAppState()
                                                                .nonePackageSearchModelIdList = [];
                                                            FFAppState()
                                                                    .nonePackageCarrierType =
                                                                'กรุณาเลือกประเภทตู้เหล็ก';
                                                            FFAppState()
                                                                    .nonePackageFlagCoop =
                                                                false;
                                                            FFAppState()
                                                                    .nonePackageTruckPart =
                                                                'กรุณาเลือกส่วนของรถบรรทุก';
                                                            FFAppState()
                                                                    .nonePackageCusMembership =
                                                                'กรุณาเลือกประเภทลูกค้า';
                                                            FFAppState()
                                                                    .nonePackageTruckCurrentPrice =
                                                                'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                                            FFAppState()
                                                                    .nonePackagePlateAdditional =
                                                                'กรุณากรอกเลขทะเบียนหางพ่วง';
                                                            FFAppState()
                                                                    .nonePackageTruckCarryPurpose =
                                                                'กรุณากรอกรถใช้บรรทุกอะไร';
                                                            FFAppState()
                                                                    .nonePackageTrailerSumInsured =
                                                                'กรุณากรอกทุนประกันหางพ่วง';
                                                            FFAppState()
                                                                .nonePackageCarrierPrice = '';
                                                            FFAppState()
                                                                .nonePackageInsurerIdList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerCodeList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerShortNameList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerNameList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerDisplayName = [];
                                                            FFAppState()
                                                                .nonePackageInsurerIdOutputList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerCodeOutputList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerShortNameOutputList = [];
                                                            FFAppState()
                                                                .nonePackageInsurerNameOutputList = [];
                                                            FFAppState()
                                                                .nonePackageReason = [];
                                                            FFAppState()
                                                                .nonePackageInsurerSelectedList = [];
                                                            FFAppState()
                                                                .nonePackageCoverTypeId = '';
                                                            FFAppState()
                                                                .nonePackageCoverTypeCode = '';
                                                            FFAppState()
                                                                    .nonePackageCoverTypeName =
                                                                'กรุณาเลือกประเภทชั้นประกัน';
                                                            FFAppState()
                                                                .nonePackageGarageTypeId = '';
                                                            FFAppState()
                                                                    .nonePackageGarageTypeName =
                                                                'กรุณาเลือกประเภทการซ่อม';
                                                            FFAppState()
                                                                .nonePackageGarageTypeCode = '';
                                                            FFAppState()
                                                                    .nonePackageFlagRenew =
                                                                false;
                                                            FFAppState()
                                                                    .nonePackageOldVmiExpDate =
                                                                'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                                            FFAppState()
                                                                .nonePackageOldVmi = '';
                                                            FFAppState()
                                                                .nonePackageOldVmiImageUrl = '';
                                                            FFAppState()
                                                                .nonePackageIdCardImageUrl = '';
                                                            FFAppState()
                                                                .nonePackageRenewImageUrlList = [];
                                                            FFAppState()
                                                                .nonePackageRenewImageCheckList = [];
                                                            FFAppState()
                                                                    .nonePackageOldVmiImageUploadedCheck =
                                                                false;
                                                            FFAppState()
                                                                    .nonePackageIdCardWatermarkUploadedCheck =
                                                                false;
                                                            FFAppState()
                                                                    .buttonOrdinary =
                                                                false;
                                                            FFAppState()
                                                                    .buttonCorporation =
                                                                false;
                                                            FFAppState()
                                                                .nonePackageCustomerType = '';
                                                            FFAppState()
                                                                .nonePackageInsurerDisplayNameOutput = '';
                                                            FFAppState()
                                                                .nonePackageImageOther = [];
                                                            FFAppState()
                                                                .nonePackageImageFront = [];
                                                            FFAppState()
                                                                .nonePackageImageRightFront = [];
                                                            FFAppState()
                                                                .nonePackageImageRight = [];
                                                            FFAppState()
                                                                .nonePackageImageRightRear = [];
                                                            FFAppState()
                                                                .nonePackageImageRear = [];
                                                            FFAppState()
                                                                .nonePackageImageLeftRear = [];
                                                            FFAppState()
                                                                .nonePackageImageLeft = [];
                                                            FFAppState()
                                                                .nonePackageImageLeftFront = [];
                                                            FFAppState()
                                                                .nonePackageImageRoof = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageFront = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightFront = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageRight = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightRear = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageRear = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftRear = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeft = [];
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftFront = [];
                                                            FFAppState()
                                                                .nonePackageInsurerOutputIndex = 0;
                                                            FFAppState()
                                                                .nonePackageLeadId = '';
                                                            FFAppState()
                                                                .nonePackageLeadNo = '';
                                                            FFAppState()
                                                                .nonePackageCarImageUploadedList = [];
                                                            FFAppState()
                                                                .nonePackageImageOldVmi = [];
                                                            FFAppState()
                                                                .nonePackageImageCompanyBook = [];
                                                            FFAppState()
                                                                .nonePackageImageIdCard = [];
                                                            FFAppState()
                                                                .nonePackageImageBlueBook = [];
                                                            FFAppState()
                                                                    .nonePackageCompanyBookImageUploadedCheck =
                                                                false;
                                                            FFAppState()
                                                                .nonePackageCompanyBookImageUrl = '';
                                                            FFAppState()
                                                                .nonePackageImageFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRightFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRightUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRightRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageLeftRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageLeftUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageLeftFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageRoofUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageRightRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftRearUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftUploaded = '';
                                                            FFAppState()
                                                                .nonePackageTrailerImageLeftFrontUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageBlueBookUploaded = '';
                                                            FFAppState()
                                                                .nonePackageImageOther1 = '';
                                                            FFAppState()
                                                                .nonePackageImageOther2 = '';
                                                            FFAppState()
                                                                .nonePackageImageOther3 = '';
                                                            FFAppState()
                                                                .nonePackageImageOther4 = '';
                                                            FFAppState()
                                                                .nonePackageImageOther5 = '';
                                                            FFAppState()
                                                                .nonePackageImageOtherNameList = [];
                                                            FFAppState()
                                                                .nonePackageSelectedInsurerShortName = '';
                                                            FFAppState()
                                                                .nonePackageSelectedInsurerName = '';
                                                            FFAppState()
                                                                .nonePackageSelectedInsurerShortNameList = [];
                                                            FFAppState()
                                                                .nonePackageSelectedInsurerNameList = [];
                                                            FFAppState()
                                                                .nonePackageFlagOldVmi = '';
                                                            FFAppState()
                                                                .nonePackageWorkType = '';
                                                            FFAppState()
                                                                .nonePackageRemark = '';
                                                            FFAppState()
                                                                .nonePackageBranchCode = '';
                                                            FFAppState()
                                                                .nonePackageBranchName = '';
                                                            FFAppState()
                                                                .nonePackageInsurerShortNameDupList = [];
                                                          });
                                                          _model.getDetailApiDup =
                                                              await InsuranceRequestDetailAPICall
                                                                  .call(
                                                            apiUrl: FFAppState()
                                                                .apiUrlInsuranceAppState,
                                                            token: FFAppState()
                                                                .accessToken,
                                                            leadId: (InsuranceRequestListAPICall
                                                                    .leadId(
                                                              (_model.getRequestList
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                .map<String>(
                                                                    (s) => s
                                                                        .toString())
                                                                .toList()[
                                                                    listIndex]
                                                                .toString(),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (InsuranceRequestDetailAPICall
                                                                  .statusLayer1(
                                                                (_model.getDetailApiDup
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              200) {
                                                            Navigator.pop(
                                                                context);
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                  title: Text(
                                                                      'พบข้อผิดพลาด'),
                                                                  content: Text(
                                                                      'กรุณาติดต่อเจ้าหน้าที่ (${InsuranceRequestDetailAPICall.messageLayer1(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString()} )'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ));
                                                              },
                                                            );
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          if (InsuranceRequestDetailAPICall
                                                                  .statusLayer2(
                                                                (_model.getDetailApiDup
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              200) {
                                                            Navigator.pop(
                                                                context);
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                  title: Text(
                                                                      'พบข้อผิดพลาด'),
                                                                  content: Text(
                                                                      'กรุณาติดต่อเจ้าหน้าที่ (${InsuranceRequestDetailAPICall.messageLayer2(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString()} )'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ));
                                                              },
                                                            );
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          setState(() {
                                                            FFAppState()
                                                                    .nonePackageFlagCarrier =
                                                                InsuranceRequestDetailAPICall
                                                                            .flagCarrier(
                                                                          (_model.getDetailApiDup?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        '1'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                .nonePackageVehicleType = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .carType(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกประเภทรถ'
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carType(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageBrandName = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .brandName(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .brandName(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageBrandId = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .carBrandId(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carBrandId(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageModelName = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .modelName(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .modelName(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageModelCode = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .carModelId(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carModelId(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageYear = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .year(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกปีจดทะเบียน'
                                                                : functions
                                                                    .checkNullValueAndReturn(
                                                                        InsuranceRequestDetailAPICall
                                                                            .year(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageUsedTypeId = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .vehicleId(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .vehicleId(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageUsedTypeCode = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .vehicleCode(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .vehicleCode(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageUsedTypeName = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .vehicleName(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกลักษณะการใช้รถ'
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .vehicleName(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageCusFullname = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .firstname(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .firstname(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageCusPhone = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .phoneNumber(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .phoneNumber(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackagePlate = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .plateNo(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .plateNo(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageProvince = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .province(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกจังหวัดจดทะเบียน'
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .province(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageProvinceId = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .carProvinceCode(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carProvinceCode(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageSumInsured = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .sumInsured(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .sumInsured(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                    .nonePackageFlagAct =
                                                                InsuranceRequestDetailAPICall
                                                                            .flagAct(
                                                                          (_model.getDetailApiDup?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        '1'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                    .nonePackageIsBrandSelect =
                                                                false;
                                                            FFAppState()
                                                                .nonePackageCarrierType = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .carrierType(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกประเภทตู้เหล็ก'
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carrierType(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                    .nonePackageFlagCoop =
                                                                InsuranceRequestDetailAPICall
                                                                            .flagCoop(
                                                                          (_model.getDetailApiDup?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        '1'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                .nonePackageTruckPart = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .truckPart(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกส่วนของรถบรรทุก'
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .truckPart(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageCusMembership = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .customerMemberchip(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกประเภทลูกค้า'
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .customerMemberchip(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageTruckCurrentPrice = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .truckCurrentPrice(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .truckCurrentPrice(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackagePlateAdditional = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .trailerPlateNo(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .trailerPlateNo(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageTruckCarryPurpose = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .carrierPropose(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carrierPropose(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageTrailerSumInsured = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .trailerSumInsured(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .trailerSumInsured(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageCarrierPrice = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .carrierPrice(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .carrierPrice(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageCoverTypeId = functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                            .coverTypeId(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s
                                                                            .toString())
                                                                        .toList()
                                                                        .first) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                        .coverTypeId(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .first);
                                                            FFAppState()
                                                                .nonePackageCoverTypeCode = functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                            .coverTypeCode(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s
                                                                            .toString())
                                                                        .toList()
                                                                        .first) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                        .coverTypeCode(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .first);
                                                            FFAppState()
                                                                .nonePackageCoverTypeName = functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                            .coverTypeNameList(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s
                                                                            .toString())
                                                                        .toList()
                                                                        .first) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกประเภทชั้นประกัน'
                                                                : functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                        .coverTypeNameList(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .first);
                                                            FFAppState()
                                                                .nonePackageGarageTypeId = functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                            .garageTypeId(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s
                                                                            .toString())
                                                                        .toList()
                                                                        .first) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                        .garageTypeId(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .first);
                                                            FFAppState()
                                                                .nonePackageGarageTypeName = functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                            .garageTypeNameList(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s
                                                                            .toString())
                                                                        .toList()
                                                                        .first) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกประเภทการซ่อม'
                                                                : functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                        .garageTypeNameList(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .first);
                                                            FFAppState()
                                                                .nonePackageGarageTypeCode = functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                            .garageTypeCodeList(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s
                                                                            .toString())
                                                                        .toList()
                                                                        .first) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn((InsuranceRequestDetailAPICall
                                                                        .garageTypeCodeList(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .first);
                                                            FFAppState()
                                                                    .nonePackageFlagRenew =
                                                                InsuranceRequestDetailAPICall
                                                                            .flagRenew(
                                                                          (_model.getDetailApiDup?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        '1'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                .nonePackageOldVmiExpDate = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .oldVmiExpriedDate(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? 'กรุณาเลือกวันที่หมดอายุประกันเดิม'
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .oldVmiExpriedDate(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageOldVmi = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .oldVmiPolicyNumber(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .oldVmiPolicyNumber(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageBranchCode = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .branchCode(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .branchCode(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                .nonePackageRemark = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .remark(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .remark(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                            FFAppState()
                                                                    .nonePackageInsurerShortNameDupList =
                                                                (InsuranceRequestDetailAPICall
                                                                        .insurerShortName(
                                                              (_model.getDetailApiDup
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            FFAppState()
                                                                    .nonePackageReason =
                                                                functions
                                                                    .createFalseListByItemNumber(
                                                                        false,
                                                                        3)!
                                                                    .toList()
                                                                    .cast<
                                                                        bool>();
                                                            FFAppState()
                                                                    .buttonOrdinary =
                                                                InsuranceRequestDetailAPICall
                                                                            .customerType(
                                                                          (_model.getDetailApiDup?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        'บุคคลธรรมดา'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                    .buttonCorporation =
                                                                InsuranceRequestDetailAPICall
                                                                            .customerType(
                                                                          (_model.getDetailApiDup?.jsonBody ??
                                                                              ''),
                                                                        ).toString() ==
                                                                        'นิติบุคคล'
                                                                    ? true
                                                                    : false;
                                                            FFAppState()
                                                                .nonePackageBranchName = functions.checkNullValueAndReturn(InsuranceRequestDetailAPICall
                                                                            .branchName(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString()) ==
                                                                    '-'
                                                                ? ''
                                                                : functions.checkNullValueAndReturn(
                                                                    InsuranceRequestDetailAPICall
                                                                        .branchName(
                                                                    (_model.getDetailApiDup
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString());
                                                          });
                                                          setState(() {
                                                            FFAppState()
                                                                .updateNonePackageReasonAtIndex(
                                                              () {
                                                                if (InsuranceRequestDetailAPICall
                                                                            .reason(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        .toString() ==
                                                                    'ไม่มีในเรท') {
                                                                  return 0;
                                                                } else if (InsuranceRequestDetailAPICall
                                                                        .reason(
                                                                      (_model.getDetailApiDup
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString() ==
                                                                    'ไม่พอใจในทุนประกัน') {
                                                                  return 1;
                                                                } else {
                                                                  return 2;
                                                                }
                                                              }(),
                                                              (_) => true,
                                                            );
                                                          });
                                                          Navigator.pop(
                                                              context);

                                                          context.pushNamed(
                                                            'NonePackageBasicPage',
                                                            queryParameters: {
                                                              'branchCode':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageBranchCode,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'carType':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageVehicleType,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'truckPart':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageTruckPart,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'cusMembership':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageCusMembership,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'carrierPurpose':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageTruckCarryPurpose,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'truckCurrentPrice':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageTruckCurrentPrice,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'carrierFlag':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageFlagCarrier,
                                                                ParamType.bool,
                                                              ),
                                                              'coopFlag':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageFlagCoop,
                                                                ParamType.bool,
                                                              ),
                                                              'carrierType':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageCarrierType,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'carrierPrice':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageCarrierPrice,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'brandName':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageBrandName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'brandId':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageBrandId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'modelName':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageModelName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'modelId':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageModelCode,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'year':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageYear,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'vehicleUsedName':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'vehicleUsedId':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'vehicleUsedCode':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageUsedTypeCode,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'coverTypeName':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageCoverTypeName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'coverTypeCode':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageCoverTypeCode,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'coverTypeId':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageCoverTypeId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'garageTypeName':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageGarageTypeName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'garageTypeCode':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageGarageTypeCode,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'garageTypeId':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageGarageTypeId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'cusName':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageCusFullname,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'cusPhone':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageCusPhone,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'plate':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackagePlate,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'plateAdditional':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackagePlateAdditional,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'provinceName':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageProvince,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'provinceCode':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageProvinceId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'sumInsured':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageSumInsured,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'trailerSumInsured':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageTrailerSumInsured,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'remark':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageRemark,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'actFlag':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nonePackageFlagAct,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        text: 'คัดลอก',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 110.0,
                                                          height: 35.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFFF3C5A2),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFD9761A),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                    ),
                                                  if (InsuranceRequestListAPICall
                                                              .flagExpired(
                                                            (_model.getRequestList
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )[listIndex] ==
                                                          0
                                                      ? true
                                                      : false)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                        content:
                                                                            Text('ต้องการจะบันทึกเตรียมข้อมูลใช่หรือไม่?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('ยกเลิก'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('ยืนยัน'),
                                                                          ),
                                                                        ],
                                                                      ));
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            setState(() {
                                                              FFAppState()
                                                                      .nonePackageFlagCarrier =
                                                                  false;
                                                              FFAppState()
                                                                      .nonePackageVehicleType =
                                                                  'กรุณาเลือกประเภทรถ';
                                                              FFAppState()
                                                                      .nonePackageBrandName =
                                                                  'กรุณาเลือกยี่ห้อรถ';
                                                              FFAppState()
                                                                  .nonePackageBrandId = '';
                                                              FFAppState()
                                                                      .nonePackageModelName =
                                                                  'กรุณากรอกรุ่นรถ';
                                                              FFAppState()
                                                                  .nonePackageModelCode = '';
                                                              FFAppState()
                                                                      .nonePackageYear =
                                                                  'กรุณาเลือกปีจดทะเบียน';
                                                              FFAppState()
                                                                  .nonePackageUsedTypeId = '';
                                                              FFAppState()
                                                                  .nonePackageSearchModelList = [];
                                                              FFAppState()
                                                                  .nonePackageUsedTypeCode = '';
                                                              FFAppState()
                                                                      .nonePackageUsedTypeName =
                                                                  'กรุณาเลือกลักษณะการใช้รถ';
                                                              FFAppState()
                                                                      .nonePackageCusFullname =
                                                                  'กรุณากรอกชื่อ';
                                                              FFAppState()
                                                                      .nonePackageCusPhone =
                                                                  'กรุณากรอกเบอร์โทรศัพท์';
                                                              FFAppState()
                                                                  .nonePackagePlate = '';
                                                              FFAppState()
                                                                      .nonePackageProvince =
                                                                  'กรุณาเลือกจังหวัดจดทะเบียน';
                                                              FFAppState()
                                                                  .nonePackageProvinceId = '';
                                                              FFAppState()
                                                                      .nonePackageSumInsured =
                                                                  'กรุณากรอกทุนประกัน';
                                                              FFAppState()
                                                                      .nonePackageFlagAct =
                                                                  true;
                                                              FFAppState()
                                                                      .nonePackageIsBrandSelect =
                                                                  false;
                                                              FFAppState()
                                                                  .nonePackageSearchModelIdList = [];
                                                              FFAppState()
                                                                      .nonePackageCarrierType =
                                                                  'กรุณาเลือกประเภทตู้เหล็ก';
                                                              FFAppState()
                                                                      .nonePackageFlagCoop =
                                                                  false;
                                                              FFAppState()
                                                                      .nonePackageTruckPart =
                                                                  'กรุณาเลือกส่วนของรถบรรทุก';
                                                              FFAppState()
                                                                      .nonePackageCusMembership =
                                                                  'กรุณาเลือกประเภทลูกค้า';
                                                              FFAppState()
                                                                      .nonePackageTruckCurrentPrice =
                                                                  'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                                              FFAppState()
                                                                      .nonePackagePlateAdditional =
                                                                  'กรุณากรอกเลขทะเบียนหางพ่วง';
                                                              FFAppState()
                                                                      .nonePackageTruckCarryPurpose =
                                                                  'กรุณากรอกรถใช้บรรทุกอะไร';
                                                              FFAppState()
                                                                      .nonePackageTrailerSumInsured =
                                                                  'กรุณากรอกทุนประกันหางพ่วง';
                                                              FFAppState()
                                                                  .nonePackageCarrierPrice = '';
                                                              FFAppState()
                                                                  .nonePackageInsurerIdList = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerCodeList = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerShortNameList = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerNameList = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerDisplayName = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerIdOutputList = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerCodeOutputList = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerShortNameOutputList = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerNameOutputList = [];
                                                              FFAppState()
                                                                  .nonePackageReason = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerSelectedList = [];
                                                              FFAppState()
                                                                  .nonePackageCoverTypeId = '';
                                                              FFAppState()
                                                                  .nonePackageCoverTypeCode = '';
                                                              FFAppState()
                                                                      .nonePackageCoverTypeName =
                                                                  'กรุณาเลือกประเภทชั้นประกัน';
                                                              FFAppState()
                                                                  .nonePackageGarageTypeId = '';
                                                              FFAppState()
                                                                      .nonePackageGarageTypeName =
                                                                  'กรุณาเลือกประเภทการซ่อม';
                                                              FFAppState()
                                                                  .nonePackageGarageTypeCode = '';
                                                              FFAppState()
                                                                      .nonePackageFlagRenew =
                                                                  false;
                                                              FFAppState()
                                                                      .nonePackageOldVmiExpDate =
                                                                  'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                                              FFAppState()
                                                                  .nonePackageOldVmi = '';
                                                              FFAppState()
                                                                  .nonePackageOldVmiImageUrl = '';
                                                              FFAppState()
                                                                  .nonePackageIdCardImageUrl = '';
                                                              FFAppState()
                                                                  .nonePackageRenewImageUrlList = [];
                                                              FFAppState()
                                                                  .nonePackageRenewImageCheckList = [];
                                                              FFAppState()
                                                                      .nonePackageOldVmiImageUploadedCheck =
                                                                  false;
                                                              FFAppState()
                                                                      .nonePackageIdCardWatermarkUploadedCheck =
                                                                  false;
                                                              FFAppState()
                                                                      .buttonOrdinary =
                                                                  false;
                                                              FFAppState()
                                                                      .buttonCorporation =
                                                                  false;
                                                              FFAppState()
                                                                  .nonePackageCustomerType = '';
                                                              FFAppState()
                                                                  .nonePackageInsurerDisplayNameOutput = '';
                                                              FFAppState()
                                                                  .nonePackageImageOther = [];
                                                              FFAppState()
                                                                  .nonePackageImageFront = [];
                                                              FFAppState()
                                                                  .nonePackageImageRightFront = [];
                                                              FFAppState()
                                                                  .nonePackageImageRight = [];
                                                              FFAppState()
                                                                  .nonePackageImageRightRear = [];
                                                              FFAppState()
                                                                  .nonePackageImageRear = [];
                                                              FFAppState()
                                                                  .nonePackageImageLeftRear = [];
                                                              FFAppState()
                                                                  .nonePackageImageLeft = [];
                                                              FFAppState()
                                                                  .nonePackageImageLeftFront = [];
                                                              FFAppState()
                                                                  .nonePackageImageRoof = [];
                                                              FFAppState()
                                                                  .nonePackageTrailerImageFront = [];
                                                              FFAppState()
                                                                  .nonePackageTrailerImageRightFront = [];
                                                              FFAppState()
                                                                  .nonePackageTrailerImageRight = [];
                                                              FFAppState()
                                                                  .nonePackageTrailerImageRightRear = [];
                                                              FFAppState()
                                                                  .nonePackageTrailerImageRear = [];
                                                              FFAppState()
                                                                  .nonePackageTrailerImageLeftRear = [];
                                                              FFAppState()
                                                                  .nonePackageTrailerImageLeft = [];
                                                              FFAppState()
                                                                  .nonePackageTrailerImageLeftFront = [];
                                                              FFAppState()
                                                                  .nonePackageInsurerOutputIndex = 0;
                                                              FFAppState()
                                                                  .nonePackageLeadId = '';
                                                              FFAppState()
                                                                  .nonePackageLeadNo = '';
                                                              FFAppState()
                                                                  .nonePackageCarImageUploadedList = [];
                                                              FFAppState()
                                                                  .nonePackageImageOldVmi = [];
                                                              FFAppState()
                                                                  .nonePackageImageCompanyBook = [];
                                                              FFAppState()
                                                                  .nonePackageImageIdCard = [];
                                                              FFAppState()
                                                                  .nonePackageImageBlueBook = [];
                                                              FFAppState()
                                                                      .nonePackageCompanyBookImageUploadedCheck =
                                                                  false;
                                                              FFAppState()
                                                                  .nonePackageCompanyBookImageUrl = '';
                                                              FFAppState()
                                                                  .nonePackageImageFrontUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageRightFrontUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageRightUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageRightRearUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageRearUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageLeftRearUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageLeftUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageLeftFrontUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageRoofUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageTrailerImageFrontUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageTrailerImageRightFrontUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageTrailerImageRightUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageTrailerImageRightRearUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageTrailerImageRearUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageTrailerImageLeftRearUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageTrailerImageLeftUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageTrailerImageLeftFrontUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageBlueBookUploaded = '';
                                                              FFAppState()
                                                                  .nonePackageImageOther1 = '';
                                                              FFAppState()
                                                                  .nonePackageImageOther2 = '';
                                                              FFAppState()
                                                                  .nonePackageImageOther3 = '';
                                                              FFAppState()
                                                                  .nonePackageImageOther4 = '';
                                                              FFAppState()
                                                                  .nonePackageImageOther5 = '';
                                                              FFAppState()
                                                                  .nonePackageImageOtherNameList = [];
                                                              FFAppState()
                                                                  .nonePackageSelectedInsurerShortName = '';
                                                              FFAppState()
                                                                  .nonePackageSelectedInsurerName = '';
                                                              FFAppState()
                                                                  .nonePackageSelectedInsurerShortNameList = [];
                                                              FFAppState()
                                                                  .nonePackageSelectedInsurerNameList = [];
                                                              FFAppState()
                                                                  .nonePackageFlagOldVmi = '';
                                                              FFAppState()
                                                                  .nonePackageWorkType = '';
                                                              FFAppState()
                                                                  .nonePackageRemark = '';
                                                              FFAppState()
                                                                  .nonePackageBranchCode = '';
                                                              FFAppState()
                                                                  .nonePackageBranchName = '';
                                                              FFAppState()
                                                                  .nonePackageInsurerShortNameDupList = [];
                                                            });
                                                            _model.listFromDash =
                                                                await InsuranceRequestListAPIDashBoardCall
                                                                    .call(
                                                              apiUrl: FFAppState()
                                                                  .apiUrlInsuranceAppState,
                                                              token: FFAppState()
                                                                  .accessToken,
                                                              leadId: (InsuranceRequestListAPICall
                                                                      .leadId(
                                                                (_model.getRequestList
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()[
                                                                      listIndex]
                                                                  .toString(),
                                                              list: FFAppState()
                                                                  .typeList,
                                                              mode: 'arunsawad',
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.listFromDash
                                                                        ?.statusCode ??
                                                                    200) ==
                                                                200) {
                                                              if (InsuranceRequestListAPIDashBoardCall
                                                                      .statusLayer2(
                                                                    (_model.listFromDash
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  200) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                      content: Text(
                                                                          '${InsuranceRequestListAPIDashBoardCall.messageLayer2(
                                                                        (_model.listFromDash?.jsonBody ??
                                                                            ''),
                                                                      ).toString()}(${InsuranceRequestListAPIDashBoardCall.statusLayer2(
                                                                        (_model.listFromDash?.jsonBody ??
                                                                            ''),
                                                                      ).toString()})'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
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

                                                              context.pushNamed(
                                                                'MakeInsuranceListPage',
                                                                queryParameters:
                                                                    {
                                                                  'checkTotal':
                                                                      serializeParam(
                                                                    InsuranceRequestListAPIDashBoardCall
                                                                        .waitingInfo(
                                                                      (_model.listFromDash
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                  'list':
                                                                      serializeParam(
                                                                    InsuranceRequestListAPIDashBoardCall
                                                                        .waitingInfoList(
                                                                      (_model.listFromDash
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    ParamType
                                                                        .JSON,
                                                                    true,
                                                                  ),
                                                                  'checkPayment':
                                                                      serializeParam(
                                                                    '0',
                                                                    ParamType
                                                                        .String,
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
                                                                      child:
                                                                          AlertDialog(
                                                                    title: Text(
                                                                        'connection'),
                                                                    content: Text(
                                                                        '${InsuranceRequestListAPIDashBoardCall.messageLayer1(
                                                                      (_model.listFromDash
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString()}(${(_model.listFromDash?.statusCode ?? 200).toString()})'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ));
                                                                },
                                                              );
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                          } else {
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        text: 'ทำประกัน',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 110.0,
                                                          height: 35.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFFD9761A),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans Thai',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                  ),
                                );
                              },
                            ).animateOnPageLoad(
                                animationsMap['listViewOnPageLoadAnimation']!);
                          },
                        ),
                      ),
                    ),
                  ),
                if (InsuranceRequestListAPICall.statusLayer2(
                          (_model.getRequestList?.jsonBody ?? ''),
                        ) ==
                        404
                    ? true
                    : false)
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.sizeOf(context).width * 0.9,
                          minHeight: 100.0,
                          maxWidth: MediaQuery.sizeOf(context).width * 0.95,
                          maxHeight: 100.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            'ไม่พบข้อมูลในระบบ',
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
    );
  }
}
