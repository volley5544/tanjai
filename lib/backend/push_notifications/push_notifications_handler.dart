import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Homepage_PIN_1.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LoginPage': (data) async => ParameterData(
        allParams: {
          'apiURL': getParameter<DocumentReference>(data, 'apiURL'),
          'token': getParameter<String>(data, 'token'),
        },
      ),
  'SuperAppPage': (data) async => ParameterData(
        allParams: {
          'dailyText': getParameter<String>(data, 'dailyText'),
        },
      ),
  'MyProfilePage': ParameterData.none(),
  'PinCodePage': ParameterData.none(),
  'SetPinCodePage': ParameterData.none(),
  'LifeInsuranceLicenseCardPage': ParameterData.none(),
  'inboxEmail': ParameterData.none(),
  'SearchInsurancePage': (data) async => ParameterData(
        allParams: {
          'fromIcon': getParameter<String>(data, 'fromIcon'),
        },
      ),
  'AboutUsPage': ParameterData.none(),
  'ContactUsPage': ParameterData.none(),
  'SelectReasonPage': ParameterData.none(),
  'MyAccountPage': ParameterData.none(),
  'SearchableListPage': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'multiSelect': getParameter<bool>(data, 'multiSelect'),
          'maxSelected': getParameter<int>(data, 'maxSelected'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'compareInsurancePage': (data) async => ParameterData(
        allParams: {
          'currentDate': getParameter<String>(data, 'currentDate'),
          'brandId': getParameter<String>(data, 'brandId'),
          'brandName': getParameter<String>(data, 'brandName'),
          'modelCode': getParameter<String>(data, 'modelCode'),
          'modelName': getParameter<String>(data, 'modelName'),
          'year': getParameter<String>(data, 'year'),
          'driverType': getParameter<String>(data, 'driverType'),
          'yearProduct': getParameter<String>(data, 'yearProduct'),
          'insurerConfig2': await getDocumentParameter<InsurerConfig2Record>(
              data, 'insurerConfig2', InsurerConfig2Record.fromSnapshot),
          'idCard': getParameter<String>(data, 'idCard'),
        },
      ),
  'insuranceListPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'insuranceInfoPage2': (data) async => ParameterData(
        allParams: {
          'masterDataFirebase': await getDocumentParameter<DataListRecord>(
              data, 'masterDataFirebase', DataListRecord.fromSnapshot),
        },
      ),
  'insuranceInfoPage1': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDtailId': getParameter<int>(data, 'leadDtailId'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'insuranceInfoPage3': ParameterData.none(),
  'insurerListPage': (data) async => ParameterData(
        allParams: {
          'brandCode': getParameter<String>(data, 'brandCode'),
          'modelCode': getParameter<String>(data, 'modelCode'),
          'year': getParameter<String>(data, 'year'),
          'province': getParameter<String>(data, 'province'),
          'vehicleUsage': getParameter<String>(data, 'vehicleUsage'),
          'brandName': getParameter<String>(data, 'brandName'),
          'modelName': getParameter<String>(data, 'modelName'),
          'carTypeDetail': getParameter<String>(data, 'carTypeDetail'),
          'oldVmiExpDate': getParameter<String>(data, 'oldVmiExpDate'),
          'provinceCode': getParameter<String>(data, 'provinceCode'),
          'driver': getParameter<String>(data, 'driver'),
          'idCard': getParameter<String>(data, 'idCard'),
          'customerType': getParameter<String>(data, 'customerType'),
        },
      ),
  'detailsInsurancePage': (data) async => ParameterData(
        allParams: {
          'insurerFullName': getParameter<String>(data, 'insurerFullName'),
          'currentDate': getParameter<String>(data, 'currentDate'),
          'brandId': getParameter<String>(data, 'brandId'),
          'brandName': getParameter<String>(data, 'brandName'),
          'modelCode': getParameter<String>(data, 'modelCode'),
          'modelName': getParameter<String>(data, 'modelName'),
          'year': getParameter<String>(data, 'year'),
          'driverType': getParameter<String>(data, 'driverType'),
          'grossTotal': getParameter<String>(data, 'grossTotal'),
          'sumInsured': getParameter<String>(data, 'sumInsured'),
          'tppd': getParameter<String>(data, 'tppd'),
          'pa': getParameter<String>(data, 'pa'),
          'grossAct': getParameter<String>(data, 'grossAct'),
          'expireDate': getParameter<String>(data, 'expireDate'),
          'coverTypeId': getParameter<String>(data, 'coverTypeId'),
          'coverTypeCode': getParameter<String>(data, 'coverTypeCode'),
          'coverTypeName': getParameter<String>(data, 'coverTypeName'),
          'garageTypeId': getParameter<String>(data, 'garageTypeId'),
          'garageTypeName': getParameter<String>(data, 'garageTypeName'),
          'insurerId': getParameter<String>(data, 'insurerId'),
          'insurerShortName': getParameter<String>(data, 'insurerShortName'),
          'garageTypeCode': getParameter<String>(data, 'garageTypeCode'),
          'tpbiPerson': getParameter<String>(data, 'tpbiPerson'),
          'tpbiAccident': getParameter<String>(data, 'tpbiAccident'),
          'logoUrl': getParameter<String>(data, 'logoUrl'),
          'yearProduct': getParameter<String>(data, 'yearProduct'),
          'accessory': getParameter<String>(data, 'accessory'),
          'productId': getParameter<String>(data, 'productId'),
          'packageId': getParameter<String>(data, 'packageId'),
          'packageName': getParameter<String>(data, 'packageName'),
          'roadsideAssis': getParameter<String>(data, 'roadsideAssis'),
          'flood': getParameter<String>(data, 'flood'),
          'deductible': getParameter<String>(data, 'deductible'),
          'me': getParameter<String>(data, 'me'),
          'bb': getParameter<String>(data, 'bb'),
          'seat': getParameter<String>(data, 'seat'),
          'netPremium': getParameter<String>(data, 'netPremium'),
          'vat': getParameter<String>(data, 'vat'),
          'stamp': getParameter<String>(data, 'stamp'),
          'insurerMaxName': getParameter<String>(data, 'insurerMaxName'),
          'contractProcessstate':
              getParameter<String>(data, 'contractProcessstate'),
          'insurerCondition': getParameter<String>(data, 'insurerCondition'),
          'cc': getParameter<String>(data, 'cc'),
          'insurerConfig': await getDocumentParameter<InsurerConfig2Record>(
              data, 'insurerConfig', InsurerConfig2Record.fromSnapshot),
          'carLost': getParameter<String>(data, 'carLost'),
          'motorAddOn': getParameter<String>(data, 'motorAddOn'),
          'driverBehavior': getParameter<String>(data, 'driverBehavior'),
          'inspectionExcept': getParameter<String>(data, 'inspectionExcept'),
          'grossTotalDiscount':
              getParameter<String>(data, 'grossTotalDiscount'),
          'discountOther': getParameter<String>(data, 'discountOther'),
          'discountPercent': getParameter<String>(data, 'discountPercent'),
          'grossTotalNet': getParameter<String>(data, 'grossTotalNet'),
          'discountFlg': getParameter<String>(data, 'discountFlg'),
          'idCard': getParameter<String>(data, 'idCard'),
        },
      ),
  'NonePackageEditPage1': ParameterData.none(),
  'NonePackageEditPage2': ParameterData.none(),
  'NonePackageEditPage3': ParameterData.none(),
  'InsuranceSuccessPage': ParameterData.none(),
  'NonePackageEditDetailPage': ParameterData.none(),
  'insuranceInfoPage4': ParameterData.none(),
  'insuranceInfoPage5': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDtlId': getParameter<int>(data, 'leadDtlId'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'SuccessPage': ParameterData.none(),
  'AddAddress': ParameterData.none(),
  'LeadFollowUpPage': ParameterData.none(),
  'SearchAddressPage': ParameterData.none(),
  'Homepage_Request_2_1': (data) async => ParameterData(
        allParams: {
          'accessory': getParameter<String>(data, 'accessory'),
        },
      ),
  'Homepage_Request_2_2': ParameterData.none(),
  'Homepage_Request_2_3': ParameterData.none(),
  'Homepage_Request_4_1': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'Homepage_Request_5_4_1': ParameterData.none(),
  'Homepage_Request_5_4_2': ParameterData.none(),
  'PaywithQRcode': (data) async => ParameterData(
        allParams: {
          'taxId': getParameter<String>(data, 'taxId'),
          'suffix': getParameter<String>(data, 'suffix'),
          'ref1': getParameter<String>(data, 'ref1'),
          'ref2': getParameter<String>(data, 'ref2'),
          'amount': getParameter<String>(data, 'amount'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'actCMI': getParameter<bool>(data, 'actCMI'),
        },
      ),
  'insuranceInfoPage5ShowPolicy': (data) async => ParameterData(
        allParams: {
          'vmiDocumentUrl': getParameter<String>(data, 'vmiDocumentUrl'),
        },
      ),
  'Outofrange_3': ParameterData.none(),
  'Quotation': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'ComparePrices': ParameterData.none(),
  'NonePackageRenewPage': (data) async => ParameterData(
        allParams: {
          'workType': getParameter<String>(data, 'workType'),
          'bodynumber': getParameter<String>(data, 'bodynumber'),
          'effectivedate': getParameter<DateTime>(data, 'effectivedate'),
        },
      ),
  'Search_7_Renew_1': ParameterData.none(),
  'SampleIDcard': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
          'imageUrl': getParameter<String>(data, 'imageUrl'),
        },
      ),
  'NonePackageBasicPage': (data) async => ParameterData(
        allParams: {
          'branchCode': getParameter<String>(data, 'branchCode'),
          'carType': getParameter<String>(data, 'carType'),
          'truckPart': getParameter<String>(data, 'truckPart'),
          'cusMembership': getParameter<String>(data, 'cusMembership'),
          'carrierPurpose': getParameter<String>(data, 'carrierPurpose'),
          'truckCurrentPrice': getParameter<String>(data, 'truckCurrentPrice'),
          'carrierFlag': getParameter<bool>(data, 'carrierFlag'),
          'coopFlag': getParameter<bool>(data, 'coopFlag'),
          'carrierType': getParameter<String>(data, 'carrierType'),
          'carrierPrice': getParameter<String>(data, 'carrierPrice'),
          'brandName': getParameter<String>(data, 'brandName'),
          'brandId': getParameter<String>(data, 'brandId'),
          'modelName': getParameter<String>(data, 'modelName'),
          'modelId': getParameter<String>(data, 'modelId'),
          'year': getParameter<String>(data, 'year'),
          'vehicleUsedName': getParameter<String>(data, 'vehicleUsedName'),
          'vehicleUsedId': getParameter<String>(data, 'vehicleUsedId'),
          'vehicleUsedCode': getParameter<String>(data, 'vehicleUsedCode'),
          'coverTypeName': getParameter<String>(data, 'coverTypeName'),
          'coverTypeCode': getParameter<String>(data, 'coverTypeCode'),
          'coverTypeId': getParameter<String>(data, 'coverTypeId'),
          'garageTypeName': getParameter<String>(data, 'garageTypeName'),
          'garageTypeCode': getParameter<String>(data, 'garageTypeCode'),
          'garageTypeId': getParameter<String>(data, 'garageTypeId'),
          'cusName': getParameter<String>(data, 'cusName'),
          'cusPhone': getParameter<String>(data, 'cusPhone'),
          'plate': getParameter<String>(data, 'plate'),
          'plateAdditional': getParameter<String>(data, 'plateAdditional'),
          'provinceName': getParameter<String>(data, 'provinceName'),
          'provinceCode': getParameter<String>(data, 'provinceCode'),
          'sumInsured': getParameter<String>(data, 'sumInsured'),
          'trailerSumInsured': getParameter<String>(data, 'trailerSumInsured'),
          'remark': getParameter<String>(data, 'remark'),
          'actFlag': getParameter<bool>(data, 'actFlag'),
          'oldVmi': getParameter<String>(data, 'oldVmi'),
          'oldVmiExpireDate': getParameter<String>(data, 'oldVmiExpireDate'),
          'workType': getParameter<String>(data, 'workType'),
          'yearChrist': getParameter<String>(data, 'yearChrist'),
        },
      ),
  'Email_1': ParameterData.none(),
  'PackageFilterPage': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'InsuranceWorkSelectPage': ParameterData.none(),
  'MakeInsuranceListPage': (data) async => ParameterData(
        allParams: {
          'checkTotal': getParameter<int>(data, 'checkTotal'),
          'checkPayment': getParameter<String>(data, 'checkPayment'),
          'checkVMI': getParameter<String>(data, 'checkVMI'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'AddCustomerName': (data) async => ParameterData(
        allParams: {
          'carType': getParameter<String>(data, 'carType'),
          'driverType': getParameter<String>(data, 'driverType'),
          'carRegistrationYear':
              getParameter<String>(data, 'carRegistrationYear'),
          'carBrandId': getParameter<String>(data, 'carBrandId'),
          'carBrandName': getParameter<String>(data, 'carBrandName'),
          'carModelName': getParameter<String>(data, 'carModelName'),
          'carModelId': getParameter<String>(data, 'carModelId'),
          'vehicleId': getParameter<String>(data, 'vehicleId'),
          'vehicleCode': getParameter<String>(data, 'vehicleCode'),
          'vehicleName': getParameter<String>(data, 'vehicleName'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'fromBtn': getParameter<String>(data, 'fromBtn'),
          'indexPage': getParameter<int>(data, 'indexPage'),
          'oldVMIExpDate': getParameter<String>(data, 'oldVMIExpDate'),
          'idCard': getParameter<String>(data, 'idCard'),
        },
      ),
  'NonePackageSelectedInsurerPage': (data) async => ParameterData(
        allParams: {
          'leadID': getParameter<String>(data, 'leadID'),
          'coverTypeName': getParameter<String>(data, 'coverTypeName'),
          'garageTypeName': getParameter<String>(data, 'garageTypeName'),
          'insurerShortName': getParameter<String>(data, 'insurerShortName'),
          'insurerName': getParameter<String>(data, 'insurerName'),
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDtlId': getParameter<int>(data, 'leadDtlId'),
          'actFlag': getParameter<bool>(data, 'actFlag'),
          'masterActAmount': getParameter<String>(data, 'masterActAmount'),
          'discountflg': getParameter<String>(data, 'discountflg'),
          'discountpercent': getParameter<String>(data, 'discountpercent'),
        },
      ),
  'PaywithBarcode': ParameterData.none(),
  'AddLeadsPage': ParameterData.none(),
  'LoginScreen_1': ParameterData.none(),
  'NonePackageInsurerPage': (data) async => ParameterData(
        allParams: {
          'workType': getParameter<String>(data, 'workType'),
          'driverFlag': getParameter<bool>(data, 'driverFlag'),
        },
      ),
  'insuranceInfoPage5Cancel': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDtlId': getParameter<int>(data, 'leadDtlId'),
        },
      ),
  'insuranceInfoPage4_2': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDetailId': getParameter<int>(data, 'leadDetailId'),
        },
      ),
  'insuranceInfoPage4_installments': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'multiSelect': getParameter<bool>(data, 'multiSelect'),
          'maxSelected': getParameter<int>(data, 'maxSelected'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'uploadImgPage': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'NonePackageEditPage2Copy': ParameterData.none(),
  'NonePackageBasicImage1Page': (data) async => ParameterData(
        allParams: {
          'workType': getParameter<String>(data, 'workType'),
          'driverFlag': getParameter<bool>(data, 'driverFlag'),
        },
      ),
  'NonePackageBasicImage2Page': (data) async => ParameterData(
        allParams: {
          'workType': getParameter<String>(data, 'workType'),
          'driverFlag': getParameter<bool>(data, 'driverFlag'),
        },
      ),
  'insuranceInfoPage3_1': ParameterData.none(),
  'SearchBranchPage': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'InsuranceUnSuccessPage': ParameterData.none(),
  'QuotationCopy': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'InsurerInfomationPage': ParameterData.none(),
  'webViewPromotionPage': ParameterData.none(),
  'NotificationIBS': ParameterData.none(),
  'SearchableCarListPage': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'multiSelect': getParameter<bool>(data, 'multiSelect'),
          'maxSelected': getParameter<int>(data, 'maxSelected'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'SearchablePickUpListPage': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'multiSelect': getParameter<bool>(data, 'multiSelect'),
          'maxSelected': getParameter<int>(data, 'maxSelected'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'renewHistory': (data) async => ParameterData(
        allParams: {
          'refRenewId': getParameter<String>(data, 'refRenewId'),
        },
      ),
  'MakeInsuranceListPageSearch': (data) async => ParameterData(
        allParams: {
          'checkTotal': getParameter<int>(data, 'checkTotal'),
          'checkPayment': getParameter<String>(data, 'checkPayment'),
          'checkVMI': getParameter<String>(data, 'checkVMI'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'type': getParameter<String>(data, 'type'),
          'carRegistration': getParameter<String>(data, 'carRegistration'),
        },
      ),
  'renewDetailPage': (data) async => ParameterData(
        allParams: {
          'refRenewId': getParameter<String>(data, 'refRenewId'),
        },
      ),
  'RenewBasicInfoPage': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDetailId': getParameter<int>(data, 'leadDetailId'),
        },
      ),
  'renewSearchAllPoolPage': ParameterData.none(),
  'renewSaveHistory': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'name': getParameter<String>(data, 'name'),
          'lastname': getParameter<String>(data, 'lastname'),
          'brand': getParameter<String>(data, 'brand'),
          'model': getParameter<String>(data, 'model'),
          'covertype': getParameter<String>(data, 'covertype'),
          'garagetype': getParameter<String>(data, 'garagetype'),
          'expDate': getParameter<String>(data, 'expDate'),
          'status': getParameter<String>(data, 'status'),
          'refRenewId': getParameter<String>(data, 'refRenewId'),
          'carregis': getParameter<String>(data, 'carregis'),
        },
      ),
  'SellingAct': ParameterData.none(),
  'InformationAct': ParameterData.none(),
  'InformationCustomer': ParameterData.none(),
  'informationCustomer2': (data) async => ParameterData(
        allParams: {
          'bodyNumber': getParameter<String>(data, 'bodyNumber'),
          'effectiveDateAct': getParameter<DateTime>(data, 'effectiveDateAct'),
        },
      ),
  'webViewPolicy': ParameterData.none(),
  'SearchInsurancePageCopy': (data) async => ParameterData(
        allParams: {
          'fromIcon': getParameter<String>(data, 'fromIcon'),
        },
      ),
  'forDupeUi': ParameterData.none(),
  'AddDriverPage': (data) async => ParameterData(
        allParams: {
          'firestoreDataConfigList': await getDocumentParameter<DataListRecord>(
              data, 'firestoreDataConfigList', DataListRecord.fromSnapshot),
          'index': getParameter<int>(data, 'index'),
          'isEditing': getParameter<bool>(data, 'isEditing'),
        },
      ),
  'ShowDriverPage': (data) async => ParameterData(
        allParams: {
          'firestoreDataConfigList': await getDocumentParameter<DataListRecord>(
              data, 'firestoreDataConfigList', DataListRecord.fromSnapshot),
        },
      ),
  'GeminiPage': ParameterData.none(),
  'SelectOrdinary': ParameterData.none(),
  'testPage': ParameterData.none(),
  'insurerListOverallPage': (data) async => ParameterData(
        allParams: {
          'brandCode': getParameter<String>(data, 'brandCode'),
          'modelCode': getParameter<String>(data, 'modelCode'),
          'year': getParameter<String>(data, 'year'),
          'province': getParameter<String>(data, 'province'),
          'vehicleUsage': getParameter<String>(data, 'vehicleUsage'),
          'brandName': getParameter<String>(data, 'brandName'),
          'modelName': getParameter<String>(data, 'modelName'),
          'carTypeDetail': getParameter<String>(data, 'carTypeDetail'),
          'oldVmiExpDate': getParameter<String>(data, 'oldVmiExpDate'),
          'provinceCode': getParameter<String>(data, 'provinceCode'),
          'driverFlag': getParameter<String>(data, 'driverFlag'),
          'idCard': getParameter<String>(data, 'idCard'),
          'customerType': getParameter<String>(data, 'customerType'),
        },
      ),
  'SearchableHouseList': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'multiSelect': getParameter<bool>(data, 'multiSelect'),
          'maxSelected': getParameter<int>(data, 'maxSelected'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'fireInsurerListAll': (data) async => ParameterData(
        allParams: {
          'brandCode': getParameter<String>(data, 'brandCode'),
          'modelCode': getParameter<String>(data, 'modelCode'),
          'year': getParameter<String>(data, 'year'),
          'province': getParameter<String>(data, 'province'),
          'vehicleUsage': getParameter<String>(data, 'vehicleUsage'),
          'brandName': getParameter<String>(data, 'brandName'),
          'modelName': getParameter<String>(data, 'modelName'),
          'carTypeDetail': getParameter<String>(data, 'carTypeDetail'),
          'oldVmiExpDate': getParameter<String>(data, 'oldVmiExpDate'),
          'provinceCode': getParameter<String>(data, 'provinceCode'),
        },
      ),
  'fireInsurerListPage': (data) async => ParameterData(
        allParams: {
          'yearMin': getParameter<String>(data, 'yearMin'),
          'yearMax': getParameter<String>(data, 'yearMax'),
          'sumInsured': getParameter<String>(data, 'sumInsured'),
          'sumInsureHouse': getParameter<String>(data, 'sumInsureHouse'),
          'sumInsureBuilding': getParameter<String>(data, 'sumInsureBuilding'),
          'sumInsureOther': getParameter<String>(data, 'sumInsureOther'),
        },
      ),
  'SearchPackageFireInsurancePage': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
        },
      ),
  'fireInsuranceListPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'MakeFireInsuranceListPage': (data) async => ParameterData(
        allParams: {
          'checkTotal': getParameter<int>(data, 'checkTotal'),
          'checkPayment': getParameter<String>(data, 'checkPayment'),
          'checkVMI': getParameter<String>(data, 'checkVMI'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'fireLeadFollowUpPage': ParameterData.none(),
  'detailsFireInsurancePage': (data) async => ParameterData(
        allParams: {
          'sumInsureHouse': getParameter<String>(data, 'sumInsureHouse'),
          'sumInsureBuildin': getParameter<String>(data, 'sumInsureBuildin'),
        },
      ),
  'AddFireCustomerName': (data) async => ParameterData(
        allParams: {
          'button': getParameter<String>(data, 'button'),
        },
      ),
  'FireSearchableListPage': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'multiSelect': getParameter<bool>(data, 'multiSelect'),
          'maxSelected': getParameter<int>(data, 'maxSelected'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'fireInsuranceInfoPage1': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDtailId': getParameter<int>(data, 'leadDtailId'),
        },
      ),
  'fireInsuranceInfoPage2': (data) async => ParameterData(
        allParams: {
          'masterDataFirebase': await getDocumentParameter<DataListRecord>(
              data, 'masterDataFirebase', DataListRecord.fromSnapshot),
        },
      ),
  'fireInsuranceInfoPage3': ParameterData.none(),
  'fireInsuranceInfoPage4': ParameterData.none(),
  'fireInsuranceInfoPage4_2': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDetailId': getParameter<int>(data, 'leadDetailId'),
        },
      ),
  'fireInsuranceInfoPage4_installments': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'multiSelect': getParameter<bool>(data, 'multiSelect'),
          'maxSelected': getParameter<int>(data, 'maxSelected'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'fireInsuranceInfoPage5': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDtlId': getParameter<int>(data, 'leadDtlId'),
        },
      ),
  'fireInsuranceInfoPage5ShowPolicy': (data) async => ParameterData(
        allParams: {
          'vmiDocumentUrl': getParameter<String>(data, 'vmiDocumentUrl'),
        },
      ),
  'fireInsuranceInfoPage5Cancel': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDtlId': getParameter<int>(data, 'leadDtlId'),
        },
      ),
  'firePaywithQRcode': (data) async => ParameterData(
        allParams: {
          'taxId': getParameter<String>(data, 'taxId'),
          'suffix': getParameter<String>(data, 'suffix'),
          'ref1': getParameter<String>(data, 'ref1'),
          'ref2': getParameter<String>(data, 'ref2'),
          'amount': getParameter<String>(data, 'amount'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'actCMI': getParameter<bool>(data, 'actCMI'),
        },
      ),
  'FireQuotationPage': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'WebviewPage': (data) async => ParameterData(
        allParams: {
          'webUrl': getParameter<String>(data, 'webUrl'),
        },
      ),
  'addPeopleFireInsurancePage': (data) async => ParameterData(
        allParams: {
          'firestoreDataConfigList': await getDocumentParameter<DataListRecord>(
              data, 'firestoreDataConfigList', DataListRecord.fromSnapshot),
          'index': getParameter<int>(data, 'index'),
          'isEditing': getParameter<bool>(data, 'isEditing'),
        },
      ),
  'showPeoplePage': (data) async => ParameterData(
        allParams: {
          'firestoreDataConfigList': await getDocumentParameter<DataListRecord>(
              data, 'firestoreDataConfigList', DataListRecord.fromSnapshot),
          'maxPeople': getParameter<String>(data, 'maxPeople'),
        },
      ),
  'FireQuotationCopy': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'uploadImgFireInsurerPage': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'WebviewNewPage': (data) async => ParameterData(
        allParams: {
          'webUrl': getParameter<String>(data, 'webUrl'),
        },
      ),
  'SearchableDriverBehaviorListPage': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'multiSelect': getParameter<bool>(data, 'multiSelect'),
          'maxSelected': getParameter<int>(data, 'maxSelected'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'AddBatteryPage': (data) async => ParameterData(
        allParams: {
          'firestoreDataConfigList': await getDocumentParameter<DataListRecord>(
              data, 'firestoreDataConfigList', DataListRecord.fromSnapshot),
          'index': getParameter<int>(data, 'index'),
          'isEditing': getParameter<bool>(data, 'isEditing'),
        },
      ),
  'ShowBatterryPage': (data) async => ParameterData(
        allParams: {
          'firestoreDataConfigList': await getDocumentParameter<DataListRecord>(
              data, 'firestoreDataConfigList', DataListRecord.fromSnapshot),
        },
      ),
  'AddMotorPage': ParameterData.none(),
  'RenewBasicInfoPage2': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDetailId': getParameter<int>(data, 'leadDetailId'),
        },
      ),
  'renewDetailPage2': (data) async => ParameterData(
        allParams: {
          'refRenewId': getParameter<String>(data, 'refRenewId'),
        },
      ),
  'renewHistory2': (data) async => ParameterData(
        allParams: {
          'refRenewId': getParameter<String>(data, 'refRenewId'),
        },
      ),
  'renewSaveHistory2': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'name': getParameter<String>(data, 'name'),
          'lastname': getParameter<String>(data, 'lastname'),
          'brand': getParameter<String>(data, 'brand'),
          'model': getParameter<String>(data, 'model'),
          'covertype': getParameter<String>(data, 'covertype'),
          'garagetype': getParameter<String>(data, 'garagetype'),
          'expDate': getParameter<String>(data, 'expDate'),
          'status': getParameter<String>(data, 'status'),
          'refRenewId': getParameter<String>(data, 'refRenewId'),
          'carregis': getParameter<String>(data, 'carregis'),
        },
      ),
  'renewSearchAllPoolPage2': ParameterData.none(),
  'insurerListOverallRenewPage': (data) async => ParameterData(
        allParams: {
          'refRenewId': getParameter<String>(data, 'refRenewId'),
        },
      ),
  'insurerListRenewPage': (data) async => ParameterData(
        allParams: {
          'refRenewId': getParameter<String>(data, 'refRenewId'),
        },
      ),
  'PackageFilterPageRenew': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
