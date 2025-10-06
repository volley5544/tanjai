import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'insurance_work_select_page_model.dart';
export 'insurance_work_select_page_model.dart';

class InsuranceWorkSelectPageWidget extends StatefulWidget {
  const InsuranceWorkSelectPageWidget({super.key});

  static String routeName = 'InsuranceWorkSelectPage';
  static String routePath = 'InsuranceWorkSelectPage';

  @override
  State<InsuranceWorkSelectPageWidget> createState() =>
      _InsuranceWorkSelectPageWidgetState();
}

class _InsuranceWorkSelectPageWidgetState
    extends State<InsuranceWorkSelectPageWidget> {
  late InsuranceWorkSelectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsuranceWorkSelectPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InsuranceWorkSelectPage'});
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
            title: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content:
                            Text(FFAppState().filterInsurerList.firstOrNull!),
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
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content:
                            Text(FFAppState().filterCoverTypeList.firstOrNull!),
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
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(
                            FFAppState().filterGarageTypeList.firstOrNull!),
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
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(
                            FFAppState().filterInsurerList.length.toString()),
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
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(
                            FFAppState().filterCoverTypeList.length.toString()),
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
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(FFAppState()
                            .filterGarageTypeList
                            .length
                            .toString()),
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
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(FFAppState()
                            .filterInsurerList
                            .contains(FFAppState()
                                .searchSerialName
                                .elementAtOrNull(1))
                            .toString()),
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
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(FFAppState()
                            .filterCoverTypeList
                            .contains(
                                FFAppState().searchCoverType.elementAtOrNull(1))
                            .toString()),
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
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(FFAppState()
                            .filterGarageTypeList
                            .contains(FFAppState()
                                .searchGarageType
                                .elementAtOrNull(1))
                            .toString()),
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
              },
              child: Text(
                'เลือกงานประกัน',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.notoSansThai(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Color(0xFF003063),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: FutureBuilder<List<HideInAppContentRecord>>(
              future: queryHideInAppContentRecordOnce(
                queryBuilder: (hideInAppContentRecord) =>
                    hideInAppContentRecord.where(
                  'content_name',
                  isEqualTo: 'disable_work_weekend',
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
                List<HideInAppContentRecord> columnHideInAppContentRecordList =
                    snapshot.data!;
                final columnHideInAppContentRecord =
                    columnHideInAppContentRecordList.isNotEmpty
                        ? columnHideInAppContentRecordList.first
                        : null;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (false)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.carSide,
                                          color: Color(0xB0FF9936),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      45.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'งานต่ออายุ',
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
                                          fontSize: 16.0,
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
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (columnHideInAppContentRecord!
                                          .isShowContent) {}
                                      FFAppState().nonePackageFlagCarrier =
                                          false;
                                      FFAppState().nonePackageVehicleType =
                                          'กรุณาเลือกประเภทรถ';
                                      FFAppState().nonePackageBrandName =
                                          'กรุณาเลือกยี่ห้อรถ';
                                      FFAppState().nonePackageBrandId = '';
                                      FFAppState().nonePackageModelName =
                                          'กรุณากรอกรุ่นรถ';
                                      FFAppState().nonePackageModelCode = '';
                                      FFAppState().nonePackageYear =
                                          'กรุณาเลือกปีจดทะเบียน';
                                      FFAppState().nonePackageUsedTypeId = '';
                                      FFAppState().nonePackageSearchModelList =
                                          [];
                                      FFAppState().nonePackageUsedTypeCode = '';
                                      FFAppState().nonePackageUsedTypeName =
                                          'กรุณาเลือกลักษณะการใช้รถ';
                                      FFAppState().nonePackageCusFullname =
                                          'กรุณากรอกชื่อ';
                                      FFAppState().nonePackageCusPhone =
                                          'กรุณากรอกเบอร์โทรศัพท์';
                                      FFAppState().nonePackagePlate = '';
                                      FFAppState().nonePackageProvince =
                                          'กรุณาเลือกจังหวัดจดทะเบียน';
                                      FFAppState().nonePackageProvinceId = '';
                                      FFAppState().nonePackageSumInsured =
                                          'กรุณากรอกทุนประกัน';
                                      FFAppState().nonePackageFlagAct = true;
                                      FFAppState().nonePackageIsBrandSelect =
                                          false;
                                      FFAppState()
                                          .nonePackageSearchModelIdList = [];
                                      FFAppState().nonePackageCarrierType =
                                          'กรุณาเลือกประเภทตู้เหล็ก';
                                      FFAppState().nonePackageFlagCoop = false;
                                      FFAppState().nonePackageTruckPart =
                                          'กรุณาเลือกส่วนของรถบรรทุก';
                                      FFAppState().nonePackageCusMembership =
                                          'กรุณาเลือกประเภทลูกค้า';
                                      FFAppState()
                                              .nonePackageTruckCurrentPrice =
                                          'กรุณากรอกราคาซื้อขายปัจจุบัน';
                                      FFAppState().nonePackagePlateAdditional =
                                          'กรุณากรอกเลขทะเบียนหางพ่วง';
                                      FFAppState()
                                              .nonePackageTruckCarryPurpose =
                                          'กรุณากรอกรถใช้บรรทุกอะไร';
                                      FFAppState()
                                              .nonePackageTrailerSumInsured =
                                          'กรุณากรอกทุนประกันหางพ่วง';
                                      FFAppState().nonePackageCarrierPrice = '';
                                      FFAppState().nonePackageInsurerIdList =
                                          [];
                                      FFAppState().nonePackageInsurerCodeList =
                                          [];
                                      FFAppState()
                                          .nonePackageInsurerShortNameList = [];
                                      FFAppState().nonePackageInsurerNameList =
                                          [];
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
                                      FFAppState().nonePackageReason = [];
                                      FFAppState()
                                          .nonePackageInsurerSelectedList = [];
                                      FFAppState().nonePackageCoverTypeId = '';
                                      FFAppState().nonePackageCoverTypeCode =
                                          '';
                                      FFAppState().nonePackageCoverTypeName =
                                          'กรุณาเลือกประเภทชั้นประกัน';
                                      FFAppState().nonePackageGarageTypeId = '';
                                      FFAppState().nonePackageGarageTypeName =
                                          'กรุณาเลือกประเภทการซ่อม';
                                      FFAppState().nonePackageGarageTypeCode =
                                          '';
                                      FFAppState().nonePackageFlagRenew = false;
                                      FFAppState().nonePackageOldVmiExpDate =
                                          'กรุณาเลือกวันที่หมดอายุประกันเดิม';
                                      FFAppState().nonePackageOldVmi = '';
                                      FFAppState().nonePackageOldVmiImageUrl =
                                          '';
                                      FFAppState().nonePackageIdCardImageUrl =
                                          '';
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
                                      FFAppState().buttonOrdinary = false;
                                      FFAppState().buttonCorporation = false;
                                      FFAppState().nonePackageCustomerType = '';
                                      FFAppState()
                                          .nonePackageInsurerDisplayNameOutput = '';
                                      FFAppState().nonePackageImageOther = [];
                                      FFAppState().nonePackageImageFront = [];
                                      FFAppState().nonePackageImageRightFront =
                                          [];
                                      FFAppState().nonePackageImageRight = [];
                                      FFAppState().nonePackageImageRightRear =
                                          [];
                                      FFAppState().nonePackageImageRear = [];
                                      FFAppState().nonePackageImageLeftRear =
                                          [];
                                      FFAppState().nonePackageImageLeft = [];
                                      FFAppState().nonePackageImageLeftFront =
                                          [];
                                      FFAppState().nonePackageImageRoof = [];
                                      FFAppState()
                                          .nonePackageTrailerImageFront = [];
                                      FFAppState()
                                          .nonePackageTrailerImageRightFront = [];
                                      FFAppState()
                                          .nonePackageTrailerImageRight = [];
                                      FFAppState()
                                          .nonePackageTrailerImageRightRear = [];
                                      FFAppState().nonePackageTrailerImageRear =
                                          [];
                                      FFAppState()
                                          .nonePackageTrailerImageLeftRear = [];
                                      FFAppState().nonePackageTrailerImageLeft =
                                          [];
                                      FFAppState()
                                          .nonePackageTrailerImageLeftFront = [];
                                      FFAppState()
                                          .nonePackageInsurerOutputIndex = 0;
                                      FFAppState().nonePackageLeadId = '';
                                      FFAppState().nonePackageLeadNo = '';
                                      FFAppState()
                                          .nonePackageCarImageUploadedList = [];
                                      FFAppState().nonePackageImageOldVmi = [];
                                      FFAppState().nonePackageImageCompanyBook =
                                          [];
                                      FFAppState().nonePackageImageIdCard = [];
                                      FFAppState().nonePackageImageBlueBook =
                                          [];
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
                                      FFAppState().nonePackageImageOther1 = '';
                                      FFAppState().nonePackageImageOther2 = '';
                                      FFAppState().nonePackageImageOther3 = '';
                                      FFAppState().nonePackageImageOther4 = '';
                                      FFAppState().nonePackageImageOther5 = '';
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
                                      FFAppState().nonePackageFlagOldVmi = '';
                                      FFAppState().nonePackageWorkType = '';
                                      FFAppState().nonePackageRemark = '';
                                      FFAppState().nonePackageBranchCode = '';
                                      FFAppState().nonePackageBranchName = '';
                                      FFAppState()
                                          .nonePackageInsurerShortNameDupList = [];
                                      safeSetState(() {});
                                      FFAppState().nonePackageFlagRenew = true;
                                      FFAppState()
                                              .nonePackageOldVmiImageUploadedCheck =
                                          false;
                                      FFAppState()
                                              .nonePackageIdCardWatermarkUploadedCheck =
                                          false;
                                      safeSetState(() {});
                                      FFAppState()
                                          .nonePackageVehicleType = FFAppState()
                                              .searchPackageCheckFilled
                                              .firstOrNull!
                                          ? FFAppState()
                                              .insuranceVehicleTypeDropDown
                                          : FFAppState().nonePackageVehicleType;
                                      FFAppState()
                                          .nonePackageBrandName = FFAppState()
                                              .searchPackageCheckFilled
                                              .elementAtOrNull(1)!
                                          ? FFAppState().insuranceBasicBrandName
                                          : FFAppState().nonePackageBrandName;
                                      FFAppState()
                                          .nonePackageBrandId = FFAppState()
                                              .searchPackageCheckFilled
                                              .elementAtOrNull(1)!
                                          ? FFAppState().insuranceBasicBrandId
                                          : FFAppState().nonePackageBrandId;
                                      FFAppState()
                                          .nonePackageModelName = FFAppState()
                                              .searchPackageCheckFilled
                                              .elementAtOrNull(2)!
                                          ? FFAppState().insuranceBasicModelName
                                          : FFAppState().nonePackageModelName;
                                      FFAppState()
                                          .nonePackageModelCode = FFAppState()
                                              .searchPackageCheckFilled
                                              .elementAtOrNull(2)!
                                          ? FFAppState().insuranceBasicModelId
                                          : FFAppState().nonePackageModelCode;
                                      FFAppState().nonePackageYear =
                                          FFAppState()
                                                  .searchPackageCheckFilled
                                                  .elementAtOrNull(3)!
                                              ? FFAppState().insuranceBasicYear
                                              : FFAppState().nonePackageYear;
                                      FFAppState()
                                          .nonePackageUsedTypeId = FFAppState()
                                              .searchPackageCheckFilled
                                              .elementAtOrNull(4)!
                                          ? FFAppState()
                                              .insuranceBasicVehicleUsedTypeId
                                          : FFAppState().nonePackageUsedTypeId;
                                      FFAppState()
                                          .nonePackageUsedTypeCode = FFAppState()
                                              .searchPackageCheckFilled
                                              .elementAtOrNull(4)!
                                          ? FFAppState()
                                              .insuranceBasicVehicleUsedTypeCode
                                          : FFAppState()
                                              .nonePackageUsedTypeCode;
                                      FFAppState()
                                          .nonePackageUsedTypeName = FFAppState()
                                              .searchPackageCheckFilled
                                              .elementAtOrNull(4)!
                                          ? FFAppState()
                                              .insuranceBasicVehicleUsedTypeName
                                          : FFAppState()
                                              .nonePackageUsedTypeName;
                                      FFAppState().nonePackageIsBrandSelect =
                                          FFAppState()
                                              .searchPackageCheckFilled
                                              .elementAtOrNull(1)!;
                                      FFAppState().nonePackageSearchModelList =
                                          FFAppState()
                                                  .searchPackageCheckFilled
                                                  .elementAtOrNull(1)!
                                              ? FFAppState()
                                                  .insuranceBasicModelNameList
                                              : FFAppState()
                                                  .nonePackageSearchModelList
                                                  .toList()
                                                  .cast<String>();
                                      FFAppState()
                                              .nonePackageSearchModelIdList =
                                          FFAppState()
                                                  .searchPackageCheckFilled
                                                  .elementAtOrNull(1)!
                                              ? FFAppState()
                                                  .insuranceBasicModelIdList
                                              : FFAppState()
                                                  .nonePackageSearchModelIdList
                                                  .toList()
                                                  .cast<String>();
                                      safeSetState(() {});
                                      FFAppState().nonePackageOldVmiExpDate =
                                          FFAppState()
                                              .insuranceBasicOldVmiExpDate;
                                      safeSetState(() {});
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
                                      FFAppState().nonePackageImageOther1 = '';
                                      FFAppState().nonePackageImageOther2 = '';
                                      FFAppState().nonePackageImageOther3 = '';
                                      FFAppState().nonePackageImageOther4 = '';
                                      FFAppState().nonePackageImageOther5 = '';
                                      FFAppState().nonePackageIdCardImageUrl =
                                          '';
                                      FFAppState().nonePackageOldVmiImageUrl =
                                          '';
                                      FFAppState()
                                          .nonePackageCompanyBookImageUrl = '';
                                      safeSetState(() {});

                                      context.pushNamed(
                                        NonePackageRenewPageWidget.routeName,
                                        queryParameters: {
                                          'workType': serializeParam(
                                            'renew',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    text: 'ต่ออายุ',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFEFE2D8),
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
                                            color: Color(0xFFDB771A),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.carSide,
                                        color: Color(0xFF7A848E),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    45.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'งานนอกเรท',
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
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (columnHideInAppContentRecord!
                                        .isShowContent) {}
                                    FFAppState().nonePackageFlagCarrier = false;
                                    FFAppState().nonePackageVehicleType =
                                        'กรุณาเลือกประเภทรถ';
                                    FFAppState().nonePackageBrandName =
                                        'กรุณาเลือกยี่ห้อรถ';
                                    FFAppState().nonePackageBrandId = '';
                                    FFAppState().nonePackageModelName =
                                        'กรุณากรอกรุ่นรถ';
                                    FFAppState().nonePackageModelCode = '';
                                    FFAppState().nonePackageYear =
                                        'กรุณาเลือกปีจดทะเบียน';
                                    FFAppState().nonePackageUsedTypeId = '';
                                    FFAppState().nonePackageSearchModelList =
                                        [];
                                    FFAppState().nonePackageUsedTypeCode = '';
                                    FFAppState().nonePackageUsedTypeName =
                                        'กรุณาเลือกลักษณะการใช้รถ';
                                    FFAppState().nonePackageCusFullname =
                                        'กรุณากรอกชื่อ';
                                    FFAppState().nonePackageCusPhone =
                                        'กรุณากรอกเบอร์โทรศัพท์';
                                    FFAppState().nonePackagePlate = '';
                                    FFAppState().nonePackageProvince =
                                        'กรุณาเลือกจังหวัดจดทะเบียน';
                                    FFAppState().nonePackageProvinceId = '';
                                    FFAppState().nonePackageSumInsured =
                                        'กรุณากรอกทุนประกัน';
                                    FFAppState().nonePackageFlagAct = true;
                                    FFAppState().nonePackageIsBrandSelect =
                                        false;
                                    FFAppState().nonePackageSearchModelIdList =
                                        [];
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
                                    FFAppState().nonePackageInsurerCodeList =
                                        [];
                                    FFAppState()
                                        .nonePackageInsurerShortNameList = [];
                                    FFAppState().nonePackageInsurerNameList =
                                        [];
                                    FFAppState().nonePackageInsurerDisplayName =
                                        [];
                                    FFAppState()
                                        .nonePackageInsurerIdOutputList = [];
                                    FFAppState()
                                        .nonePackageInsurerCodeOutputList = [];
                                    FFAppState()
                                        .nonePackageInsurerShortNameOutputList = [];
                                    FFAppState()
                                        .nonePackageInsurerNameOutputList = [];
                                    FFAppState().nonePackageReason = [];
                                    FFAppState()
                                        .nonePackageInsurerSelectedList = [];
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
                                    FFAppState().nonePackageRenewImageUrlList =
                                        [];
                                    FFAppState()
                                        .nonePackageRenewImageCheckList = [];
                                    FFAppState()
                                            .nonePackageOldVmiImageUploadedCheck =
                                        false;
                                    FFAppState()
                                            .nonePackageIdCardWatermarkUploadedCheck =
                                        false;
                                    FFAppState().buttonOrdinary = false;
                                    FFAppState().buttonCorporation = false;
                                    FFAppState().nonePackageCustomerType = '';
                                    FFAppState()
                                        .nonePackageInsurerDisplayNameOutput = '';
                                    FFAppState().nonePackageImageOther = [];
                                    FFAppState().nonePackageImageFront = [];
                                    FFAppState().nonePackageImageRightFront =
                                        [];
                                    FFAppState().nonePackageImageRight = [];
                                    FFAppState().nonePackageImageRightRear = [];
                                    FFAppState().nonePackageImageRear = [];
                                    FFAppState().nonePackageImageLeftRear = [];
                                    FFAppState().nonePackageImageLeft = [];
                                    FFAppState().nonePackageImageLeftFront = [];
                                    FFAppState().nonePackageImageRoof = [];
                                    FFAppState().nonePackageTrailerImageFront =
                                        [];
                                    FFAppState()
                                        .nonePackageTrailerImageRightFront = [];
                                    FFAppState().nonePackageTrailerImageRight =
                                        [];
                                    FFAppState()
                                        .nonePackageTrailerImageRightRear = [];
                                    FFAppState().nonePackageTrailerImageRear =
                                        [];
                                    FFAppState()
                                        .nonePackageTrailerImageLeftRear = [];
                                    FFAppState().nonePackageTrailerImageLeft =
                                        [];
                                    FFAppState()
                                        .nonePackageTrailerImageLeftFront = [];
                                    FFAppState().nonePackageInsurerOutputIndex =
                                        0;
                                    FFAppState().nonePackageLeadId = '';
                                    FFAppState().nonePackageLeadNo = '';
                                    FFAppState()
                                        .nonePackageCarImageUploadedList = [];
                                    FFAppState().nonePackageImageOldVmi = [];
                                    FFAppState().nonePackageImageCompanyBook =
                                        [];
                                    FFAppState().nonePackageImageIdCard = [];
                                    FFAppState().nonePackageImageBlueBook = [];
                                    FFAppState()
                                            .nonePackageCompanyBookImageUploadedCheck =
                                        false;
                                    FFAppState()
                                        .nonePackageCompanyBookImageUrl = '';
                                    FFAppState().nonePackageImageFrontUploaded =
                                        '';
                                    FFAppState()
                                        .nonePackageImageRightFrontUploaded = '';
                                    FFAppState().nonePackageImageRightUploaded =
                                        '';
                                    FFAppState()
                                        .nonePackageImageRightRearUploaded = '';
                                    FFAppState().nonePackageImageRearUploaded =
                                        '';
                                    FFAppState()
                                        .nonePackageImageLeftRearUploaded = '';
                                    FFAppState().nonePackageImageLeftUploaded =
                                        '';
                                    FFAppState()
                                        .nonePackageImageLeftFrontUploaded = '';
                                    FFAppState().nonePackageImageRoofUploaded =
                                        '';
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
                                    FFAppState().nonePackageImageOther1 = '';
                                    FFAppState().nonePackageImageOther2 = '';
                                    FFAppState().nonePackageImageOther3 = '';
                                    FFAppState().nonePackageImageOther4 = '';
                                    FFAppState().nonePackageImageOther5 = '';
                                    FFAppState().nonePackageImageOtherNameList =
                                        [];
                                    FFAppState()
                                        .nonePackageSelectedInsurerShortName = '';
                                    FFAppState()
                                        .nonePackageSelectedInsurerName = '';
                                    FFAppState()
                                        .nonePackageSelectedInsurerShortNameList = [];
                                    FFAppState()
                                        .nonePackageSelectedInsurerNameList = [];
                                    FFAppState().nonePackageFlagOldVmi = '';
                                    FFAppState().nonePackageWorkType = '';
                                    FFAppState().nonePackageRemark = '';
                                    FFAppState().nonePackageBranchCode = '';
                                    FFAppState().nonePackageBranchName = '';
                                    FFAppState()
                                        .nonePackageInsurerShortNameDupList = [];
                                    safeSetState(() {});
                                    FFAppState().nonePackageFlagRenew = false;
                                    safeSetState(() {});
                                    FFAppState()
                                        .nonePackageVehicleType = FFAppState()
                                            .searchPackageCheckFilled
                                            .firstOrNull!
                                        ? FFAppState()
                                            .insuranceVehicleTypeDropDown
                                        : FFAppState().nonePackageVehicleType;
                                    FFAppState()
                                        .nonePackageBrandName = FFAppState()
                                            .searchPackageCheckFilled
                                            .elementAtOrNull(1)!
                                        ? FFAppState().insuranceBasicBrandName
                                        : FFAppState().nonePackageBrandName;
                                    FFAppState().nonePackageBrandId =
                                        FFAppState()
                                                .searchPackageCheckFilled
                                                .elementAtOrNull(1)!
                                            ? FFAppState().insuranceBasicBrandId
                                            : FFAppState().nonePackageBrandId;
                                    FFAppState()
                                        .nonePackageModelName = FFAppState()
                                            .searchPackageCheckFilled
                                            .elementAtOrNull(2)!
                                        ? FFAppState().insuranceBasicModelName
                                        : FFAppState().nonePackageModelName;
                                    FFAppState().nonePackageModelCode =
                                        FFAppState()
                                                .searchPackageCheckFilled
                                                .elementAtOrNull(2)!
                                            ? FFAppState().insuranceBasicModelId
                                            : FFAppState().nonePackageModelCode;
                                    FFAppState().nonePackageYear = FFAppState()
                                            .searchPackageCheckFilled
                                            .elementAtOrNull(3)!
                                        ? FFAppState().insuranceBasicYear
                                        : FFAppState().nonePackageYear;
                                    FFAppState()
                                        .nonePackageUsedTypeId = FFAppState()
                                            .searchPackageCheckFilled
                                            .elementAtOrNull(4)!
                                        ? FFAppState()
                                            .insuranceBasicVehicleUsedTypeId
                                        : FFAppState().nonePackageUsedTypeId;
                                    FFAppState()
                                        .nonePackageUsedTypeCode = FFAppState()
                                            .searchPackageCheckFilled
                                            .elementAtOrNull(4)!
                                        ? FFAppState()
                                            .insuranceBasicVehicleUsedTypeCode
                                        : FFAppState().nonePackageUsedTypeCode;
                                    FFAppState()
                                        .nonePackageUsedTypeName = FFAppState()
                                            .searchPackageCheckFilled
                                            .elementAtOrNull(4)!
                                        ? FFAppState()
                                            .insuranceBasicVehicleUsedTypeName
                                        : FFAppState().nonePackageUsedTypeName;
                                    FFAppState().nonePackageIsBrandSelect =
                                        FFAppState()
                                            .searchPackageCheckFilled
                                            .elementAtOrNull(1)!;
                                    FFAppState().nonePackageSearchModelList =
                                        FFAppState()
                                                .searchPackageCheckFilled
                                                .elementAtOrNull(1)!
                                            ? FFAppState()
                                                .insuranceBasicModelNameList
                                            : FFAppState()
                                                .nonePackageSearchModelList
                                                .toList()
                                                .cast<String>();
                                    FFAppState().nonePackageSearchModelIdList =
                                        FFAppState()
                                                .searchPackageCheckFilled
                                                .elementAtOrNull(1)!
                                            ? FFAppState()
                                                .insuranceBasicModelIdList
                                            : FFAppState()
                                                .nonePackageSearchModelIdList
                                                .toList()
                                                .cast<String>();
                                    safeSetState(() {});
                                    FFAppState().nonePackageOldVmiExpDate =
                                        FFAppState()
                                            .insuranceBasicOldVmiExpDate;
                                    safeSetState(() {});
                                    FFAppState().nonePackageImageFrontUploaded =
                                        '';
                                    FFAppState()
                                        .nonePackageImageRightFrontUploaded = '';
                                    FFAppState().nonePackageImageRightUploaded =
                                        '';
                                    FFAppState()
                                        .nonePackageImageRightRearUploaded = '';
                                    FFAppState().nonePackageImageRearUploaded =
                                        '';
                                    FFAppState()
                                        .nonePackageImageLeftRearUploaded = '';
                                    FFAppState().nonePackageImageLeftUploaded =
                                        '';
                                    FFAppState()
                                        .nonePackageImageLeftFrontUploaded = '';
                                    FFAppState().nonePackageImageRoofUploaded =
                                        '';
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
                                    FFAppState().nonePackageImageOther1 = '';
                                    FFAppState().nonePackageImageOther2 = '';
                                    FFAppState().nonePackageImageOther3 = '';
                                    FFAppState().nonePackageImageOther4 = '';
                                    FFAppState().nonePackageImageOther5 = '';
                                    FFAppState().nonePackageIdCardImageUrl = '';
                                    FFAppState().nonePackageOldVmiImageUrl = '';
                                    FFAppState()
                                        .nonePackageCompanyBookImageUrl = '';
                                    safeSetState(() {});

                                    context.pushNamed(
                                        SelectReasonPageWidget.routeName);
                                  },
                                  text: 'นอกเรท',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFD9D9D9),
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
                                          color: FlutterFlowTheme.of(context)
                                              .black600,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].addToStart(SizedBox(height: 24.0)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
