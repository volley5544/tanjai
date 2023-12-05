import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'LoginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(
                apiURL: params.getParam('apiURL', ParamType.DocumentReference,
                    false, ['Key_Storage']),
                token: params.getParam('token', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SetPinCodePage',
              path: 'setPinCodePage',
              builder: (context, params) => SetPinCodePageWidget(),
            ),
            FFRoute(
              name: 'PinCodePage',
              path: 'pinCodePage',
              builder: (context, params) => PinCodePageWidget(),
            ),
            FFRoute(
              name: 'SuperAppPage',
              path: 'superAppPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'SuperAppPage')
                  : SuperAppPageWidget(
                      dailyText: params.getParam('dailyText', ParamType.String),
                    ),
            ),
            FFRoute(
              name: 'NotificationDetailPage',
              path: 'notificationDetailPage',
              builder: (context, params) => NotificationDetailPageWidget(),
            ),
            FFRoute(
              name: 'MyProfilePage',
              path: 'myProfilePage',
              builder: (context, params) => MyProfilePageWidget(),
            ),
            FFRoute(
              name: 'IntrodutionPage',
              path: 'introdutionPage',
              builder: (context, params) => IntrodutionPageWidget(),
            ),
            FFRoute(
              name: 'CheckInsurancePage',
              path: 'checkInsurancePage',
              builder: (context, params) => CheckInsurancePageWidget(),
            ),
            FFRoute(
              name: 'Check_1InsurancePage',
              path: 'check1InsurancePage',
              builder: (context, params) => Check1InsurancePageWidget(
                brandCode: params.getParam('brandCode', ParamType.String),
                modelCode: params.getParam('modelCode', ParamType.String),
                year: params.getParam('year', ParamType.String),
                province: params.getParam('province', ParamType.String),
                driver: params.getParam('driver', ParamType.String),
                vehicleUsage: params.getParam('vehicleUsage', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ListInsurancPage',
              path: 'listInsurancPage',
              builder: (context, params) => ListInsurancPageWidget(),
            ),
            FFRoute(
              name: 'DetailInsurancePage',
              path: 'detailInsurancePage',
              builder: (context, params) => DetailInsurancePageWidget(
                fullName: params.getParam('fullName', ParamType.String),
                coverType: params.getParam('coverType', ParamType.String),
                garageType: params.getParam('garageType', ParamType.String),
                grossTotal: params.getParam('grossTotal', ParamType.String),
                sumInsured: params.getParam('sumInsured', ParamType.String),
                tppd: params.getParam('tppd', ParamType.String),
                pa: params.getParam('pa', ParamType.String),
                actAmount: params.getParam('actAmount', ParamType.String),
                expiryDate: params.getParam('expiryDate', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'htmlPage',
              path: 'htmlPage',
              builder: (context, params) => HtmlPageWidget(
                contentHtml: params.getParam('contentHtml', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'WelfareKPICEOPage',
              path: 'welfareKPICEOPage',
              builder: (context, params) => WelfareKPICEOPageWidget(),
            ),
            FFRoute(
              name: 'LifeInsuranceLicenseCardPage',
              path: 'lifeInsuranceLicenseCardPage',
              builder: (context, params) =>
                  LifeInsuranceLicenseCardPageWidget(),
            ),
            FFRoute(
              name: 'ChatSearchPage',
              path: 'chatSearchPage',
              builder: (context, params) => ChatSearchPageWidget(),
            ),
            FFRoute(
              name: 'ChatHomePage',
              path: 'chatHomePage',
              builder: (context, params) => ChatHomePageWidget(),
            ),
            FFRoute(
              name: 'ChattingPage',
              path: 'chattingPage',
              builder: (context, params) => ChattingPageWidget(
                userBProfileImage:
                    params.getParam('userBProfileImage', ParamType.String),
                userBDocRef: params.getParam('userBDocRef',
                    ParamType.DocumentReference, false, ['user_custom']),
                userBName: params.getParam('userBName', ParamType.String),
                userBNickname:
                    params.getParam('userBNickname', ParamType.String),
                userBEmployeeId:
                    params.getParam('userBEmployeeId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'InsuranceRequestInsurerPage',
              path: 'InsuranceRequestPageCopy',
              builder: (context, params) => InsuranceRequestInsurerPageWidget(),
            ),
            FFRoute(
              name: 'InsuranceRequestImagePage',
              path: 'InsuranceRequestImagePage',
              builder: (context, params) => InsuranceRequestImagePageWidget(),
            ),
            FFRoute(
              name: 'InsuranceRequestBasicPage',
              path: 'InsuranceRequestBasicPage',
              builder: (context, params) => InsuranceRequestBasicPageWidget(),
            ),
            FFRoute(
              name: 'InsuranceRequestListPage',
              path: 'InsuranceRequestListPage',
              builder: (context, params) => InsuranceRequestListPageWidget(),
            ),
            FFRoute(
              name: 'InsuranceRequestDashboardPage',
              path: 'insuranceRequestDashboardPage',
              builder: (context, params) => InsuranceRequestDashboardPageWidget(
                jwtToken: params.getParam('jwtToken', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'inboxEmail',
              path: 'inboxEmail',
              builder: (context, params) => InboxEmailWidget(),
            ),
            FFRoute(
              name: 'SearchInsurancePage',
              path: 'searchInsurancePage',
              builder: (context, params) => SearchInsurancePageWidget(),
            ),
            FFRoute(
              name: 'AboutUsPage',
              path: 'aboutUsPage',
              builder: (context, params) => AboutUsPageWidget(),
            ),
            FFRoute(
              name: 'ContactUsPage',
              path: 'ContactUsPage',
              builder: (context, params) => ContactUsPageWidget(),
            ),
            FFRoute(
              name: 'InsuranceRequestListPageCopy',
              path: 'InsuranceRequestListPageCopy',
              builder: (context, params) =>
                  InsuranceRequestListPageCopyWidget(),
            ),
            FFRoute(
              name: 'SelectReasonPage',
              path: 'selectReasonPage',
              builder: (context, params) => SelectReasonPageWidget(),
            ),
            FFRoute(
              name: 'SelectInsurer',
              path: 'selectInsurer',
              builder: (context, params) => SelectInsurerWidget(),
            ),
            FFRoute(
              name: 'VehicleType',
              path: 'vehicleType',
              builder: (context, params) => VehicleTypeWidget(),
            ),
            FFRoute(
              name: 'MyAccountPage',
              path: 'myAccountPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MyAccountPage')
                  : MyAccountPageWidget(),
            ),
            FFRoute(
              name: 'SearchableListPage',
              path: 'SearchableListPage',
              builder: (context, params) => SearchableListPageWidget(
                titleText: params.getParam('titleText', ParamType.String),
                searchLabel: params.getParam('searchLabel', ParamType.String),
                dataList:
                    params.getParam<String>('dataList', ParamType.String, true),
                multiSelect: params.getParam('multiSelect', ParamType.bool),
                maxSelected: params.getParam('maxSelected', ParamType.int),
                fromPage: params.getParam('fromPage', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'compareInsurancePage',
              path: 'compareInsurancePage',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CompareInsurancePageWidget(
                  insurerFullName: params.getParam<String>(
                      'insurerFullName', ParamType.String, true),
                  currentDate: params.getParam('currentDate', ParamType.String),
                  brandId: params.getParam('brandId', ParamType.String),
                  brandName: params.getParam('brandName', ParamType.String),
                  modelCode: params.getParam('modelCode', ParamType.String),
                  modelName: params.getParam('modelName', ParamType.String),
                  year: params.getParam('year', ParamType.String),
                  driverType: params.getParam('driverType', ParamType.String),
                  grossTotal: params.getParam<String>(
                      'grossTotal', ParamType.String, true),
                  sumInsured: params.getParam<String>(
                      'sumInsured', ParamType.String, true),
                  tpbiPerson: params.getParam<String>(
                      'tpbiPerson', ParamType.String, true),
                  tpbiAccident: params.getParam<String>(
                      'tpbiAccident', ParamType.String, true),
                  grossAct: params.getParam<String>(
                      'grossAct', ParamType.String, true),
                  expireDate: params.getParam<String>(
                      'expireDate', ParamType.String, true),
                  coverTypeId: params.getParam<String>(
                      'coverTypeId', ParamType.String, true),
                  coverTypeCode: params.getParam<String>(
                      'coverTypeCode', ParamType.String, true),
                  coverTypeName: params.getParam<String>(
                      'coverTypeName', ParamType.String, true),
                  garageTypeId: params.getParam<String>(
                      'garageTypeId', ParamType.String, true),
                  garageTypeName: params.getParam<String>(
                      'garageTypeName', ParamType.String, true),
                  insurerId: params.getParam<String>(
                      'insurerId', ParamType.String, true),
                  insurerShortName: params.getParam<String>(
                      'insurerShortName', ParamType.String, true),
                  garageTypeCode: params.getParam<String>(
                      'garageTypeCode', ParamType.String, true),
                  insurerLogoUrl: params.getParam<String>(
                      'insurerLogoUrl', ParamType.String, true),
                  yearProduct: params.getParam('yearProduct', ParamType.String),
                  accessory: params.getParam<String>(
                      'accessory', ParamType.String, true),
                  pa: params.getParam<String>('pa', ParamType.String, true),
                  productId: params.getParam<String>(
                      'productId', ParamType.String, true),
                  packageId: params.getParam<String>(
                      'packageId', ParamType.String, true),
                  packageName: params.getParam<String>(
                      'packageName', ParamType.String, true),
                  roadsideAssis: params.getParam<String>(
                      'roadsideAssis', ParamType.String, true),
                  flood:
                      params.getParam<String>('flood', ParamType.String, true),
                  deductible: params.getParam<String>(
                      'deductible', ParamType.String, true),
                  me: params.getParam<String>('me', ParamType.String, true),
                  bb: params.getParam<String>('bb', ParamType.String, true),
                  seat: params.getParam<String>('seat', ParamType.String, true),
                  netPremium: params.getParam<String>(
                      'netPremium', ParamType.String, true),
                  vat: params.getParam<String>('vat', ParamType.String, true),
                  stamp:
                      params.getParam<String>('stamp', ParamType.String, true),
                  insurerMaxName: params.getParam<String>(
                      'insurerMaxName', ParamType.String, true),
                  tppd: params.getParam<String>('tppd', ParamType.String, true),
                  contractProcessstate: params.getParam<String>(
                      'contractProcessstate', ParamType.String, true),
                ),
              ),
            ),
            FFRoute(
              name: 'insuranceListPage',
              path: 'insuranceListPage',
              builder: (context, params) => InsuranceListPageWidget(
                checkType: params.getParam('checkType', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'insuranceInfoPage2',
              path: 'insuranceInfoPage2',
              builder: (context, params) => InsuranceInfoPage2Widget(),
            ),
            FFRoute(
              name: 'insuranceInfoPage1',
              path: 'insuranceInfoPage1',
              builder: (context, params) => InsuranceInfoPage1Widget(
                quotationId: params.getParam('quotationId', ParamType.String),
                leadDtailId: params.getParam('leadDtailId', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'insuranceInfoPage3',
              path: 'insuranceInfoPage3',
              builder: (context, params) => InsuranceInfoPage3Widget(),
            ),
            FFRoute(
              name: 'insurerListPage',
              path: 'insurerListPage',
              builder: (context, params) => InsurerListPageWidget(
                brandCode: params.getParam('brandCode', ParamType.String),
                modelCode: params.getParam('modelCode', ParamType.String),
                year: params.getParam('year', ParamType.String),
                province: params.getParam('province', ParamType.String),
                vehicleUsage: params.getParam('vehicleUsage', ParamType.String),
                coverType: params.getParam<String>(
                    'coverType', ParamType.String, true),
                garageType: params.getParam<String>(
                    'garageType', ParamType.String, true),
                brandName: params.getParam('brandName', ParamType.String),
                modelName: params.getParam('modelName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'detailsInsurancePage',
              path: 'detailsInsurancePage',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: DetailsInsurancePageWidget(
                  insurerFullName:
                      params.getParam('insurerFullName', ParamType.String),
                  currentDate: params.getParam('currentDate', ParamType.String),
                  brandId: params.getParam('brandId', ParamType.String),
                  brandName: params.getParam('brandName', ParamType.String),
                  modelCode: params.getParam('modelCode', ParamType.String),
                  modelName: params.getParam('modelName', ParamType.String),
                  year: params.getParam('year', ParamType.String),
                  driverType: params.getParam('driverType', ParamType.String),
                  grossTotal: params.getParam('grossTotal', ParamType.String),
                  sumInsured: params.getParam('sumInsured', ParamType.String),
                  tppd: params.getParam('tppd', ParamType.String),
                  pa: params.getParam('pa', ParamType.String),
                  grossAct: params.getParam('grossAct', ParamType.String),
                  expireDate: params.getParam('expireDate', ParamType.String),
                  coverTypeId: params.getParam('coverTypeId', ParamType.String),
                  coverTypeCode:
                      params.getParam('coverTypeCode', ParamType.String),
                  coverTypeName:
                      params.getParam('coverTypeName', ParamType.String),
                  garageTypeId:
                      params.getParam('garageTypeId', ParamType.String),
                  garageTypeName:
                      params.getParam('garageTypeName', ParamType.String),
                  insurerId: params.getParam('insurerId', ParamType.String),
                  insurerShortName:
                      params.getParam('insurerShortName', ParamType.String),
                  garageTypeCode:
                      params.getParam('garageTypeCode', ParamType.String),
                  tpbiPerson: params.getParam('tpbiPerson', ParamType.String),
                  tpbiAccident:
                      params.getParam('tpbiAccident', ParamType.String),
                  logoUrl: params.getParam('logoUrl', ParamType.String),
                  yearProduct: params.getParam('yearProduct', ParamType.String),
                  accessory: params.getParam('accessory', ParamType.String),
                  productId: params.getParam('productId', ParamType.String),
                  packageId: params.getParam('packageId', ParamType.String),
                  packageName: params.getParam('packageName', ParamType.String),
                  roadsideAssis:
                      params.getParam('roadsideAssis', ParamType.String),
                  flood: params.getParam('flood', ParamType.String),
                  deductible: params.getParam('deductible', ParamType.String),
                  me: params.getParam('me', ParamType.String),
                  bb: params.getParam('bb', ParamType.String),
                  seat: params.getParam('seat', ParamType.String),
                  netPremium: params.getParam('netPremium', ParamType.String),
                  vat: params.getParam('vat', ParamType.String),
                  stamp: params.getParam('stamp', ParamType.String),
                  insurerMaxName:
                      params.getParam('insurerMaxName', ParamType.String),
                  contractProcessstate:
                      params.getParam('contractProcessstate', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'NonePackageEditPage1',
              path: 'NonePackageEditPage1',
              builder: (context, params) => NonePackageEditPage1Widget(),
            ),
            FFRoute(
              name: 'NonePackageEditPage2',
              path: 'NonePackageEditPage2',
              builder: (context, params) => NonePackageEditPage2Widget(),
            ),
            FFRoute(
              name: 'NonePackageEditPage3',
              path: 'NonePackageEditPage3',
              builder: (context, params) => NonePackageEditPage3Widget(),
            ),
            FFRoute(
              name: 'InsuranceSuccessPage',
              path: 'InsuranceSuccessPage',
              builder: (context, params) => InsuranceSuccessPageWidget(),
            ),
            FFRoute(
              name: 'NonePackageEditDetailPage',
              path: 'NonePackageEditDetailPage',
              builder: (context, params) => NonePackageEditDetailPageWidget(),
            ),
            FFRoute(
              name: 'insuranceInfoPage4',
              path: 'insuranceInfoPage4',
              builder: (context, params) => InsuranceInfoPage4Widget(),
            ),
            FFRoute(
              name: 'insuranceInfoPage5',
              path: 'insuranceInfoPage5',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: InsuranceInfoPage5Widget(
                  quotationId: params.getParam('quotationId', ParamType.String),
                  leadDtlId: params.getParam('leadDtlId', ParamType.int),
                ),
              ),
            ),
            FFRoute(
              name: 'homepageFollowUp11',
              path: 'homepageFollowUp11',
              builder: (context, params) => HomepageFollowUp11Widget(),
            ),
            FFRoute(
              name: 'homepageFollowUp12',
              path: 'homepageFollowUp12',
              builder: (context, params) => HomepageFollowUp12Widget(),
            ),
            FFRoute(
              name: 'SuccessPage',
              path: 'successPage',
              builder: (context, params) => SuccessPageWidget(),
            ),
            FFRoute(
              name: 'AddAddress',
              path: 'addAddress',
              builder: (context, params) => AddAddressWidget(),
            ),
            FFRoute(
              name: 'LeadFollowUpPage',
              path: 'LeadFollowUpPage',
              requireAuth: true,
              builder: (context, params) => LeadFollowUpPageWidget(),
            ),
            FFRoute(
              name: 'SearchAddressPage',
              path: 'searchAddressPage',
              builder: (context, params) => SearchAddressPageWidget(),
            ),
            FFRoute(
              name: 'Homepage_Request_2_1',
              path: 'Homepage_Request_2_1',
              builder: (context, params) => HomepageRequest21Widget(
                accessory: params.getParam('accessory', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Homepage_Request_2_2',
              path: 'Homepage_Request_2_2',
              builder: (context, params) => HomepageRequest22Widget(),
            ),
            FFRoute(
              name: 'Homepage_Request_2_3',
              path: 'Homepage_Request_2_3',
              builder: (context, params) => HomepageRequest23Widget(),
            ),
            FFRoute(
              name: 'Homepage_Request_4_1',
              path: 'Homepage_Request_4_1',
              builder: (context, params) => HomepageRequest41Widget(),
            ),
            FFRoute(
              name: 'Homepage_Request_5_4_1',
              path: 'Homepage_Request_5_4_1',
              builder: (context, params) => HomepageRequest541Widget(),
            ),
            FFRoute(
              name: 'Homepage_Request_5_4_2',
              path: 'Homepage_Request_5_4_2',
              builder: (context, params) => HomepageRequest542Widget(),
            ),
            FFRoute(
              name: 'PaywithQRcode',
              path: 'PaywithQRcode',
              builder: (context, params) => PaywithQRcodeWidget(
                taxId: params.getParam('taxId', ParamType.String),
                suffix: params.getParam('suffix', ParamType.String),
                ref1: params.getParam('ref1', ParamType.String),
                ref2: params.getParam('ref2', ParamType.String),
                amount: params.getParam('amount', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'insuranceInfoPage5ShowPolicy',
              path: 'insuranceInfoPage5ShowPolicy',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: InsuranceInfoPage5ShowPolicyWidget(
                  vmiDocumentUrl:
                      params.getParam('vmiDocumentUrl', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'Homepage_Request_5_2_3',
              path: 'Homepage_Request_5_2_3',
              builder: (context, params) => HomepageRequest523Widget(
                index: params.getParam('index', ParamType.int),
                insuranceName:
                    params.getParam('insuranceName', ParamType.String),
                insuranceType:
                    params.getParam('insuranceType', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'List_out_1',
              path: 'List_out_1',
              builder: (context, params) => ListOut1Widget(),
            ),
            FFRoute(
              name: 'Outofrange_3',
              path: 'Outofrange_3',
              builder: (context, params) => Outofrange3Widget(),
            ),
            FFRoute(
              name: 'Quotation',
              path: 'Quotation',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: QuotationWidget(),
              ),
            ),
            FFRoute(
              name: 'ComparePrices',
              path: 'ComparePrices',
              builder: (context, params) => ComparePricesWidget(),
            ),
            FFRoute(
              name: 'NonePackageRenewPage',
              path: 'NonePackageRenewPage',
              builder: (context, params) => NonePackageRenewPageWidget(),
            ),
            FFRoute(
              name: 'Search_7_Renew_1',
              path: 'Search_7_Renew_1',
              builder: (context, params) => Search7Renew1Widget(),
            ),
            FFRoute(
              name: 'SampleIDcard',
              path: 'SampleIDcard',
              builder: (context, params) => SampleIDcardWidget(),
            ),
            FFRoute(
              name: 'NonePackageBasicPage',
              path: 'NonePackageBasicPage',
              builder: (context, params) => NonePackageBasicPageWidget(
                branchCode: params.getParam('branchCode', ParamType.String),
                carType: params.getParam('carType', ParamType.String),
                truckPart: params.getParam('truckPart', ParamType.String),
                cusMembership:
                    params.getParam('cusMembership', ParamType.String),
                carrierPurpose:
                    params.getParam('carrierPurpose', ParamType.String),
                truckCurrentPrice:
                    params.getParam('truckCurrentPrice', ParamType.String),
                carrierFlag: params.getParam('carrierFlag', ParamType.bool),
                coopFlag: params.getParam('coopFlag', ParamType.bool),
                carrierType: params.getParam('carrierType', ParamType.String),
                carrierPrice: params.getParam('carrierPrice', ParamType.String),
                brandName: params.getParam('brandName', ParamType.String),
                brandId: params.getParam('brandId', ParamType.String),
                modelName: params.getParam('modelName', ParamType.String),
                modelId: params.getParam('modelId', ParamType.String),
                year: params.getParam('year', ParamType.String),
                vehicleUsedName:
                    params.getParam('vehicleUsedName', ParamType.String),
                vehicleUsedId:
                    params.getParam('vehicleUsedId', ParamType.String),
                vehicleUsedCode:
                    params.getParam('vehicleUsedCode', ParamType.String),
                coverTypeName:
                    params.getParam('coverTypeName', ParamType.String),
                coverTypeCode:
                    params.getParam('coverTypeCode', ParamType.String),
                coverTypeId: params.getParam('coverTypeId', ParamType.String),
                garageTypeName:
                    params.getParam('garageTypeName', ParamType.String),
                garageTypeCode:
                    params.getParam('garageTypeCode', ParamType.String),
                garageTypeId: params.getParam('garageTypeId', ParamType.String),
                cusName: params.getParam('cusName', ParamType.String),
                cusPhone: params.getParam('cusPhone', ParamType.String),
                plate: params.getParam('plate', ParamType.String),
                plateAdditional:
                    params.getParam('plateAdditional', ParamType.String),
                provinceName: params.getParam('provinceName', ParamType.String),
                provinceCode: params.getParam('provinceCode', ParamType.String),
                sumInsured: params.getParam('sumInsured', ParamType.String),
                trailerSumInsured:
                    params.getParam('trailerSumInsured', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                actFlag: params.getParam('actFlag', ParamType.bool),
                oldVmi: params.getParam('oldVmi', ParamType.String),
                oldVmiExpireDate:
                    params.getParam('oldVmiExpireDate', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Email_1',
              path: 'List_out_1_EDIT1Copy',
              builder: (context, params) => Email1Widget(),
            ),
            FFRoute(
              name: 'PackageFilterPage',
              path: 'PackageFilterPage',
              builder: (context, params) => PackageFilterPageWidget(),
            ),
            FFRoute(
              name: 'InsuranceWorkSelectPage',
              path: 'InsuranceWorkSelectPage',
              builder: (context, params) => InsuranceWorkSelectPageWidget(),
            ),
            FFRoute(
              name: 'MakeInsuranceListPage',
              path: 'MakeInsuranceListPage',
              builder: (context, params) => MakeInsuranceListPageWidget(
                checkTotal: params.getParam('checkTotal', ParamType.int),
                list: params.getParam<dynamic>('list', ParamType.JSON, true),
                checkPayment: params.getParam('checkPayment', ParamType.String),
                checkVMI: params.getParam('checkVMI', ParamType.String),
                fromPage: params.getParam('fromPage', ParamType.String),
                type: params.getParam('type', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AddCustomerName',
              path: 'AddCustomerName',
              builder: (context, params) => AddCustomerNameWidget(
                insurerId: params.getParam<String>(
                    'insurerId', ParamType.String, true),
                insurerCode: params.getParam<String>(
                    'insurerCode', ParamType.String, true),
                insurerShortName: params.getParam<String>(
                    'insurerShortName', ParamType.String, true),
                insurerName: params.getParam<String>(
                    'insurerName', ParamType.String, true),
                coverTypeId: params.getParam<String>(
                    'coverTypeId', ParamType.String, true),
                coverTypeCode: params.getParam<String>(
                    'coverTypeCode', ParamType.String, true),
                coverTypeName: params.getParam<String>(
                    'coverTypeName', ParamType.String, true),
                garageTypeId: params.getParam<String>(
                    'garageTypeId', ParamType.String, true),
                garageTypeCode: params.getParam<String>(
                    'garageTypeCode', ParamType.String, true),
                garageTypeName: params.getParam<String>(
                    'garageTypeName', ParamType.String, true),
                productId: params.getParam<String>(
                    'productId', ParamType.String, true),
                packageId: params.getParam<String>(
                    'packageId', ParamType.String, true),
                packageName: params.getParam<String>(
                    'packageName', ParamType.String, true),
                sumInsured: params.getParam<String>(
                    'sumInsured', ParamType.String, true),
                workType:
                    params.getParam<String>('workType', ParamType.String, true),
                roadsideAssistance: params.getParam<String>(
                    'roadsideAssistance', ParamType.String, true),
                tpbiPerson: params.getParam<String>(
                    'tpbiPerson', ParamType.String, true),
                tpbiAccident: params.getParam<String>(
                    'tpbiAccident', ParamType.String, true),
                tppd: params.getParam<String>('tppd', ParamType.String, true),
                flood: params.getParam<String>('flood', ParamType.String, true),
                deductible: params.getParam<String>(
                    'deductible', ParamType.String, true),
                pa: params.getParam<String>('pa', ParamType.String, true),
                me: params.getParam<String>('me', ParamType.String, true),
                bb: params.getParam<String>('bb', ParamType.String, true),
                assessory: params.getParam<String>(
                    'assessory', ParamType.String, true),
                seat: params.getParam<String>('seat', ParamType.String, true),
                netPremium: params.getParam<String>(
                    'netPremium', ParamType.String, true),
                vat: params.getParam<String>('vat', ParamType.String, true),
                stamp: params.getParam<String>('stamp', ParamType.String, true),
                grossTotal: params.getParam<String>(
                    'grossTotal', ParamType.String, true),
                carType: params.getParam('carType', ParamType.String),
                driverType: params.getParam('driverType', ParamType.String),
                carRegistrationYear:
                    params.getParam('carRegistrationYear', ParamType.String),
                carBrandId: params.getParam('carBrandId', ParamType.String),
                carBrandName: params.getParam('carBrandName', ParamType.String),
                carModelName: params.getParam('carModelName', ParamType.String),
                carModelId: params.getParam('carModelId', ParamType.String),
                vehicleId: params.getParam('vehicleId', ParamType.String),
                vehicleCode: params.getParam('vehicleCode', ParamType.String),
                vehicleName: params.getParam('vehicleName', ParamType.String),
                contractProcessstate: params.getParam<String>(
                    'contractProcessstate', ParamType.String, true),
                fromPage: params.getParam('fromPage', ParamType.String),
                fromBtn: params.getParam('fromBtn', ParamType.String),
                indexPage: params.getParam('indexPage', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'NonePackageSelectedInsurerPage',
              path: 'NonePackageSelectedInsurerPage',
              builder: (context, params) =>
                  NonePackageSelectedInsurerPageWidget(
                leadID: params.getParam('leadID', ParamType.String),
                coverTypeName:
                    params.getParam('coverTypeName', ParamType.String),
                garageTypeName:
                    params.getParam('garageTypeName', ParamType.String),
                insurerShortName:
                    params.getParam('insurerShortName', ParamType.String),
                insurerName: params.getParam('insurerName', ParamType.String),
                quotationId: params.getParam('quotationId', ParamType.String),
                leadDtlId: params.getParam('leadDtlId', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'PaywithBarcode',
              path: 'PaywithBarcode',
              builder: (context, params) => PaywithBarcodeWidget(),
            ),
            FFRoute(
              name: 'AddLeadsPage',
              path: 'AddLeadsPage',
              builder: (context, params) => AddLeadsPageWidget(),
            ),
            FFRoute(
              name: 'LoginScreen_1',
              path: 'LoginScreen_1',
              builder: (context, params) => LoginScreen1Widget(),
            ),
            FFRoute(
              name: 'NonePackageInsurerPage',
              path: 'NonePackageInsurerPage',
              builder: (context, params) => NonePackageInsurerPageWidget(),
            ),
            FFRoute(
              name: 'insuranceInfoPage5Cancel',
              path: 'Homepage_Request_5_confirm',
              builder: (context, params) => InsuranceInfoPage5CancelWidget(
                quotationId: params.getParam('quotationId', ParamType.String),
                leadDtlId: params.getParam('leadDtlId', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'insuranceInfoPage4_2',
              path: 'insuranceInfoPage4_2',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: InsuranceInfoPage42Widget(
                  quotationId: params.getParam('quotationId', ParamType.String),
                  leadDetailId: params.getParam('leadDetailId', ParamType.int),
                ),
              ),
            ),
            FFRoute(
              name: 'insuranceInfoPage4_installments',
              path: 'insuranceInfoPage4_installments',
              builder: (context, params) =>
                  InsuranceInfoPage4InstallmentsWidget(
                titleText: params.getParam('titleText', ParamType.String),
                searchLabel: params.getParam('searchLabel', ParamType.String),
                dataList:
                    params.getParam<String>('dataList', ParamType.String, true),
                multiSelect: params.getParam('multiSelect', ParamType.bool),
                maxSelected: params.getParam('maxSelected', ParamType.int),
                fromPage: params.getParam('fromPage', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'uploadImgPage',
              path: 'uploadImgPage',
              builder: (context, params) => UploadImgPageWidget(
                titleText: params.getParam('titleText', ParamType.String),
                searchLabel: params.getParam('searchLabel', ParamType.String),
                fromPage: params.getParam('fromPage', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'List_out_1_EDIT1Copy',
              path: 'List_out_1_EDIT177',
              builder: (context, params) => ListOut1EDIT1CopyWidget(),
            ),
            FFRoute(
              name: 'NonePackageEditPage2Copy',
              path: 'NonePackageEditPage22',
              builder: (context, params) => NonePackageEditPage2CopyWidget(),
            ),
            FFRoute(
              name: 'ReloadApp',
              path: 'reloadApp',
              builder: (context, params) => ReloadAppWidget(),
            ),
            FFRoute(
              name: 'NonePackageBasicImage1Page',
              path: 'NonePackageBasicImage1Page',
              builder: (context, params) => NonePackageBasicImage1PageWidget(),
            ),
            FFRoute(
              name: 'NonePackageBasicImage2Page',
              path: 'NonePackageBasicImage2Page',
              builder: (context, params) => NonePackageBasicImage2PageWidget(),
            ),
            FFRoute(
              name: 'insuranceInfoPage3_1',
              path: 'insuranceInfoPage3_1',
              builder: (context, params) => InsuranceInfoPage31Widget(),
            ),
            FFRoute(
              name: 'SearchBranchPage',
              path: 'SearchBranchPage',
              builder: (context, params) => SearchBranchPageWidget(
                fromPage: params.getParam('fromPage', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'InsuranceUnSuccessPage',
              path: 'InsuranceUnSuccessPage',
              builder: (context, params) => InsuranceUnSuccessPageWidget(),
            ),
            FFRoute(
              name: 'QuotationCopy',
              path: 'QuotationCopy',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: QuotationCopyWidget(
                  quotation: params.getParam('quotation', ParamType.JSON),
                ),
              ),
            ),
            FFRoute(
              name: 'InsurerInfomationPage',
              path: 'insurerInfomationPage',
              builder: (context, params) => InsurerInfomationPageWidget(),
            ),
            FFRoute(
              name: 'webViewPromotionPage',
              path: 'webViewPromotionPage',
              builder: (context, params) => WebViewPromotionPageWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Homepage_PIN_1.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
