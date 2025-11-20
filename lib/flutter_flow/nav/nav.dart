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
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
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
              name: LoginPageWidget.routeName,
              path: LoginPageWidget.routePath,
              builder: (context, params) => LoginPageWidget(
                apiURL: params.getParam(
                  'apiURL',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Key_Storage'],
                ),
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SuperAppPageWidget.routeName,
              path: SuperAppPageWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'SuperAppPage')
                  : SuperAppPageWidget(
                      dailyText: params.getParam(
                        'dailyText',
                        ParamType.String,
                      ),
                    ),
            ),
            FFRoute(
              name: MyProfilePageWidget.routeName,
              path: MyProfilePageWidget.routePath,
              builder: (context, params) => MyProfilePageWidget(),
            ),
            FFRoute(
              name: PinCodePageWidget.routeName,
              path: PinCodePageWidget.routePath,
              builder: (context, params) => PinCodePageWidget(),
            ),
            FFRoute(
              name: SetPinCodePageWidget.routeName,
              path: SetPinCodePageWidget.routePath,
              builder: (context, params) => SetPinCodePageWidget(),
            ),
            FFRoute(
              name: LifeInsuranceLicenseCardPageWidget.routeName,
              path: LifeInsuranceLicenseCardPageWidget.routePath,
              builder: (context, params) =>
                  LifeInsuranceLicenseCardPageWidget(),
            ),
            FFRoute(
              name: InboxEmailWidget.routeName,
              path: InboxEmailWidget.routePath,
              builder: (context, params) => InboxEmailWidget(),
            ),
            FFRoute(
              name: SearchInsurancePageWidget.routeName,
              path: SearchInsurancePageWidget.routePath,
              builder: (context, params) => SearchInsurancePageWidget(
                fromIcon: params.getParam(
                  'fromIcon',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AboutUsPageWidget.routeName,
              path: AboutUsPageWidget.routePath,
              builder: (context, params) => AboutUsPageWidget(),
            ),
            FFRoute(
              name: ContactUsPageWidget.routeName,
              path: ContactUsPageWidget.routePath,
              builder: (context, params) => ContactUsPageWidget(),
            ),
            FFRoute(
              name: SelectReasonPageWidget.routeName,
              path: SelectReasonPageWidget.routePath,
              builder: (context, params) => SelectReasonPageWidget(),
            ),
            FFRoute(
              name: MyAccountPageWidget.routeName,
              path: MyAccountPageWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MyAccountPage')
                  : MyAccountPageWidget(),
            ),
            FFRoute(
              name: SearchableListPageWidget.routeName,
              path: SearchableListPageWidget.routePath,
              builder: (context, params) => SearchableListPageWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                dataList: params.getParam<String>(
                  'dataList',
                  ParamType.String,
                  isList: true,
                ),
                multiSelect: params.getParam(
                  'multiSelect',
                  ParamType.bool,
                ),
                maxSelected: params.getParam(
                  'maxSelected',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
                name: CompareInsurancePageWidget.routeName,
                path: CompareInsurancePageWidget.routePath,
                asyncParams: {
                  'insurerConfig2': getDoc(
                      ['InsurerConfig2'], InsurerConfig2Record.fromSnapshot),
                },
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: CompareInsurancePageWidget(
                        insurerFullName: params.getParam<String>(
                          'insurerFullName',
                          ParamType.String,
                          isList: true,
                        ),
                        currentDate: params.getParam(
                          'currentDate',
                          ParamType.String,
                        ),
                        brandId: params.getParam(
                          'brandId',
                          ParamType.String,
                        ),
                        brandName: params.getParam(
                          'brandName',
                          ParamType.String,
                        ),
                        modelCode: params.getParam(
                          'modelCode',
                          ParamType.String,
                        ),
                        modelName: params.getParam(
                          'modelName',
                          ParamType.String,
                        ),
                        year: params.getParam(
                          'year',
                          ParamType.String,
                        ),
                        driverType: params.getParam(
                          'driverType',
                          ParamType.String,
                        ),
                        grossTotal: params.getParam<String>(
                          'grossTotal',
                          ParamType.String,
                          isList: true,
                        ),
                        sumInsured: params.getParam<String>(
                          'sumInsured',
                          ParamType.String,
                          isList: true,
                        ),
                        tpbiPerson: params.getParam<String>(
                          'tpbiPerson',
                          ParamType.String,
                          isList: true,
                        ),
                        tpbiAccident: params.getParam<String>(
                          'tpbiAccident',
                          ParamType.String,
                          isList: true,
                        ),
                        grossAct: params.getParam<String>(
                          'grossAct',
                          ParamType.String,
                          isList: true,
                        ),
                        expireDate: params.getParam<String>(
                          'expireDate',
                          ParamType.String,
                          isList: true,
                        ),
                        coverTypeId: params.getParam<String>(
                          'coverTypeId',
                          ParamType.String,
                          isList: true,
                        ),
                        coverTypeCode: params.getParam<String>(
                          'coverTypeCode',
                          ParamType.String,
                          isList: true,
                        ),
                        coverTypeName: params.getParam<String>(
                          'coverTypeName',
                          ParamType.String,
                          isList: true,
                        ),
                        garageTypeId: params.getParam<String>(
                          'garageTypeId',
                          ParamType.String,
                          isList: true,
                        ),
                        garageTypeName: params.getParam<String>(
                          'garageTypeName',
                          ParamType.String,
                          isList: true,
                        ),
                        insurerId: params.getParam<String>(
                          'insurerId',
                          ParamType.String,
                          isList: true,
                        ),
                        insurerShortName: params.getParam<String>(
                          'insurerShortName',
                          ParamType.String,
                          isList: true,
                        ),
                        garageTypeCode: params.getParam<String>(
                          'garageTypeCode',
                          ParamType.String,
                          isList: true,
                        ),
                        insurerLogoUrl: params.getParam<String>(
                          'insurerLogoUrl',
                          ParamType.String,
                          isList: true,
                        ),
                        yearProduct: params.getParam(
                          'yearProduct',
                          ParamType.String,
                        ),
                        accessory: params.getParam<String>(
                          'accessory',
                          ParamType.String,
                          isList: true,
                        ),
                        pa: params.getParam<String>(
                          'pa',
                          ParamType.String,
                          isList: true,
                        ),
                        productId: params.getParam<String>(
                          'productId',
                          ParamType.String,
                          isList: true,
                        ),
                        packageId: params.getParam<String>(
                          'packageId',
                          ParamType.String,
                          isList: true,
                        ),
                        packageName: params.getParam<String>(
                          'packageName',
                          ParamType.String,
                          isList: true,
                        ),
                        roadsideAssis: params.getParam<String>(
                          'roadsideAssis',
                          ParamType.String,
                          isList: true,
                        ),
                        flood: params.getParam<String>(
                          'flood',
                          ParamType.String,
                          isList: true,
                        ),
                        deductible: params.getParam<String>(
                          'deductible',
                          ParamType.String,
                          isList: true,
                        ),
                        me: params.getParam<String>(
                          'me',
                          ParamType.String,
                          isList: true,
                        ),
                        bb: params.getParam<String>(
                          'bb',
                          ParamType.String,
                          isList: true,
                        ),
                        seat: params.getParam<String>(
                          'seat',
                          ParamType.String,
                          isList: true,
                        ),
                        netPremium: params.getParam<String>(
                          'netPremium',
                          ParamType.String,
                          isList: true,
                        ),
                        vat: params.getParam<String>(
                          'vat',
                          ParamType.String,
                          isList: true,
                        ),
                        stamp: params.getParam<String>(
                          'stamp',
                          ParamType.String,
                          isList: true,
                        ),
                        insurerMaxName: params.getParam<String>(
                          'insurerMaxName',
                          ParamType.String,
                          isList: true,
                        ),
                        tppd: params.getParam<String>(
                          'tppd',
                          ParamType.String,
                          isList: true,
                        ),
                        contractProcessstate: params.getParam<String>(
                          'contractProcessstate',
                          ParamType.String,
                          isList: true,
                        ),
                        insurerCondition: params.getParam<String>(
                          'insurerCondition',
                          ParamType.String,
                          isList: true,
                        ),
                        cc: params.getParam<String>(
                          'cc',
                          ParamType.String,
                          isList: true,
                        ),
                        insurerConfig2: params.getParam(
                          'insurerConfig2',
                          ParamType.Document,
                        ),
                        carLost: params.getParam<String>(
                          'carLost',
                          ParamType.String,
                          isList: true,
                        ),
                        motorAddOn: params.getParam<String>(
                          'motorAddOn',
                          ParamType.String,
                          isList: true,
                        ),
                        driverBehavior: params.getParam<String>(
                          'driverBehavior',
                          ParamType.String,
                          isList: true,
                        ),
                        inspectionExcept: params.getParam<String>(
                          'inspectionExcept',
                          ParamType.String,
                          isList: true,
                        ),
                      ),
                    )),
            FFRoute(
              name: InsuranceListPageWidget.routeName,
              path: InsuranceListPageWidget.routePath,
              builder: (context, params) => InsuranceListPageWidget(
                checkType: params.getParam(
                  'checkType',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: InsuranceInfoPage2Widget.routeName,
              path: InsuranceInfoPage2Widget.routePath,
              asyncParams: {
                'masterDataFirebase':
                    getDoc(['dataList'], DataListRecord.fromSnapshot),
              },
              builder: (context, params) => InsuranceInfoPage2Widget(
                masterDataFirebase: params.getParam(
                  'masterDataFirebase',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: InsuranceInfoPage1Widget.routeName,
              path: InsuranceInfoPage1Widget.routePath,
              builder: (context, params) => InsuranceInfoPage1Widget(
                quotationId: params.getParam(
                  'quotationId',
                  ParamType.String,
                ),
                leadDtailId: params.getParam(
                  'leadDtailId',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: InsuranceInfoPage3Widget.routeName,
              path: InsuranceInfoPage3Widget.routePath,
              builder: (context, params) => InsuranceInfoPage3Widget(),
            ),
            FFRoute(
              name: InsurerListPageWidget.routeName,
              path: InsurerListPageWidget.routePath,
              builder: (context, params) => InsurerListPageWidget(
                brandCode: params.getParam(
                  'brandCode',
                  ParamType.String,
                ),
                modelCode: params.getParam(
                  'modelCode',
                  ParamType.String,
                ),
                year: params.getParam(
                  'year',
                  ParamType.String,
                ),
                province: params.getParam(
                  'province',
                  ParamType.String,
                ),
                vehicleUsage: params.getParam(
                  'vehicleUsage',
                  ParamType.String,
                ),
                coverType: params.getParam<String>(
                  'coverType',
                  ParamType.String,
                  isList: true,
                ),
                garageType: params.getParam<String>(
                  'garageType',
                  ParamType.String,
                  isList: true,
                ),
                brandName: params.getParam(
                  'brandName',
                  ParamType.String,
                ),
                modelName: params.getParam(
                  'modelName',
                  ParamType.String,
                ),
                carTypeDetail: params.getParam(
                  'carTypeDetail',
                  ParamType.String,
                ),
                oldVmiExpDate: params.getParam(
                  'oldVmiExpDate',
                  ParamType.String,
                ),
                provinceCode: params.getParam(
                  'provinceCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
                name: DetailsInsurancePageWidget.routeName,
                path: DetailsInsurancePageWidget.routePath,
                asyncParams: {
                  'insurerConfig': getDoc(
                      ['InsurerConfig2'], InsurerConfig2Record.fromSnapshot),
                },
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: DetailsInsurancePageWidget(
                        insurerFullName: params.getParam(
                          'insurerFullName',
                          ParamType.String,
                        ),
                        currentDate: params.getParam(
                          'currentDate',
                          ParamType.String,
                        ),
                        brandId: params.getParam(
                          'brandId',
                          ParamType.String,
                        ),
                        brandName: params.getParam(
                          'brandName',
                          ParamType.String,
                        ),
                        modelCode: params.getParam(
                          'modelCode',
                          ParamType.String,
                        ),
                        modelName: params.getParam(
                          'modelName',
                          ParamType.String,
                        ),
                        year: params.getParam(
                          'year',
                          ParamType.String,
                        ),
                        driverType: params.getParam(
                          'driverType',
                          ParamType.String,
                        ),
                        grossTotal: params.getParam(
                          'grossTotal',
                          ParamType.String,
                        ),
                        sumInsured: params.getParam(
                          'sumInsured',
                          ParamType.String,
                        ),
                        tppd: params.getParam(
                          'tppd',
                          ParamType.String,
                        ),
                        pa: params.getParam(
                          'pa',
                          ParamType.String,
                        ),
                        grossAct: params.getParam(
                          'grossAct',
                          ParamType.String,
                        ),
                        expireDate: params.getParam(
                          'expireDate',
                          ParamType.String,
                        ),
                        coverTypeId: params.getParam(
                          'coverTypeId',
                          ParamType.String,
                        ),
                        coverTypeCode: params.getParam(
                          'coverTypeCode',
                          ParamType.String,
                        ),
                        coverTypeName: params.getParam(
                          'coverTypeName',
                          ParamType.String,
                        ),
                        garageTypeId: params.getParam(
                          'garageTypeId',
                          ParamType.String,
                        ),
                        garageTypeName: params.getParam(
                          'garageTypeName',
                          ParamType.String,
                        ),
                        insurerId: params.getParam(
                          'insurerId',
                          ParamType.String,
                        ),
                        insurerShortName: params.getParam(
                          'insurerShortName',
                          ParamType.String,
                        ),
                        garageTypeCode: params.getParam(
                          'garageTypeCode',
                          ParamType.String,
                        ),
                        tpbiPerson: params.getParam(
                          'tpbiPerson',
                          ParamType.String,
                        ),
                        tpbiAccident: params.getParam(
                          'tpbiAccident',
                          ParamType.String,
                        ),
                        logoUrl: params.getParam(
                          'logoUrl',
                          ParamType.String,
                        ),
                        yearProduct: params.getParam(
                          'yearProduct',
                          ParamType.String,
                        ),
                        accessory: params.getParam(
                          'accessory',
                          ParamType.String,
                        ),
                        productId: params.getParam(
                          'productId',
                          ParamType.String,
                        ),
                        packageId: params.getParam(
                          'packageId',
                          ParamType.String,
                        ),
                        packageName: params.getParam(
                          'packageName',
                          ParamType.String,
                        ),
                        roadsideAssis: params.getParam(
                          'roadsideAssis',
                          ParamType.String,
                        ),
                        flood: params.getParam(
                          'flood',
                          ParamType.String,
                        ),
                        deductible: params.getParam(
                          'deductible',
                          ParamType.String,
                        ),
                        me: params.getParam(
                          'me',
                          ParamType.String,
                        ),
                        bb: params.getParam(
                          'bb',
                          ParamType.String,
                        ),
                        seat: params.getParam(
                          'seat',
                          ParamType.String,
                        ),
                        netPremium: params.getParam(
                          'netPremium',
                          ParamType.String,
                        ),
                        vat: params.getParam(
                          'vat',
                          ParamType.String,
                        ),
                        stamp: params.getParam(
                          'stamp',
                          ParamType.String,
                        ),
                        insurerMaxName: params.getParam(
                          'insurerMaxName',
                          ParamType.String,
                        ),
                        contractProcessstate: params.getParam(
                          'contractProcessstate',
                          ParamType.String,
                        ),
                        insurerCondition: params.getParam(
                          'insurerCondition',
                          ParamType.String,
                        ),
                        cc: params.getParam(
                          'cc',
                          ParamType.String,
                        ),
                        insurerConfig: params.getParam(
                          'insurerConfig',
                          ParamType.Document,
                        ),
                        carLost: params.getParam(
                          'carLost',
                          ParamType.String,
                        ),
                        motorAddOn: params.getParam(
                          'motorAddOn',
                          ParamType.String,
                        ),
                        driverBehavior: params.getParam(
                          'driverBehavior',
                          ParamType.String,
                        ),
                        inspectionExcept: params.getParam(
                          'inspectionExcept',
                          ParamType.String,
                        ),
                      ),
                    )),
            FFRoute(
              name: NonePackageEditPage1Widget.routeName,
              path: NonePackageEditPage1Widget.routePath,
              builder: (context, params) => NonePackageEditPage1Widget(),
            ),
            FFRoute(
              name: NonePackageEditPage2Widget.routeName,
              path: NonePackageEditPage2Widget.routePath,
              builder: (context, params) => NonePackageEditPage2Widget(),
            ),
            FFRoute(
              name: NonePackageEditPage3Widget.routeName,
              path: NonePackageEditPage3Widget.routePath,
              builder: (context, params) => NonePackageEditPage3Widget(),
            ),
            FFRoute(
              name: InsuranceSuccessPageWidget.routeName,
              path: InsuranceSuccessPageWidget.routePath,
              builder: (context, params) => InsuranceSuccessPageWidget(),
            ),
            FFRoute(
              name: NonePackageEditDetailPageWidget.routeName,
              path: NonePackageEditDetailPageWidget.routePath,
              builder: (context, params) => NonePackageEditDetailPageWidget(),
            ),
            FFRoute(
              name: InsuranceInfoPage4Widget.routeName,
              path: InsuranceInfoPage4Widget.routePath,
              builder: (context, params) => InsuranceInfoPage4Widget(),
            ),
            FFRoute(
                name: InsuranceInfoPage5Widget.routeName,
                path: InsuranceInfoPage5Widget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: InsuranceInfoPage5Widget(
                        quotationId: params.getParam(
                          'quotationId',
                          ParamType.String,
                        ),
                        leadDtlId: params.getParam(
                          'leadDtlId',
                          ParamType.int,
                        ),
                      ),
                    )),
            FFRoute(
              name: SuccessPageWidget.routeName,
              path: SuccessPageWidget.routePath,
              builder: (context, params) => SuccessPageWidget(),
            ),
            FFRoute(
              name: AddAddressWidget.routeName,
              path: AddAddressWidget.routePath,
              builder: (context, params) => AddAddressWidget(),
            ),
            FFRoute(
              name: LeadFollowUpPageWidget.routeName,
              path: LeadFollowUpPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => LeadFollowUpPageWidget(),
            ),
            FFRoute(
              name: SearchAddressPageWidget.routeName,
              path: SearchAddressPageWidget.routePath,
              builder: (context, params) => SearchAddressPageWidget(),
            ),
            FFRoute(
              name: HomepageRequest21Widget.routeName,
              path: HomepageRequest21Widget.routePath,
              builder: (context, params) => HomepageRequest21Widget(
                accessory: params.getParam(
                  'accessory',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: HomepageRequest22Widget.routeName,
              path: HomepageRequest22Widget.routePath,
              builder: (context, params) => HomepageRequest22Widget(),
            ),
            FFRoute(
              name: HomepageRequest23Widget.routeName,
              path: HomepageRequest23Widget.routePath,
              builder: (context, params) => HomepageRequest23Widget(),
            ),
            FFRoute(
              name: HomepageRequest41Widget.routeName,
              path: HomepageRequest41Widget.routePath,
              builder: (context, params) => HomepageRequest41Widget(
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: HomepageRequest541Widget.routeName,
              path: HomepageRequest541Widget.routePath,
              builder: (context, params) => HomepageRequest541Widget(),
            ),
            FFRoute(
              name: HomepageRequest542Widget.routeName,
              path: HomepageRequest542Widget.routePath,
              builder: (context, params) => HomepageRequest542Widget(),
            ),
            FFRoute(
              name: PaywithQRcodeWidget.routeName,
              path: PaywithQRcodeWidget.routePath,
              builder: (context, params) => PaywithQRcodeWidget(
                taxId: params.getParam(
                  'taxId',
                  ParamType.String,
                ),
                suffix: params.getParam(
                  'suffix',
                  ParamType.String,
                ),
                ref1: params.getParam(
                  'ref1',
                  ParamType.String,
                ),
                ref2: params.getParam(
                  'ref2',
                  ParamType.String,
                ),
                amount: params.getParam(
                  'amount',
                  ParamType.String,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                actCMI: params.getParam(
                  'actCMI',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
                name: InsuranceInfoPage5ShowPolicyWidget.routeName,
                path: InsuranceInfoPage5ShowPolicyWidget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: InsuranceInfoPage5ShowPolicyWidget(
                        vmiDocumentUrl: params.getParam(
                          'vmiDocumentUrl',
                          ParamType.String,
                        ),
                      ),
                    )),
            FFRoute(
              name: Outofrange3Widget.routeName,
              path: Outofrange3Widget.routePath,
              builder: (context, params) => Outofrange3Widget(),
            ),
            FFRoute(
                name: QuotationWidget.routeName,
                path: QuotationWidget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: QuotationWidget(
                        fromPage: params.getParam(
                          'fromPage',
                          ParamType.String,
                        ),
                      ),
                    )),
            FFRoute(
              name: ComparePricesWidget.routeName,
              path: ComparePricesWidget.routePath,
              builder: (context, params) => ComparePricesWidget(),
            ),
            FFRoute(
              name: NonePackageRenewPageWidget.routeName,
              path: NonePackageRenewPageWidget.routePath,
              builder: (context, params) => NonePackageRenewPageWidget(
                workType: params.getParam(
                  'workType',
                  ParamType.String,
                ),
                bodynumber: params.getParam(
                  'bodynumber',
                  ParamType.String,
                ),
                effectivedate: params.getParam(
                  'effectivedate',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: Search7Renew1Widget.routeName,
              path: Search7Renew1Widget.routePath,
              builder: (context, params) => Search7Renew1Widget(),
            ),
            FFRoute(
              name: SampleIDcardWidget.routeName,
              path: SampleIDcardWidget.routePath,
              builder: (context, params) => SampleIDcardWidget(
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                imageUrl: params.getParam(
                  'imageUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: NonePackageBasicPageWidget.routeName,
              path: NonePackageBasicPageWidget.routePath,
              builder: (context, params) => NonePackageBasicPageWidget(
                branchCode: params.getParam(
                  'branchCode',
                  ParamType.String,
                ),
                carType: params.getParam(
                  'carType',
                  ParamType.String,
                ),
                truckPart: params.getParam(
                  'truckPart',
                  ParamType.String,
                ),
                cusMembership: params.getParam(
                  'cusMembership',
                  ParamType.String,
                ),
                carrierPurpose: params.getParam(
                  'carrierPurpose',
                  ParamType.String,
                ),
                truckCurrentPrice: params.getParam(
                  'truckCurrentPrice',
                  ParamType.String,
                ),
                carrierFlag: params.getParam(
                  'carrierFlag',
                  ParamType.bool,
                ),
                coopFlag: params.getParam(
                  'coopFlag',
                  ParamType.bool,
                ),
                carrierType: params.getParam(
                  'carrierType',
                  ParamType.String,
                ),
                carrierPrice: params.getParam(
                  'carrierPrice',
                  ParamType.String,
                ),
                brandName: params.getParam(
                  'brandName',
                  ParamType.String,
                ),
                brandId: params.getParam(
                  'brandId',
                  ParamType.String,
                ),
                modelName: params.getParam(
                  'modelName',
                  ParamType.String,
                ),
                modelId: params.getParam(
                  'modelId',
                  ParamType.String,
                ),
                year: params.getParam(
                  'year',
                  ParamType.String,
                ),
                vehicleUsedName: params.getParam(
                  'vehicleUsedName',
                  ParamType.String,
                ),
                vehicleUsedId: params.getParam(
                  'vehicleUsedId',
                  ParamType.String,
                ),
                vehicleUsedCode: params.getParam(
                  'vehicleUsedCode',
                  ParamType.String,
                ),
                coverTypeName: params.getParam(
                  'coverTypeName',
                  ParamType.String,
                ),
                coverTypeCode: params.getParam(
                  'coverTypeCode',
                  ParamType.String,
                ),
                coverTypeId: params.getParam(
                  'coverTypeId',
                  ParamType.String,
                ),
                garageTypeName: params.getParam(
                  'garageTypeName',
                  ParamType.String,
                ),
                garageTypeCode: params.getParam(
                  'garageTypeCode',
                  ParamType.String,
                ),
                garageTypeId: params.getParam(
                  'garageTypeId',
                  ParamType.String,
                ),
                cusName: params.getParam(
                  'cusName',
                  ParamType.String,
                ),
                cusPhone: params.getParam(
                  'cusPhone',
                  ParamType.String,
                ),
                plate: params.getParam(
                  'plate',
                  ParamType.String,
                ),
                plateAdditional: params.getParam(
                  'plateAdditional',
                  ParamType.String,
                ),
                provinceName: params.getParam(
                  'provinceName',
                  ParamType.String,
                ),
                provinceCode: params.getParam(
                  'provinceCode',
                  ParamType.String,
                ),
                sumInsured: params.getParam(
                  'sumInsured',
                  ParamType.String,
                ),
                trailerSumInsured: params.getParam(
                  'trailerSumInsured',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                actFlag: params.getParam(
                  'actFlag',
                  ParamType.bool,
                ),
                oldVmi: params.getParam(
                  'oldVmi',
                  ParamType.String,
                ),
                oldVmiExpireDate: params.getParam(
                  'oldVmiExpireDate',
                  ParamType.String,
                ),
                workType: params.getParam(
                  'workType',
                  ParamType.String,
                ),
                yearChrist: params.getParam(
                  'yearChrist',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Email1Widget.routeName,
              path: Email1Widget.routePath,
              builder: (context, params) => Email1Widget(),
            ),
            FFRoute(
              name: PackageFilterPageWidget.routeName,
              path: PackageFilterPageWidget.routePath,
              builder: (context, params) => PackageFilterPageWidget(
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: InsuranceWorkSelectPageWidget.routeName,
              path: InsuranceWorkSelectPageWidget.routePath,
              builder: (context, params) => InsuranceWorkSelectPageWidget(),
            ),
            FFRoute(
              name: MakeInsuranceListPageWidget.routeName,
              path: MakeInsuranceListPageWidget.routePath,
              builder: (context, params) => MakeInsuranceListPageWidget(
                checkTotal: params.getParam(
                  'checkTotal',
                  ParamType.int,
                ),
                list: params.getParam<dynamic>(
                  'list',
                  ParamType.JSON,
                  isList: true,
                ),
                checkPayment: params.getParam(
                  'checkPayment',
                  ParamType.String,
                ),
                checkVMI: params.getParam(
                  'checkVMI',
                  ParamType.String,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AddCustomerNameWidget.routeName,
              path: AddCustomerNameWidget.routePath,
              builder: (context, params) => AddCustomerNameWidget(
                insurerId: params.getParam<String>(
                  'insurerId',
                  ParamType.String,
                  isList: true,
                ),
                insurerCode: params.getParam<String>(
                  'insurerCode',
                  ParamType.String,
                  isList: true,
                ),
                insurerShortName: params.getParam<String>(
                  'insurerShortName',
                  ParamType.String,
                  isList: true,
                ),
                insurerName: params.getParam<String>(
                  'insurerName',
                  ParamType.String,
                  isList: true,
                ),
                coverTypeId: params.getParam<String>(
                  'coverTypeId',
                  ParamType.String,
                  isList: true,
                ),
                coverTypeCode: params.getParam<String>(
                  'coverTypeCode',
                  ParamType.String,
                  isList: true,
                ),
                coverTypeName: params.getParam<String>(
                  'coverTypeName',
                  ParamType.String,
                  isList: true,
                ),
                garageTypeId: params.getParam<String>(
                  'garageTypeId',
                  ParamType.String,
                  isList: true,
                ),
                garageTypeCode: params.getParam<String>(
                  'garageTypeCode',
                  ParamType.String,
                  isList: true,
                ),
                garageTypeName: params.getParam<String>(
                  'garageTypeName',
                  ParamType.String,
                  isList: true,
                ),
                productId: params.getParam<String>(
                  'productId',
                  ParamType.String,
                  isList: true,
                ),
                packageId: params.getParam<String>(
                  'packageId',
                  ParamType.String,
                  isList: true,
                ),
                packageName: params.getParam<String>(
                  'packageName',
                  ParamType.String,
                  isList: true,
                ),
                sumInsured: params.getParam<String>(
                  'sumInsured',
                  ParamType.String,
                  isList: true,
                ),
                workType: params.getParam<String>(
                  'workType',
                  ParamType.String,
                  isList: true,
                ),
                roadsideAssistance: params.getParam<String>(
                  'roadsideAssistance',
                  ParamType.String,
                  isList: true,
                ),
                tpbiPerson: params.getParam<String>(
                  'tpbiPerson',
                  ParamType.String,
                  isList: true,
                ),
                tpbiAccident: params.getParam<String>(
                  'tpbiAccident',
                  ParamType.String,
                  isList: true,
                ),
                tppd: params.getParam<String>(
                  'tppd',
                  ParamType.String,
                  isList: true,
                ),
                flood: params.getParam<String>(
                  'flood',
                  ParamType.String,
                  isList: true,
                ),
                deductible: params.getParam<String>(
                  'deductible',
                  ParamType.String,
                  isList: true,
                ),
                pa: params.getParam<String>(
                  'pa',
                  ParamType.String,
                  isList: true,
                ),
                me: params.getParam<String>(
                  'me',
                  ParamType.String,
                  isList: true,
                ),
                bb: params.getParam<String>(
                  'bb',
                  ParamType.String,
                  isList: true,
                ),
                assessory: params.getParam<String>(
                  'assessory',
                  ParamType.String,
                  isList: true,
                ),
                seat: params.getParam<String>(
                  'seat',
                  ParamType.String,
                  isList: true,
                ),
                netPremium: params.getParam<String>(
                  'netPremium',
                  ParamType.String,
                  isList: true,
                ),
                vat: params.getParam<String>(
                  'vat',
                  ParamType.String,
                  isList: true,
                ),
                stamp: params.getParam<String>(
                  'stamp',
                  ParamType.String,
                  isList: true,
                ),
                grossTotal: params.getParam<String>(
                  'grossTotal',
                  ParamType.String,
                  isList: true,
                ),
                carType: params.getParam(
                  'carType',
                  ParamType.String,
                ),
                driverType: params.getParam(
                  'driverType',
                  ParamType.String,
                ),
                carRegistrationYear: params.getParam(
                  'carRegistrationYear',
                  ParamType.String,
                ),
                carBrandId: params.getParam(
                  'carBrandId',
                  ParamType.String,
                ),
                carBrandName: params.getParam(
                  'carBrandName',
                  ParamType.String,
                ),
                carModelName: params.getParam(
                  'carModelName',
                  ParamType.String,
                ),
                carModelId: params.getParam(
                  'carModelId',
                  ParamType.String,
                ),
                vehicleId: params.getParam(
                  'vehicleId',
                  ParamType.String,
                ),
                vehicleCode: params.getParam(
                  'vehicleCode',
                  ParamType.String,
                ),
                vehicleName: params.getParam(
                  'vehicleName',
                  ParamType.String,
                ),
                contractProcessstate: params.getParam<String>(
                  'contractProcessstate',
                  ParamType.String,
                  isList: true,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                fromBtn: params.getParam(
                  'fromBtn',
                  ParamType.String,
                ),
                indexPage: params.getParam(
                  'indexPage',
                  ParamType.int,
                ),
                oldVMIExpDate: params.getParam(
                  'oldVMIExpDate',
                  ParamType.String,
                ),
                cc: params.getParam<String>(
                  'cc',
                  ParamType.String,
                  isList: true,
                ),
                carLost: params.getParam<String>(
                  'carLost',
                  ParamType.String,
                  isList: true,
                ),
                motorAddOn: params.getParam<String>(
                  'motorAddOn',
                  ParamType.String,
                  isList: true,
                ),
                driverBehavior: params.getParam<String>(
                  'driverBehavior',
                  ParamType.String,
                  isList: true,
                ),
                inspectionExcept: params.getParam<String>(
                  'inspectionExcept',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: NonePackageSelectedInsurerPageWidget.routeName,
              path: NonePackageSelectedInsurerPageWidget.routePath,
              builder: (context, params) =>
                  NonePackageSelectedInsurerPageWidget(
                leadID: params.getParam(
                  'leadID',
                  ParamType.String,
                ),
                coverTypeName: params.getParam(
                  'coverTypeName',
                  ParamType.String,
                ),
                garageTypeName: params.getParam(
                  'garageTypeName',
                  ParamType.String,
                ),
                insurerShortName: params.getParam(
                  'insurerShortName',
                  ParamType.String,
                ),
                insurerName: params.getParam(
                  'insurerName',
                  ParamType.String,
                ),
                quotationId: params.getParam(
                  'quotationId',
                  ParamType.String,
                ),
                leadDtlId: params.getParam(
                  'leadDtlId',
                  ParamType.int,
                ),
                actFlag: params.getParam(
                  'actFlag',
                  ParamType.bool,
                ),
                masterActAmount: params.getParam(
                  'masterActAmount',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: PaywithBarcodeWidget.routeName,
              path: PaywithBarcodeWidget.routePath,
              builder: (context, params) => PaywithBarcodeWidget(),
            ),
            FFRoute(
              name: AddLeadsPageWidget.routeName,
              path: AddLeadsPageWidget.routePath,
              builder: (context, params) => AddLeadsPageWidget(),
            ),
            FFRoute(
              name: LoginScreen1Widget.routeName,
              path: LoginScreen1Widget.routePath,
              builder: (context, params) => LoginScreen1Widget(),
            ),
            FFRoute(
              name: NonePackageInsurerPageWidget.routeName,
              path: NonePackageInsurerPageWidget.routePath,
              builder: (context, params) => NonePackageInsurerPageWidget(
                workType: params.getParam(
                  'workType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: InsuranceInfoPage5CancelWidget.routeName,
              path: InsuranceInfoPage5CancelWidget.routePath,
              builder: (context, params) => InsuranceInfoPage5CancelWidget(
                quotationId: params.getParam(
                  'quotationId',
                  ParamType.String,
                ),
                leadDtlId: params.getParam(
                  'leadDtlId',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
                name: InsuranceInfoPage42Widget.routeName,
                path: InsuranceInfoPage42Widget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: InsuranceInfoPage42Widget(
                        quotationId: params.getParam(
                          'quotationId',
                          ParamType.String,
                        ),
                        leadDetailId: params.getParam(
                          'leadDetailId',
                          ParamType.int,
                        ),
                      ),
                    )),
            FFRoute(
              name: InsuranceInfoPage4InstallmentsWidget.routeName,
              path: InsuranceInfoPage4InstallmentsWidget.routePath,
              builder: (context, params) =>
                  InsuranceInfoPage4InstallmentsWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                dataList: params.getParam<String>(
                  'dataList',
                  ParamType.String,
                  isList: true,
                ),
                multiSelect: params.getParam(
                  'multiSelect',
                  ParamType.bool,
                ),
                maxSelected: params.getParam(
                  'maxSelected',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: UploadImgPageWidget.routeName,
              path: UploadImgPageWidget.routePath,
              builder: (context, params) => UploadImgPageWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: NonePackageEditPage2CopyWidget.routeName,
              path: NonePackageEditPage2CopyWidget.routePath,
              builder: (context, params) => NonePackageEditPage2CopyWidget(),
            ),
            FFRoute(
              name: NonePackageBasicImage1PageWidget.routeName,
              path: NonePackageBasicImage1PageWidget.routePath,
              builder: (context, params) => NonePackageBasicImage1PageWidget(
                workType: params.getParam(
                  'workType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: NonePackageBasicImage2PageWidget.routeName,
              path: NonePackageBasicImage2PageWidget.routePath,
              builder: (context, params) => NonePackageBasicImage2PageWidget(
                workType: params.getParam(
                  'workType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: InsuranceInfoPage31Widget.routeName,
              path: InsuranceInfoPage31Widget.routePath,
              builder: (context, params) => InsuranceInfoPage31Widget(),
            ),
            FFRoute(
              name: SearchBranchPageWidget.routeName,
              path: SearchBranchPageWidget.routePath,
              builder: (context, params) => SearchBranchPageWidget(
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: InsuranceUnSuccessPageWidget.routeName,
              path: InsuranceUnSuccessPageWidget.routePath,
              builder: (context, params) => InsuranceUnSuccessPageWidget(),
            ),
            FFRoute(
              name: QuotationCopyWidget.routeName,
              path: QuotationCopyWidget.routePath,
              builder: (context, params) => QuotationCopyWidget(
                quotation: params.getParam<String>(
                  'quotation',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: InsurerInfomationPageWidget.routeName,
              path: InsurerInfomationPageWidget.routePath,
              builder: (context, params) => InsurerInfomationPageWidget(),
            ),
            FFRoute(
              name: WebViewPromotionPageWidget.routeName,
              path: WebViewPromotionPageWidget.routePath,
              builder: (context, params) => WebViewPromotionPageWidget(),
            ),
            FFRoute(
              name: NotificationIBSWidget.routeName,
              path: NotificationIBSWidget.routePath,
              builder: (context, params) => NotificationIBSWidget(),
            ),
            FFRoute(
              name: SearchableCarListPageWidget.routeName,
              path: SearchableCarListPageWidget.routePath,
              builder: (context, params) => SearchableCarListPageWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                dataList: params.getParam<String>(
                  'dataList',
                  ParamType.String,
                  isList: true,
                ),
                multiSelect: params.getParam(
                  'multiSelect',
                  ParamType.bool,
                ),
                maxSelected: params.getParam(
                  'maxSelected',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SearchablePickUpListPageWidget.routeName,
              path: SearchablePickUpListPageWidget.routePath,
              builder: (context, params) => SearchablePickUpListPageWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                dataList: params.getParam<String>(
                  'dataList',
                  ParamType.String,
                  isList: true,
                ),
                multiSelect: params.getParam(
                  'multiSelect',
                  ParamType.bool,
                ),
                maxSelected: params.getParam(
                  'maxSelected',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RenewHistoryWidget.routeName,
              path: RenewHistoryWidget.routePath,
              builder: (context, params) => RenewHistoryWidget(
                refRenewId: params.getParam(
                  'refRenewId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MakeInsuranceListPageSearchWidget.routeName,
              path: MakeInsuranceListPageSearchWidget.routePath,
              builder: (context, params) => MakeInsuranceListPageSearchWidget(
                checkTotal: params.getParam(
                  'checkTotal',
                  ParamType.int,
                ),
                list: params.getParam<dynamic>(
                  'list',
                  ParamType.JSON,
                  isList: true,
                ),
                checkPayment: params.getParam(
                  'checkPayment',
                  ParamType.String,
                ),
                checkVMI: params.getParam(
                  'checkVMI',
                  ParamType.String,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                carRegistration: params.getParam(
                  'carRegistration',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RenewDetailPageWidget.routeName,
              path: RenewDetailPageWidget.routePath,
              builder: (context, params) => RenewDetailPageWidget(
                refRenewId: params.getParam(
                  'refRenewId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RenewBasicInfoPageWidget.routeName,
              path: RenewBasicInfoPageWidget.routePath,
              builder: (context, params) => RenewBasicInfoPageWidget(
                quotationId: params.getParam(
                  'quotationId',
                  ParamType.String,
                ),
                leadDetailId: params.getParam(
                  'leadDetailId',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: RenewSearchAllPoolPageWidget.routeName,
              path: RenewSearchAllPoolPageWidget.routePath,
              builder: (context, params) => RenewSearchAllPoolPageWidget(),
            ),
            FFRoute(
              name: RenewSaveHistoryWidget.routeName,
              path: RenewSaveHistoryWidget.routePath,
              builder: (context, params) => RenewSaveHistoryWidget(
                title: params.getParam(
                  'title',
                  ParamType.String,
                ),
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
                lastname: params.getParam(
                  'lastname',
                  ParamType.String,
                ),
                brand: params.getParam(
                  'brand',
                  ParamType.String,
                ),
                model: params.getParam(
                  'model',
                  ParamType.String,
                ),
                covertype: params.getParam(
                  'covertype',
                  ParamType.String,
                ),
                garagetype: params.getParam(
                  'garagetype',
                  ParamType.String,
                ),
                expDate: params.getParam(
                  'expDate',
                  ParamType.String,
                ),
                status: params.getParam(
                  'status',
                  ParamType.String,
                ),
                refRenewId: params.getParam(
                  'refRenewId',
                  ParamType.String,
                ),
                carregis: params.getParam(
                  'carregis',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SellingActWidget.routeName,
              path: SellingActWidget.routePath,
              builder: (context, params) => SellingActWidget(),
            ),
            FFRoute(
              name: InformationActWidget.routeName,
              path: InformationActWidget.routePath,
              builder: (context, params) => InformationActWidget(),
            ),
            FFRoute(
              name: InformationCustomerWidget.routeName,
              path: InformationCustomerWidget.routePath,
              builder: (context, params) => InformationCustomerWidget(),
            ),
            FFRoute(
              name: InformationCustomer2Widget.routeName,
              path: InformationCustomer2Widget.routePath,
              builder: (context, params) => InformationCustomer2Widget(
                bodyNumber: params.getParam(
                  'bodyNumber',
                  ParamType.String,
                ),
                effectiveDateAct: params.getParam(
                  'effectiveDateAct',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: WebViewPolicyWidget.routeName,
              path: WebViewPolicyWidget.routePath,
              builder: (context, params) => WebViewPolicyWidget(),
            ),
            FFRoute(
              name: SearchInsurancePageCopyWidget.routeName,
              path: SearchInsurancePageCopyWidget.routePath,
              builder: (context, params) => SearchInsurancePageCopyWidget(
                fromIcon: params.getParam(
                  'fromIcon',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ForDupeUiWidget.routeName,
              path: ForDupeUiWidget.routePath,
              builder: (context, params) => ForDupeUiWidget(),
            ),
            FFRoute(
              name: AddDriverPageWidget.routeName,
              path: AddDriverPageWidget.routePath,
              asyncParams: {
                'firestoreDataConfigList':
                    getDoc(['dataList'], DataListRecord.fromSnapshot),
              },
              builder: (context, params) => AddDriverPageWidget(
                firestoreDataConfigList: params.getParam(
                  'firestoreDataConfigList',
                  ParamType.Document,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
                isEditing: params.getParam(
                  'isEditing',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: ShowDriverPageWidget.routeName,
              path: ShowDriverPageWidget.routePath,
              asyncParams: {
                'firestoreDataConfigList':
                    getDoc(['dataList'], DataListRecord.fromSnapshot),
              },
              builder: (context, params) => ShowDriverPageWidget(
                firestoreDataConfigList: params.getParam(
                  'firestoreDataConfigList',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: GeminiPageWidget.routeName,
              path: GeminiPageWidget.routePath,
              builder: (context, params) => GeminiPageWidget(),
            ),
            FFRoute(
              name: SelectOrdinaryWidget.routeName,
              path: SelectOrdinaryWidget.routePath,
              builder: (context, params) => SelectOrdinaryWidget(),
            ),
            FFRoute(
              name: TestPageWidget.routeName,
              path: TestPageWidget.routePath,
              builder: (context, params) => TestPageWidget(),
            ),
            FFRoute(
              name: InsurerListOverallPageWidget.routeName,
              path: InsurerListOverallPageWidget.routePath,
              builder: (context, params) => InsurerListOverallPageWidget(
                brandCode: params.getParam(
                  'brandCode',
                  ParamType.String,
                ),
                modelCode: params.getParam(
                  'modelCode',
                  ParamType.String,
                ),
                year: params.getParam(
                  'year',
                  ParamType.String,
                ),
                province: params.getParam(
                  'province',
                  ParamType.String,
                ),
                vehicleUsage: params.getParam(
                  'vehicleUsage',
                  ParamType.String,
                ),
                coverType: params.getParam<String>(
                  'coverType',
                  ParamType.String,
                  isList: true,
                ),
                garageType: params.getParam<String>(
                  'garageType',
                  ParamType.String,
                  isList: true,
                ),
                brandName: params.getParam(
                  'brandName',
                  ParamType.String,
                ),
                modelName: params.getParam(
                  'modelName',
                  ParamType.String,
                ),
                carTypeDetail: params.getParam(
                  'carTypeDetail',
                  ParamType.String,
                ),
                oldVmiExpDate: params.getParam(
                  'oldVmiExpDate',
                  ParamType.String,
                ),
                provinceCode: params.getParam(
                  'provinceCode',
                  ParamType.String,
                ),
                driverBehaviorScoreList: params.getParam<String>(
                  'driverBehaviorScoreList',
                  ParamType.String,
                  isList: true,
                ),
                driverFlag: params.getParam(
                  'driverFlag',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SearchableHouseListWidget.routeName,
              path: SearchableHouseListWidget.routePath,
              builder: (context, params) => SearchableHouseListWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                dataList: params.getParam<String>(
                  'dataList',
                  ParamType.String,
                  isList: true,
                ),
                multiSelect: params.getParam(
                  'multiSelect',
                  ParamType.bool,
                ),
                maxSelected: params.getParam(
                  'maxSelected',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FireInsurerListAllWidget.routeName,
              path: FireInsurerListAllWidget.routePath,
              builder: (context, params) => FireInsurerListAllWidget(
                brandCode: params.getParam(
                  'brandCode',
                  ParamType.String,
                ),
                modelCode: params.getParam(
                  'modelCode',
                  ParamType.String,
                ),
                year: params.getParam(
                  'year',
                  ParamType.String,
                ),
                province: params.getParam(
                  'province',
                  ParamType.String,
                ),
                vehicleUsage: params.getParam(
                  'vehicleUsage',
                  ParamType.String,
                ),
                coverType: params.getParam<String>(
                  'coverType',
                  ParamType.String,
                  isList: true,
                ),
                garageType: params.getParam<String>(
                  'garageType',
                  ParamType.String,
                  isList: true,
                ),
                brandName: params.getParam(
                  'brandName',
                  ParamType.String,
                ),
                modelName: params.getParam(
                  'modelName',
                  ParamType.String,
                ),
                carTypeDetail: params.getParam(
                  'carTypeDetail',
                  ParamType.String,
                ),
                oldVmiExpDate: params.getParam(
                  'oldVmiExpDate',
                  ParamType.String,
                ),
                provinceCode: params.getParam(
                  'provinceCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FireInsurerListPageWidget.routeName,
              path: FireInsurerListPageWidget.routePath,
              builder: (context, params) => FireInsurerListPageWidget(
                yearMin: params.getParam(
                  'yearMin',
                  ParamType.String,
                ),
                yearMax: params.getParam(
                  'yearMax',
                  ParamType.String,
                ),
                sumInsured: params.getParam(
                  'sumInsured',
                  ParamType.String,
                ),
                sumInsureHouse: params.getParam(
                  'sumInsureHouse',
                  ParamType.String,
                ),
                sumInsureBuilding: params.getParam(
                  'sumInsureBuilding',
                  ParamType.String,
                ),
                sumInsureOther: params.getParam(
                  'sumInsureOther',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SearchPackageFireInsurancePageWidget.routeName,
              path: SearchPackageFireInsurancePageWidget.routePath,
              builder: (context, params) =>
                  SearchPackageFireInsurancePageWidget(
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
                userProfileData: params.getParam(
                  'userProfileData',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: FireInsuranceListPageWidget.routeName,
              path: FireInsuranceListPageWidget.routePath,
              builder: (context, params) => FireInsuranceListPageWidget(
                checkType: params.getParam(
                  'checkType',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: MakeFireInsuranceListPageWidget.routeName,
              path: MakeFireInsuranceListPageWidget.routePath,
              builder: (context, params) => MakeFireInsuranceListPageWidget(
                checkTotal: params.getParam(
                  'checkTotal',
                  ParamType.int,
                ),
                list: params.getParam<dynamic>(
                  'list',
                  ParamType.JSON,
                  isList: true,
                ),
                checkPayment: params.getParam(
                  'checkPayment',
                  ParamType.String,
                ),
                checkVMI: params.getParam(
                  'checkVMI',
                  ParamType.String,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FireLeadFollowUpPageWidget.routeName,
              path: FireLeadFollowUpPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => FireLeadFollowUpPageWidget(),
            ),
            FFRoute(
                name: DetailsFireInsurancePageWidget.routeName,
                path: DetailsFireInsurancePageWidget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: DetailsFireInsurancePageWidget(
                        packageData: params.getParam(
                          'packageData',
                          ParamType.DataStruct,
                          isList: false,
                          structBuilder: GetPackageFireInsurerDataTypeStruct
                              .fromSerializableMap,
                        ),
                        sumInsureHouse: params.getParam(
                          'sumInsureHouse',
                          ParamType.String,
                        ),
                        sumInsureBuildin: params.getParam(
                          'sumInsureBuildin',
                          ParamType.String,
                        ),
                      ),
                    )),
            FFRoute(
              name: AddFireCustomerNameWidget.routeName,
              path: AddFireCustomerNameWidget.routePath,
              builder: (context, params) => AddFireCustomerNameWidget(
                packageDetail: params.getParam(
                  'packageDetail',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder:
                      GetPackageFireInsurerDataTypeStruct.fromSerializableMap,
                ),
                button: params.getParam(
                  'button',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FireSearchableListPageWidget.routeName,
              path: FireSearchableListPageWidget.routePath,
              builder: (context, params) => FireSearchableListPageWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                dataList: params.getParam<String>(
                  'dataList',
                  ParamType.String,
                  isList: true,
                ),
                multiSelect: params.getParam(
                  'multiSelect',
                  ParamType.bool,
                ),
                maxSelected: params.getParam(
                  'maxSelected',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: FireInsuranceInfoPage1Widget.routeName,
              path: FireInsuranceInfoPage1Widget.routePath,
              builder: (context, params) => FireInsuranceInfoPage1Widget(
                quotationId: params.getParam(
                  'quotationId',
                  ParamType.String,
                ),
                leadDtailId: params.getParam(
                  'leadDtailId',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: FireInsuranceInfoPage2Widget.routeName,
              path: FireInsuranceInfoPage2Widget.routePath,
              asyncParams: {
                'masterDataFirebase':
                    getDoc(['dataList'], DataListRecord.fromSnapshot),
              },
              builder: (context, params) => FireInsuranceInfoPage2Widget(
                masterDataFirebase: params.getParam(
                  'masterDataFirebase',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: FireInsuranceInfoPage3Widget.routeName,
              path: FireInsuranceInfoPage3Widget.routePath,
              builder: (context, params) => FireInsuranceInfoPage3Widget(),
            ),
            FFRoute(
              name: FireInsuranceInfoPage4Widget.routeName,
              path: FireInsuranceInfoPage4Widget.routePath,
              builder: (context, params) => FireInsuranceInfoPage4Widget(),
            ),
            FFRoute(
                name: FireInsuranceInfoPage42Widget.routeName,
                path: FireInsuranceInfoPage42Widget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: FireInsuranceInfoPage42Widget(
                        quotationId: params.getParam(
                          'quotationId',
                          ParamType.String,
                        ),
                        leadDetailId: params.getParam(
                          'leadDetailId',
                          ParamType.int,
                        ),
                      ),
                    )),
            FFRoute(
              name: FireInsuranceInfoPage4InstallmentsWidget.routeName,
              path: FireInsuranceInfoPage4InstallmentsWidget.routePath,
              builder: (context, params) =>
                  FireInsuranceInfoPage4InstallmentsWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                dataList: params.getParam<String>(
                  'dataList',
                  ParamType.String,
                  isList: true,
                ),
                multiSelect: params.getParam(
                  'multiSelect',
                  ParamType.bool,
                ),
                maxSelected: params.getParam(
                  'maxSelected',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
                name: FireInsuranceInfoPage5Widget.routeName,
                path: FireInsuranceInfoPage5Widget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: FireInsuranceInfoPage5Widget(
                        quotationId: params.getParam(
                          'quotationId',
                          ParamType.String,
                        ),
                        leadDtlId: params.getParam(
                          'leadDtlId',
                          ParamType.int,
                        ),
                      ),
                    )),
            FFRoute(
                name: FireInsuranceInfoPage5ShowPolicyWidget.routeName,
                path: FireInsuranceInfoPage5ShowPolicyWidget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: FireInsuranceInfoPage5ShowPolicyWidget(
                        vmiDocumentUrl: params.getParam(
                          'vmiDocumentUrl',
                          ParamType.String,
                        ),
                      ),
                    )),
            FFRoute(
              name: FireInsuranceInfoPage5CancelWidget.routeName,
              path: FireInsuranceInfoPage5CancelWidget.routePath,
              builder: (context, params) => FireInsuranceInfoPage5CancelWidget(
                quotationId: params.getParam(
                  'quotationId',
                  ParamType.String,
                ),
                leadDtlId: params.getParam(
                  'leadDtlId',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: FirePaywithQRcodeWidget.routeName,
              path: FirePaywithQRcodeWidget.routePath,
              builder: (context, params) => FirePaywithQRcodeWidget(
                taxId: params.getParam(
                  'taxId',
                  ParamType.String,
                ),
                suffix: params.getParam(
                  'suffix',
                  ParamType.String,
                ),
                ref1: params.getParam(
                  'ref1',
                  ParamType.String,
                ),
                ref2: params.getParam(
                  'ref2',
                  ParamType.String,
                ),
                amount: params.getParam(
                  'amount',
                  ParamType.String,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                actCMI: params.getParam(
                  'actCMI',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
                name: FireQuotationPageWidget.routeName,
                path: FireQuotationPageWidget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: FireQuotationPageWidget(
                        fromPage: params.getParam(
                          'fromPage',
                          ParamType.String,
                        ),
                        pdfUrl: params.getParam<String>(
                          'pdfUrl',
                          ParamType.String,
                          isList: true,
                        ),
                      ),
                    )),
            FFRoute(
              name: WebviewPageWidget.routeName,
              path: WebviewPageWidget.routePath,
              builder: (context, params) => WebviewPageWidget(
                webUrl: params.getParam(
                  'webUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AddPeopleFireInsurancePageWidget.routeName,
              path: AddPeopleFireInsurancePageWidget.routePath,
              asyncParams: {
                'firestoreDataConfigList':
                    getDoc(['dataList'], DataListRecord.fromSnapshot),
              },
              builder: (context, params) => AddPeopleFireInsurancePageWidget(
                firestoreDataConfigList: params.getParam(
                  'firestoreDataConfigList',
                  ParamType.Document,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
                isEditing: params.getParam(
                  'isEditing',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: ShowPeoplePageWidget.routeName,
              path: ShowPeoplePageWidget.routePath,
              asyncParams: {
                'firestoreDataConfigList':
                    getDoc(['dataList'], DataListRecord.fromSnapshot),
              },
              builder: (context, params) => ShowPeoplePageWidget(
                firestoreDataConfigList: params.getParam(
                  'firestoreDataConfigList',
                  ParamType.Document,
                ),
                maxPeople: params.getParam(
                  'maxPeople',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
                name: FireQuotationCopyWidget.routeName,
                path: FireQuotationCopyWidget.routePath,
                builder: (context, params) => NavBarPage(
                      initialPage: '',
                      page: FireQuotationCopyWidget(
                        quotation: params.getParam<String>(
                          'quotation',
                          ParamType.String,
                          isList: true,
                        ),
                      ),
                    )),
            FFRoute(
              name: UploadImgFireInsurerPageWidget.routeName,
              path: UploadImgFireInsurerPageWidget.routePath,
              builder: (context, params) => UploadImgFireInsurerPageWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: WebviewNewPageWidget.routeName,
              path: WebviewNewPageWidget.routePath,
              builder: (context, params) => WebviewNewPageWidget(
                webUrl: params.getParam(
                  'webUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SearchableDriverBehaviorListPageWidget.routeName,
              path: SearchableDriverBehaviorListPageWidget.routePath,
              builder: (context, params) =>
                  SearchableDriverBehaviorListPageWidget(
                titleText: params.getParam(
                  'titleText',
                  ParamType.String,
                ),
                searchLabel: params.getParam(
                  'searchLabel',
                  ParamType.String,
                ),
                multiSelect: params.getParam(
                  'multiSelect',
                  ParamType.bool,
                ),
                maxSelected: params.getParam(
                  'maxSelected',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: AddBatteryPageWidget.routeName,
              path: AddBatteryPageWidget.routePath,
              asyncParams: {
                'firestoreDataConfigList':
                    getDoc(['dataList'], DataListRecord.fromSnapshot),
              },
              builder: (context, params) => AddBatteryPageWidget(
                firestoreDataConfigList: params.getParam(
                  'firestoreDataConfigList',
                  ParamType.Document,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
                isEditing: params.getParam(
                  'isEditing',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: ShowBatterryPageWidget.routeName,
              path: ShowBatterryPageWidget.routePath,
              asyncParams: {
                'firestoreDataConfigList':
                    getDoc(['dataList'], DataListRecord.fromSnapshot),
              },
              builder: (context, params) => ShowBatterryPageWidget(
                firestoreDataConfigList: params.getParam(
                  'firestoreDataConfigList',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: AddMotorPageWidget.routeName,
              path: AddMotorPageWidget.routePath,
              builder: (context, params) => AddMotorPageWidget(),
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
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
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
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
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
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
