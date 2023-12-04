import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

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

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
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
  'SetPinCodePage': ParameterData.none(),
  'PinCodePage': ParameterData.none(),
  'SuperAppPage': (data) async => ParameterData(
        allParams: {
          'dailyText': getParameter<String>(data, 'dailyText'),
        },
      ),
  'NotificationDetailPage': ParameterData.none(),
  'MyProfilePage': ParameterData.none(),
  'IntrodutionPage': ParameterData.none(),
  'CheckInsurancePage': ParameterData.none(),
  'Check_1InsurancePage': (data) async => ParameterData(
        allParams: {
          'brandCode': getParameter<String>(data, 'brandCode'),
          'modelCode': getParameter<String>(data, 'modelCode'),
          'year': getParameter<String>(data, 'year'),
          'province': getParameter<String>(data, 'province'),
          'driver': getParameter<String>(data, 'driver'),
          'vehicleUsage': getParameter<String>(data, 'vehicleUsage'),
        },
      ),
  'ListInsurancPage': ParameterData.none(),
  'DetailInsurancePage': (data) async => ParameterData(
        allParams: {
          'fullName': getParameter<String>(data, 'fullName'),
          'coverType': getParameter<String>(data, 'coverType'),
          'garageType': getParameter<String>(data, 'garageType'),
          'grossTotal': getParameter<String>(data, 'grossTotal'),
          'sumInsured': getParameter<String>(data, 'sumInsured'),
          'tppd': getParameter<String>(data, 'tppd'),
          'pa': getParameter<String>(data, 'pa'),
          'actAmount': getParameter<String>(data, 'actAmount'),
          'expiryDate': getParameter<String>(data, 'expiryDate'),
        },
      ),
  'htmlPage': (data) async => ParameterData(
        allParams: {
          'contentHtml': getParameter<String>(data, 'contentHtml'),
        },
      ),
  'WelfareKPICEOPage': ParameterData.none(),
  'LifeInsuranceLicenseCardPage': ParameterData.none(),
  'ChatSearchPage': ParameterData.none(),
  'ChatHomePage': ParameterData.none(),
  'ChattingPage': (data) async => ParameterData(
        allParams: {
          'userBProfileImage': getParameter<String>(data, 'userBProfileImage'),
          'userBDocRef': getParameter<DocumentReference>(data, 'userBDocRef'),
          'userBName': getParameter<String>(data, 'userBName'),
          'userBNickname': getParameter<String>(data, 'userBNickname'),
          'userBEmployeeId': getParameter<String>(data, 'userBEmployeeId'),
        },
      ),
  'InsuranceRequestInsurerPage': ParameterData.none(),
  'InsuranceRequestImagePage': ParameterData.none(),
  'InsuranceRequestBasicPage': ParameterData.none(),
  'InsuranceRequestListPage': ParameterData.none(),
  'InsuranceRequestDashboardPage': (data) async => ParameterData(
        allParams: {
          'jwtToken': getParameter<String>(data, 'jwtToken'),
        },
      ),
  'inboxEmail': ParameterData.none(),
  'SearchInsurancePage': ParameterData.none(),
  'AboutUsPage': ParameterData.none(),
  'ContactUsPage': ParameterData.none(),
  'InsuranceRequestListPageCopy': ParameterData.none(),
  'SelectReasonPage': ParameterData.none(),
  'SelectInsurer': ParameterData.none(),
  'VehicleType': ParameterData.none(),
  'MyAccountPage': ParameterData.none(),
  'SearchableListPage': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'searchLabel': getParameter<String>(data, 'searchLabel'),
          'multiSelect': getParameter<bool>(data, 'multiSelect'),
          'maxSelected': getParameter<int>(data, 'maxSelected'),
          'fromPage': getParameter<String>(data, 'fromPage'),
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
        },
      ),
  'insuranceListPage': (data) async => ParameterData(
        allParams: {},
      ),
  'insuranceInfoPage2': ParameterData.none(),
  'insuranceInfoPage1': (data) async => ParameterData(
        allParams: {
          'quotationId': getParameter<String>(data, 'quotationId'),
          'leadDtailId': getParameter<int>(data, 'leadDtailId'),
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
        },
      ),
  'homepageFollowUp11': ParameterData.none(),
  'homepageFollowUp12': ParameterData.none(),
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
  'Homepage_Request_4_1': ParameterData.none(),
  'Homepage_Request_5_4_1': ParameterData.none(),
  'Homepage_Request_5_4_2': ParameterData.none(),
  'PaywithQRcode': (data) async => ParameterData(
        allParams: {
          'taxId': getParameter<String>(data, 'taxId'),
          'suffix': getParameter<String>(data, 'suffix'),
          'ref1': getParameter<String>(data, 'ref1'),
          'ref2': getParameter<String>(data, 'ref2'),
          'amount': getParameter<String>(data, 'amount'),
        },
      ),
  'insuranceInfoPage5ShowPolicy': (data) async => ParameterData(
        allParams: {
          'vmiDocumentUrl': getParameter<String>(data, 'vmiDocumentUrl'),
        },
      ),
  'Homepage_Request_5_2_3': (data) async => ParameterData(
        allParams: {
          'index': getParameter<int>(data, 'index'),
          'insuranceName': getParameter<String>(data, 'insuranceName'),
          'insuranceType': getParameter<String>(data, 'insuranceType'),
        },
      ),
  'List_out_1': ParameterData.none(),
  'Outofrange_3': ParameterData.none(),
  'Quotation': ParameterData.none(),
  'ComparePrices': ParameterData.none(),
  'NonePackageRenewPage': ParameterData.none(),
  'Search_7_Renew_1': ParameterData.none(),
  'SampleIDcard': ParameterData.none(),
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
        },
      ),
  'Email_1': ParameterData.none(),
  'PackageFilterPage': ParameterData.none(),
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
        },
      ),
  'PaywithBarcode': ParameterData.none(),
  'AddLeadsPage': ParameterData.none(),
  'LoginScreen_1': ParameterData.none(),
  'NonePackageInsurerPage': ParameterData.none(),
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
  'List_out_1_EDIT1Copy': ParameterData.none(),
  'NonePackageEditPage2Copy': ParameterData.none(),
  'ReloadApp': ParameterData.none(),
  'NonePackageBasicImage1Page': ParameterData.none(),
  'NonePackageBasicImage2Page': ParameterData.none(),
  'insuranceInfoPage3_1': ParameterData.none(),
  'SearchBranchPage': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'InsuranceUnSuccessPage': ParameterData.none(),
  'QuotationCopy': (data) async => ParameterData(
        allParams: {},
      ),
  'InsurerInfomationPage': ParameterData.none(),
  'webViewPage': ParameterData.none(),
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
